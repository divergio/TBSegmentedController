//
//  CWSegmentButtonController.m
//  chewen
//
//  Created by Tyler Barth on 2013-01-29.
//  Copyright (c) 2013年 Brian. All rights reserved.
//

#import "TBSegmentedControl.h"
#import "objc/runtime.h"

@interface TBSegmentedControl ()

@property (nonatomic, strong) NSArray* images;
@property (nonatomic, strong) NSNumber* numberOfSegments;

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
            
- (void) awakeFromNib
{
    [super awakeFromNib];

    //Get images to use for the button
    self.images = [self.delegate imagesForSegmentButton:self];
    
    //Determine the number of segments to the control implicitly
    //Based on the number of selected images passed int
    self.numberOfSegments = [NSNumber numberWithInt:[self.images count]];
    
    //Enable User Interaction on yourself
    [self setUserInteractionEnabled:YES];
    
    //We could use a different size,
    //Or even use resizable images,
    //But we're just going to assume the images are custom made for these buttons.
    CGSize size = [(UIImage*)[self.images objectAtIndex:0] size];
        
    //Set frame according to passed in image.
    [self setFrame:CGRectMake(self.frame.origin.x, self.frame.origin.y, size.width, size.height)];
    
    CGFloat increment = size.width / [self.numberOfSegments floatValue];
    
    //Make buttons for the sections
    
    for (int i = 0; i < [self.numberOfSegments integerValue]; ++i) {
        UIButton* button = [UIButton buttonWithType:UIButtonTypeCustom];
        
        CGFloat originx =  i*increment;
        [button setFrame:CGRectMake(originx, 0.0, increment, self.frame.size.height)];
        
        //Associate the segment index with the button
        objc_setAssociatedObject(button, &CW_BUTTON_KEY, [NSNumber numberWithInt:i], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
        
        [button addTarget:self action:@selector(changeState:) forControlEvents:UIControlEventTouchDown];
        
        [self addSubview:button];
    }
    
    //Initialize with segment 0 selected
    [self setSelectedIndex:0];
}

//Setting the selected segment makes the buttons appearance change. 
- (void) setSelectedIndex:(NSUInteger)selectedIndex
{
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
    [self.delegate didChangeState:self];
}

@end
