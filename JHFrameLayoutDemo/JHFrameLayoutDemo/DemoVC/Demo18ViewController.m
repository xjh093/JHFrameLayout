//
//  Demo18ViewController.m
//  JHFrameLayoutDemo
//
//  Created by HaoCold on 2019/6/26.
//

#import "Demo18ViewController.h"
#import "JHFrameLayout.h"

@interface Demo18ViewController ()

@end

@implementation Demo18ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
     
     跨层级视图的布局
     
     subviews has different superview.
     
     view1
     --view1_1
       --view1_1_1
     
     view2
     --view2_1
       --view2_1_1
     */
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"跨层级视图的布局";
    
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:view1];
    
    UIView *view1_1 = [[UIView alloc] init];
    view1_1.backgroundColor = [UIColor redColor];
    [view1 addSubview:view1_1];
    
    UIView *view1_1_1 = [[UIView alloc] init];
    view1_1_1.backgroundColor = [UIColor orangeColor];
    [view1_1 addSubview:view1_1_1];
    
    UIView *view1_2 = [[UIView alloc] init];
    view1_2.backgroundColor = [UIColor cyanColor];
    [view1 addSubview:view1_2];
    
    
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor brownColor];
    [self.view addSubview:view2];
    
    UIView *view2_1 = [[UIView alloc] init];
    view2_1.backgroundColor = [UIColor blueColor];
    [view2 addSubview:view2_1];
    
    UIView *view2_1_1 = [[UIView alloc] init];
    view2_1_1.backgroundColor = [UIColor yellowColor];
    [view2_1 addSubview:view2_1_1];
    
    UIView *view2_2 = [[UIView alloc] init];
    view2_2.backgroundColor = [UIColor blackColor];
    [view2 addSubview:view2_2];
    
    
    [view1 jh_widthIsEqualToView:self.view];
    [view1 jh_topIs:0 fromBottomOfView:self.navigationController.navigationBar];
    [view1 jh_bottomIs:0 fromMiddleOfView:self.view updateHeight:YES];
    
    [view2 jh_sizeIsEqualToView:view1];
    [view2 jh_topIs:10 fromBottomOfView:view1];
    
    [view1_1 jh_leftIs:10];
    [view1_1 jh_heightIs:50];
    [view1_1 jh_rightIs:50 fromMiddleOfView:view1 updateWidth:YES];
    [view1_1 jh_bottomIs:-5 fromBottomOfView:view1];
    
    [view2_1 jh_topIs:5];
    [view2_1 jh_sizeIs:CGSizeMake(100, 75)];
    [view2_1 jh_rightIs:0 fromRightOfView:view1_1];
    
    [view1_1_1 jh_topIsEqualToBottom:5];
    [view1_1_1 jh_leftIs:0 fromLeftOfView:view2_1];
    [view1_1_1 jh_widthIs:70];
    
    [view2_1_1 jh_topIsEqualToBottom:5];
    [view2_1_1 jh_leftIs:0 fromRightOfView:view1_1_1];
    [view2_1_1 jh_rightIs:-5 fromRightOfView:view1_1 updateWidth:YES];
    
    [view1_2 jh_sizeIs:CGSizeMake(80, 50)];
    [view1_2 jh_centerIsEqualToView:view1];
    
    // 设置为0 来看看不同的效果
    // set 0, see difference
#if 0
    
    /*
     view2_2 is still in view2
     */
    
    [view2_2 jh_sizeIs:CGSizeMake(30, 30)];
    //[view2_2 jh_centerIsEqualToView:view1];
    [view2_2 jh_centerIsEqualToView:view1 crossLevel:NO];
#else
    
    /*
     it looks like view2_2 is in view1, actually, view2_2 is still in view2
     */
    
    [view2_2 jh_sizeIs:CGSizeMake(30, 30)];
    [view2_2 jh_centerIsEqualToView:view1 crossLevel:YES];
#endif
    
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
