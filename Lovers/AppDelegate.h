//
//  AppDelegate.h
//  Lovers
//
//  Created by Apple on 14-8-8.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Util.h"
#import "NSLogExt.h"
#import "ButtonUtil.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    UIStoryboard *storyBoard;

}
@property (strong, nonatomic) UIWindow *window;
@property (strong, nonatomic) UINavigationController *navController;
@end
