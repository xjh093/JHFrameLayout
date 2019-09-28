//
//  JHFrameLayoutView.m
//  JHKit
//
//  Created by HaoCold on 2018/5/25.
//  Copyright © 2018年 HaoCold. All rights reserved.
//
//  MIT License
//
//  Copyright (c) 2018 xjh093
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in all
//  copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
//  SOFTWARE.

#import "JHFrameLayoutView.h"
#import <objc/runtime.h>
#import "UIView+JHFrameLayout.h"

typedef void(^JHLayoutBlock)(void);

@interface JHLayoutLabelTextObserver : NSObject

@property (nonatomic,  assign) BOOL  autoWidth;
@property (nonatomic,  assign) BOOL  autoHeight;
@property (nonatomic,  assign) CGFloat  minWidth;
@property (nonatomic,  assign) CGFloat  maxWidth;
@property (nonatomic,  assign) CGFloat  minHeight;
@property (nonatomic,  assign) CGFloat  maxHeight;

@property (nonatomic,  unsafe_unretained) UILabel *label;
@end

@implementation JHLayoutLabelTextObserver

- (instancetype)init{
    self = [super init];
    if (self) {
        _minWidth = -1;
        _maxWidth = -1;
        _minHeight = -1;
        _maxHeight = -1;
    }
    return self;
}

- (void)dealloc{
    [_label removeObserver:self forKeyPath:@"text"];
    [_label removeObserver:self forKeyPath:@"attributedText"];
}

- (void)setLabel:(UILabel *)label{
    if (!_label) {
        _label = label;
        
        [label addObserver:self forKeyPath:@"text" options:NSKeyValueObservingOptionNew context:NULL];
        [label addObserver:self forKeyPath:@"attributedText" options:NSKeyValueObservingOptionNew context:NULL];
    }
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    if ([keyPath isEqualToString:@"text"] ||
        [keyPath isEqualToString:@"attributedText"]) {
        
        if (_autoWidth) {
            [_label jh_autoWidth];
        }
        else if (_autoHeight) {
            [_label jh_autoHeight];
        }
        
        if (_minWidth >= 0) {
            [_label jh_minWidth:_minWidth];
        }
        
        if (_maxWidth >= 0) {
            [_label jh_maxWidth:_maxWidth];
        }
        
        if (_minHeight >= 0) {
            [_label jh_minHeight:_minHeight];
        }
        
        if (_maxHeight >= 0) {
            [_label jh_maxHeight:_maxHeight];
        }
        
        [_label.superview setNeedsLayout];
    }
}

@end

@interface UILabel (JHLayoutObserver)
@property (nonatomic,  strong) JHLayoutLabelTextObserver *textObserver;
@end

@implementation UILabel (JHLayoutObserver)
- (void)setTextObserver:(JHLayoutLabelTextObserver *)textObserver{
    objc_setAssociatedObject(self, @selector(textObserver), textObserver, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (JHLayoutLabelTextObserver *)textObserver{
    JHLayoutLabelTextObserver *textObserver = objc_getAssociatedObject(self, _cmd);
    if (!textObserver) {
        textObserver = [[JHLayoutLabelTextObserver alloc] init];
        textObserver.label = self;
        self.textObserver = textObserver;
    }
    return textObserver;
}
@end


@interface JHLayout()
@property (nonatomic,  strong) NSMutableArray *layoutArray;
@end

@implementation JHLayout

- (void)setLayoutView:(UIView *)layoutView{
    objc_setAssociatedObject(self, @selector(layoutView), layoutView, OBJC_ASSOCIATION_ASSIGN);
}

- (UIView *)layoutView{
    return objc_getAssociatedObject(self, _cmd);
}

- (NSMutableArray *)layoutArray{
    if (!_layoutArray) {
        _layoutArray = @[].mutableCopy;
    }
    return _layoutArray;
}

#pragma mark - size,center,origin
- (JHLayoutSize)sizeIs{
    return ^(CGSize size){
        
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_sizeIs:size];
        };
        [self.layoutArray addObject:block];

        return self;
    };
}

- (JHLayoutSizeEqualToView)sizeIsEqualToView{
    return ^(UIView *view){
        
        __weak typeof(self) ws = self;
        UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_sizeIsEqualToView:wkview];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutCenter)centerIs{
    return ^(CGPoint center){
        
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_centerIs:center];
        };
        [self.layoutArray addObject:block];

        return self;
    };
}

- (JHLayoutCenterEqualToView)centerIsEqualToView{
    return ^(UIView *view){
        
        __weak typeof(self) ws = self;
        UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_centerIsEqualToView:wkview];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutOrigin)originIs{
    return ^(CGPoint origin){
        
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_originIs:origin];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutOriginEqualToView)originIsEqualToView{
    return ^(UIView *view){
        
        __weak typeof(self) ws = self;
        UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_originIsEqualToView:wkview];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

#pragma mark - edge
- (JHLayoutEdge)edgeIs{
    return ^(CGFloat padding){
        
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_edgeIs:padding];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

#pragma mark - width
- (JHLayoutWidth)widthIs{
    return ^(CGFloat width){
        
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_widthIs:width];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutWidthEqualToView)widthIsEqualToView{
    return ^(UIView *view){
        
        __weak typeof(self) ws = self;
        __weak UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_widthIsEqualToView:wkview];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutRatioOfViewWidth)widthIsRatioOfViewWidth{
    return ^(CGFloat ratio, UIView *view){
        
        __weak typeof(self) ws = self;
        __weak UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_widthIs:ratio ratioOfViewWidth:wkview];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutRatioOfViewHeight)widthIsRatioOfViewHeight{
    return ^(CGFloat ratio, UIView *view){
        
        __weak typeof(self) ws = self;
        __weak UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_widthIs:ratio ratioOfViewHeight:wkview];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

#pragma mark - height
- (JHLayoutHeight)heightIs{
    return ^(CGFloat height){
        
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_heightIs:height];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutHeightEqualToView)heightIsEqualToView{
    return ^(UIView *view){
        
        __weak typeof(self) ws = self;
        __weak UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_heightIsEqualToView:wkview];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutRatioOfViewHeight)heightIsRatioOfViewWidth{
    return ^(CGFloat ratio, UIView *view){
        
        __weak typeof(self) ws = self;
        __weak UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_heightIs:ratio ratioOfViewWidth:wkview];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutRatioOfViewHeight)heightIsRatioOfViewHeight{
    return ^(CGFloat ratio, UIView *view){
    
        __weak typeof(self) ws = self;
        __weak UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_heightIs:ratio ratioOfViewHeight:wkview];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

#pragma mark - top
- (JHLayoutTop)topIs{
    return ^(CGFloat offsetY){
        
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_topIs:offsetY];
        };
        [self.layoutArray addObject:block];
    
        return self;
    };
}

- (JHLayoutTopEqualToView)topIsEqualToView{
    return ^(UIView *view){
        
        __weak typeof(self) ws = self;
        __weak UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_topIsEqualToView:wkview];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutTopEqualToBottom)topIsEqualToBottom{
    return ^(CGFloat padding){
        
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_topIsEqualToBottom:padding];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutTopOfView)topOffsetTopOfView{
    return ^(CGFloat offsetY, UIView *view, BOOL update){
        
        __weak typeof(self) ws = self;
        __weak UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_topIs:offsetY fromTopOfView:wkview updateHeight:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutMiddleOfView)topOffsetMiddleOfView{
    return ^(CGFloat offsetY, UIView *view, BOOL update){
        
        __weak typeof(self) ws = self;
        __weak UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_topIs:offsetY fromMiddleOfView:wkview updateHeight:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutBottomOfView)topOffsetBottomOfView{
    return ^(CGFloat offsetY, UIView *view, BOOL update){
        
        __weak typeof(self) ws = self;
        __weak UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_topIs:offsetY fromBottomOfView:wkview updateHeight:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

#pragma mark - left
- (JHLayoutLeft)leftIs{
    return ^(CGFloat offsetX){
        
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_leftIs:offsetX];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutLeftEqualToView)leftIsEqualToView{
    return ^(UIView *view){
        
        __weak typeof(self) ws = self;
        __weak UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_leftIsEqualToView:wkview];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutLeftEqualToRight)leftIsEqualToRight{
    return ^(CGFloat padding){
        
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_leftIsEqualToRight:padding];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutLeftOfView)leftOffsetLeftOfView{
    return ^(CGFloat offsetX, UIView *view, BOOL update){
        
        __weak typeof(self) ws = self;
        __weak UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_leftIs:offsetX fromLeftOfView:wkview updateWidth:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutMiddleOfView)leftOffsetMiddleOfView{
    return ^(CGFloat offsetX, UIView *view, BOOL update){
        
        __weak typeof(self) ws = self;
        __weak UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_leftIs:offsetX fromMiddleOfView:wkview updateWidth:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutRightOfView)leftOffsetRightOfView{
    return ^(CGFloat offsetX, UIView *view, BOOL update){
        
        __weak typeof(self) ws = self;
        __weak UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_leftIs:offsetX fromRightOfView:wkview updateWidth:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

#pragma mark - bottom
- (JHLayoutBottom)bottomIs{
    return ^(CGFloat offsetY){
        
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_bottomIs:offsetY];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutBottomEqualToView)bottomIsEqualToView{
    return ^(UIView *view){
        
        __weak typeof(self) ws = self;
        __weak UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_bottomIsEqualToView:wkview];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutTopOfView)bottomOffsetTopOfView{
    return ^(CGFloat offsetY, UIView *view, BOOL update){
        
        __weak typeof(self) ws = self;
        __weak UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_bottomIs:offsetY fromTopOfView:wkview updateHeight:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutMiddleOfView)bottomOffsetMiddleOfView{
    return ^(CGFloat offsetY, UIView *view, BOOL update){
        
        __weak typeof(self) ws = self;
        __weak UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_bottomIs:offsetY fromMiddleOfView:wkview updateHeight:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutBottomOfView)bottomOffsetBottomOfView{
    return ^(CGFloat offsetY, UIView *view, BOOL update){
        
        __weak typeof(self) ws = self;
        __weak UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_bottomIs:offsetY fromBottomOfView:wkview updateHeight:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

#pragma mark - right
- (JHLayoutRight)rightIs{
    return ^(CGFloat offsetX){
        
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_rightIs:offsetX];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutRightEqualToView)rightIsEqualToView{
    return ^(UIView *view){
        
        __weak typeof(self) ws = self;
        __weak UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_rightIsEqualToView:wkview];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutLeftOfView)rightOffsetLeftOfView{
    return ^(CGFloat offsetX, UIView *view, BOOL update){
        
        __weak typeof(self) ws = self;
        __weak UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_rightIs:offsetX fromLeftOfView:wkview updateWidth:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutMiddleOfView)rightOffsetMiddleOfView{
    return ^(CGFloat offsetX, UIView *view, BOOL update){
        
        __weak typeof(self) ws = self;
        __weak UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_rightIs:offsetX fromMiddleOfView:wkview updateWidth:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutRightOfView)rightOffsetRightOfView{
    return ^(CGFloat offsetX, UIView *view, BOOL update){
        
        __weak typeof(self) ws = self;
        __weak UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_rightIs:offsetX fromRightOfView:wkview updateWidth:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

#pragma mark - centerX
- (JHLayoutCenterX)centerXIs{
    return ^(CGFloat offsetX){
        
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_centerXIs:offsetX];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutCenterXEqualToView)centerXIsEqualToView{
    return ^(UIView *view){
        
        __weak typeof(self) ws = self;
        __weak UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_centerXIsEqualToView:wkview];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutLeftOfView)centerXOffsetLeftOfView{
    return ^(CGFloat offsetX, UIView *view, BOOL update){
        
        __weak typeof(self) ws = self;
        __weak UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_centerXIs:offsetX fromLeftOfView:wkview updateWidth:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutMiddleOfView)centerXOffsetMiddleOfView{
    return ^(CGFloat offsetX, UIView *view, BOOL update){
        
        __weak typeof(self) ws = self;
        __weak UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_centerXIs:offsetX fromMiddleOfView:wkview updateWidth:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutRightOfView)centerXOffsetRightOfView{
    return ^(CGFloat offsetX, UIView *view, BOOL update){
        
        __weak typeof(self) ws = self;
        __weak UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_centerXIs:offsetX fromRightOfView:wkview updateWidth:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

#pragma mark - centerY
- (JHLayoutCenterY)centerYIs{
    return ^(CGFloat offsetY){
        
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_centerYIs:offsetY];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutCenterYEqualToView)centerYIsEqualToView{
    return ^(UIView *view){
        
        __weak typeof(self) ws = self;
        __weak UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_centerYIsEqualToView:wkview];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutTopOfView)centerYOffsetTopOfView{
    return ^(CGFloat offsetY, UIView *view, BOOL update){
        
        __weak typeof(self) ws = self;
        __weak UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_centerYIs:offsetY fromTopOfView:wkview updateHeight:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutMiddleOfView)centerYOffsetMiddleOfView{
    return ^(CGFloat offsetY, UIView *view, BOOL update){
        
        __weak typeof(self) ws = self;
        __weak UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_centerYIs:offsetY fromMiddleOfView:wkview updateHeight:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutBottomOfView)centerYOffsetBottomOfView{
    return ^(CGFloat offsetY, UIView *view, BOOL update){
        
        __weak typeof(self) ws = self;
        __weak UIView *wkview = view;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_centerYIs:offsetY fromBottomOfView:wkview updateHeight:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

#pragma mark - max X

- (JHLayoutMaxX)maxXIs{
    return ^(CGFloat maxX, BOOL update){
        
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_maxXIs:maxX updateWidth:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

#pragma mark - max Y

- (JHLayoutMaxX)maxYIs{
    return ^(CGFloat maxY, BOOL update){
        
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_maxYIs:maxY updateHeight:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

#pragma mark - UILabel

- (JHLayoutAutoWidth)autoWidth{
    return ^(){
        
        if ([self.layoutView isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)self.layoutView;
            label.textObserver.autoWidth = YES;
            if (label.text.length > 0) {
                [label jh_autoWidth];
            }
        }
        
        return self;
    };
}

- (JHLayoutAutoHeight)autoHeight{
    return ^(){
        
        if ([self.layoutView isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)self.layoutView;
            label.textObserver.autoHeight = YES;
            if (label.text.length > 0) {
                [label jh_autoHeight];
            }
        }
        
        return self;
    };
}

- (JHLayoutMinWidth)minWidth{
    return ^(CGFloat minWidth){
        
        if ([self.layoutView isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)self.layoutView;
            label.textObserver.minWidth = minWidth;
            if (label.text.length > 0) {
                [label jh_minWidth:minWidth];
            }
        }
        
        return self;
    };
}

- (JHLayoutMaxWidth)maxWidth{
    return ^(CGFloat maxWidth){
        
        if ([self.layoutView isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)self.layoutView;
            label.textObserver.maxWidth = maxWidth;
            if (label.text.length > 0) {
                [label jh_maxWidth:maxWidth];
            }
        }
        
        return self;
    };
}

- (JHLayoutMinHeight)minHeight{
    return ^(CGFloat minHeight){
        
        if ([self.layoutView isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)self.layoutView;
            label.textObserver.minHeight = minHeight;
            if (label.text.length > 0) {
                [label jh_minHeight:minHeight];
            }
        }
        
        return self;
    };
}

- (JHLayoutMaxHeight)maxHeight{
    return ^(CGFloat maxHeight){
        
        if ([self.layoutView isKindOfClass:[UILabel class]]) {
            UILabel *label = (UILabel *)self.layoutView;
            label.textObserver.maxHeight = maxHeight;
            if (label.text.length > 0) {
                [label jh_maxHeight:maxHeight];
            }
        }
        
        return self;
    };
}

@end


void *JHFrameLayoutViewSuperviewObserveContext = (void *)201811161;

@interface JHFrameLayoutView()
@property (nonatomic,  assign) BOOL  initFlag;
@property (nonatomic,  assign) BOOL  superviewObserveFlag;
@end

@implementation JHFrameLayoutView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)willMoveToSuperview:(UIView *)newSuperview{
    [super willMoveToSuperview:newSuperview];
    
    // newSuperview is not kind of JHFrameLayoutView
    if (newSuperview && ![newSuperview isKindOfClass:[JHFrameLayoutView class]] ) {
        
        // self.superview may be observed before
        if (_superviewObserveFlag && self.superview != nil && ![self.superview isKindOfClass:[JHFrameLayoutView class]]) {
            @try {
                [self.superview removeObserver:self forKeyPath:@"frame"];
            } @catch (NSException *exception) {
                
            } @finally {
                
            }
            
            @try {
                [self.superview removeObserver:self forKeyPath:@"bounds"];
            } @catch (NSException *exception) {
                
            } @finally {
                
            }
        }
        
        // observe newSuperview's frame and bounds
        [newSuperview addObserver:self forKeyPath:@"frame" options:NSKeyValueObservingOptionNew context:JHFrameLayoutViewSuperviewObserveContext];
        [newSuperview addObserver:self forKeyPath:@"bounds" options:NSKeyValueObservingOptionNew context:JHFrameLayoutViewSuperviewObserveContext];
        _superviewObserveFlag = YES;
    }
    
    // remove observer
    if (newSuperview == nil && self.superview != nil && _superviewObserveFlag && ![self.superview isKindOfClass:[JHFrameLayoutView class]]) {
        _superviewObserveFlag = NO;
        
        @try {
            [self.superview removeObserver:self forKeyPath:@"frame"];
        } @catch (NSException *exception) {
            
        } @finally {
            
        }
        
        @try {
            [self.superview removeObserver:self forKeyPath:@"bounds"];
        } @catch (NSException *exception) {
            
        } @finally {
            
        }
    }
}

- (void)dealloc{
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (CGSize)sizeThatFits:(CGSize)size{
    [self layoutSubviews];
    return self.frame.size;
}

- (void)layoutSubviews{
    
    if (!_initFlag) {
        [self jh_initOnce];
    }

    [self jh_layoutView:self];
    [self jh_layoutSubviews:self.subviews];
    [self jh_layoutView:self];
}

- (void)jh_initOnce
{
    _initFlag = YES;
    
    id vc;
    UIView *view = self;
    while (view != nil) {
        vc = [view valueForKey:@"viewDelegate"];
        if (vc != nil) {
            
            // JHFrameLayoutView is not UIViewController's root view.
            if (![[vc view] isKindOfClass:[JHFrameLayoutView class]]){
                
                // Screen Rotate Notification
                [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(jh_delayLayoutSubviews) name:UIApplicationDidChangeStatusBarOrientationNotification object:nil];
            }
            break;
        }
        view = view.superview;
    }
}

- (void)jh_delayLayoutSubviews
{
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self layoutSubviews];
    });
}

- (void)jh_layoutSubviews:(NSArray *)subviews{
    for (UIView *view in subviews) {
        [self jh_layoutView:view];
        [self jh_layoutSubviews:view.subviews];
    }
}

- (void)jh_layoutView:(UIView *)view
{
    if (!view.isJhLayout) {
        return;
    }
    
    for (JHLayoutBlock block in view.jhLayout.layoutArray) {
        block();
    }
}

#pragma mark --- NSKeyValueObserving
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context
{
    if (context == JHFrameLayoutViewSuperviewObserveContext) {
        if ([keyPath isEqualToString:@"frame"] ||
            [keyPath isEqualToString:@"bounds"]) {
            [self layoutSubviews];
        }
    }
}

@end

@implementation UIView (JHLayout)

- (void)setJhLayout:(JHLayout *)jhLayout{
    objc_setAssociatedObject(self, @selector(jhLayout), jhLayout, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (JHLayout *)jhLayout{
    JHLayout *frame = objc_getAssociatedObject(self, _cmd);
    if (!frame) {
        frame = [[JHLayout alloc] init];
        self.jhLayout = frame;
        self.isJhLayout = YES;
        frame.layoutView = self;
    }
    return frame;
}

- (void)setIsJhLayout:(BOOL)isJhLayout{
    objc_setAssociatedObject(self, @selector(isJhLayout), @(isJhLayout), OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (BOOL)isJhLayout{
    return [objc_getAssociatedObject(self, _cmd) boolValue];
}


@end
