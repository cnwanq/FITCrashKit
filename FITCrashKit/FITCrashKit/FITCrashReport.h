//
//  FITCrashReport.h
//  FITCrashKit
//
//  Created by wanqijian on 2018/12/7.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface FITCrashReport : NSObject

@property (nonatomic, copy) NSString *reportUrl;

+ (instancetype)shareInstance;

+ (void)reportCrash:(NSString *)info;


@end

NS_ASSUME_NONNULL_END
