//
//  HYCoverView.h
//  HYChoiceDate
//
//  Created by heyang on 15/9/7.
//  Copyright (c) 2015年 com.scxingdun. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^HHCoverViewHandler)(NSString *aString);
@interface HYCoverView : UIView
@property (nonatomic,copy) HHCoverViewHandler cellSelectedHandler;

- (instancetype)initWithView:(UIView *)view;
@end
