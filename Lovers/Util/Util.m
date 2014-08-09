//
//  Util.m
//  Lovers
//
//  Created by Apple on 14-8-8.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import "Util.h"
#import <math.h>
@implementation Util
+(void) getResult : (Float32) boy_h girl_height : (Float32) girl_h boy : (CGRect*) boy girl : (CGRect*) girl
{
    [Util getResult:0.8 :0.8 boy_height:boy_h girl_height:girl_h boy:boy girl:girl];
}
+(void) getResult  : (Float32) canvas_width_ratio : (Float32) canvas_height_ratio boy_height :  (Float32) boy_h girl_height : (Float32) girl_h boy : (CGRect*) boy girl : (CGRect*) girl
{
    CGRect canvas={0};
    CGRect screen = [[UIScreen mainScreen] bounds];
    
    screen = CGRECT_HAVE_NAV(screen.origin.x, screen.origin.y, screen.size.width, screen.size.height);
    screen.size.width = screen.size.width-screen.origin.x;
    screen.size.height = screen.size.height-screen.origin.y;
    
    canvas.size.width = screen.size.width * canvas_width_ratio;
    canvas.size.height = screen.size.height * canvas_height_ratio;
    canvas.origin.x = (screen.size.width - canvas.size.width)/2.0f+screen.origin.x;
    canvas.origin.y = (screen.size.height - canvas.size.height)/2.0f+screen.origin.y;

    if (boy_h >= girl_h) {
        boy->size.height = canvas.size.height;
        girl->size.height = ( girl_h / boy_h ) * canvas.size.height;
        boy->origin.y = canvas.origin.y;
        girl->origin.y=canvas.origin.y+ fabs(girl->size.height-canvas.size.height);
    }else{
        boy->size.height = ( boy_h / girl_h ) * canvas.size.height;
        girl->size.height = canvas.size.height;
        boy->origin.y=canvas.origin.y+ fabs(boy->size.height-canvas.size.height);
    }

    boy->size.width = canvas.size.width / 2.0f;
    girl->size.width = canvas.size.width / 2.0f;
    
    boy->origin.x = canvas.origin.x;
    girl->origin.x= canvas.origin.x + canvas.size.width/2.0f;
}
@end
