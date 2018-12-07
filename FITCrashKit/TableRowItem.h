//
//  TableRowItem.h
//  FITCrashKit
//
//  Created by wanqijian on 2018/12/6.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TableRowItem : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *subtitle;
@property (nonatomic, copy) void(^taphandle)(void);

@end

NS_ASSUME_NONNULL_END
