//
//  Demo1ViewController.m
//  JHFrameLayoutDemo
//
//  Created by xuejinghao on 2018/5/29.
//

#import "Demo1ViewController.h"
#import "JHFrameLayout.h"

@interface Demo1ViewController ()

@end

@implementation Demo1ViewController

- (void)loadView{
    
    /**<
     
     This Demo tells you how to use 'UIView+JHFrameLayout' simplely.
     
     这个 Demo 简单地介绍了 'UIView+JHFrameLayout' 的使用
     
     */
    
    [super loadView];
    
    // top,left,width,height
    UIView *view = [[UIView alloc] init];
    view.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:view];
    [view jh_topIs:CGRectGetMaxY(self.navigationController.navigationBar.frame) + 10];
    [view jh_leftIs:10];
    [view jh_widthIs:CGRectGetWidth(self.view.frame) - 20];
    [view jh_heightIs:300];
    
    // size, origin
    UILabel *label1 = [[UILabel alloc] init];
    label1.text = @"size,origin -> frame";
    label1.textColor = [UIColor blackColor];
    label1.font = [UIFont systemFontOfSize:16];
    label1.textAlignment = NSTextAlignmentCenter;
    label1.backgroundColor = [UIColor orangeColor];
    [view addSubview:label1];
    
    [label1 jh_sizeIs:CGSizeMake(200, 40)];
    [label1 jh_originIs:CGPointMake(20, 20)];
    
    
    // size, center
    UILabel *label2 = [[UILabel alloc] init];
    label2.text = @"size,center -> frame";
    label2.textColor = [UIColor blackColor];
    label2.font = [UIFont systemFontOfSize:16];
    label2.textAlignment = NSTextAlignmentCenter;
    label2.backgroundColor = [UIColor brownColor];
    [view addSubview:label2];
    
    [label2 jh_sizeIs:CGSizeMake(200, 40)];
    [label2 jh_centerIs:CGPointMake(self.view.center.x, CGRectGetMaxY(label1.frame) + 40)];
    
    
    // top,left,width,height
    UILabel *label3 = [[UILabel alloc] init];
    label3.text = @"top,left,width,height -> frame";
    label3.textColor = [UIColor blackColor];
    label3.font = [UIFont systemFontOfSize:16];
    label3.textAlignment = NSTextAlignmentCenter;
    label3.backgroundColor = [UIColor grayColor];
    [view addSubview:label3];
    
    [label3 jh_topIs:CGRectGetMaxY(label2.frame) + 20];
    [label3 jh_leftIs:30];
    [label3 jh_widthIs:250];
    [label3 jh_heightIs:40];
    
    // size,bottom,right
    UILabel *label4 = [[UILabel alloc] init];
    label4.text = @"size,bottom,right -> frame";
    label4.textColor = [UIColor blackColor];
    label4.font = [UIFont systemFontOfSize:16];
    label4.textAlignment = NSTextAlignmentCenter;
    label4.backgroundColor = [UIColor yellowColor];
    [view addSubview:label4];
    
    [label4 jh_sizeIs:CGSizeMake(200, 40)];
    
    /**<
     
     Set the distance between view's bottom with it's parent-view's bottom,
     If view's 'height' > 0,it modify the value of 'y',
     Otherwise modify 'height'.
     
     设置底部 距离父视图 底部的距离，
     如果视图的 height 大于 0，就修改 y 的值，
     否则修改视图的高度。
     */
    [label4 jh_bottomIs:-10];
    
    /**<
     
     Set the distance between view's right with it's parent-view's right,
     If view's 'width' > 0,it modify the value of 'x',
     Otherwise modify 'width'.
     
     设置右侧 距离父视图 右侧的距离，
     如果视图的 width 大于 0，就修改 x 的值，
     否则修改视图的宽度。
     */
    [label4 jh_rightIs:-10];
    
    
    // top,left,right,bottom
    UILabel *label5 = [[UILabel alloc] init];
    label5.text = @"top,left,right,bottom -> frame";
    label5.textColor = [UIColor blackColor];
    label5.font = [UIFont systemFontOfSize:16];
    label5.textAlignment = NSTextAlignmentCenter;
    label5.backgroundColor = [UIColor orangeColor];
    [self.view addSubview:label5];
    
    [label5 jh_topIs:CGRectGetMaxY(view.frame) + 10];
    [label5 jh_leftIs:30];
    [label5 jh_bottomIs:-20];
    [label5 jh_rightIs:-30];
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"Demo1";
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
