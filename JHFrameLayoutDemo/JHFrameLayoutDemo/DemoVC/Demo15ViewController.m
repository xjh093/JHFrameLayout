//
//  Demo15ViewController.m
//  JHFrameLayoutDemo
//
//  Created by HaoCold on 2018/11/12.
//

#import "Demo15ViewController.h"
#import "JHFrameLayout.h"

@interface Demo15ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,  strong) UITableView *tableView;

@end

@implementation Demo15ViewController

- (void)loadView{
    self.view = [[JHFrameLayoutView alloc] initWithFrame:[UIScreen mainScreen].bounds];
    [self.view addSubview:self.tableView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    /*
        UITableViewCell auto height
     
        自动高度
     */
    
    self.navigationItem.title = @"Cell 自动高度";
    
    self.tableView.jhLayout
    .topOffsetBottomOfView(0, self.navigationController.navigationBar, NO)
    .widthIsEqualToView(self.view)
    .bottomOffsetBottomOfView(0, self.view, YES);
    
}

#pragma mark -------------------------------------事件-------------------------------------------

#pragma mark ---UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 12;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return (indexPath.row+1)*20+5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"resueID";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
        [cell.contentView addSubview:({
            JHFrameLayoutView *view = [[JHFrameLayoutView alloc] init];
            view.backgroundColor = [UIColor lightGrayColor];
            view.jhLayout.edgeIs(5);
            view;
        })];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"Row %@",@(indexPath.row+1)];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
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

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
