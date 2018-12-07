//
//  FITCrashKit.h
//  FITCrashKit
//
//  Created by wanqijian on 2018/12/6.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FITCrashKit : NSObject

@property (nonatomic, copy) void (^handleCrashBlock)(NSString *crashInfo);

+ (instancetype)shareInstance;

+ (void)enable;


@end

NS_ASSUME_NONNULL_END
