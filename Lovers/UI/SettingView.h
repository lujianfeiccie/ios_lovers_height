//
//  SettingView.h
//  Lovers
//
//  Created by Apple on 14-8-9.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>


@class SettingModel;
@class AppDelegate;

@protocol SettingViewDelegate <NSObject>
@optional
-(void) SettingViewClose:(SettingModel*) model;
@end

@interface SettingView : UIViewController<UITextViewDelegate>
{
    AppDelegate* app;
    __weak IBOutlet UITextField *m_textfield_man_height;
    __weak IBOutlet UITextField *m_textfield_woman_height;
    
    __weak IBOutlet UITextField *m_textfield_canvas_width;
    __weak IBOutlet UITextField *m_textfield_canvas_height;
    
    
}
-(void) toolBarLeft;
-(void) toolBarRight;
-(IBAction)textfieldTouchUpOutside:(id)sender;
@property id<SettingViewDelegate> delegate;
@end