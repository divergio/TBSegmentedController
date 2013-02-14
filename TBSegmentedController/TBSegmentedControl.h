//
//  CWSegmentButtonController.h
//
//  Created by Tyler Barth on 2013-01-29.

#import <UIKit/UIKit.h>

@class TBSegmentedControl;

@protocol TBSegmentedControlDelegate <NSObject>

//Number of segments is determined implicitly by the number of images
//One image for each button selected
@required
- (NSArray*) imagesForSegmentButton: (TBSegmentedControl*) view;

@optional
//Labels, array of NSString*
// If you require more complicated settings, like title color or format
// use the UIAppearance protocol and change UIButton when in class
// TBSegmented control
- (NSArray*) titlesForSegmentButton:(TBSegmentedControl*)view;

//Optional accessibility hints
// Array of NSStrings (should be NSLocalizedStrings)
- (NSArray*) accessabilityHintForSegmentButton:(TBSegmentedControl*)view;

- (void) didChangeState: (TBSegmentedControl*) view;


@end

@interface TBSegmentedControl : UIImageView

@property (nonatomic, weak) IBOutlet id <TBSegmentedControlDelegate> delegate;

@property (nonatomic, assign) NSUInteger selectedIndex;

@end
