//
//  Demo19ViewController.m
//  JHFrameLayoutDemo
//
//  Created by HaoCold on 2019/7/19.
//

#import "Demo19ViewController.h"

@interface Demo19ViewController ()
@property (nonatomic,  strong) UIView *view1;
@property (nonatomic,  strong) UIView *view2;
@end

@implementation Demo19ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(50, 90, 50, 50);
    view.backgroundColor = [UIColor brownColor];
    [self.view addSubview:view];
    _view1 = view;
    
    {
    UIView *view = [[UIView alloc] init];
    view.frame = CGRectMake(50, 150, 50, 50);
    view.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view];
    _view2 = view;
    }
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:({
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.titleLabel.font = [UIFont systemFontOfSize:16];
        [button setTitle:@"操作" forState:0];
        [button setTitleColor:[UIColor blackColor] forState:0];
        [button sizeToFit];
        [button addTarget:self action:@selector(clickAction) forControlEvents:1<<6];
        button;
    })];
}

- (void)clickAction
{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:0];
    UIAlertAction *action1 = [UIAlertAction actionWithTitle:@"修改transform" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self modify];
    }];
    UIAlertAction *action2 = [UIAlertAction actionWithTitle:@"设置frame" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self resetFrame];
    }];
    UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"设置anchorPoint" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        [self anchorPoint];
    }];
    
    [alert addAction:action1];
    [alert addAction:action2];
    [alert addAction:action3];
    
    [self presentViewController:alert animated:YES completion:nil];
}

- (void)modify
{
    _view1.transform = CGAffineTransformMakeTranslation(50, 0);
    //_view1.transform = CGAffineTransformMakeRotation(M_PI_4);
    //_view1.transform = CGAffineTransformMakeScale(1.2, 1.2);
    
    _view2.transform = CGAffineTransformMakeTranslation(50, 0);
}

- (void)resetFrame
{
#if 0
    //
    CGRect frame = _view1.bounds;
    frame.size.width = 70;
    frame.size.height = 70;
    _view1.bounds = frame;
#else
    // _view 在 transform 变化后，修改 frame，导致 _view 不可见了
    CGRect frame = _view1.frame;
    frame.size.width = 70;
    frame.size.height = 70;
    _view1.frame = frame;
#endif
}

- (void)anchorPoint
{
    _view2.layer.anchorPoint = CGPointMake(0, 0);
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
