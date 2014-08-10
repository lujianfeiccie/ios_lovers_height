//
//  SettingModel.h
//  Lovers
//
//  Created by Apple on 14-8-10.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface SettingModel : NSObject<NSCoding> //用户传值实体类
{
    NSString* m_str_man_height;
    NSString* m_str_woman_height;
    NSString* m_str_canvas_width;
    NSString* m_str_canvas_height;
    
}
+(BOOL) save:(SettingModel*) model;
+(SettingModel*) load;
@property (strong, nonatomic) NSString* m_str_man_height;
@property (strong, nonatomic) NSString* m_str_woman_height;
@property (strong, nonatomic) NSString* m_str_canvas_width;
@property (strong, nonatomic) NSString* m_str_canvas_height;
@end
