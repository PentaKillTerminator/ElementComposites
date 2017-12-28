//
//  BaseCommonTableViewCell.h
//  ZNItem
//
//  Created by Mr.Z on 2017/12/28.
//  Copyright © 2017年 juanvision. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseCommonTableViewCellRow.h"
#import "BaseCellSetting.h"
@interface BaseCommonTableViewCell : UITableViewCell
@property (nonatomic, strong) BaseCommonTableViewCellRow *cellRow;


@end
