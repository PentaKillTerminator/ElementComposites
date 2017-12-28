//
//  BaseIndicateWithSwitchTableViewCell.m
//  ZNItem
//
//  Created by Mr.Z on 2017/12/28.
//  Copyright © 2017年 juanvision. All rights reserved.
//

#import "BaseIndicateWithSwitchTableViewCell.h"
#import "SDAutoLayout.h"

@interface BaseIndicateWithSwitchTableViewCell()
@property (nonatomic, strong) UILabel *leftTitle;
@property (nonatomic, strong) UISwitch *switchControl;
@end;

@implementation BaseIndicateWithSwitchTableViewCell

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
    
    self.switchControl = [UISwitch new];
    [_switchControl addTarget:self action:@selector(switchChange) forControlEvents:UIControlEventValueChanged];
    [self.contentView addSubview:_switchControl];
    _switchControl.sd_layout
    .centerYIs(contentView.centerY_sd)
    .rightSpaceToView(contentView, rightSpace)
    .heightIs(30);

}

-(void)setCellRow:(BaseCommonTableViewCellRow *)cellRow {
    _leftTitle.text = cellRow.leftTitle;
    _leftTitle.font = cellRow.leftTitleFont;
    _leftTitle.textColor = cellRow.leftTitleColor;
    _switchControl.on = cellRow.switchON;

    [self setupAutoHeightWithBottomView:_leftTitle bottomMargin:bottomSpace];
}

- (void)switchChange{
    self.cellRow.switchON = _switchControl.on;
    if (self.cellRow.baseCommonTableViewCellAction) {
        self.cellRow.baseCommonTableViewCellAction(@(_switchControl.on));
    }
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
