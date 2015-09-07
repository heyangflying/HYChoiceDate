//
//  rightCell.m
//  Demo
//
//  Created by heyang on 15/6/17.
//  Copyright (c) 2015年 scxd.com.cn. All rights reserved.
//

#import "rightCell.h"

@implementation rightCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setObj:(NSString *)obj
{
    _obj = obj;
    
    self.time.text = obj;
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
