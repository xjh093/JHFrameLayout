//
//  Demo17ViewCell.m
//  JHFrameLayoutDemo
//
//  Created by HaoCold on 2018/12/10.
//

#import "Demo17ViewCell.h"

@interface Demo17ViewCell()

@property (nonatomic,  strong) JHFrameLayoutView *layoutView;

@property (nonatomic,  strong) UIImageView *photo;
@property (nonatomic,  strong) UILabel *nameLabel;
@property (nonatomic,  strong) UILabel *timeLabel;
@property (nonatomic,  strong) UILabel *contentLabel;

@property (nonatomic,  assign) CGSize  size;

@end

@implementation Demo17ViewCell

#pragma mark -------------------------------------视图-------------------------------------------

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self xjh_setupViews];
    }
    return self;
}

- (void)xjh_setupViews
{
    [self.contentView addSubview:self.layoutView];
    [self.layoutView addSubview:self.photo];
    [self.layoutView addSubview:self.nameLabel];
    [self.layoutView addSubview:self.timeLabel];
    [self.layoutView addSubview:self.contentLabel];
    
    _layoutView.jhLayout
    .bottomOffsetBottomOfView(10, _contentLabel, YES);
    
    _photo.jhLayout
    .sizeIs(CGSizeMake(60, 60))
    .topIs(10)
    .leftIs(10);
    
    _nameLabel.jhLayout
    .heightIs(16)
    .topIsEqualToView(_photo)
    .leftOffsetRightOfView(10, _photo, NO)
    .rightOffsetRightOfView(-10, _layoutView, YES);
    
    _timeLabel.jhLayout
    .heightIs(14)
    .topOffsetBottomOfView(10, _nameLabel, NO)
    .leftIsEqualToView(_nameLabel)
    .widthIsEqualToView(_nameLabel);
    
    _contentLabel.jhLayout
    .topOffsetBottomOfView(10, _photo, NO)
    .leftIsEqualToView(_photo)
    .rightOffsetRightOfView(0, _nameLabel, YES)
    .autoHeight();

}

#pragma mark -------------------------------------事件-------------------------------------------

- (void)configureWithText:(NSString *)text
{
    _contentLabel.text = text;
}

- (CGSize)systemLayoutSizeFittingSize:(CGSize)targetSize withHorizontalFittingPriority:(UILayoutPriority)horizontalFittingPriority verticalFittingPriority:(UILayoutPriority)verticalFittingPriority
{
    CGSize size = [_layoutView sizeThatFits:targetSize];
    NSLog(@"systemLayoutSizeFittingSize:%@",NSStringFromCGSize(size));
    if (_size.height != size.height) {
        _size = size;
    }
    return _size;
}

#pragma mark -------------------------------------懒加载-----------------------------------------

- (JHFrameLayoutView *)layoutView{
    if (!_layoutView) {
        JHFrameLayoutView *view = [[JHFrameLayoutView alloc] init];
        view.frame = CGRectMake(0, 0, CGRectGetWidth([UIScreen mainScreen].bounds), 0);
        view.backgroundColor = [UIColor clearColor];
        _layoutView = view;
    }
    return _layoutView;
}

- (UIImageView *)photo{
    if (!_photo) {
        UIImageView *imageView = [[UIImageView alloc] init];
        imageView.backgroundColor = [UIColor lightGrayColor];
        _photo = imageView;
    }
    return _photo;
}

- (UILabel *)nameLabel{
    if (!_nameLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.text = @"name";
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:14];
        label.textAlignment = NSTextAlignmentLeft;
        _nameLabel = label;
    }
    return _nameLabel;
}

- (UILabel *)timeLabel{
    if (!_timeLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.text = @"2018-12-10 12:55:52";
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:12];
        label.textAlignment = NSTextAlignmentLeft;
        _timeLabel = label;
    }
    return _timeLabel;
}

- (UILabel *)contentLabel{
    if (!_contentLabel) {
        UILabel *label = [[UILabel alloc] init];
        label.text = @"";
        label.textColor = [UIColor blackColor];
        label.font = [UIFont systemFontOfSize:16];
        label.textAlignment = NSTextAlignmentLeft;
        label.numberOfLines = 0;
        _contentLabel = label;
    }
    return _contentLabel;
}

@end
