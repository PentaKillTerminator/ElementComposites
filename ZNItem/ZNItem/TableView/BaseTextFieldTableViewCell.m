//
//  BaseTextFieldTableViewCell.m
//  ZNItem
//
//  Created by Mr.Z on 2017/12/28.
//  Copyright © 2017年 juanvision. All rights reserved.
//

#import "BaseTextFieldTableViewCell.h"
#import "SDAutoLayout.h"

@interface BaseTextFieldTableViewCell ()
@property (nonatomic, strong) UILabel *leftTitle;
@property (nonatomic, strong) UITextField *textField;
@end

@implementation BaseTextFieldTableViewCell

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
    .leftSpaceToView(contentView, leftSpace)
    .topSpaceToView(contentView, topSpace)
    .widthIs(200)
    .heightIs(50)
    .autoHeightRatio(0);
    
    self.textField = [UITextField new];
    _textField.textAlignment = NSTextAlignmentRight;
    [_textField addTarget:self action:@selector(textChange) forControlEvents:UIControlEventEditingChanged];
    [_textField addTarget:self action:@selector(textEndEdit) forControlEvents:UIControlEventEditingDidEnd];
    [self.contentView addSubview:_textField];
    _textField.sd_layout
    .leftSpaceToView(_leftTitle, leftSpace)
    .topSpaceToView(contentView, topSpace)
    .rightSpaceToView(contentView, rightSpace)
    .heightRatioToView(_leftTitle, 1);
    
    
}

- (void)setCellRow:(BaseCommonTableViewCellRow *)cellRow {
    _leftTitle.text = cellRow.leftTitle;
    _leftTitle.font = cellRow.leftTitleFont;
    _leftTitle.textColor = cellRow.leftTitleColor;
    
    _textField.placeholder = cellRow.textFieldPlaceholder;
    _leftTitle.font = cellRow.textFieldFont;
    _leftTitle.textColor = cellRow.leftTitleColor;
    [self setupAutoHeightWithBottomView:_leftTitle bottomMargin:bottomSpace];
}

- (void)textChange{
    self.cellRow.textFieldValue = _textField.text;
}
- (void)textEndEdit{
    [self textChange];
    if (self.cellRow.baseCommonTableViewCellAction) {
        self.cellRow.baseCommonTableViewCellAction(_textField.text);
    }
}


- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
