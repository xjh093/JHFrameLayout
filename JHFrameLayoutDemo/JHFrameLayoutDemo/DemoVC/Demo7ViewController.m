//
//  Demo7ViewController.m
//  JHFrameLayoutDemo
//
//  Created by xuejinghao on 2018/5/30.
//

#import "Demo7ViewController.h"
#import "JHFrameLayout.h"

@interface Demo7ViewController ()
@property (nonatomic,  strong) UIView *grayView;
@property (nonatomic,  strong) UILabel *label;
@end

@implementation Demo7ViewController

- (void)loadView{
    
    /**<
     
     This Demo tells you how to use 'UIView+JHFrameLayout' simplely.
     
     这个 Demo 简单地介绍了 'UIView+JHFrameLayout' 的使用
     
     */
    
    [super loadView];
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(250, 100, 60, 30);
    view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view];
    _grayView = view;
    
    [view jh_leftIs:10 fromMiddleOfView:self.view updateWidth:NO];
    
    // updateHeight:NO
    UILabel *label1 = [[UILabel alloc] init];
    label1.text = @"updateHeight:NO";
    label1.textColor = [UIColor blackColor];
    label1.font = [UIFont systemFontOfSize:12];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:label1];
    _label = label1;
    
    [label1 jh_topIs:160];
    [label1 jh_heightIs:50];
    [label1 jh_widthIs:100];
    [label1 jh_rightIs:0 fromMiddleOfView:self.view updateWidth:NO];
    
    CGFloat width = CGRectGetWidth(self.view.bounds);
    
    UIButton *button1 = [self jhsetupButton];
    button1.frame = CGRectMake(0, CGRectGetMaxY(label1.frame)+50, width, 40);
    [button1 setTitle:@"Click Me\n[_label jh_topIs:-5 fromTopOfView:_grayView updateHeight:NO];" forState:0];
    [button1 addTarget:self action:@selector(update1) forControlEvents:1<<6];
    
    UIButton *button2 = [self jhsetupButton];
    button2.frame = CGRectMake(0, CGRectGetMaxY(button1.frame)+10, width, 40);
    [button2 setTitle:@"Click Me\n[_label jh_topIs:-5 fromMiddleOfView:_grayView updateHeight:NO];" forState:0];
    [button2 addTarget:self action:@selector(update2) forControlEvents:1<<6];
    
    UIButton *button3 = [self jhsetupButton];
    button3.frame = CGRectMake(0, CGRectGetMaxY(button2.frame)+10, width, 40);
    [button3 setTitle:@"Click Me\n[_label jh_topIs:-5 fromBottomOfView:_grayView updateHeight:NO];" forState:0];
    [button3 addTarget:self action:@selector(update3) forControlEvents:1<<6];
    
    UIButton *nextButton = [self jhsetupButton];
    nextButton.frame = CGRectMake(0, CGRectGetMaxY(button3.frame)+30, width, 40);
    [nextButton setTitle:@"More Demo About CenterY" forState:0];
    [nextButton addTarget:self action:@selector(goSecondVC) forControlEvents:1<<6];
    
    if (_second) {
        
        button1.hidden = button2.hidden = button3.hidden = YES;
        
        UIButton *button4 = [self jhsetupButton];
        button4.frame = CGRectMake(0, CGRectGetMaxY(label1.frame)+50, width, 40);
        [button4 setTitle:@"Click Me\n[_label jh_centerYIs:-5 fromTopOfView:_grayView updateHeight:NO];" forState:0];
        [button4 addTarget:self action:@selector(update4) forControlEvents:1<<6];
        
        UIButton *button5 = [self jhsetupButton];
        button5.frame = CGRectMake(0, CGRectGetMaxY(button4.frame)+10, width, 40);
        [button5 setTitle:@"Click Me\n[_label jh_centerYIs:-5 fromMiddleOfView:_grayView updateHeight:NO];" forState:0];
        [button5 addTarget:self action:@selector(update5) forControlEvents:1<<6];
        
        UIButton *button6 = [self jhsetupButton];
        button6.frame = CGRectMake(0, CGRectGetMaxY(button5.frame)+10, width, 40);
        [button6 setTitle:@"Click Me\n[_label jh_centerYIs:-5 fromBottomOfView:_grayView updateHeight:NO];" forState:0];
        [button6 addTarget:self action:@selector(update6) forControlEvents:1<<6];
        
        nextButton.hidden = YES;
    }
}

- (void)viewDidLoad {
    [super viewDidLoad];
        // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Demo7";
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(0, 0, 64, 44);
        button.backgroundColor = [UIColor lightGrayColor];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [button setTitle:@"layout" forState:0];
        [button setTitleColor:[UIColor blackColor] forState:0];
        [button addTarget:self action:@selector(layoutStyle) forControlEvents:1<<6];
        button;
    })];
    
}

- (void)layoutStyle
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"layout Style" message:@"调整布局" preferredStyle:0];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"Style 1" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self style1];
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"Style 2" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self style2];
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"Style 3" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self style3];
    }];
    [alert addAction:action1];
    [alert addAction:action2];
    [alert addAction:action3];
    [self presentViewController:alert animated:YES completion:nil];
}

- (UIButton *)jhsetupButton
{
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeSystem];
    button1.titleLabel.font = [UIFont systemFontOfSize:10];
    button1.titleLabel.numberOfLines = 0;
    button1.titleLabel.textAlignment = 1;
    button1.backgroundColor = [UIColor lightGrayColor];
    [button1 setTitleColor:[UIColor blackColor] forState:0];
    [self.view addSubview:button1];
    return button1;
}

- (void)style1
{
    [UIView animateWithDuration:0.25 animations:^{
        [_grayView jh_topIs:100];
        [_label jh_topIs:160];
    }];
    
}

- (void)style2
{
    [UIView animateWithDuration:0.25 animations:^{
        [_grayView jh_topIs:130];
        [_label jh_centerYIsEqualToView:_grayView];
    }];
    
}

- (void)style3
{
    [UIView animateWithDuration:0.25 animations:^{
        [_grayView jh_topIs:160];
        [_label jh_topIs:100];
    }];
    
}

- (void)update1
{
    /**<
     
     if you set 'updateHeight' NO, you will modify 'y'
     
     updateHeight 设置为 NO, 表示你要修改 y 的值
     */
    
    [UIView animateWithDuration:.5 animations:^{
        [_label jh_topIs:-5 fromTopOfView:_grayView updateHeight:NO];
    }];
    
}

- (void)update2
{
    /**<
     
     if you set 'updateHeight' NO, you will modify 'y'
     
     updateHeight 设置为 NO, 表示你要修改 y 的值
     */
    
    [UIView animateWithDuration:.5 animations:^{
        [_label jh_topIs:-5 fromMiddleOfView:_grayView updateHeight:NO];
    }];
    
}

- (void)update3
{
    /**<
     
     if you set 'updateHeight' NO, you will modify 'y'
     
     updateHeight 设置为 NO, 表示你要修改 y 的值
     */
    
    [UIView animateWithDuration:.5 animations:^{
        [_label jh_topIs:-5 fromBottomOfView:_grayView updateHeight:NO];
    }];
    
}

- (void)goSecondVC
{
    Demo7ViewController *vc = [[Demo7ViewController alloc] init];
    vc.second = YES;
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)update4
{
    [UIView animateWithDuration:.5 animations:^{
        [_label jh_centerYIs:-5 fromTopOfView:_grayView updateHeight:NO];
    }];
}

- (void)update5
{
    [UIView animateWithDuration:.5 animations:^{
        [_label jh_centerYIs:-5 fromMiddleOfView:_grayView updateHeight:NO];
    }];
}

- (void)update6
{
    [UIView animateWithDuration:.5 animations:^{
        [_label jh_centerYIs:-5 fromBottomOfView:_grayView updateHeight:NO];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
        // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
