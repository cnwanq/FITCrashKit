//
//  FITCrashStore.h
//  FITCrashKit
//
//  Created by wanqijian on 2018/12/7.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import <Foundation/Foundation.h>

FOUNDATION_EXTERN NSString *const kFITCrashStoreKey;

NS_ASSUME_NONNULL_BEGIN

@interface FITCrashStore : NSObject

+ (NSString *)lastCrashInfo;

+ (void)storeCrashInfo:(NSString *)info;

+ (void)clearCrashInfo;

@end

NS_ASSUME_NONNULL_END
