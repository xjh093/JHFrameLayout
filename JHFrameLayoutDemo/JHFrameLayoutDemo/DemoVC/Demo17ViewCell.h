//
//  Demo17ViewCell.h
//  JHFrameLayoutDemo
//
//  Created by HaoCold on 2018/12/10.
//

#import <UIKit/UIKit.h>
#import "JHFrameLayout.h"

NS_ASSUME_NONNULL_BEGIN

@interface Demo17ViewCell : UITableViewCell
@property (nonatomic,  strong,  readonly) JHFrameLayoutView *layoutView;

- (void)configureWithText:(NSString *)text;

@end

NS_ASSUME_NONNULL_END
