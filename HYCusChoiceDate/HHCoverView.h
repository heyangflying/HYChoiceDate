//
//  HHCoverView.h
//  traffic
//
//  Created by diipo on 15/5/22.
//  Copyright (c) 2015年 diipo.inc. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^HHCoverViewHandler)(NSString *aString);

@interface HHCoverView : UIView

@property (nonatomic,copy) HHCoverViewHandler cellSelectedHandler;

- (instancetype)initWithView:(UIView *)view;

@end
