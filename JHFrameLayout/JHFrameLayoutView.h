//
//  JHFrameLayoutView.h
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

#import <UIKit/UIKit.h>

//!!!!:JHLayout
@class JHLayout;

typedef JHLayout *(^JHLayoutSize)(CGSize size);
typedef JHLayout *(^JHLayoutSizeEqualToView)(UIView *view);
typedef JHLayout *(^JHLayoutOrigin)(CGPoint origin);
typedef JHLayout *(^JHLayoutOriginEqualToView)(UIView *view);
typedef JHLayout *(^JHLayoutCenter)(CGPoint center);
typedef JHLayout *(^JHLayoutCenterEqualToView)(UIView *view);

typedef JHLayout *(^JHLayoutWidth)(CGFloat width);
typedef JHLayout *(^JHLayoutHeight)(CGFloat height);
typedef JHLayout *(^JHLayoutWidthEqualToView)(UIView *view);
typedef JHLayout *(^JHLayoutHeightEqualToView)(UIView *view);
typedef JHLayout *(^JHLayoutRatioOfViewWidth)(CGFloat ratio, UIView *view);
typedef JHLayout *(^JHLayoutRatioOfViewHeight)(CGFloat ratio, UIView *view);

typedef JHLayout *(^JHLayoutTop)(CGFloat offsetY);
typedef JHLayout *(^JHLayoutLeft)(CGFloat offsetX);
typedef JHLayout *(^JHLayoutBottom)(CGFloat offsetY);
typedef JHLayout *(^JHLayoutRight)(CGFloat offsetX);
typedef JHLayout *(^JHLayoutCenterX)(CGFloat offsetX);
typedef JHLayout *(^JHLayoutCenterY)(CGFloat offsetY);
typedef JHLayout *(^JHLayoutTopEqualToView)(UIView *view);
typedef JHLayout *(^JHLayoutLeftEqualToView)(UIView *view);
typedef JHLayout *(^JHLayoutBottomEqualToView)(UIView *view);
typedef JHLayout *(^JHLayoutRightEqualToView)(UIView *view);
typedef JHLayout *(^JHLayoutCenterXEqualToView)(UIView *view);
typedef JHLayout *(^JHLayoutCenterYEqualToView)(UIView *view);

typedef JHLayout *(^JHLayoutTopOfView)(CGFloat offsetY, UIView *view, BOOL update);
typedef JHLayout *(^JHLayoutLeftOfView)(CGFloat offsetX, UIView *view, BOOL update);
typedef JHLayout *(^JHLayoutBottomOfView)(CGFloat offsetY, UIView *view, BOOL update);
typedef JHLayout *(^JHLayoutRightOfView)(CGFloat offsetX, UIView *view, BOOL update);
typedef JHLayout *(^JHLayoutMiddleOfView)(CGFloat offset, UIView *view, BOOL update);

@interface JHLayout : NSObject

@property (nonatomic,    weak) UIView *layoutView;

// size,center,origin
@property (nonatomic, copy, readonly) JHLayoutSize   sizeIs;
@property (nonatomic, copy, readonly) JHLayoutSizeEqualToView  sizeIsEqualToView;
@property (nonatomic, copy, readonly) JHLayoutCenter centerIs;
@property (nonatomic, copy, readonly) JHLayoutCenterEqualToView  centerIsEqualToView;
@property (nonatomic, copy, readonly) JHLayoutOrigin originIs;
@property (nonatomic, copy, readonly) JHLayoutOriginEqualToView  originIsEqualToView;

// width
@property (nonatomic, copy, readonly) JHLayoutWidth  widthIs;
@property (nonatomic, copy, readonly) JHLayoutWidthEqualToView  widthIsEqualToView;
@property (nonatomic, copy, readonly) JHLayoutRatioOfViewWidth  widthIsRatioOfViewWidth;
@property (nonatomic, copy, readonly) JHLayoutRatioOfViewHeight widthIsRatioOfViewHeight;

// height
@property (nonatomic, copy, readonly) JHLayoutHeight heightIs;
@property (nonatomic, copy, readonly) JHLayoutHeightEqualToView heightIsEqualToView;
@property (nonatomic, copy, readonly) JHLayoutRatioOfViewWidth  heightIsRatioOfViewWidth;
@property (nonatomic, copy, readonly) JHLayoutRatioOfViewHeight heightIsRatioOfViewHeight;

// top space in super view
@property (nonatomic, copy, readonly) JHLayoutTop topIs;
@property (nonatomic, copy, readonly) JHLayoutTopEqualToView topIsEqualToView;
@property (nonatomic, copy, readonly) JHLayoutTopOfView topOffsetTopOfView;
@property (nonatomic, copy, readonly) JHLayoutMiddleOfView topOffsetMiddleOfView;
@property (nonatomic, copy, readonly) JHLayoutBottomOfView topOffsetBottomOfView;


// left space in super view
@property (nonatomic, copy, readonly) JHLayoutLeft leftIs;
@property (nonatomic, copy, readonly) JHLayoutLeftEqualToView leftIsEqualToView;
@property (nonatomic, copy, readonly) JHLayoutLeftOfView leftOffsetLeftOfView;
@property (nonatomic, copy, readonly) JHLayoutMiddleOfView leftOffsetMiddleOfView;
@property (nonatomic, copy, readonly) JHLayoutRightOfView leftOffsetRightOfView;


// bottom space in super view
@property (nonatomic, copy, readonly) JHLayoutBottom bottomIs;
@property (nonatomic, copy, readonly) JHLayoutBottomEqualToView bottomIsEqualToView;
@property (nonatomic, copy, readonly) JHLayoutTopOfView bottomOffsetTopOfView;
@property (nonatomic, copy, readonly) JHLayoutMiddleOfView bottomOffsetMiddleOfView;
@property (nonatomic, copy, readonly) JHLayoutBottomOfView bottomOffsetBottomOfView;

// right space to super view
@property (nonatomic, copy, readonly) JHLayoutRight rightIs;
@property (nonatomic, copy, readonly) JHLayoutRightEqualToView rightIsEqualToView;
@property (nonatomic, copy, readonly) JHLayoutLeftOfView rightOffsetLeftOfView;
@property (nonatomic, copy, readonly) JHLayoutMiddleOfView rightOffsetMiddleOfView;
@property (nonatomic, copy, readonly) JHLayoutRightOfView rightOffsetRightOfView;

// center X
@property (nonatomic, copy, readonly) JHLayoutCenterX centerXIs;
@property (nonatomic, copy, readonly) JHLayoutCenterXEqualToView centerXIsEqualToView;
@property (nonatomic, copy, readonly) JHLayoutLeftOfView centerXOffsetLeftOfView;
@property (nonatomic, copy, readonly) JHLayoutMiddleOfView centerXOffsetMiddleOfView;
@property (nonatomic, copy, readonly) JHLayoutRightOfView centerXOffsetRightOfView;

/// center Y
@property (nonatomic, copy, readonly) JHLayoutCenterY centerYIs;
@property (nonatomic, copy, readonly) JHLayoutCenterYEqualToView centerYIsEqualToView;
@property (nonatomic, copy, readonly) JHLayoutTopOfView centerYOffsetTopOfView;
@property (nonatomic, copy, readonly) JHLayoutMiddleOfView centerYOffsetMiddleOfView;
@property (nonatomic, copy, readonly) JHLayoutBottomOfView centerYOffsetBottomOfView;

@end

//!!!!:JHFrameLayoutView
@interface JHFrameLayoutView : UIView

@end

//!!!!:UIView (JHLayout)
@interface UIView (JHLayout)
@property (nonatomic,  strong) JHLayout *jhLayout;
@end
