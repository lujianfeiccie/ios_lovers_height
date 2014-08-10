//
//  ViewController.m
//  Lovers
//
//  Created by Apple on 14-8-8.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import "ViewController.h"
#import "SettingModel.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    app = [[UIApplication sharedApplication] delegate];


    
    m_image_man = [[UIImageView alloc]init];
    m_image_woman = [[UIImageView alloc]init];
    
    [m_image_man setImage:[UIImage imageNamed:@"man.png"]];
    [m_image_woman setImage:[UIImage imageNamed:@"woman.png"]];

    SettingModel* model = [SettingModel load];
    [Util getResult:model
                boy:&m_rect_man
               girl:&m_rect_woman];
    
    [m_image_man setFrame:m_rect_man];
    [m_image_woman setFrame:m_rect_woman];
    
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
    UIViewController *next = [[self storyboard] instantiateViewControllerWithIdentifier:@"setting_view"];
    ((SettingView*)next).delegate = self;
    [[app navController] pushViewController:next animated:YES];
}

-(void) SettingViewClose:(SettingModel*) model
{
    NSLog(@"SettingViewClose");
    [Util getResult:model
                boy:&m_rect_man
               girl:&m_rect_woman];
    
    [m_image_man setFrame:m_rect_man];
    [m_image_woman setFrame:m_rect_woman];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
