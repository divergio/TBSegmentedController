//
//  CustomViewController.m
//  TBSegmentedControl
//
//  Created by Tyler Barth on 2013-01-30.
//  Copyright (c) 2013年 Tyler Barth. All rights reserved.
//

#import "CustomViewController.h"
#import "TBSegmentedControl.h"

@interface CustomViewController () <TBSegmentedControlDelegate>

@property (nonatomic, strong) IBOutlet UILabel* label0;
@property (nonatomic, strong) IBOutlet UILabel* label1;

@property (nonatomic, strong) IBOutlet TBSegmentedControl* control0;
@property (nonatomic, strong) IBOutlet TBSegmentedControl* control1;


@end

@implementation CustomViewController

- (NSArray*) imagesForSegmentButton:(TBSegmentedControl *)view
{
    if (view == self.control0) {
        return [NSArray arrayWithObjects:[UIImage imageNamed:@"segment_0_selected.png"],
                [UIImage imageNamed:@"segment_1_selected.png"],
                [UIImage imageNamed:@"segment_2_selected.png"], nil];
    } else if (view == self.control1) {
        return [NSArray arrayWithObjects:[UIImage imageNamed:@"segment_0_selected.png"],
                [UIImage imageNamed:@"segment_1_selected.png"],
                [UIImage imageNamed:@"segment_2_selected.png"], nil];
    }
    else
#ifdef DEBUG
        NSLog(@"Invalid segment control");
#endif
    return nil;
}

- (NSArray*) titlesForSegmentButton:(TBSegmentedControl *)view
{
    if (view == self.control1) {
        return @[ @"First", @"Second", @"Third"];
    }
    //No labels for the other controls
    return nil;
}

- (NSArray*) accessabilityHintForSegmentButton:(TBSegmentedControl *)view
{
    if (view == self.control0) {
        return @[ @"Number 1", @"Number 2", @"Number 3"];
    }
    else if (view == self.control1) {
        return @[ @"does something", @"something else", @"a third option"];
    }
    
    return nil;
}


- (void) viewWillAppear:(BOOL)animated
{
    //Just to initialize the label
    [self didChangeState];
}
- (void) didChangeState
{
    self.label0.text = [NSString stringWithFormat:@"Selected = %i",self.control0.selectedIndex + 1];
    self.label1.text = [NSString stringWithFormat:@"Selected = %i",self.control1.selectedIndex + 1];
}

@end
