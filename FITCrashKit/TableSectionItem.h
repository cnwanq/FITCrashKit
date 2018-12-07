//
//  TableSectionItem.h
//  FITCrashKit
//
//  Created by wanqijian on 2018/12/6.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TableRowItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface TableSectionItem : NSObject

@property (nonatomic, strong) NSString *headerTitle;
@property (nonatomic, strong) NSString *footerTitle;

@property (nonatomic, strong) NSArray *rowItems;

- (void)addRowItem:(TableRowItem *)rowItem;

@end

NS_ASSUME_NONNULL_END
