//
//  SLAppDelegate.h
//  SoundList
//
//  Created by Vladislav Korotnev on 3/25/13.
//  Copyright (c) 2013 Vladislav Korotnev. All rights reserved.
//

#import <UIKit/UIKit.h>

@class SLViewController;

@interface SLAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) SLViewController *viewController;

@end
