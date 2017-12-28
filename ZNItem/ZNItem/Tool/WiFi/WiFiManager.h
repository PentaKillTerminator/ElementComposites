//
//  WiFiManager.h
//  ZNItem
//
//  Created by Mr.Z on 2017/12/20.
//  Copyright © 2017年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WiFiManager : NSObject
+ (NSString *)getCurrentSSID;

+ (NSString *)getIP;

+ (NSString *)getDeviceHost;

+ (instancetype)manager;

- (void)saveDefaultSSID;

- (NSString *)getDefaultSSID;
@end
