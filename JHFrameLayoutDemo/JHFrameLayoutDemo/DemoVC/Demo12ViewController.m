//
//  Demo12ViewController.m
//  JHFrameLayoutDemo
//
//  Created by 薛精豪 on 2018/8/16.
//

#import "Demo12ViewController.h"
#import "JHFrameLayout.h"

@interface Demo12ViewController ()

@end

@implementation Demo12ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /**<
     
     This Demo tells you how to use 'JHFrameLayoutView' simplely.
     if JHFrameLayoutView is not UIViewController's root view
     JHFrameLayoutView will observe Screen Rotate Notification
     and Observe superview's frame,bounds,center
     
     这个 Demo 简单地介绍了 'JHFrameLayoutView' 的使用
     当 JHFrameLayoutView 不是 UIViewController 的 根视图时
     JHFrameLayoutView 会添加 屏幕旋转 监听，以及 监听 superview 的 frame,bounds,center
     
     */
    
    
    self.navigationItem.title = @"Demo12";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(10, CGRectGetMaxY(self.navigationController.navigationBar.frame) + 10, CGRectGetWidth(self.view.frame)-20, 300);
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    JHFrameLayoutView *layoutView = [[JHFrameLayoutView alloc] init];
    layoutView.backgroundColor = [UIColor lightGrayColor];
    [view addSubview:layoutView];
    
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor redColor];
    [layoutView addSubview:view1];
    
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor greenColor];
    [layoutView addSubview:view2];
    
    UIView *view3 = [[UIView alloc] init];
    view3.backgroundColor = [UIColor blueColor];
    [layoutView addSubview:view3];
    
    UIView *view4 = [[UIView alloc] init];
    view4.backgroundColor = [UIColor purpleColor];
    [layoutView addSubview:view4];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, CGRectGetHeight(self.view.frame) - 50, CGRectGetWidth(self.view.frame)-20 , 30);
    button.backgroundColor = [UIColor lightGrayColor];
    button.titleLabel.font = [UIFont systemFontOfSize:16];
    [button setTitle:@"Change Red View Frame" forState:0];
    [button setTitleColor:[UIColor blackColor] forState:0];
    [button addTarget:self action:@selector(buttonEVent) forControlEvents:1<<6];
    [self.view addSubview:button];
    
    view.tag = 100;
    layoutView.tag = 200;
    view1.tag = 201;
    view2.tag = 202;
    view3.tag = 203;
    view4.tag = 204;
    
    layoutView.jhLayout
    .topOffsetBottomOfView(15, self.navigationController.navigationBar, NO)
    .leftIs(10)
    .rightOffsetRightOfView(-20, self.view, YES)
    .bottomOffsetBottomOfView(-10, view, YES);
    
    view1.jhLayout
    .topIs(10)
    .leftIs(10)
    .sizeIs(CGSizeMake(50, 50));
    
    view2.jhLayout
    .sizeIs(CGSizeMake(50, 50))
    .rightOffsetRightOfView(-10, layoutView, NO)
    .topIs(10);
    
    view3.jhLayout
    .sizeIs(CGSizeMake(50, 50))
    .leftIs(10)
    .bottomOffsetBottomOfView(-10, layoutView, NO);
    
    view4.jhLayout
    .sizeIs(CGSizeMake(50, 50))
    .rightOffsetRightOfView(-10, layoutView, NO)
    .bottomOffsetBottomOfView(-10, layoutView, NO);
    
}

- (void)buttonEVent
{
    UIView *view = [self.view viewWithTag:100];
    CGRect frame = view.frame;
    
    if (frame.size.height == 300) {
        frame.size.height = 400;
        view.frame = frame;
    }else{
        frame.size.height = 300;
        view.frame = frame;
    }
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
