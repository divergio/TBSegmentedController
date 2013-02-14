//
//  TBSegmentedControl.h
//
//  Created by Tyler Barth on 2013-01-29.
//

#import "TBSegmentedControl.h"
#import "objc/runtime.h"

@interface TBSegmentedControl ()

@property (nonatomic, strong) NSArray* images;
@property (nonatomic, strong) NSNumber* numberOfSegments;
@property (nonatomic, strong) NSMutableArray* buttons;

@end

//The key to use for associated objects
@implementation TBSegmentedControl

static char CW_BUTTON_KEY;

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

- (NSArray*) images
{
    //Lazy load images
    if (!_images) {
        _images = [self.delegate imagesForSegmentButton:self];
    }
    return _images;
}
            
- (void) awakeFromNib
{
    [super awakeFromNib];
    
    //Determine the number of segments to the control implicitly
    //Based on the number of selected images passed int
    self.numberOfSegments = [NSNumber numberWithInt:[self.images count]];
    
    //Enable User Interaction on yourself
    [self setUserInteractionEnabled:YES];
    
    //We could use a different size,
    //Or even use resizable images,
    //But we're just going to assume the images are custom made for these buttons.
    CGSize size = [(UIImage*)[self.images objectAtIndex:0] size];
    
    NSArray *titles = nil;
    if ([self.delegate respondsToSelector:@selector(titlesForSegmentButton:)]) {
        titles = [self.delegate titlesForSegmentButton:self];
    }
    
    NSArray *accessibilityHints = nil;
    if ([self.delegate respondsToSelector:@selector(accessabilityHintForSegmentButton:)]) {
        accessibilityHints = [self.delegate accessabilityHintForSegmentButton:self];
    }
    
    //Set frame according to passed in image.
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width, size.height)];
    
    CGFloat increment = size.width / [self.numberOfSegments floatValue];
    
    //Make buttons for the sections
    
    //This is just an array to help keep track of the buttons
    self.buttons = [[NSMutableArray alloc] initWithCapacity:[self.images count]];
    
    for (int i = 0; i < [self.numberOfSegments integerValue]; ++i) {
        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        CGFloat originx =  i*increment;
        [button setFrame:CGRectMake(originx, 0.0, increment, self.frame.size.height)];
        
        //Associate the segment index with the button
        objc_setAssociatedObject(button, &CW_BUTTON_KEY, [NSNumber numberWithInt:i], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [button addTarget:self action:@selector(changeState:) forControlEvents:UIControlEventTouchDown];
        
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setAccessibilityHint:accessibilityHints[i]];
        
        //Put it in the correct container
        
        [self addSubview:button];
        [self.buttons addObject:button];
    }
    
    //Initialize with segment 0 selected
    [self setSelectedIndex:0];
}

//Setting the selected segment makes the buttons appearance change. 
- (void) setSelectedIndex:(NSUInteger)selectedIndex
{
    //Make the button selected for accessibility
    [(UIButton*) self.buttons[selectedIndex] setSelected:YES];
    
    _selectedIndex = selectedIndex;
    [self setImage:[self.images objectAtIndex:selectedIndex]];
    
}

//If any of the buttons are pressed, they call this method.
- (void) changeState: (UIButton*) sender
{
    //Get the int associated with the button, this is the segment index.
    NSNumber* index = (NSNumber*) objc_getAssociatedObject(sender, &CW_BUTTON_KEY);
    self.selectedIndex = [index integerValue];
    
    //Inform the delegate.
    if ([self.delegate respondsToSelector:@selector(didChangeState:)]) {
        [self.delegate didChangeState:self];
    }
}


#pragma mark - UIAccessibilityContainer protocol 
- (NSInteger)accessibilityElementCount
{
    return [self.images count];
}

- (id)accessibilityElementAtIndex:(NSInteger)index
{
    return self.buttons[index];
}

- (NSInteger)indexOfAccessibilityElement:(id)element
{
    NSNumber* index = [NSNumber numberWithInt:0];
    
    index = (NSNumber*) objc_getAssociatedObject(element, &CW_BUTTON_KEY);
    
    return [index integerValue] ;
}


@end
