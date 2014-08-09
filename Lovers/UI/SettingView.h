//
//  SettingView.h
//  Lovers
//
//  Created by Apple on 14-8-9.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

@protocol SettingViewDelegate <NSObject>

@optional
-(void) SettingViewClose;
@end

@interface SettingModel : NSObject<NSCoding> //用户传值实体类
{
    NSString* m_str_man_height;
    NSString* m_str_woman_height;
    NSString* m_str_canvas_width;
    NSString* m_str_canvas_height;
}
@property (strong, nonatomic) NSString* m_str_man_height;
@property (strong, nonatomic) NSString* m_str_woman_height;
@property (strong, nonatomic) NSString* m_str_canvas_width;
@property (strong, nonatomic) NSString* m_str_canvas_height;
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
-(IBAction)textfieldTouchUpOutside:(id)sender;
@property id<SettingViewDelegate> delegate;
@end
