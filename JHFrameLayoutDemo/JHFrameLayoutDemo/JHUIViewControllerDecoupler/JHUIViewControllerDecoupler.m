//
//  JHUIViewControllerDecoupler.m
//  JHKit
//
//  Created by HaoCold on 2017/12/5.
//  Copyright © 2017年 HaoCold. All rights reserved.
//
//  MIT License
//
//  Copyright (c) 2017 xjh093
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

#import "JHUIViewControllerDecoupler.h"

@implementation JHUIViewControllerDecoupler

+ (UIViewController *)jh_controllerFromString:(NSString *)string
                                     paramter:(NSDictionary *)dictionary
{
    // vc from string.
    UIViewController *vc = [NSClassFromString(string) new];
    
    // if vc is nil.
    if (vc == nil) {
        return [self jh_notice_vc:string];
    }
    
    // just KVC it.
    for (NSString *key in dictionary.count > 0 ? dictionary.allKeys : @[]) {
        [vc setValue:dictionary[key] forKey:key];
    }
    
    return vc;
}

+ (UIViewController *)jh_notice_vc:(NSString *)string
{
    UIViewController *vc = [[UIViewController alloc] init];
    vc.view.backgroundColor = [UIColor whiteColor];
    vc.title = @"oops~😅";
    
    [vc.view addSubview:({
        
        NSString *text = @"Can't find this class\n\n"
                          "'%@'\n\n"
                          "in your project.😅\n\n"
                          "👇\n"
                          "Forget to import it\n"
                          "or\n"
                          "Doesn't create it yet~";
        
        UILabel *label = [[UILabel alloc] init];
        label.frame = [UIScreen mainScreen].bounds;
        label.text = [NSString stringWithFormat:text,string];
        label.textColor = [UIColor blackColor];
        label.font = [UIFont boldSystemFontOfSize:18];
        label.textAlignment = NSTextAlignmentCenter;
        label.numberOfLines = 0;
        label;
    })];
    return vc;
}
@end

@interface UIViewController (JHUIViewControllerDecoupler)
@end

@implementation UIViewController (JHUIViewControllerDecoupler)
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    NSLog(@"[<%@ %p> %s]: this class is not key value coding-compliant for the key: %@",NSStringFromClass([self class]),self,__FUNCTION__,key);
}
@end

