//
//  Util.h
//  Lovers
//
//  Created by Apple on 14-8-8.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PlatformUtil.h"
@interface Util : NSObject

+(void) getResult : (Float32) boy_h girl_height : (Float32) girl_h boy : (CGRect*) boy girl : (CGRect*) girl;
+(void) getResult  : (Float32) canvas_width_ratio : (Float32) canvas_height_ratio boy_height :  (Float32) boy_h girl_height : (Float32) girl_h boy : (CGRect*) boy girl : (CGRect*) girl;

+(void) showKeyboard:(UIView*) view;
+(void) hideKeyboard:(UIView*) view;
+(void) editingKeyboard:(UIView*) view :(UITextField*) text;
@end
