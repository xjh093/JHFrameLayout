//
//  Demo17ViewController.m
//  JHFrameLayoutDemo
//
//  Created by HaoCold on 2018/12/10.
//

#import "Demo17ViewController.h"
#import "JHFrameLayout.h"
#import "Demo17ViewCell.h"

@interface Demo17ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic,  strong) UITableView *tableView;

@property (nonatomic,  strong) NSArray *dataArray;
@end

@implementation Demo17ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
        // Do any additional setup after loading the view.
    
    /*
     UITableViewCell auto height
     
     自动高度
     */
    
    self.navigationItem.title = @"Cell 自动高度";
    self.view.backgroundColor = [UIColor whiteColor];
    
    _dataArray = @[
@"1234567890qwertyui234567890",
@"1234567890qwertyui2345678901234567890qwertyui234567890",
@"1234567890qwertyui2341234567890qwertyui2345678901235346545678901234567890qwertyui234567890",
@"1234567890qwertyui2341234567890qwertyui2345678901235346545678901234567890qwertyui2345678906545678901234567890qwertyui234567890",
@"1234567890qwertyui2341234567890qwertyui2345678901235346545678901234567890qwertyui2345678906545678901234567890qwertyui2345678901234567890qwertyui234567890",
@"",
@"1234567890qwertyui234567890",
@"1234567890qwertyui2345678901234567890qwertyui234567890",
@"1234567890qwertyui2341234567890qwertyui2345678901235346545678901234567890qwertyui234567890",
@"1234567890qwertyui2341234567890qwertyui2345678901235346545678901234567890qwertyui2345678906545678901234567890qwertyui234567890",
@"1234567890qwertyui2341234567890qwertyui2345678901235346545678901234567890qwertyui2345678906545678901234567890qwertyui2345678901234567890qwertyui234567890",
@"",
@"1234567890qwertyui234567890",
@"1234567890qwertyui2345678901234567890qwertyui234567890",
@"1234567890qwertyui2341234567890qwertyui2345678901235346545678901234567890qwertyui234567890",
@"1234567890qwertyui2341234567890qwertyui2345678901235346545678901234567890qwertyui2345678906545678901234567890qwertyui234567890",
@"1234567890qwertyui2341234567890qwertyui2345678901235346545678901234567890qwertyui2345678906545678901234567890qwertyui2345678901234567890qwertyui234567890",
@"",
@"1234567890qwertyui234567890",
@"1234567890qwertyui2345678901234567890qwertyui234567890",
@"1234567890qwertyui2341234567890qwertyui2345678901235346545678901234567890qwertyui234567890",
@"1234567890qwertyui2341234567890qwertyui2345678901235346545678901234567890qwertyui2345678906545678901234567890qwertyui234567890",
@"1234567890qwertyui2341234567890qwertyui2345678901235346545678901234567890qwertyui2345678906545678901234567890qwertyui2345678901234567890qwertyui234567890",
@"",
                   ];
    
    [self.view addSubview:self.tableView];
    _tableView.frame = self.view.bounds;
    
}

#pragma mark -------------------------------------事件-------------------------------------------

#pragma mark ---UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"heightForRowAtIndexPath:%@",@(indexPath.row));
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"cellForRowAtIndexPath:%@",@(indexPath.row));
    static NSString *ID = @"resueID";
    Demo17ViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[Demo17ViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.layoutView.tag = indexPath.row;
    [cell configureWithText:_dataArray[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark -------------------------------------懒加载-----------------------------------------

- (UITableView *)tableView{
    if (!_tableView) {
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectZero style:0];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.estimatedRowHeight = 60;
        tableView.rowHeight = UITableViewAutomaticDimension;
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
