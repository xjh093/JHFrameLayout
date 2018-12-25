# JHFrameLayout
A light weight autolayout framework.

---

# Pod

`pod 'JHFrameLayout'`

---

# Compare layout time
`Frame` vs `JHFrameLayout` vs `MyFlowLayout`

![image](https://github.com/xjh093/JHFrameLayout/blob/master/image1.png)

---

# Logs

### 2018-11-9
- add some simple methods

    - 1.jh_topIsEqualToBottom:

    - 2.jh_leftIsEqualToRight:

    - 3.jh_edgeIs:

### 2018-11-6
- fix crash: about remove observer of superview

    - 1. iOS 9.3 An instance 0x7ffb2263c230 of class UIView was deallocated while key value observers were still registered with it

    - 2. iOS 12.1 EXC_BAD_ACCESS

### 2018-8-21
- 1.fix bug.

### 2018-8-17
- 1.observe Screen Rotate Notification
- 2.observe superview's frame,bounds,center

### 2018-8-10
- 1.add method 'roundNumber' for 1x,2x,3x.

### 2018-7-19
- 1.update.

### 2018-5-30
- 1.chainable & autolayout.
- 2.fix bugs.

### 2018-5-28
- 1.fix bug: 
- 2.add method:
    - jh_rightIs:
    - jh_bottomIs:

### 2018-5-15
- 1.fix bug: when there is no common superview.

### 2018-1-17
- 1.upload.

---

# USE

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

# More details in Demo :)

