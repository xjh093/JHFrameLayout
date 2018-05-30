//
//  Demo2ViewController.m
//  JHFrameLayoutDemo
//
//  Created by xuejinghao on 2018/5/29.
//

#import "Demo2ViewController.h"
#import "JHFrameLayout.h"

@interface Demo2ViewController ()

@end

@implementation Demo2ViewController

- (void)loadView{
    
    /**<
     
     This Demo tells you how to use 'UIView+JHFrameLayout' simplely.
     
     这个 Demo 简单地介绍了 'UIView+JHFrameLayout' 的使用
     
     */
    
    [super loadView];
    
    // ratioOfViewWidth
    UILabel *label1 = [[UILabel alloc] init];
    label1.text = @"ratioOfViewWidth";
    label1.textColor = [UIColor blackColor];
    label1.font = [UIFont systemFontOfSize:16];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.backgroundColor = [UIColor orangeColor];
    label1.numberOfLines = 0;
    [self.view addSubview:label1];
    
    [label1 jh_topIs:100];
    [label1 jh_leftIs:20];
    [label1 jh_widthIs:0.9 ratioOfViewWidth:self.view];
    [label1 jh_heightIs:0.3 ratioOfViewWidth:self.view];
    
    
    // ratioOfViewHeight
    UILabel *label2 = [[UILabel alloc] init];
    label2.text = @"ratioOfViewHeight";
    label2.textColor = [UIColor blackColor];
    label2.font = [UIFont systemFontOfSize:16];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.backgroundColor = [UIColor lightGrayColor];
    label2.numberOfLines = 0;
    [self.view addSubview:label2];
    
    [label2 jh_leftIs:10];
    [label2 jh_topIs:CGRectGetMaxY(label1.frame) + 10];
    [label2 jh_widthIs:3 ratioOfViewHeight:label1];
    [label2 jh_heightIs:0.8 ratioOfViewHeight:label1];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Demo2";
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
