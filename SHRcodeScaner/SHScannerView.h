//
//  SHScannerView.h
//  SHRcodeScaner
//
//  Created by lalala on 2017/5/3.
//  Copyright © 2017年 lsh. All rights reserved.
//

#import <UIKit/UIKit.h>
@class SHScannerView;

@protocol SHQRScannerDelegate <NSObject>
/**
 *  扫描成功的代理回调方法 ---- 可以直接使用提供的设置block方法替代 代理
 *
 *  @param scanner      scanner
 *  @param resultString 扫描结果 -- 字符串
 */
-(void)qrScanner:(SHScannerView *)scanner didFinishScanningWithResult:(NSString *)resultString;

@end

typedef void(^QRScannerFinishHandler)(SHScannerView *scanner, NSString *resultString);

@interface SHScannerView : UIView
//扫描框的背景图片
@property(nonatomic,strong) UIImage * backgroundImage;
//扫描线--图片
@property(nonatomic,strong) UIImage * scrollImage;
//扫描线一次扫描的时间 --可以设置扫描线滚动的速度 默认是2秒
@property(nonatomic,assign) CGFloat scrollImageAnimationDuration;

//代理 --- 也可以直接使用block
@property(nonatomic,weak) id<SHQRScannerDelegate> delegate;

//设置扫描成功的回调--也可以使用代理来实现
-(void)setScannerFinishHandler:(QRScannerFinishHandler)handler;
//开始扫描
-(void)startScanning;
//停止扫描
-(void)stopScanning;

@end
