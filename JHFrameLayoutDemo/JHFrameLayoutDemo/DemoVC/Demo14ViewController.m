//
//  Demo14ViewController.m
//  JHFrameLayoutDemo
//
//  Created by Apple on 2018/11/6.
//

#import "Demo14ViewController.h"
#import "JHFrameLayout.h"


@interface Demo14ViewController ()

@end

@implementation Demo14ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /**
        some more simple methods
     
        一些简便的方法
     
     */
    
    
    self.navigationItem.title = @"Demo14";
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor brownColor];
    [self.view addSubview:view1];
    
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor orangeColor];
    [view1 addSubview:view2];
    
    UIView *view3 = [[UIView alloc] init];
    view3.backgroundColor = [UIColor purpleColor];
    [view2 addSubview:view3];
    
    UIView *view4 = [[UIView alloc] init];
    view4.backgroundColor = [UIColor grayColor];
    [view3 addSubview:view4];
    
    UIView *view5 = [[UIView alloc] init];
    view5.backgroundColor = [UIColor yellowColor];
    view5.alpha = 0.5;
    [view4 addSubview:view5];
    
    
    [view1 jh_topIs:100];
    [view1 jh_heightIs:100];
    /*
     [view1 jh_leftIs:20];
     [view1 jh_rightIs:-20 fromRightOfView:self.view updateWidth:YES];
     */
    [view1 jh_leftIsEqualToRight:20];
    
    [view2 jh_leftIs:10];
    [view2 jh_widthIs:100];
    /*
     [view2 jh_topIs:10];
     [view2 jh_bottomIs:-10 fromBottomOfView:view1 updateHeight:YES];
     */
    [view2 jh_topIsEqualToBottom:10];
    
    
    [view3 jh_leftIsEqualToRight:10];
    [view3 jh_topIsEqualToBottom:10];
    
    /*
     [view4 jh_leftIsEqualToRight:20];
     [view4 jh_topIsEqualToBottom:20];
     */
    [view4 jh_edgeIs:20];
    
    //
    /*
     [view5 jh_leftIsEqualToRight:-10];
     [view5 jh_topIsEqualToBottom:-10];
     */
    [view5 jh_edgeIs:-10];
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
