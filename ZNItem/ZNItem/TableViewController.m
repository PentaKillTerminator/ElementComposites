//
//  TableViewController.m
//  ZNItem
//
//  Created by Mr.Z on 2017/12/28.
//  Copyright © 2017年 juanvision. All rights reserved.
//

#import "TableViewController.h"
#import "BaseCommonTableViewCellRow.h"
#import "BaseCommonTableViewSection.h"
@interface TableViewController ()

@end

@implementation TableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    BaseCommonTableViewSection *section1 = [[BaseCommonTableViewSection alloc]init];
    section1.headerTitle = @"textfield";
    section1.headerHight = 30;
    section1.footerHight = CGFLOAT_MIN;
    [self.sections addObject:section1];
    
    BaseCommonTableViewCellRow *row1 = [[BaseCommonTableViewCellRow alloc]init];
    row1.type = BaseCommonTableViewCellTextField;
    row1.leftTitle = @"这是一个输入框";
    row1.textFieldPlaceholder = @"请输入一个文字";
    [section1.rows addObject:row1];
    
    
    BaseCommonTableViewSection *section2 = [[BaseCommonTableViewSection alloc]init];
    section2.headerTitle = @"LeftAndRightText";
    section2.headerHight = 30;
    section2.footerHight = CGFLOAT_MIN;
    [self.sections addObject:section2];
    
    BaseCommonTableViewCellRow *row2 = [[BaseCommonTableViewCellRow alloc]init];
    row2.type = BaseCommonTableViewCellLeftAndRightText;
    row2.leftTitle = @"左边的很长很长左边的很长很长左边的很长很长左边的很长很长左边的很长很长左边的很长很长左边的wenzi";
    row2.rightTitle = @"右边文字";
    [section2.rows addObject:row2];
    
    
    BaseCommonTableViewSection *section3 = [[BaseCommonTableViewSection alloc]init];
    section3.headerTitle = @"LeftTitleAndDescribeRightText";
    section3.headerHight = 30;
    section3.footerHight = CGFLOAT_MIN;
    [self.sections addObject:section3];
    
    BaseCommonTableViewCellRow *row3 = [[BaseCommonTableViewCellRow alloc]init];
    row3.type = BaseCommonTableViewCellLeftTitleAndDescribeRightText;
    row3.leftTitle = @"左边的标题";
    row3.leftDescribe = @"左边的文字描述";
    row3.rightTitle = @"右边的文字";
    [section3.rows addObject:row3];
    
    
    BaseCommonTableViewSection *section4 = [[BaseCommonTableViewSection alloc]init];
    section4.headerTitle = @"LeftTitleAndDescribeRightText";
    section4.headerHight = 30;
    section4.footerHight = CGFLOAT_MIN;
    [self.sections addObject:section4];
    
    BaseCommonTableViewCellRow *row4 = [[BaseCommonTableViewCellRow alloc]init];
    row4.type = BaseCommonTableViewCellIndicateSwitch;
    row4.leftTitle = @"开关";
    row4.switchON = YES;
    [section4.rows addObject:row4];
    [self.tableView reloadData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
