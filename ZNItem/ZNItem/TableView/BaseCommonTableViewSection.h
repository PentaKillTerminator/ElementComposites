//
//  BaseCommonTableViewSection.h
//  ZNItem
//
//  Created by Mr.Z on 2017/12/28.
//  Copyright © 2017年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BaseCommonTableViewCellRow.h"

@interface BaseCommonTableViewSection : NSObject
@property (nonatomic, copy) NSString *headerTitle;
@property (nonatomic, copy) NSString *footerTitle;
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIView *footerView;
@property (nonatomic, assign) CGFloat headerHight;
@property (nonatomic, assign) CGFloat footerHight;
@property (nonatomic, strong) NSMutableArray<BaseCommonTableViewCellRow *> *rows;
@end
