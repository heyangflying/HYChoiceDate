//
//  GetTime.m
//  Demo
//
//  Created by heyang on 15/6/17.
//  Copyright (c) 2015年 scxd.com.cn. All rights reserved.
//

#import "GetTime.h"

@implementation GetTime

+(NSArray *)MonthAndDay
{
    NSMutableArray *array = [NSMutableArray array];
  
    for (int i = 0; i<7; i++) {

        [array addObject:[self getAfterDateByDis:i]];
        
    }
    return array;
}
+(NSArray *)Time
{
    
    NSMutableArray *timeArray = [NSMutableArray array];
    
    for (int i = 0; i<7; i++) {
        
     [timeArray addObject: [self addTimeArrayByIndex:i]];
        
    }
    
    return timeArray;
}
+(NSArray *)addTimeArrayByIndex:(int)x;
{
    
    NSMutableArray *timeArray       = [NSMutableArray array];
    //当前时间
    NSDate * nowDate                = [NSDate date];
    NSCalendar *calendar            = [NSCalendar currentCalendar];
    NSUInteger unitFlags            = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:nowDate];

    NSInteger hour                  = [dateComponent hour];
    
    int  idex ;
    
    if(x == 0){
        idex = hour + 1;
    }else{
        idex = 0;
    }
    
    for (int i = idex; i < 24; i++) {
       
        if (i+1 >24) break;
        
        [timeArray addObject:[NSString stringWithFormat:@"%02d:00 - %02d:00",i,i+1 == 24 ? 0 : i+1]];
        }
    if(x == 0){
        [timeArray insertObject:@"立刻上门(30分钟之内到)" atIndex:0];
    }
    
    return timeArray;
    
}
+(NSString *)getAfterDateByDis:(NSInteger)d
{
    NSInteger dis                   = d;//前后的天数
    NSDate*nowDate                  = [NSDate date];

    NSDate* theDate;

    if(dis!=0)
    {
    NSTimeInterval  oneDay          = 24*60*60*1;//1天的长度
    theDate                         = [nowDate initWithTimeIntervalSinceNow: +oneDay*dis ];
    }else{
    theDate                         = nowDate;
    }


    NSCalendar *calendar            = [NSCalendar currentCalendar];
    NSUInteger unitFlags            = NSCalendarUnitYear | NSCalendarUnitMonth | NSCalendarUnitDay | NSCalendarUnitHour | NSCalendarUnitMinute | NSCalendarUnitSecond;
    NSDateComponents *dateComponent = [calendar components:unitFlags fromDate:theDate];
 //   NSInteger year                = [dateComponent year];
    NSInteger month                 = [dateComponent month];
    NSInteger day                   = [dateComponent day];
//    NSInteger hour                = [dateComponent hour];
//    NSInteger minute              = [dateComponent minute];
//    NSInteger second              = [dateComponent second];

    NSString *MAndDay               = [NSString stringWithFormat:@"%02d-%02d",month,day];
  
    return MAndDay;
   
}
@end
