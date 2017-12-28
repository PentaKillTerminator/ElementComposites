//
//  ViewController.m
//  ZNItem
//
//  Created by Mr.Z on 2017/12/20.
//  Copyright © 2017年 juanvision. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
#import "SDAutoLayout.h"
#import "LabelIimageView.h"
#import "Masonry.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    LabelIimageView *labe = [[LabelIimageView alloc]init];
    labe.center = self.view.center;
    labe.text = @"控制器";
    labe.image = @"";
    [labe addTarget:self action:@selector(logInfo) forControlEvents:UIControlEventTouchDown];
    [self.view addSubview:labe];
    [labe mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX);
        make.centerY.equalTo(self.view.mas_centerY);
    }];

}
- (void)logInfo{
    TableViewController *tabel = [[TableViewController alloc]init];
    [self.navigationController pushViewController:tabel animated:YES];
}

- (void)pushvc{
    TableViewController *base = [[TableViewController alloc]init];
    [self.navigationController pushViewController:base animated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
