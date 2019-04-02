//
//  Demo17ViewController.m
//  JHFrameLayoutDemo
//
//  Created by HaoCold on 2018/12/10.
//

#import "Demo17ViewController.h"
#import "JHFrameLayout.h"
#import "Demo17ViewCell.h"
#import "YYFPSLabel.h"

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
    
    self.navigationItem.titleView = [[YYFPSLabel alloc] initWithFrame:CGRectMake(0, 0, 80, 40)];
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
@"旅行者2号在1989年拍摄到海王星崔顿卫星的一部分。图片来源：NASA/JPL/USGS\n海王星的卫星崔顿(海卫一)是太阳系中最奇怪的星球之一，这就是为什么科学家们正在构思能让他们详细了解崔顿卫星的任务概念。\n崔顿(海卫一)是一颗巨大的卫星，其大小在太阳系的卫星中排名第七，科学家们认为它诞生于柯伊伯带，随后才落入了它目前环绕海王星的轨道，但这也对崔顿造成了影响：海王星对崔顿卫星施加了非常大的引力，以至于其结冰的表面很有可能隐藏着地下液态海洋。“旅行者2号”为我们提供的“惊鸿一瞥”表明，在最近的1000万年前，海卫一依然有活跃的地质活动。\n“他们说了那个神奇的词，崔顿，然后我就说，我要去哪报名?”露易丝·普洛克托(Louise Procktor)说，她是一名行星地质学家，也是德克萨斯州月球与行星研究所(Lunar and planetary Institute)所长，并且她还是一名致力于“三叉戟”(Trident)任务概念的科学家，她说：“我们对海卫一的了解足以知道它很危险，但我们只知道一点点，还有很多我们是不知道的。”\n当然了，要想更多地了解太阳系中的任何天体，最好的方法就是实地去参观它。Procktor和她的同事们相信，在2025年发射并将于2038年到达海卫一的一次飞行任务中，他们可以一次过拍摄到海卫一的整个表面。\n",
@"所有的这些将通过一个仔细的技巧来实现。在经过海卫一的过程中，飞船的飞行将会被定时，以便可以在阳光下看到旅行者2号当年无法看到的60%左右的海卫一表面，在第一次接近后，飞船将会把相机转回来，重新捕捉旅行者号已经拍摄到的那40%的表面图像，但这次是在海王星行星反射出的微弱光线下拍摄的，这些光线被称为海王星之光(Neptune-shine)。\nProcktor说：“人们被前往海卫一的想法所吸引，我认为真正吸引人的地方之一是公众第一次看到这一个天体。引起人们对探索的纯粹兴奋也是这次任务的目的之一。”\n这一壮举还意味着科学家们可以在了解这个最奇怪的星球上取得真正的进展。Procktor说：“这是非常奇怪、陌生的天体，奇怪又有着异国情调。我们认为它是一个充满异国情调的海洋世界——与其他海洋世界相比，它是一个真正的异类。”\n海卫一在很多方面都是一个异类。它以一个异常陡峭的角度绕着错误的轨道运行，它还有着一个看起来非常年轻的表面(似乎是在大约1000万年前形成的)，科学家至今还无法真正解释个中原因，并且大部分的表面还被地质学家们称之为“哈密瓜地形”的地形所覆盖——这个短语的灵感来自于哈密瓜表面的粗糙质地。旅行者2号还发现了海卫一表面有升起巨大的羽状物，并且还有一些可能是旧羽状物残留的黑色痕迹。",
@"4月2日下午消息，原国家新闻出版广电总局官方显示，首批进口游戏已经下发，总数为30个，审批时间为3月29日。其中，游族网络和腾讯的《权力的游戏·凛冬将至》、网易的《迷室3》、完美世界的《洪潮之焰》等游戏获批。\n这个是进口游戏继2018年2月公布审批信息之后，时隔近14个月再度下发进口游戏版号。",
@"2019年3月31日23点51分，天链二号01星在西昌卫星发射中心成功发射。这是我国第二代地球同步轨道数据中继卫星的首发星，其成功发射后将使我国数据中继卫星系统能力大幅提升。\n该卫星由中国航天科技集团五院通信卫星事业部抓总研制，采用东方红四号卫星公用平台，主要用于为飞船、空间技术实验室、空间站等载人航天器提供数据中继和测控服务，也能服务于中、低轨道遥感、测绘、气象等卫星，还能为航天器发射提供测控支持。",
@"如果说天链一号实现了我国数据中继卫星“从无到有”，天链二号01星则要实现“从有到强”。",
@"国内没有同类研制经验可以借鉴，他们查找了国外技术资料，发现国外曾开展此类攻关，却因难度太大绕道而行，转为其他技术替代。借鉴学习的路被堵死。",
@"据天链二号卫星系统发展规划，01星发射成功后，后续将启动02星、03星的研制，未来将实现组网运行，在我国天基测控和信息传输领域发挥更大作用。"
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
    return UITableViewAutomaticDimension;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *ID = @"resueID";
    Demo17ViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell == nil) {
        cell = [[Demo17ViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.indexPath = indexPath;
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
