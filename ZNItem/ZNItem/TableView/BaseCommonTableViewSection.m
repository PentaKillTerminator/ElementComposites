//
//  BaseCommonTableViewSection.m
//  ZNItem
//
//  Created by Mr.Z on 2017/12/28.
//  Copyright © 2017年 juanvision. All rights reserved.
//

#import "BaseCommonTableViewSection.h"

@implementation BaseCommonTableViewSection
-(NSMutableArray<BaseCommonTableViewCellRow *> *)rows {
    if (!_rows) {
        _rows = [NSMutableArray array];
    }
    return _rows;
}
@end
