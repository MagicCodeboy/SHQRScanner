//
//  SHCannerViewController.h
//  SHRcodeScaner
//
//  Created by lalala on 2017/5/4.
//  Copyright © 2017年 lsh. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SHCannerViewController : UIViewController

- (void)startScanner;

- (void)createCodeWithQRString:(NSString *)qrString andLogoImage:(UIImage *)logo;

- (void)recognizedQRImage:(UIImage *)qrImage;

@end
