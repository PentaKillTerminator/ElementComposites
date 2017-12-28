//
//  UIApplication+PushSettings.m
//  ZNItem
//
//  Created by Mr.Z on 2017/12/20.
//  Copyright © 2017年 juanvision. All rights reserved.
//

#import "UIApplication+PushSettings.h"
#define JA_SYSTEM_VERSION  [[[UIDevice currentDevice] systemVersion] floatValue]

@implementation UIApplication (PushSettings)
- (void)pushToWiFiList
{
    if (JA_SYSTEM_VERSION >= 10.0) {
        [self openURL:[NSURL URLWithString:@"App-Prefs:root=WIFI"]];
    }else{
        [self openURL:[NSURL URLWithString:@"prefs:root=WIFI"]];
    }
}

- (void)pushToNotification
{
    if (JA_SYSTEM_VERSION >= 10.0) {
        [self openURL:[NSURL URLWithString:@"App-Prefs:root=NOTIFICATIONS_ID"]];
    }else{
        [self openURL:[NSURL URLWithString:@"prefs:root=NOTIFICATIONS_ID"]];
    }
}

- (void)pushToLanguageAndLocalized
{
    if (JA_SYSTEM_VERSION >= 10.0) {
        [self openURL:[NSURL URLWithString:@"App-Prefs:root=General&path=INTERNATIONAL"]];
    }else{
        [self openURL:[NSURL URLWithString:@"prefs:root=General&path=INTERNATIONAL"]];
    }
}

- (void)pushToPhotos
{
    if (JA_SYSTEM_VERSION >= 10.0) {
        [self openURL:[NSURL URLWithString:@"App-Prefs:root=Photos"]];
    }else{
        [self openURL:[NSURL URLWithString:@"prefs:root=Photos"]];
    }
}

- (void)pushAppSettings {
    NSURL *setting = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    if ([self canOpenURL:setting]) {
        [self openURL:setting];
    }
    
}
@end
