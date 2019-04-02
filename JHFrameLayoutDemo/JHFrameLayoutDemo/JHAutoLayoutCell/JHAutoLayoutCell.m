//
//  JHAutoLayoutCell.m
//  JHFrameLayoutDemo
//
//  Created by HaoCold on 2019/4/2.
//

#import "JHAutoLayoutCell.h"
#import <objc/runtime.h>

@interface JHAutoLayoutCell (UITableView)

@property (nonatomic,weak,readonly) UITableView *tableView;

@end

@implementation JHAutoLayoutCell (UITableView)

- (UITableView *)tableView{
    UIView *tableView = self.superview;
    while (tableView) {
        if ([tableView isKindOfClass:[UITableView class]]) {
            break;
        }
        tableView = tableView.superview;
    }
    return (UITableView *)tableView;
}

@end

@interface UITableView (JHAutoLayoutCell)

@property (nonatomic,  strong) NSMutableDictionary *cellHeightCache;

@end

@implementation UITableView (JHAutoLayoutCell)

- (void)setCellHeightCache:(NSMutableDictionary *)cellHeightCache{
    objc_setAssociatedObject(self, @selector(cellHeightCache), cellHeightCache, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (NSMutableDictionary *)cellHeightCache{
    NSMutableDictionary *cache = objc_getAssociatedObject(self, _cmd);
    if (!cache) {
        cache = @{}.mutableCopy;
        self.cellHeightCache = cache;
    }
    return cache;
}

@end

@interface JHAutoLayoutCell()

@property (nonatomic,  strong) JHFrameLayoutView *layoutView;

@end

@implementation JHAutoLayoutCell

#pragma mark -------------------------------------视图-------------------------------------------

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self.contentView addSubview:self.layoutView];
        [self setupViews];
    }
    return self;
}

- (void)setupViews
{
    // subclass override 
}

#pragma mark -------------------------------------事件-------------------------------------------

- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority verticalFittingPriority:(UILayoutPriority)verticalFittingPriority
{
    CGSize size = self.cellSize;
    if (size.width <= 0 || size.height <= 0) {
        size = [_layoutView sizeThatFits:targetSize];
        self.cellSize = size;
    }
    return size;
}

#pragma mark -------------------------------------懒加载-----------------------------------------

- (void)setCellSize:(CGSize)cellSize{
    if (_indexPath) {
        [self.tableView.cellHeightCache setObject:[NSValue valueWithCGSize:cellSize] forKey:_indexPath];
    }
}

- (CGSize)cellSize
{
    CGSize size = CGSizeZero;
    if (_indexPath) {
        size = [[self.tableView.cellHeightCache objectForKey:_indexPath] CGSizeValue];
    }
    return size;
}

- (JHFrameLayoutView *)layoutView{
    if (!_layoutView) {
        JHFrameLayoutView *view = [[JHFrameLayoutView alloc] init];
        view.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), 0);
        view.backgroundColor = [UIColor clearColor];
        _layoutView = view;
    }
    return _layoutView;
}

@end
