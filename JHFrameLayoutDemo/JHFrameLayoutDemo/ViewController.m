//
//  ViewController.m
//  JHFrameLayoutDemo
//
//  Created by xuejinghao on 2018/5/29.
//

#import "ViewController.h"
#import "JHUIViewControllerDecoupler.h"
#import "JHFrameLayout.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,  strong) UITableView *tableView;
@end

@implementation ViewController

- (void)loadView{
    self.view = [[JHFrameLayoutView alloc] initWithFrame:[UIScreen mainScreen].bounds];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self setupViews];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    self.navigationItem.title = @"Back";
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    self.navigationItem.title = @"JHFrameLayout";
}

#pragma mark -------------------------------------视图-------------------------------------------

- (void)setupViews
{
#if 0
    CGFloat X,Y,W,H;
    X = 0;
    Y = CGRectGetMaxY(self.navigationController.navigationBar.frame);
    W = CGRectGetWidth(self.view.frame);
    H = CGRectGetHeight(self.view.frame) - Y;
    self.tableView.frame = CGRectMake(X,Y,W,H);
#else
    self.tableView.jhLayout
    .topOffsetBottomOfView(0, self.navigationController.navigationBar, NO)
    .widthIsEqualToView(self.view)
    .bottomOffsetBottomOfView(0, self.view, YES);
#endif
    [self.view addSubview:_tableView];
    self.view.backgroundColor = [UIColor whiteColor];
}

#pragma mark -------------------------------------事件-------------------------------------------

- (void)back
{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark ---UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 22;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"resueID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Demo%@",@(indexPath.row+1)];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    NSString *clsString = [NSString stringWithFormat:@"Demo%@ViewController",@(indexPath.row+1)];
    UIViewController *vc = [JHUIViewControllerDecoupler jh_controllerFromString:clsString paramter:nil];
    [self.navigationController pushViewController:vc animated:YES];
}


#pragma mark -------------------------------------懒加载-----------------------------------------

- (UITableView *)tableView{
    if (!_tableView) {
        
        // 为什么要加一个空view,详见：
        // https://blog.csdn.net/xjh093/article/details/78899390
        [self.view addSubview:[[UIView alloc] init]];
        
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:0];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.rowHeight = 50;
        tableView.tableFooterView = [[UIView alloc] init];
        tableView.showsVerticalScrollIndicator = NO;
        _tableView = tableView;
    }
    return _tableView;
}

@end
