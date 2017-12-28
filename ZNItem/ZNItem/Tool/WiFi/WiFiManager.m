//
//  WiFiManager.m
//  ZNItem
//
//  Created by Mr.Z on 2017/12/20.
//  Copyright © 2017年 juanvision. All rights reserved.
//

#import "WiFiManager.h"
#import <SystemConfiguration/CaptiveNetwork.h>
#import <ifaddrs.h>
#import <arpa/inet.h>


@interface WiFiManager()
@property (nonatomic, strong) NSString *defualtSSID;
@end

@implementation WiFiManager
+ (instancetype)manager {
    static WiFiManager *manager = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        manager = [[WiFiManager alloc] init];
    });
    return manager;
}

- (void)saveDefaultSSID {
    NSString *ssid;
    ssid = [WiFiManager getCurrentSSID];
    if (![ssid hasPrefix:@"IPC"])  // 过滤掉设备热点
        self.defualtSSID = ssid;
}

- (NSString *)getDefaultSSID {
    return self.defualtSSID;
}

+ (NSString *)getCurrentSSID {
    NSArray *ifs = (__bridge id)CNCopySupportedInterfaces();
    
    id info = nil;
    for (NSString *ifnam in ifs) {
        info = (__bridge id)CNCopyCurrentNetworkInfo((__bridge CFStringRef)ifnam);
        if (info && [info count]) {
            break;
        }
    }
    NSDictionary *dctySSID = (NSDictionary *)info;
    
    return [dctySSID objectForKey:@"SSID"];
}

+ (NSString *)getIP {
    NSString *address = nil;
    struct ifaddrs *interfaces = NULL;
    struct ifaddrs *temp_addr = NULL;
    int success = 0;
    // retrieve the current interfaces - returns 0 on success
    success = getifaddrs(&interfaces);
    if (success == 0) {
        // Loop through linked list of interfaces
        temp_addr = interfaces;
        while(temp_addr != NULL) {
            if(temp_addr->ifa_addr->sa_family == AF_INET) {
                // Check if interface is en0 which is the wifi connection on the iPhone
                if([[NSString stringWithUTF8String:temp_addr->ifa_name] isEqualToString:@"en0"]) {
                    // Get NSString from C String
                    address = [NSString stringWithUTF8String:inet_ntoa(((struct sockaddr_in *)temp_addr->ifa_addr)->sin_addr)];
                }
            }
            temp_addr = temp_addr->ifa_next;
        }
    }
    // Free memory
    freeifaddrs(interfaces);
    NSLog(@"[getIP] %@", address);
    return address;
}

+ (NSString *)getDeviceHost {
    NSString *lhostName = nil;
    NSString *ipStr = [WiFiManager getIP];
    NSString *lsuffix = [ipStr substringFromIndex:[ipStr length]-3];
    NSUInteger lastPortPos = 0;
    if ([lsuffix rangeOfString:@"."].location == NSNotFound) {
        lastPortPos = [ipStr length] - 4;
    } else {
        lastPortPos = [ipStr length] - 3 + [lsuffix rangeOfString:@"."].location;
    }
    lhostName = [NSString stringWithFormat:@"%@.1", [ipStr substringToIndex:lastPortPos]];
    NSLog(@"[getDeviceHost] %@", lhostName);
    return lhostName;
}
@end
