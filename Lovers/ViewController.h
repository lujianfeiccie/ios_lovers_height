//
//  ViewController.h
//  Lovers
//
//  Created by Apple on 14-8-8.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import"AppDelegate.h"
#import "SettingView.h"
@interface ViewController : UIViewController<SettingViewDelegate>
{
    AppDelegate* app;
    
    UIImageView* m_image_man;
    UIImageView* m_image_woman;
    
    CGRect m_rect_man;
    CGRect m_rect_woman;
}
-(void) toolBarLeft;
-(void) toolBarRight;
@end
