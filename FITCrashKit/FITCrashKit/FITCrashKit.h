//
//  FITCrashKit.h
//  FITCrashKit
//
//  Created by wanqijian on 2018/12/6.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "FITCrashStore.h"
#import "FITCrashReport.h"

NS_ASSUME_NONNULL_BEGIN

@interface FITCrashKit : NSObject

@property (nonatomic, copy) NSString *reportUrl;
@property (nonatomic, copy) void (^handleCrashBlock)(NSString *crashInfo);

+ (instancetype)shareInstance;

+ (void)enable;
+ (void)enableWithReportUrl:(NSString *)url;


@end

NS_ASSUME_NONNULL_END
