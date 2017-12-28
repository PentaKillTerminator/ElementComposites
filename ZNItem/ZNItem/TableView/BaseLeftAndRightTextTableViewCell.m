//
//  BaseLeftAndRightTextTableViewCell.m
//  ZNItem
//
//  Created by Mr.Z on 2017/12/28.
//  Copyright © 2017年 juanvision. All rights reserved.
//

#import "BaseLeftAndRightTextTableViewCell.h"
#import "SDAutoLayout.h"

@interface BaseLeftAndRightTextTableViewCell ()
@property (nonatomic, strong) UILabel *leftTitle;
@property (nonatomic, strong) UILabel *rightTitle;
@end

@implementation BaseLeftAndRightTextTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self makeSubviewsConstraint];
    }
    return self;
}
- (void)makeSubviewsConstraint{
    UIView *contentView = self.contentView;
    self.leftTitle = [UILabel new];
    _leftTitle.numberOfLines = 0;
    _leftTitle.lineBreakMode = NSLineBreakByWordWrapping;
    [self.contentView addSubview:_leftTitle];
    _leftTitle.sd_layout
    .topSpaceToView(contentView, topSpace)
    .leftSpaceToView(contentView, leftSpace)
    .widthIs(200)
    .autoHeightRatio(0);
    
    
    
    self.rightTitle = [UILabel new];
    _rightTitle.textAlignment = NSTextAlignmentRight;
    _rightTitle.numberOfLines = 0;
    _rightTitle.lineBreakMode = NSLineBreakByWordWrapping;
    [self.contentView addSubview:_rightTitle];
    _rightTitle.sd_layout
    .topEqualToView(_leftTitle)
    .leftSpaceToView(_leftTitle, leftSpace)
    .rightSpaceToView(contentView, rightSpace)
    .heightRatioToView(_leftTitle, 1.0)
    .centerYIs(_leftTitle.centerY_sd);
}

-(void)setCellRow:(BaseCommonTableViewCellRow *)cellRow {
    _leftTitle.text = cellRow.leftTitle;
    _leftTitle.font = cellRow.leftTitleFont;
    _leftTitle.textColor = cellRow.leftTitleColor;
    _rightTitle.text = cellRow.rightTitle;
    _rightTitle.font = cellRow.rightTitleFont;
    _rightTitle.textColor = cellRow.rightTitleColor;
    [self setupAutoHeightWithBottomView:_leftTitle bottomMargin:bottomSpace];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
