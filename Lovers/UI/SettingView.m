//
//  SettingView.m
//  Lovers
//
//  Created by Apple on 14-8-9.
//  Copyright (c) 2014年 Apple. All rights reserved.
//

#import "SettingView.h"

@interface SettingView ()

@end
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
@end

@implementation SettingView
@synthesize delegate;
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    app = [[UIApplication sharedApplication]delegate];
    self.navigationItem.leftBarButtonItem = [ButtonUtil createToolBarButton:@"返回" target:self action:@selector(toolBarLeft)];
    
    //触摸其它地方让键盘隐藏
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(textfieldTouchUpOutside:)];
    [self.view addGestureRecognizer:singleTap];
    
    m_textfield_canvas_height.delegate = self;
    m_textfield_canvas_width.delegate = self;
    m_textfield_man_height.delegate = self;
    m_textfield_woman_height.delegate = self;
    
    
}
-(void) toolBarLeft
{
    NSLog(@"canvas height=%@\n",m_textfield_canvas_height.text);
        NSLog(@"canvas width=%@\n",m_textfield_canvas_width.text);
        NSLog(@"man height=%@\n",m_textfield_man_height.text);
        NSLog(@"woman height=%@\n",m_textfield_woman_height.text);
    
    m_textfield_canvas_height.delegate = nil;
    m_textfield_canvas_width.delegate = nil;
    m_textfield_man_height.delegate = nil;
    m_textfield_woman_height.delegate = nil;
    
    if(delegate != nil){
        [delegate SettingViewClose];
    }
    [[app navController] popViewControllerAnimated:YES];
}
-(IBAction)textfieldTouchUpOutside:(id)sender
{
    [Util hideKeyboard:self.view];
    
    [m_textfield_canvas_height resignFirstResponder];
    [m_textfield_canvas_width resignFirstResponder];
    [m_textfield_man_height resignFirstResponder];
    [m_textfield_woman_height resignFirstResponder];
}
// 当点击键盘的返回键（右下角）时，执行该方法。
// 一般用来隐藏键盘
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    // When the user presses return, take focus away from the text field so that the keyboard is dismissed.
    [Util hideKeyboard:self.view];
    
    [textField resignFirstResponder];
    return YES;
}
- (void)keyboardWillShow:(NSNotification *)noti
{
    [Util showKeyboard:self.view];
}


- (void)textFieldDidBeginEditing:(UITextField *)textField
{
    [Util editingKeyboard:self.view :textField];
}
#pragma mark -


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
