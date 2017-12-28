//
//  LabelIimageView.m
//  ZNItem
//
//  Created by Mr.Z on 2017/12/28.
//  Copyright © 2017年 juanvision. All rights reserved.
//

#import "LabelIimageView.h"
#import "Masonry.h"

@interface LabelIimageView ()
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UIImageView *imageView;
@end

@implementation LabelIimageView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        NSAssert(1, @"使用masonry添加中心约束即可，不需要设置宽高，使用init初始化");
        
    }
    return self;
}
- (instancetype)init {
    self = [super init];
    if (self) {
       [self maskSubviewsConstraint];
    }
    return self;
}
- (void)maskSubviewsConstraint{
    [self setContentCompressionResistancePriority:UILayoutPriorityRequired
                                          forAxis:UILayoutConstraintAxisHorizontal];
    [self setContentHuggingPriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    self.label = [UILabel new];
    _label.numberOfLines = 0;
    _label.lineBreakMode = NSLineBreakByWordWrapping;
    [self addSubview:_label];
    
    self.imageView = [UIImageView new];
    [self addSubview:_imageView];
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self).offset(5);
        make.left.equalTo(self).offset(5);
        make.bottom.equalTo(self.mas_bottom).offset(-5);
        make.width.lessThanOrEqualTo(@200);
    }];
    
    [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(_label.mas_right).offset(10);
        make.centerY.equalTo(_label);
        make.size.mas_equalTo(CGSizeMake(30, 30));
        make.right.equalTo(self.mas_right).offset(-5);
    }];
}


- (void)setText:(NSString *)text {
    _text = text;
    _label.text = text;
}
- (void)setImage:(NSString *)image {
    _image = image;
    _imageView.image = [UIImage imageNamed:image];
    _imageView.backgroundColor = [UIColor redColor];
}
@end
