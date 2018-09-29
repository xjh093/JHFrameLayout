# JHFrameLayout
### frame layout

## What is it?
A autolayout base on 'frame'.

## Pod

`pod 'JHFrameLayout'`

---

## Logs

 2018-8-21
- 1.fix bug.

---

 2018-8-17
- 1.observe Screen Rotate Notification
- 2.observe superview's frame,bounds,center

---

 2018-8-10
- 1.add method 'roundNumber' for 1x,2x,3x.

---

 2018-7-19
- 1.update.

---

 2018-5-30
- 1.chainable & autolayout.
- 2.fix bugs.

---

 2018-5-28
- 1.fix bug: jh_rightIs: jh_bottomIs:

---

 2018-5-15
- 1.fix bug: when there is no common superview.

---

 2018-1-17
- 1.upload.

---

## USE

```
- (void)loadView{

    self.view = [[JHFrameLayoutView alloc] initWithFrame:[UIScreen mainScreen].bounds];

    UIView *view1 = [[UIView alloc] init];
    view1.backgroundColor = [UIColor grayColor];
    [self.view addSubview:view1];
    
    view1.jhLayout
    .topOffsetBottomOfView(10, self.navigationController.navigationBar, NO)
    .leftIs(10)
    .bottomOffsetMiddleOfView(-50, self.view, YES)
    .rightOffsetMiddleOfView(-5, self.view, YES);
}

```

### More details in Demo

---

## API
```
// size,center,origin
- (void)jh_sizeIs:(CGSize)size;
- (void)jh_centerIs:(CGPoint)center;
- (void)jh_originIs:(CGPoint)origin;


// width
- (void)jh_widthIs:(CGFloat)width;
- (void)jh_widthIsEqualToView:(UIView *)view;
- (void)jh_widthIs:(CGFloat)ratio ratioOfViewWidth:(UIView *)view;
- (void)jh_widthIs:(CGFloat)ratio ratioOfViewHeight:(UIView *)view;


// height
- (void)jh_heightIs:(CGFloat)height;
- (void)jh_heightIsEqualToView:(UIView *)view;
- (void)jh_heightIs:(CGFloat)ratio ratioOfViewWidth:(UIView *)view;
- (void)jh_heightIs:(CGFloat)ratio ratioOfViewHeight:(UIView *)view;


/// top space in super view
- (void)jh_topIs:(CGFloat)top;
- (void)jh_topIsEqualToView:(UIView *)view;
// if flag is YES, will update height to keep bottom space
- (void)jh_topIs:(CGFloat)offsetY fromTopOfView:(UIView *)view updateHeight:(BOOL)flag;
- (void)jh_topIs:(CGFloat)offsetY fromMiddleOfView:(UIView *)view updateHeight:(BOOL)flag;
- (void)jh_topIs:(CGFloat)offsetY fromBottomOfView:(UIView *)view updateHeight:(BOOL)flag;


/// left space in super view
- (void)jh_leftIs:(CGFloat)left;
- (void)jh_leftIsEqualToView:(UIView *)view;
// if flag is YES, will update width to keep right space
- (void)jh_leftIs:(CGFloat)offsetX fromLeftOfView:(UIView *)view updateWidth:(BOOL)flag;
- (void)jh_leftIs:(CGFloat)offsetX fromMiddleOfView:(UIView *)view updateWidth:(BOOL)flag;
- (void)jh_leftIs:(CGFloat)offsetX fromRightOfView:(UIView *)view updateWidth:(BOOL)flag;


/// bottom space in super view,if 'height' > 0, 'y' will be modified,otherwise modify 'height'.
- (void)jh_bottomIs:(CGFloat)bottom;
- (void)jh_bottomIsEqualToView:(UIView *)view;
// if flag is YES, will update height to keep top space
- (void)jh_bottomIs:(CGFloat)offsetY fromBottomOfView:(UIView *)view updateHeight:(BOOL)flag;
- (void)jh_bottomIs:(CGFloat)offsetY fromMiddleOfView:(UIView *)view updateHeight:(BOOL)flag;
- (void)jh_bottomIs:(CGFloat)offsetY fromTopOfView:(UIView *)view updateHeight:(BOOL)flag;


/// right space to super view,if 'width' > 0, 'x' will be modified,otherwise modify 'width'.
- (void)jh_rightIs:(CGFloat)right;
- (void)jh_rightIsEqualToView:(UIView *)view;
// if flag is YES, will update width to keep left space
- (void)jh_rightIs:(CGFloat)offsetX fromRightOfView:(UIView *)view updateWidth:(BOOL)flag;
- (void)jh_rightIs:(CGFloat)offsetX fromMiddleOfView:(UIView *)view updateWidth:(BOOL)flag;
- (void)jh_rightIs:(CGFloat)offsetX fromLeftOfView:(UIView *)view updateWidth:(BOOL)flag;


/// center X
- (void)jh_centerXIs:(CGFloat)centerX;
- (void)jh_centerXIsEqualToView:(UIView *)view;
// if flag is YES, will update width, keep left space for right move, keep right space for left move
- (void)jh_centerXIs:(CGFloat)offsetX fromLeftOfView:(UIView *)view updateWidth:(BOOL)flag;
- (void)jh_centerXIs:(CGFloat)offsetX fromMiddleOfView:(UIView *)view updateWidth:(BOOL)flag;
- (void)jh_centerXIs:(CGFloat)offsetX fromRightOfView:(UIView *)view updateWidth:(BOOL)flag;

/// center Y
- (void)jh_centerYIs:(CGFloat)centerY;
- (void)jh_centerYIsEqualToView:(UIView *)view;
// if flag is YES, wiil update height, keep top space for bottom move, keep bottom space for top move
- (void)jh_centerYIs:(CGFloat)offsetY fromTopOfView:(UIView *)view updateHeight:(BOOL)flag;
- (void)jh_centerYIs:(CGFloat)offsetY fromMiddleOfView:(UIView *)view updateHeight:(BOOL)flag;
- (void)jh_centerYIs:(CGFloat)offsetY fromBottomOfView:(UIView *)view updateHeight:(BOOL)flag;
```
