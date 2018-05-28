# JHFrameLayout
### frame layout

## Logs

### 2018-5-28
1.fix bug: jh_rightIs: jh_bottomIs:

### 2018-5-15
1.fix bug: when there is no common superview.

### 2018-1-17
1.upload.

---

## API
```
// size,center,origin
- (void)jh_sizeIs:(CGSize)size;
- (void)jh_centerIs:(CGPoint)center;
- (void)jh_originIs:(CGPoint)origin;


// width
- (void)jh_widthIs:(CGFloat)width;
- (void)jh_widthIs:(CGFloat)ratio ratioOfViewWidth:(UIView *)view;
- (void)jh_widthIs:(CGFloat)ratio ratioOfViewHeight:(UIView *)view;


// height
- (void)jh_heightIs:(CGFloat)height;
- (void)jh_heightIs:(CGFloat)ratio ratioOfViewWidth:(UIView *)view;
- (void)jh_heightIs:(CGFloat)ratio ratioOfViewHeight:(UIView *)view;


/// top space in super view
- (void)jh_topIs:(CGFloat)top;
// if flag is YES, will update height to keep bottom space
- (void)jh_topIs:(CGFloat)offsetY fromTopOfView:(UIView *)view updateHeight:(BOOL)flag;
- (void)jh_topIs:(CGFloat)offsetY fromMiddleOfView:(UIView *)view updateHeight:(BOOL)flag;
- (void)jh_topIs:(CGFloat)offsetY fromBottomOfView:(UIView *)view updateHeight:(BOOL)flag;


/// left space in super view
- (void)jh_leftIs:(CGFloat)left;
// if flag is YES, will update width to keep right space
- (void)jh_leftIs:(CGFloat)offsetX fromLeftOfView:(UIView *)view updateWidth:(BOOL)flag;
- (void)jh_leftIs:(CGFloat)offsetX fromMiddleOfView:(UIView *)view updateWidth:(BOOL)flag;
- (void)jh_leftIs:(CGFloat)offsetX fromRightOfView:(UIView *)view updateWidth:(BOOL)flag;


/// bottom space in super view
- (void)jh_bottomIs:(CGFloat)bottom;
// if flag is YES, will update height to keep top space
- (void)jh_bottomIs:(CGFloat)offsetY fromBottomOfView:(UIView *)view updateHeight:(BOOL)flag;
- (void)jh_bottomIs:(CGFloat)offsetY fromMiddleOfView:(UIView *)view updateHeight:(BOOL)flag;
- (void)jh_bottomIs:(CGFloat)offsetY fromTopOfView:(UIView *)view updateHeight:(BOOL)flag;


/// right space to super view
- (void)jh_rightIs:(CGFloat)right;
// if flag is YES, will update width to keep left space
- (void)jh_rightIs:(CGFloat)offsetX fromRightOfView:(UIView *)view updateWidth:(BOOL)flag;
- (void)jh_rightIs:(CGFloat)offsetX fromMiddleOfView:(UIView *)view updateWidth:(BOOL)flag;
- (void)jh_rightIs:(CGFloat)offsetX fromLeftOfView:(UIView *)view updateWidth:(BOOL)flag;


/// center X
- (void)jh_centerXIs:(CGFloat)centerX;
// if flag is YES, will update width, keep left space for right move, keep right space for left move
- (void)jh_centerXIs:(CGFloat)offsetX fromLeftOfView:(UIView *)view updateWidth:(BOOL)flag;
- (void)jh_centerXIs:(CGFloat)offsetX fromMiddleOfView:(UIView *)view updateWidth:(BOOL)flag;
- (void)jh_centerXIs:(CGFloat)offsetX fromRightOfView:(UIView *)view updateWidth:(BOOL)flag;

/// center Y
- (void)jh_centerYIs:(CGFloat)centerY;
// if flag is YES, wiil update height, keep top space for bottom move, keep bottom space for top move
- (void)jh_centerYIs:(CGFloat)offsetY fromTopOfView:(UIView *)view updateHeight:(BOOL)flag;
- (void)jh_centerYIs:(CGFloat)offsetY fromMiddleOfView:(UIView *)view updateHeight:(BOOL)flag;
- (void)jh_centerYIs:(CGFloat)offsetY fromBottomOfView:(UIView *)view updateHeight:(BOOL)flag;
```
