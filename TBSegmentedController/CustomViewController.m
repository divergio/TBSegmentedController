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

@property (nonatomic, strong) IBOutlet UILabel* label;

@property (nonatomic, strong) IBOutlet TBSegmentedControl* control;

@end

@implementation CustomViewController

- (NSArray*) imagesForSegmentButton:(TBSegmentedControl *)view
{
    return [NSArray arrayWithObjects:[UIImage imageNamed:@"segment_0_selected.png"],
            [UIImage imageNamed:@"segment_1_selected.png"],
            [UIImage imageNamed:@"segment_2_selected.png"], nil];
}

- (void) viewWillAppear:(BOOL)animated
{
    //Just to initialize the label
    [self didChangeState:self.control];
}
- (void) didChangeState:(TBSegmentedControl *)view
{
    self.label.text = [NSString stringWithFormat:@"Selected = %i",view.selectedIndex + 1];
}

@end
