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
    
    m_label_man = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, 200, 20)];
    m_label_man.textAlignment = NSTextAlignmentCenter;
    m_label_woman = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, 200, 20)];
    m_label_woman.textAlignment = NSTextAlignmentCenter;
    
    [m_image_man setImage:[UIImage imageNamed:@"man.png"]];
    [m_image_woman setImage:[UIImage imageNamed:@"woman.png"]];

   
    
    self.navigationItem.title=@"情侣身高对比";
    
    
    self.navigationItem.leftBarButtonItem = [ButtonUtil createToolBarButton:@"关于" target:self action:@selector(toolBarLeft)];
    
    self.navigationItem.rightBarButtonItem = [ButtonUtil createToolBarButton:@"设置" target:self action:@selector(toolBarRight)];
    
    [self.view addSubview:m_image_man];
    [self.view addSubview:m_image_woman];
    
    [self.view addSubview:m_label_man];
    [self.view addSubview:m_label_woman];


    SettingModel* model = [SettingModel load];
    
    [self resizeAll:model];
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
-(void) resizeAll : (SettingModel*) model
{
    [Util getResult:model
                boy:&m_rect_man
               girl:&m_rect_woman];
    
    m_label_man.text=[NSString stringWithFormat:@"身高%.0fcm",[model.m_str_man_height floatValue]];
    m_label_woman.text = [NSString stringWithFormat:@"身高%.0fcm",[model.m_str_woman_height floatValue]];
    
    CGRect m_rect_label_man;
    CGRect m_rect_label_woman;
    m_rect_label_man.origin.y = m_rect_man.origin.y - m_label_man.frame.size.height;
    m_rect_label_man.origin.x = m_rect_man.origin.x;
    m_rect_label_woman.origin.y = m_rect_woman.origin.y - m_label_woman.frame.size.height;
    m_rect_label_woman.origin.x = m_rect_woman.origin.x;
    
    m_rect_label_man.size = m_label_man.frame.size;
    m_rect_label_woman.size = m_label_woman.frame.size;
    
    m_rect_label_man.size.width = m_rect_man.size.width;
    m_rect_label_woman.size.width = m_rect_woman.size.width;
    
    NSLogExt(@"height=%f width=%f",m_label_man.frame.size.height,m_label_man.frame.size.width);
    
    [m_label_man setFrame:m_rect_label_man];
    [m_label_woman setFrame:m_rect_label_woman];
    
    [m_image_man setFrame:m_rect_man];
    [m_image_woman setFrame:m_rect_woman];
}
-(void) SettingViewClose:(SettingModel*) model
{
    NSLog(@"SettingViewClose");
    [self resizeAll:model];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
