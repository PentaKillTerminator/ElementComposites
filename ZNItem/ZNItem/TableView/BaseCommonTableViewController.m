//
//  BaseCommonTableViewController.m
//  ZNItem
//
//  Created by Mr.Z on 2017/12/28.
//  Copyright © 2017年 juanvision. All rights reserved.
//

#import "BaseCommonTableViewController.h"
#import "BaseCommonTableViewCell.h"
#import "BaseTextFieldTableViewCell.h"
#import "BaseIndicateWithSwitchTableViewCell.h"
#import "BaseLeftAndRightTextTableViewCell.h"
#import "BaseIndicateWithSwitchTableViewCell.h"
#import "BaseLeftTitleAndDescribeRightTextTableViewCell.h"
#import "SDAutoLayout.h"
@interface BaseCommonTableViewController () <UITableViewDataSource,UITableViewDelegate>

@end

@implementation BaseCommonTableViewController
-(NSMutableArray<BaseCommonTableViewSection *> *)sections{
    if (!_sections) {
        _sections = [NSMutableArray array];
    }
    return _sections;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self makeSubviewsConstraint];
}
- (void)makeSubviewsConstraint{
    self.tableView = [[UITableView alloc]initWithFrame:self.view.bounds];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.sections[section].rows.count;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return self.sections.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return self.sections[section].headerHight;
}
-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return self.sections[section].footerHight;
}

-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return self.sections[section].headerView;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return self.sections[section].headerTitle;
}


- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return self.sections[section].footerView;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return self.sections[section].footerTitle;
}

-(BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath {
    return  self.sections[indexPath.section].rows[indexPath.row].shouldHighlightRow;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *cell = @"BaseCommonTableViewCell";
    switch (self.sections[indexPath.section].rows[indexPath.row].type) {
        case BaseCommonTableViewCellNormal:
            cell = @"BaseCommonTableViewCell";
            break;
        case BaseCommonTableViewCellTextField:
            cell = @"BaseTextFieldTableViewCell";
            break;
        case BaseCommonTableViewCellIndicateSwitch:
            cell = @"BaseIndicateWithSwitchTableViewCell";
            break;
        case BaseCommonTableViewCellLeftAndRightText:
            cell = @"BaseLeftAndRightTextTableViewCell";
            break;
        case BaseCommonTableViewCellLeftTitleAndDescribeRightText:
            cell = @"BaseLeftTitleAndDescribeRightTextTableViewCell";
            break;
            
        default:
            break;
    }
    CGFloat height = [tableView cellHeightForIndexPath:indexPath model:self.sections[indexPath.section].rows[indexPath.row] keyPath:@"cellRow" cellClass:NSClassFromString(cell) contentViewWidth:self.view.bounds.size.width];
    return height > 50 ? height : 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    BaseCommonTableViewCellRow *row = self.sections[indexPath.section].rows[indexPath.row];
    NSString *identifier = [NSString stringWithFormat:@"cell_id_%ld",row.type];
    switch (row.type) {
        case BaseCommonTableViewCellNormal: {
           BaseCommonTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
              cell = [[BaseCommonTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
                cell.cellRow = row;
                cell.cellRow.indexPath = indexPath;
                return cell;
            }
            break;
        }
        case BaseCommonTableViewCellTextField: {
          BaseTextFieldTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[BaseTextFieldTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
                cell.cellRow = row;
                cell.cellRow.indexPath = indexPath;
            }
            return cell;
            break;
        }
        case BaseCommonTableViewCellLeftAndRightText: {
           BaseLeftAndRightTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[BaseLeftAndRightTextTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
                cell.cellRow = row;
                cell.cellRow.indexPath = indexPath;
            }
            return cell;
            break;
        }
        case BaseCommonTableViewCellIndicateSwitch: {
           BaseIndicateWithSwitchTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[BaseIndicateWithSwitchTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
                cell.cellRow = row;
                cell.cellRow.indexPath = indexPath;
            }
            return cell;
            break;
        }
        case BaseCommonTableViewCellLeftTitleAndDescribeRightText: {
           BaseLeftTitleAndDescribeRightTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
            if (!cell) {
                cell = [[BaseLeftTitleAndDescribeRightTextTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
                cell.cellRow = row;
                cell.cellRow.indexPath = indexPath;
            }
            return cell;
            break;
        }
            
        default:
            break;
    }
    return nil;
}




- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self.view endEditing:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
