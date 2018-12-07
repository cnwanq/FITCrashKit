//
//  ViewController.m
//  FITCrashKit
//
//  Created by wanqijian on 2018/12/6.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import "ViewController.h"
#import "TableSectionItem.h"
#import "ExceptionFactory.h"


@interface ViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) NSMutableArray<TableSectionItem *> *dataSource;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initData];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
}

- (void)initData {
    {
        // section 1
        TableSectionItem *sectionItem = [TableSectionItem new];
        sectionItem.headerTitle = @"Exception Section";

        TableRowItem *rowItem1 = [TableRowItem new];
        rowItem1.title = @"NSGenericException";
        rowItem1.subtitle = @"普通异常";
        rowItem1.taphandle = ^{
            NSLog(@"NSGenericException");
            [ExceptionFactory handleException:NSGenericException];
        };
        [sectionItem addRowItem:rowItem1];

        TableRowItem *rowItem2 = [TableRowItem new];
        rowItem2.title = @"NSRangeException";
        rowItem2.subtitle = @"数组越界";
        rowItem2.taphandle = ^{
            NSLog(@"NSRangeException");
            [ExceptionFactory handleException:NSRangeException];
        };
        [sectionItem addRowItem:rowItem2];

        TableRowItem *rowItem3 = [TableRowItem new];
        rowItem3.title = @"NSInvalidArgumentException";
        rowItem3.subtitle = @"非法参数";
        rowItem3.taphandle = ^{
            NSLog(@"NSInvalidArgumentException");
            [ExceptionFactory handleException:NSInvalidArgumentException];
        };
        [sectionItem addRowItem:rowItem3];

        TableRowItem *rowItem4 = [TableRowItem new];
        rowItem4.title = @"NSInternalInconsistencyException";
        rowItem4.subtitle = @"xxx";
        rowItem4.taphandle = ^{
            NSLog(@"NSInternalInconsistencyException");
            [ExceptionFactory handleException:NSInternalInconsistencyException];
        };
        [sectionItem addRowItem:rowItem4];

        TableRowItem *rowItem5 = [TableRowItem new];
        rowItem5.title = @"NSMallocException";
        rowItem5.subtitle = @"分配空间异常";
        rowItem5.taphandle = ^{
            NSLog(@"NSMallocException");
            [ExceptionFactory handleException:NSMallocException];
        };
        [sectionItem addRowItem:rowItem5];

        [self.dataSource addObject:sectionItem];
    }
    
    {
        // section 2
        TableSectionItem *sectionItem2 = [TableSectionItem new];
        sectionItem2.headerTitle = @"Signal Crash Section";
        
        TableRowItem *rowItem1 = [TableRowItem new];
        rowItem1.title = @"Signal Crash";
        rowItem1.subtitle = @"Crash";
        rowItem1.taphandle = ^{
            [ExceptionFactory handCrashSignal:0];
        };
        [sectionItem2 addRowItem:rowItem1];
        
        [self.dataSource addObject:sectionItem2];
    }
    
    
}

#pragma make - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    TableSectionItem *sectionItem = self.dataSource[indexPath.section];
    TableRowItem *rowItem = sectionItem.rowItems[indexPath.row];
    if (rowItem.taphandle) {
        rowItem.taphandle();
    }
    

}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    TableSectionItem *sectionItem = self.dataSource[section];
    return sectionItem.headerTitle;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    TableSectionItem *sectionItem = self.dataSource[section];
    return sectionItem.footerTitle;
}


#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSource.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    TableSectionItem *sectionItem = self.dataSource[section];
    return sectionItem.rowItems.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TableSectionItem *sectionItem = self.dataSource[indexPath.section];
    TableRowItem *rowItem = sectionItem.rowItems[indexPath.row];
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
    
    cell.textLabel.text = rowItem.title;
    cell.detailTextLabel.text = rowItem.subtitle;
    
    return cell;
}


#pragma mark - Getter

- (NSMutableArray<TableSectionItem *> *)dataSource {
    if (!_dataSource) {
        _dataSource = [NSMutableArray<TableSectionItem *> array];
    }
    return _dataSource;
}

@end
