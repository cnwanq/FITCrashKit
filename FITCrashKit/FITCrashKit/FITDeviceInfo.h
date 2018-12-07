//
//  FITDeviceInfo.h
//  FITCrashKit
//
//  Created by wanqijian on 2018/12/7.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FITDeviceInfo : NSObject

@property (nonatomic, copy) NSString *appName;
@property (nonatomic, copy) NSString *bundleIdentifier;
@property (nonatomic, copy) NSString *version;
@property (nonatomic, copy) NSString *build;

@property (nonatomic, copy) NSString *deviceName;
@property (nonatomic, copy) NSString *systemVersion;
@property (nonatomic, copy) NSString *model;
@property (nonatomic, copy) NSString *local;

+ (instancetype)currentDeviceInfo;

@end

NS_ASSUME_NONNULL_END
