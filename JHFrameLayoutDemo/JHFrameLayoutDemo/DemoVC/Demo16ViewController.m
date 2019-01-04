//
//  Demo16ViewController.m
//  JHFrameLayoutDemo
//
//  Created by HaoCold on 2018/11/22.
//

#import "Demo16ViewController.h"
#import "JHFrameLayout.h"

@interface Demo16ViewController ()

@end

@implementation Demo16ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /**
     
     UILabel text change
     
     UILabel 文字变化
     */
    
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationItem.title = @"UILabel text";
    
    JHFrameLayoutView *layoutView = [[JHFrameLayoutView alloc] init];
    layoutView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:layoutView];
    
    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor redColor];
    [layoutView addSubview:view1];
    
    UILabel *label1 = [[UILabel alloc] init];
    label1.backgroundColor = [UIColor brownColor];
    label1.text = @"123456";
    [layoutView addSubview:label1];
    
    UIView *view2 = [[UIView alloc] init];
    view2.backgroundColor = [UIColor greenColor];
    [layoutView addSubview:view2];
    
    UILabel *label2 = [[UILabel alloc] init];
    label2.backgroundColor = [UIColor orangeColor];
    label2.text = @"123456";
    [layoutView addSubview:label2];
    
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
    [button setTitle:@"Change Label Text" forState:0];
    [button setTitleColor:[UIColor blackColor] forState:0];
    [button addTarget:self action:@selector(buttonEVent) forControlEvents:1<<6];
    [self.view addSubview:button];
    
    view1.tag = 100;
    view2.tag = 200;
    view3.tag = 300;
    view4.tag = 400;
    label1.tag = 500;
    label2.tag = 600;
    
    layoutView.jhLayout
    .topIs(100)
    .leftIsEqualToRight(20)
    .bottomOffsetMiddleOfView(0, self.view, YES);
    
    view1.jhLayout
    .topIs(10)
    .leftIsEqualToRight(10)
    .heightIs(20);
    
    label1.jhLayout
    .topOffsetBottomOfView(10, view1, NO)
    .leftIsEqualToRight(10)
    .autoHeight()
    .maxHeight(65);
    
    view2.jhLayout
    .topOffsetBottomOfView(10, label1, NO)
    .leftIsEqualToRight(10)
    .heightIs(20);
    
    label2.jhLayout
    .leftIsEqualToView(view2)
    .topOffsetBottomOfView(20, view2, NO)
    .heightIs(20)
    .autoWidth()
    .maxWidth(150);
    
    view3.jhLayout
    .topIsEqualToView(label2)
    .leftOffsetRightOfView(10, label2, NO)
    .widthIs(30)
    .heightIs(20);
    
    view4.jhLayout
    .topIsEqualToView(label2)
    .leftOffsetRightOfView(10, view3, NO)
    .widthIs(30)
    .heightIs(20);
}

- (void)buttonEVent
{
    UILabel *label1 = [self.view viewWithTag:500];
    
    NSArray *array1 = @[
@"1234567890qwertyui234567890",
@"1234567890qwertyui2345678901234567890qwertyui234567890",
@"1234567890qwertyui2341234567890qwertyui2345678901235346545678901234567890qwertyui234567890",
@"1234567890qwertyui2341234567890qwertyui2345678901235346545678901234567890qwertyui2345678906545678901234567890qwertyui234567890",
@"1234567890qwertyui2341234567890qwertyui2345678901235346545678901234567890qwertyui2345678906545678901234567890qwertyui2345678901234567890qwertyui234567890",
@""];
    
    label1.text = array1[arc4random()%array1.count];
    
    UILabel *label2 = [self.view viewWithTag:600];
    
    NSArray *array2 = @[@"123456",
                        @"1234567890qwerty",
                        @"1234567890qwertyui2341234",
                        @""];
    
    label2.text = array2[arc4random()%array2.count];
    
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
