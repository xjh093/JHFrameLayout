//
//  Demo11ViewController.m
//  JHFrameLayoutDemo
//
//  Created by xuejinghao on 2018/5/30.
//

#import "Demo11ViewController.h"
#import "JHFrameLayout.h"

@interface Demo11ViewController ()

@end

@implementation Demo11ViewController

- (void)loadView{
    
    /**<
     
     This Demo tells you how to use 'JHFrameLayoutView' simplely.
     
     这个 Demo 简单地介绍了 'JHFrameLayoutView' 的使用
     
     */
    
    self.view = [[JHFrameLayoutView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    
    
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view1];
    
    UILabel *label = [[UILabel alloc] init];
    label.text = @"Rotate your phone";
    label.textColor = [UIColor blackColor];
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment = NSTextAlignmentCenter;
    label.backgroundColor = [UIColor grayColor];
    [view1 addSubview:label];
    
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor brownColor];
    [self.view addSubview:view2];
    
    UIView *view3 = [[UIView alloc] init];
    view3.backgroundColor = [UIColor blueColor];
    [self.view addSubview:view3];
    
    UIView *view4 = [[UIView alloc] init];
    view4.backgroundColor = [UIColor greenColor];
    [self.view addSubview:view4];
    
    UIView *view5 = [[UIView alloc] init];
    view5.backgroundColor = [UIColor redColor];
    [self.view addSubview:view5];
    
    
    view1.jhLayout
    .topOffsetBottomOfView(10, self.navigationController.navigationBar, NO)
    .leftIs(10)
    .bottomOffsetMiddleOfView(-50, self.view, YES)
    .rightOffsetMiddleOfView(-5, self.view, YES);
    
    label.jhLayout
    .widthIsRatioOfViewWidth(1, view1)
    .heightIsRatioOfViewHeight(1, view1);
    
    view2.jhLayout
    .topOffsetTopOfView(0, view1, NO)
    .leftOffsetMiddleOfView(5, self.view, NO)
    .widthIsRatioOfViewWidth(1, view1)
    .heightIsRatioOfViewHeight(1, view1);
    
    view3.jhLayout
    .topOffsetMiddleOfView(80, self.view, NO)
    .leftIs(10)
    .bottomOffsetBottomOfView(-10, self.view, YES)
    .rightOffsetMiddleOfView(-5, self.view, YES);
    
    view4.jhLayout
    .topOffsetTopOfView(0, view3, NO)
    .leftOffsetMiddleOfView(5, self.view, NO)
    .widthIsRatioOfViewWidth(1, view3)
    .heightIsRatioOfViewHeight(1, view3);
    
    view5.jhLayout
    .topOffsetBottomOfView(0, view1, NO)
    .leftOffsetRightOfView(0, view1, NO)
    .bottomOffsetTopOfView(0, view3, YES)
    .rightOffsetLeftOfView(0, view4, YES);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Demo11";
    self.view.backgroundColor = [UIColor whiteColor];
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
