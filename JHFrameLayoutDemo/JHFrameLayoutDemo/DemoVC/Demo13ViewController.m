//
//  Demo13ViewController.m
//  JHFrameLayoutDemo
//
//  Created by xuejinghao on 2018/11/5.
//

#import "Demo13ViewController.h"
#import "JHFrameLayout.h"

@interface CustomView: JHFrameLayoutView
@end
@implementation CustomView
@end

@interface Demo13ViewController ()

@end

@implementation Demo13ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /**
     
     a custom view inherit JHFrameLayoutView
     
     自定义的view 继承自 JHFrameLayoutView
     
     */
    
    self.navigationItem.title = @"Demo13";
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    CustomView *view = [[CustomView alloc] init];
    view.frame = CGRectMake(10, CGRectGetMaxY(self.navigationController.navigationBar.frame) + 10, CGRectGetWidth(self.view.frame)-20, 300);
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    UIView *layoutView = [[UIView alloc] init];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
