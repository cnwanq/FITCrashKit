//
//  FITCrashStore.m
//  FITCrashKit
//
//  Created by wanqijian on 2018/12/7.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import "FITCrashStore.h"

NSString *const kFITCrashStoreKey = @"kFITCrashStoreKey";

@implementation FITCrashStore

+ (NSString *)lastCrashInfo {
    NSString *crashInfo = [[NSUserDefaults standardUserDefaults] valueForKey:kFITCrashStoreKey];
    return crashInfo;
}

+ (void)storeCrashInfo:(NSString *)info {
    [[NSUserDefaults standardUserDefaults] setValue:info forKey:kFITCrashStoreKey];
}

+ (void)clearCrashInfo {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:kFITCrashStoreKey];
}

@end
