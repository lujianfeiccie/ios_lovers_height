//
//  SettingModel.m
//  Lovers
//
//  Created by Apple on 14-8-10.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import "SettingModel.h"

@implementation SettingModel
@synthesize m_str_man_height;
@synthesize m_str_woman_height;
@synthesize m_str_canvas_width;
@synthesize m_str_canvas_height;
-(id) initWithCoder:(NSCoder *)aDecoder{
    if (self = [super init])
    {
        self.m_str_man_height = [aDecoder decodeObjectForKey:@"m_str_man_height"];
        self.m_str_woman_height = [aDecoder decodeObjectForKey:@"m_str_woman_height"];
        self.m_str_canvas_width = [aDecoder decodeObjectForKey:@"m_str_canvas_width"];
        self.m_str_canvas_height = [aDecoder decodeObjectForKey:@"m_str_canvas_height"];
    }
    return self;
}
-(void) encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:m_str_man_height forKey:@"m_str_man_height"];
    [aCoder encodeObject:m_str_woman_height forKey:@"m_str_woman_height"];
    [aCoder encodeObject:m_str_canvas_width forKey:@"m_str_canvas_width"];
    [aCoder encodeObject:m_str_canvas_height forKey:@"m_str_canvas_height"];
}

+(BOOL) save:(SettingModel*) model{
    //保存配置信息
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSData *udObject = [NSKeyedArchiver archivedDataWithRootObject:model];
    [ud setObject:udObject forKey:@"SettingModel"];
    return YES;
}
+(SettingModel*) load{
    SettingModel* model = nil;
    //读取用户信息
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    NSData* udObject = [ud objectForKey:@"SettingModel"];
    model = [NSKeyedUnarchiver unarchiveObjectWithData:udObject];
    if(model==nil){
        model = [[SettingModel alloc]init];
        model.m_str_canvas_height = @"80";
        model.m_str_canvas_width = @"80";
        model.m_str_man_height = @"175";
        model.m_str_woman_height = @"175";
    }
    return model;
}
@end

