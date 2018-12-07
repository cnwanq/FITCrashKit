//
//  FITCrashReport.m
//  FITCrashKit
//
//  Created by wanqijian on 2018/12/7.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import "FITCrashReport.h"
#import "FITDeviceInfo.h"

@implementation FITCrashReport

static FITCrashReport *_shareInstance = nil;
+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareInstance = [[FITCrashReport alloc] init];
    });
    return _shareInstance;
}

+ (void)reportCrash:(NSString *)info {
    [[FITCrashReport shareInstance] reportCrash:info];
}

- (void)reportCrash:(NSString *)info {
    if (self.reportUrl.length == 0) {
        return;
    }
    NSString *body = [self getPayloadWithInfo:info];
    NSURLSession *session = [NSURLSession sharedSession];
    NSURL *url = [NSURL URLWithString:self.reportUrl];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    request.HTTPMethod = @"POST";
    request.HTTPBody = [body dataUsingEncoding:NSUTF8StringEncoding];
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:request];
    [dataTask resume];
}

- (NSString *)getPayloadWithInfo:(NSString *)info {
    return [NSString stringWithFormat:@"payload={\"channel\": \"ios_crash_alert\", \"username\": \"CrashBot\", \"text\": \"%@\n%@\", \"icon_emoji\": \":ghost:\"}", [FITDeviceInfo currentDeviceInfo].description, info];
}


@end
