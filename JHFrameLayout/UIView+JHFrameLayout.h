//
//  UIView+JHFrameLayout.h
//  JHKit
//
//  Created by HaoCold on 2018/1/12.
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

@interface UIView (JHFrameLayout)

#pragma mark --- size, center, origin
- (void)jh_sizeIs:(CGSize)size;
- (void)jh_sizeIsEqualToView:(UIView *)view;
- (void)jh_centerIs:(CGPoint)center;
- (void)jh_centerIsEqualToView:(UIView *)view;
- (void)jh_originIs:(CGPoint)origin;
- (void)jh_originISEqualToView:(UIView *)view;

#pragma mark --- edge
- (void)jh_edgeIs:(CGFloat)padding;

#pragma mark --- width
- (void)jh_widthIs:(CGFloat)width;
- (void)jh_widthIsEqualToView:(UIView *)view;
- (void)jh_widthIs:(CGFloat)ratio ratioOfViewWidth:(UIView *)view;
- (void)jh_widthIs:(CGFloat)ratio ratioOfViewHeight:(UIView *)view;

#pragma mark --- height
- (void)jh_heightIs:(CGFloat)height;
- (void)jh_heightIsEqualToView:(UIView *)view;
- (void)jh_heightIs:(CGFloat)ratio ratioOfViewWidth:(UIView *)view;
- (void)jh_heightIs:(CGFloat)ratio ratioOfViewHeight:(UIView *)view;

#pragma mark --- top
/// top space in super view
- (void)jh_topIs:(CGFloat)top;
- (void)jh_topIsEqualToView:(UIView *)view;
- (void)jh_topIsEqualToBottom:(CGFloat)padding;

//
- (void)jh_topIs:(CGFloat)offsetY fromTopOfView:(UIView *)view;
- (void)jh_topIs:(CGFloat)offsetY fromMiddleOfView:(UIView *)view;
- (void)jh_topIs:(CGFloat)offsetY fromBottomOfView:(UIView *)view;

// if flag is YES, will update height to keep 'bottom' space space in some case.
- (void)jh_topIs:(CGFloat)offsetY fromTopOfView:(UIView *)view updateHeight:(BOOL)flag;
- (void)jh_topIs:(CGFloat)offsetY fromMiddleOfView:(UIView *)view updateHeight:(BOOL)flag;
- (void)jh_topIs:(CGFloat)offsetY fromBottomOfView:(UIView *)view updateHeight:(BOOL)flag;

#pragma mark --- left
/// left space in super view
- (void)jh_leftIs:(CGFloat)left;
- (void)jh_leftIsEqualToView:(UIView *)view;
- (void)jh_leftIsEqualToRight:(CGFloat)padding;

//
- (void)jh_leftIs:(CGFloat)offsetX fromLeftOfView:(UIView *)view;
- (void)jh_leftIs:(CGFloat)offsetX fromMiddleOfView:(UIView *)view;
- (void)jh_leftIs:(CGFloat)offsetX fromRightOfView:(UIView *)view;

// if flag is YES, will update width to keep 'right' space in some case.
- (void)jh_leftIs:(CGFloat)offsetX fromLeftOfView:(UIView *)view updateWidth:(BOOL)flag;
- (void)jh_leftIs:(CGFloat)offsetX fromMiddleOfView:(UIView *)view updateWidth:(BOOL)flag;
- (void)jh_leftIs:(CGFloat)offsetX fromRightOfView:(UIView *)view updateWidth:(BOOL)flag;

#pragma mark --- bottom
/// bottom space in super view,if 'height' > 0, 'y' will be modified,otherwise modify 'height'.
- (void)jh_bottomIs:(CGFloat)bottom;
- (void)jh_bottomIsEqualToView:(UIView *)view;

//
- (void)jh_bottomIs:(CGFloat)offsetY fromBottomOfView:(UIView *)view;
- (void)jh_bottomIs:(CGFloat)offsetY fromMiddleOfView:(UIView *)view;
- (void)jh_bottomIs:(CGFloat)offsetY fromTopOfView:(UIView *)view;

// if flag is YES, will update height to keep 'top' space space in some case.
- (void)jh_bottomIs:(CGFloat)offsetY fromBottomOfView:(UIView *)view updateHeight:(BOOL)flag;
- (void)jh_bottomIs:(CGFloat)offsetY fromMiddleOfView:(UIView *)view updateHeight:(BOOL)flag;
- (void)jh_bottomIs:(CGFloat)offsetY fromTopOfView:(UIView *)view updateHeight:(BOOL)flag;

#pragma mark --- right
/// right space to super view,if 'width' > 0, 'x' will be modified,otherwise modify 'width'.
- (void)jh_rightIs:(CGFloat)right;
- (void)jh_rightIsEqualToView:(UIView *)view;

//
- (void)jh_rightIs:(CGFloat)offsetX fromRightOfView:(UIView *)view;
- (void)jh_rightIs:(CGFloat)offsetX fromMiddleOfView:(UIView *)view;
- (void)jh_rightIs:(CGFloat)offsetX fromLeftOfView:(UIView *)view;

// if flag is YES, will update width to keep 'left' space in some case.
- (void)jh_rightIs:(CGFloat)offsetX fromRightOfView:(UIView *)view updateWidth:(BOOL)flag;
- (void)jh_rightIs:(CGFloat)offsetX fromMiddleOfView:(UIView *)view updateWidth:(BOOL)flag;
- (void)jh_rightIs:(CGFloat)offsetX fromLeftOfView:(UIView *)view updateWidth:(BOOL)flag;

#pragma mark --- center X
- (void)jh_centerXIs:(CGFloat)centerX;
- (void)jh_centerXIsEqualToView:(UIView *)view;

//
- (void)jh_centerXIs:(CGFloat)offsetX fromLeftOfView:(UIView *)view;
- (void)jh_centerXIs:(CGFloat)offsetX fromMiddleOfView:(UIView *)view;
- (void)jh_centerXIs:(CGFloat)offsetX fromRightOfView:(UIView *)view;

// if flag is YES, will update width, keep left space for right move, keep right space for left move
- (void)jh_centerXIs:(CGFloat)offsetX fromLeftOfView:(UIView *)view updateWidth:(BOOL)flag;
- (void)jh_centerXIs:(CGFloat)offsetX fromMiddleOfView:(UIView *)view updateWidth:(BOOL)flag;
- (void)jh_centerXIs:(CGFloat)offsetX fromRightOfView:(UIView *)view updateWidth:(BOOL)flag;

#pragma mark --- center Y
- (void)jh_centerYIs:(CGFloat)centerY;
- (void)jh_centerYIsEqualToView:(UIView *)view;

//
- (void)jh_centerYIs:(CGFloat)offsetY fromTopOfView:(UIView *)view;
- (void)jh_centerYIs:(CGFloat)offsetY fromMiddleOfView:(UIView *)view;
- (void)jh_centerYIs:(CGFloat)offsetY fromBottomOfView:(UIView *)view;

// if flag is YES, will update height, keep top space for bottom move, keep bottom space for top move
- (void)jh_centerYIs:(CGFloat)offsetY fromTopOfView:(UIView *)view updateHeight:(BOOL)flag;
- (void)jh_centerYIs:(CGFloat)offsetY fromMiddleOfView:(UIView *)view updateHeight:(BOOL)flag;
- (void)jh_centerYIs:(CGFloat)offsetY fromBottomOfView:(UIView *)view updateHeight:(BOOL)flag;

/// if flag is YES, will update width, keep origin.x, otherwise update origin.x
- (void)jh_maxXIs:(CGFloat)maxX updateWidth:(BOOL)flag;

/// if flag is YES, will update height, keep origin.y, otherwise update origin.y
- (void)jh_maxYIs:(CGFloat)maxY updateHeight:(BOOL)flag;

#pragma mark --- for UILabel
- (void)jh_autoWidth;
- (void)jh_autoHeight;
- (void)jh_minWidth:(CGFloat)width;
- (void)jh_maxWidth:(CGFloat)width;
- (void)jh_minHeight:(CGFloat)height;
- (void)jh_maxHeight:(CGFloat)height;

@end
