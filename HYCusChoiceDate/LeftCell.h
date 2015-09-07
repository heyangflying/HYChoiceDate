//
//  LeftCell.h
//  Demo
//
//  Created by heyang on 15/6/17.
//  Copyright (c) 2015年 scxd.com.cn. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LeftCell : UITableViewCell
@property (nonatomic,strong) NSDictionary *dic;
@property (weak, nonatomic) IBOutlet UILabel *leftCurrentDay;
@property (weak, nonatomic) IBOutlet UILabel *rightCurrentDay;
@property (nonatomic)BOOL isSelected;
@end
