//
//  JHAutoLayoutCell.h
//  JHFrameLayoutDemo
//
//  Created by HaoCold on 2019/4/2.
//

#import <UIKit/UIKit.h>
#import "JHFrameLayout.h"

@interface JHAutoLayoutCell : UITableViewCell

@property (nonatomic,  assign) CGSize  cellSize;

@property (nonatomic,  strong) NSIndexPath *indexPath;

@property (nonatomic,  strong,  readonly) JHFrameLayoutView *layoutView;

/**
 subclass call this method and add subviews on `self.layoutView`.
 */
- (void)setupViews;

@end
