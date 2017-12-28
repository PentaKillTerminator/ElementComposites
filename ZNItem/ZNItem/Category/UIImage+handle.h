//
//  UIImage+handle.h
//  ZNItem
//
//  Created by Mr.Z on 2017/12/20.
//  Copyright © 2017年 juanvision. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (handle)
/**改变图片尺寸*/
+ (UIImage*)originImage:(UIImage *)image scaleToSize:(CGSize)size;

/** 改变图片颜色*/
+ (UIImage *)originImage:(UIImage *)image changeColor:(UIColor *)color;

/**绘制纯色的图片*/
+ (UIImage *)imageWithColor:(UIColor *)color size:(CGSize)size;

/**绘制渐变色的图片*/
+ (UIImage *)graphicsBeginImage:(CGSize)size startColor:(UIColor *)start endColor:(UIColor *)end;

/** 按给定的方向旋转图片 */
- (UIImage*)rotate:(UIImageOrientation)orient;

/** 将图片旋转degrees角度 */
- (UIImage *)imageRotatedByDegrees:(CGFloat)degrees;

/** 将图片旋转radians弧度 */
- (UIImage *)imageRotatedByRadians:(CGFloat)radians;

/** 纠正图片的方向 */
- (UIImage *)fixOrientation;

/** 垂直翻转 */
- (UIImage *)flipVertical;

/** 水平翻转 */
- (UIImage *)flipHorizontal;

/** 获取视频第一帧的图片 */
+ (UIImage*)imageFormVideoFilePath:(NSURL *)path;
@end
