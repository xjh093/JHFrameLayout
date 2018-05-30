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

- (JHLayoutRatioOfViewWidth)widthIsRatioOfViewWidth{
    return ^(CGFloat ratio, UIView *view){
        
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_widthIs:ratio ratioOfViewWidth:view];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutRatioOfViewHeight)widthIsRatioOfViewHeight{
    return ^(CGFloat ratio, UIView *view){
        
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_widthIs:ratio ratioOfViewHeight:view];
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

- (JHLayoutRatioOfViewHeight)heightIsRatioOfViewWidth{
    return ^(CGFloat ratio, UIView *view){
        
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_heightIs:ratio ratioOfViewWidth:view];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutRatioOfViewHeight)heightIsRatioOfViewHeight{
    return ^(CGFloat ratio, UIView *view){
    
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_heightIs:ratio ratioOfViewHeight:view];
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

- (JHLayoutTopOfView)topOffsetTopOfView{
    return ^(CGFloat offsetY, UIView *view, BOOL update){
        
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_topIs:offsetY fromTopOfView:view updateHeight:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutMiddleOfView)topOffsetMiddleOfView{
    return ^(CGFloat offsetY, UIView *view, BOOL update){
        
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_topIs:offsetY fromMiddleOfView:view updateHeight:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutBottomOfView)topOffsetBottomOfView{
    return ^(CGFloat offsetY, UIView *view, BOOL update){
        
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_topIs:offsetY fromBottomOfView:view updateHeight:update];
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

- (JHLayoutLeftOfView)leftOffsetLeftOfView{
    return ^(CGFloat offsetX, UIView *view, BOOL update){
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_leftIs:offsetX fromLeftOfView:view updateWidth:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutMiddleOfView)leftOffsetMiddleOfView{
    return ^(CGFloat offsetX, UIView *view, BOOL update){
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_leftIs:offsetX fromMiddleOfView:view updateWidth:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutRightOfView)leftOffsetRightOfView{
    return ^(CGFloat offsetX, UIView *view, BOOL update){
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_leftIs:offsetX fromRightOfView:view updateWidth:update];
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

- (JHLayoutTopOfView)bottomOffsetTopOfView{
    return ^(CGFloat offsetY, UIView *view, BOOL update){
        
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_bottomIs:offsetY fromTopOfView:view updateHeight:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutMiddleOfView)bottomOffsetMiddleOfView{
    return ^(CGFloat offsetY, UIView *view, BOOL update){
        
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_bottomIs:offsetY fromMiddleOfView:view updateHeight:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutBottomOfView)bottomOffsetBottomOfView{
    return ^(CGFloat offsetY, UIView *view, BOOL update){
        
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_bottomIs:offsetY fromBottomOfView:view updateHeight:update];
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

- (JHLayoutLeftOfView)rightOffsetLeftOfView{
    return ^(CGFloat offsetX, UIView *view, BOOL update){
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_rightIs:offsetX fromLeftOfView:view updateWidth:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutMiddleOfView)rightOffsetMiddleOfView{
    return ^(CGFloat offsetX, UIView *view, BOOL update){
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_rightIs:offsetX fromMiddleOfView:view updateWidth:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutRightOfView)rightOffsetRightOfView{
    return ^(CGFloat offsetX, UIView *view, BOOL update){
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_rightIs:offsetX fromRightOfView:view updateWidth:update];
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

- (JHLayoutLeftOfView)centerXOffsetLeftOfView{
    return ^(CGFloat offsetX, UIView *view, BOOL update){
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_centerXIs:offsetX fromLeftOfView:view updateWidth:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutMiddleOfView)centerXOffsetMiddleOfView{
    return ^(CGFloat offsetX, UIView *view, BOOL update){
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_centerXIs:offsetX fromMiddleOfView:view updateWidth:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutRightOfView)centerXOffsetRightOfView{
    return ^(CGFloat offsetX, UIView *view, BOOL update){
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_centerXIs:offsetX fromRightOfView:view updateWidth:update];
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

- (JHLayoutTopOfView)centerYOffsetTopOfView{
    return ^(CGFloat offsetY, UIView *view, BOOL update){
        
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_centerYIs:offsetY fromTopOfView:view updateHeight:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutMiddleOfView)centerYOffsetMiddleOfView{
    return ^(CGFloat offsetY, UIView *view, BOOL update){
        
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_centerYIs:offsetY fromMiddleOfView:view updateHeight:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

- (JHLayoutBottomOfView)centerYOffsetBottomOfView{
    return ^(CGFloat offsetY, UIView *view, BOOL update){
        
        __weak typeof(self) ws = self;
        JHLayoutBlock block = ^(){
            [ws.layoutView jh_centerYIs:offsetY fromBottomOfView:view updateHeight:update];
        };
        [self.layoutArray addObject:block];
        
        return self;
    };
}

@end

@interface JHFrameLayoutView()@end

@implementation JHFrameLayoutView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
    }
    return self;
}

- (void)layoutSubviews{
    [self jh_layoutSubviews:self.subviews];
}

- (void)jh_layoutSubviews:(NSArray *)subviews{
    for (UIView *view in subviews) {
        [self jh_layoutView:view];
        [self jh_layoutSubviews:view.subviews];
    }
}

- (void)jh_layoutView:(UIView *)view
{
    for (JHLayoutBlock block in view.jhLayout.layoutArray) {
        block();
    }
}

@end

@implementation UIView (JHLayout)

- (void)setJhLayout:(JHLayout *)jhLayout{
    objc_setAssociatedObject(self, @selector(jhLayout), jhLayout, OBJC_ASSOCIATION_RETAIN);
}

- (JHLayout *)jhLayout{
    JHLayout *frame = objc_getAssociatedObject(self, _cmd);
    if (!frame) {
        frame = [[JHLayout alloc] init];
        self.jhLayout = frame;
        frame.layoutView = self;
    }
    return frame;
}

@end
