//
//  FITDeviceInfo.m
//  FITCrashKit
//
//  Created by wanqijian on 2018/12/7.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import "FITDeviceInfo.h"
#import <UIKit/UIKit.h>

@implementation FITDeviceInfo

static FITDeviceInfo *_currentDeviceInfo = nil;
+ (instancetype)currentDeviceInfo {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSDictionary *infoDictionary = [[NSBundle mainBundle] infoDictionary];
        _currentDeviceInfo = [[FITDeviceInfo alloc] init];
        _currentDeviceInfo.appName = [infoDictionary objectForKey:@"CFBundleDisplayName"];
        _currentDeviceInfo.bundleIdentifier = [[NSBundle mainBundle]bundleIdentifier];
        _currentDeviceInfo.version = [infoDictionary objectForKey:@"CFBundleShortVersionString"];
        _currentDeviceInfo.build = [infoDictionary objectForKey:@"CFBundleVersion"];
        _currentDeviceInfo.deviceName =  [[UIDevice currentDevice] systemName];
        _currentDeviceInfo.systemVersion = [[UIDevice currentDevice] systemVersion];
        _currentDeviceInfo.model = [[UIDevice currentDevice] model];
        _currentDeviceInfo.local = [[UIDevice currentDevice] localizedModel];
    });
    return _currentDeviceInfo;
}

- (NSString *)description {
    return [NSString stringWithFormat:@"app_name: %@\nbundle_identifier: %@\nversion: %@\nbuild: %@\ndevice_name: %@\nsystem_version: %@\nmodel: %@\nlocal: %@\n", self.appName, self.bundleIdentifier, self.version, self.build, self.deviceName, self.systemVersion, self.model, self.local];
}

@end
