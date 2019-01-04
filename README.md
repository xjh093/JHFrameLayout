# JHFrameLayout
A light weight autolayout framework.

---

# Version
Latest release version: 
- [2.5.3](https://github.com/xjh093/JHFrameLayout/releases)

---

# Cocoapods

`pod 'JHFrameLayout'`

---

# Compare layout time
`Frame` vs `JHFrameLayout` vs `MyFlowLayout`

![image](https://github.com/xjh093/JHFrameLayout/blob/master/image1.png)

---


# Usage

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

---

# Logs

[Change Log](https://github.com/xjh093/JHFrameLayout/blob/master/CHANGELOG.md)

---

# More details in Demo :)

