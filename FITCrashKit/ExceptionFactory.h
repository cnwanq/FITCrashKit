//
//  ExceptionFactory.h
//  FITCrashKit
//
//  Created by wanqijian on 2018/12/6.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ExceptionFactory : NSObject


+ (void)handleException:(NSExceptionName)exceptionName;

+ (void)handCrashSignal:(int)signal;

@end

NS_ASSUME_NONNULL_END
