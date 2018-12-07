//
//  TableSectionItem.m
//  FITCrashKit
//
//  Created by wanqijian on 2018/12/6.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import "TableSectionItem.h"

@implementation TableSectionItem

- (void)addRowItem:(TableRowItem *)rowItem {
    if (!rowItem) {
        return;
    }
    NSMutableArray *rows = [self.rowItems mutableCopy];
    [rows addObject:rowItem];
    self.rowItems = [rows copy];
}

#pragma mark - Getter

- (NSArray *)rowItems {
    if (!_rowItems) {
        _rowItems = [NSArray array];
    }
    return _rowItems;
}



@end
