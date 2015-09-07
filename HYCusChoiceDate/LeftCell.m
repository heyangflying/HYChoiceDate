//
//  LeftCell.m
//  Demo
//
//  Created by heyang on 15/6/17.
//  Copyright (c) 2015年 scxd.com.cn. All rights reserved.
//

#import "LeftCell.h"

@implementation LeftCell

- (void)awakeFromNib {
    // Initialization code
}
-(void)setDic:(NSDictionary *)dic
{
    _dic = dic;
    NSString *key = [dic allKeys][0];
    NSString *value = [dic allValues][0];
    if([key intValue] == 0){
        self.leftCurrentDay.text = @"今天";
    }else{
        self.leftCurrentDay.text = @"";
    }
    if(self.isSelected){
        
        self.leftCurrentDay.textColor = [UIColor orangeColor];
         self.rightCurrentDay.textColor = [UIColor orangeColor];
    }else{
        self.leftCurrentDay.textColor = [UIColor blackColor];
        self.rightCurrentDay.textColor = [UIColor blackColor];
       
    }
    self.rightCurrentDay.text = value;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
