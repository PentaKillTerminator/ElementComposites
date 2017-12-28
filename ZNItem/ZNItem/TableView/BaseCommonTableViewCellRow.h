//
//  BaseCommonTableViewCellRow.h
//  ZNItem
//
//  Created by Mr.Z on 2017/12/28.
//  Copyright © 2017年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,BaseCommonTableViewCellType) {
    BaseCommonTableViewCellNormal,
    BaseCommonTableViewCellTextField,
    BaseCommonTableViewCellLeftAndRightText,
    BaseCommonTableViewCellIndicateSwitch,
    BaseCommonTableViewCellLeftTitleAndDescribeRightText,
    
};

@interface BaseCommonTableViewCellRow : NSObject
@property (nonatomic,   copy) NSString *leftTitle;
@property (nonatomic,   copy) NSString *rightTitle;
@property (nonatomic,   copy) NSString *leftDescribe;
@property (nonatomic,   copy) NSString *textFieldPlaceholder;
@property (nonatomic,   copy) NSString *textFieldValue;
@property (nonatomic, strong) UIFont *leftTitleFont;
@property (nonatomic, strong) UIColor *leftTitleColor;
@property (nonatomic, strong) UIFont *rightTitleFont;
@property (nonatomic, strong) UIColor *rightTitleColor;
@property (nonatomic, strong) UIFont *leftDescribeFont;
@property (nonatomic, strong) UIColor *leftDescribeColor;
@property (nonatomic, strong) UIFont *textFieldFont;
@property (nonatomic, assign) BOOL switchON;
@property (nonatomic, assign) BOOL shouldHighlightRow;
@property (nonatomic, assign) BaseCommonTableViewCellType type;
@property (nonatomic, strong) NSIndexPath *indexPath;
@property (nonatomic,   copy) NSString *cellClassName;

@property (nonatomic,copy) void(^ baseCommonTableViewCellAction)(id object);

@end
