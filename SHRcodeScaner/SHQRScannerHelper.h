//
//  SHQRScannerHelper.h
//  SHRcodeScaner
//
//  Created by lalala on 2017/5/4.
//  Copyright © 2017年 lsh. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface SHQRScannerHelper : NSObject
/*
 *  生成一个二维码图片 默认边长为300
 @param  string 二维码内容
 @return 生成的二维码图片
 */
+(UIImage *)createQRCodeWithString:(NSString *)string;
/*
 *  生成一个二维码图片 需要制定图片的边长
 @param  string 二维码内容
 @param  sideLength 图片的边长
 @return  生成的二维码图片
 */
+(UIImage *)createQRcodeWithString:(NSString *)string withSideLength:(CGFloat)sideLength;
/*
 *  从图中识别二维码
 @param  image 二维码图片
 @return 返回识别出的字符串
 */
+(NSString *)recognizeQRCodeFromImage:(UIImage *)image;
/*
 *  添加一张图片到二维码上（图片）
 @param  codeImage 二维码图片
 @param  image 要添加的图片
 @param  sideLength 要添加的图片的边长尺寸
 @return 返回合成的图片
 */
+(UIImage *)compposeQRCodeImage:(UIImage *)codeImage withImage:(UIImage *)image withImageSideLength:(CGFloat)sideLength;
/*
 **  改变二维码的图片的颜色
 @param  image 二维码图片
 @param  backgroundColor 背景颜色
 @param  frontColor 二维码的颜色
 @return 图片
 */
+(UIImage *)changeColorForQRImage:(UIImage *)image backgroundColor:(UIColor *)backgroundColor frontColor:(UIColor *)frontColor;


@end
