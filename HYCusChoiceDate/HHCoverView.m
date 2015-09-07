//
//  HHCoverView.m
//  traffic
//
//  Created by diipo on 15/5/22.
//  Copyright (c) 2015年 diipo.inc. All rights reserved.
//

//#import "UIImageView+HHForScollView.h"
#import "HHCoverView.h"
#import "LeftCell.h"
#import "rightCell.h"
#import "GetTime.h"

@interface HHCoverView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) UITableView *leftTableView;
@property (nonatomic,strong) UITableView *rightTableView;
@property (nonatomic,strong) NSArray *leftDataSource;
@property (nonatomic,strong) NSArray *rightDataSource;
@property (nonatomic) BOOL isSelected;
@property (nonatomic)  int  index;
@end

#define CellHeight 44

@implementation HHCoverView

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    self.hidden = YES;
}

- (instancetype)initWithView:(UIView *)view
{
    if (self = [super initWithFrame:view.bounds])
    {
        self.backgroundColor                = [[UIColor blackColor] colorWithAlphaComponent:0.5];

        self.leftTableView                  = [[UITableView alloc]initWithFrame:CGRectMake(0, view.bounds.size.height - 300, view.bounds.size.width/2, 300)];
        self.leftTableView.backgroundColor  = [UIColor colorWithRed:220.0/255.0 green:220.0/255.0 blue:220.0/255.0 alpha:1];
        self.leftTableView.dataSource       = self;
        self.leftTableView.delegate         = self;
        self.leftTableView.tag              = 666;//设置不隐藏滚动条
        self.leftTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        
        self.rightTableView                 = [[UITableView alloc]initWithFrame:CGRectMake(view.bounds.size.width/2, view.bounds.size.height - 300, view.bounds.size.width/2, 300)];
        self.rightTableView.backgroundColor = [UIColor whiteColor];
        self.rightTableView.dataSource      = self;
        self.rightTableView.delegate        = self;
        self.rightTableView.tag             = 888;//设置不隐藏滚动条
        self.rightTableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        
        
        [self.leftTableView registerNib:[UINib nibWithNibName:@"LeftCell" bundle:nil] forCellReuseIdentifier:@"cell1"];
        [self.rightTableView registerNib:[UINib nibWithNibName:@"rightCell" bundle:nil] forCellReuseIdentifier:@"cell2"];
       
        [self addSubview:self.leftTableView];
        [self addSubview:self.rightTableView];
        
         self.leftDataSource = [GetTime MonthAndDay];
        self.rightDataSource = [GetTime Time][0];
        
        [self.leftTableView reloadData];
        [self.rightTableView reloadData];
       
        [GetTime Time];
        
    }
    return self;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if(tableView.tag == 666){
        return self.leftDataSource.count;
      
    }else{
        return self.rightDataSource.count;
    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{

    if (tableView.tag == 666) {
        LeftCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell1" forIndexPath:indexPath];
        NSMutableDictionary *dic = [NSMutableDictionary dictionary];
        [dic setObject:self.leftDataSource[indexPath.row] forKey:[NSString stringWithFormat:@"%d",indexPath.row]];
        /**
         *   @author _YounG_, 15-06-17 13:06:39
         *
         *   选中颜色
         */
        if(indexPath.row == self.index){
            cell.isSelected = YES;
            UIColor *color = [UIColor whiteColor];
            cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame] ;
            cell.selectedBackgroundView.backgroundColor = color;
            
        }else{
            cell.isSelected = NO;
            UIColor *color = [UIColor whiteColor];
            cell.selectedBackgroundView = [[UIView alloc] initWithFrame:cell.frame] ;
            cell.selectedBackgroundView.backgroundColor = color;
        }
        
         cell.dic = dic;
        cell.backgroundColor = [UIColor clearColor];
        return cell;
    }else
    {
         rightCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell2"];
        cell.obj = self.rightDataSource[indexPath.row];
        return cell;
    }
    
   
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 1;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if(tableView.tag == 666){
        self.index = indexPath.row;
        [self.leftTableView reloadData];
        
        self.rightDataSource = [GetTime Time][indexPath.row];
        [self.rightTableView reloadData];
        
    }else
    {
        
        self.cellSelectedHandler([NSString stringWithFormat:@"%@ %@",self.leftDataSource[self.index],self.rightDataSource[indexPath.row]]);
        [self removeFromSuperview];

    }
 
    
   
    
}

@end
