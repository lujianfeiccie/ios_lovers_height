//
//  ViewController.m
//  Lovers
//
//  Created by Apple on 14-8-8.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    app = [[UIApplication sharedApplication] delegate];

    
    [Util getResult:0.8 :0.7 boy_height:1.75 girl_height:1.75 boy:&m_rect_man girl:&m_rect_woman];
    
    m_image_man = [[UIImageView alloc]initWithFrame:m_rect_man];
    m_image_woman = [[UIImageView alloc]initWithFrame:m_rect_woman];
    
    [m_image_man setImage:[UIImage imageNamed:@"man.png"]];
    [m_image_woman setImage:[UIImage imageNamed:@"woman.png"]];
    
    self.navigationItem.title=@"情侣身高对比";
    
    
    self.navigationItem.leftBarButtonItem = [ButtonUtil createToolBarButton:@"关于" target:self action:@selector(toolBarLeft)];
    
    self.navigationItem.rightBarButtonItem = [ButtonUtil createToolBarButton:@"设置" target:self action:@selector(toolBarRight)];
    
    [self.view addSubview:m_image_man];
    [self.view addSubview:m_image_woman];
    
}

-(void) toolBarLeft
{
    UIViewController *next = [[self storyboard] instantiateViewControllerWithIdentifier:@"about_view"];
    [[app navController] pushViewController:next animated:YES];
}
-(void) toolBarRight
{
    
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
