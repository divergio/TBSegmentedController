//
//  CWSegmentButtonController.h
//
//  Created by Tyler Barth on 2013-01-29.


#import <UIKit/UIKit.h>

@class TBSegmentedControl;

@protocol TBSegmentedControlDelegate <NSObject>

- (void) didChangeState: (TBSegmentedControl*) view;

//Number of segments is determined implicitly by the number of images
//One image for each button selected
- (NSArray*) imagesForSegmentButton: (TBSegmentedControl*) view;

@end

@interface TBSegmentedControl : UIImageView

@property (nonatomic, strong) IBOutlet id <TBSegmentedControlDelegate> delegate;

@property (nonatomic, assign) NSUInteger selectedIndex;

@end
