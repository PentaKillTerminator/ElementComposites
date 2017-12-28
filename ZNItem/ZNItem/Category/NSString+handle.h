//
//  NSString+handle.h
//  ZNItem
//
//  Created by Mr.Z on 2017/12/20.
//  Copyright © 2017年 juanvision. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (handle)

/**base64编码*/
- (NSString *)base64Encode;

/**base64解码*/
- (NSString *)base64Decode;

/**包含数字*/
- (BOOL)isFixNumber;

/**包含表情*/
- (BOOL)containsEmoji;

/**包含中文*/
- (BOOL)containsChinese;

/**转为时分秒字符串*/
+ (NSString *)timeLengthFromSS:(NSInteger)seconds;

/**字典转字符串*/
+ (NSString *)jsonToString:(NSDictionary *)json;

/**字符串转字典*/
- (NSDictionary *)jsonStringToDictionary;
@end
