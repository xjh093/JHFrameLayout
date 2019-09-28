# JHFrameLayout
A light weight autolayout framework.

---

# Version
Latest release version: 
- [2.5.7](https://github.com/xjh093/JHFrameLayout/releases)

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

    UIView *view1 = [[
