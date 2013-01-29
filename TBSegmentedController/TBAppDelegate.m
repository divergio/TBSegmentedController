//
//  TBAppDelegate.m
//  TBSegmentedController
//
//  Created by Tyler Barth on 2013-01-30.
//  Copyright (c) 2013年 Tyler Barth. All rights reserved.
//

#import "TBAppDelegate.h"

@implementation TBAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    // Override point for customization after application launch.
    self.window.backgroundColor = [UIColor whiteColor];
    self.window.rootViewController = [[UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil] instantiateInitialViewController];
    [self.window makeKeyAndVisible];
    return YES;
}

@end
