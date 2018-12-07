//
//  ExceptionFactory.m
//  FITCrashKit
//
//  Created by wanqijian on 2018/12/6.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import "ExceptionFactory.h"

@implementation ExceptionFactory

+ (void)handleException:(NSExceptionName)exceptionName {
    if (exceptionName == NSGenericException) {
        [self handleGenericException];
    } else if (exceptionName == NSRangeException) {
        [self handleRangeException];
    } else if (exceptionName == NSInvalidArgumentException) {
        [self handleInvalidArgumentException];
    } else if (exceptionName == NSInternalInconsistencyException) {
        [self handleInternalInconsistencyException];
    } else if (exceptionName == NSMallocException) {
        [self handleMallocException];
    } else if (exceptionName == NSObjectInaccessibleException) {
        
    }
}

+ (void)handleGenericException {
    NSMutableArray *array = [NSMutableArray array];
    [array addObject:@"0"];
    [array addObject:@"1"];
    [array addObject:@"2"];
    for (NSString *item in array) {
        [array removeObject:item];
    }
}

+ (void)handleRangeException {
    NSArray *array = @[@"0", @"1", @"2"];
    NSString *item = array[array.count];
    NSLog(@"%@", item);
}

+ (void)handleInvalidArgumentException {
    NSString *value = nil;
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    [dict setObject:value forKey:@"key"];
}

+ (void)handleInternalInconsistencyException {
    NSMutableDictionary *dict = (NSMutableDictionary *)@{@"key1": @"value1", @"key2": @"value2"};
    [dict setObject:@"value3" forKey:@"key1"];
}

+ (void)handleMallocException {
    NSMutableData *data = [[NSMutableData alloc] initWithCapacity:1];
    NSUInteger len = 2032935142000000000;
    [data increaseLengthBy:len];
}

+ (void)handleObjectInaccessibleException {
}


+ (void)handCrashSignal:(int)signal {
}

@end
