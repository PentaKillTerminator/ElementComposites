//
//  BaseCommonTableViewController.h
//  ZNItem
//
//  Created by Mr.Z on 2017/12/28.
//  Copyright © 2017年 juanvision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCommonTableViewSection.h"
#import "BaseCommonTableViewCellRow.h"
@interface BaseCommonTableViewController : UIViewController
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSMutableArray <BaseCommonTableViewSection *> *sections;
@end
