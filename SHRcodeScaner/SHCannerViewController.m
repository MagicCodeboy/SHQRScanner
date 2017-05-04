//
//  SHCannerViewController.m
//  SHRcodeScaner
//
//  Created by lalala on 2017/5/4.
//  Copyright © 2017年 lsh. All rights reserved.
//

#import "SHCannerViewController.h"
#import "SHScannerView.h"
#import "SHQRScannerHelper.h"
@interface SHCannerViewController ()

@property(nonatomic,strong) UIImageView * imageView;
@property(nonatomic,strong) UIImage * qrImage;

@property(nonatomic,strong) SHScannerView * scnnerView;
@end

@implementation SHCannerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
   
    self.view.backgroundColor = [UIColor whiteColor];
}
-(void)viewWillDisappear:(BOOL)animated{
    //停止扫描
    [_scnnerView stopScanning];
}
-(void)startScanner{
    NSLog(@"需要真机测试");
    _scnnerView = [SHScannerView new];
    _scnnerView.frame = self.view.bounds;
    [self.view addSubview:_scnnerView];
    
    //开始扫描
    [_scnnerView startScanning];
    //扫描完成
    [_scnnerView setScannerFinishHandler:^(SHScannerView *scanner, NSString *resultString) {
       //扫描结束
        NSLog(@"内容是%@",resultString);
    }];
}
-(void)createCodeWithQRString:(NSString *)qrString andLogoImage:(UIImage *)logo{
    UIImage * qrImage = [SHQRScannerHelper createQRcodeWithString:qrString withSideLength:200.f];
    //改变颜色
    qrImage = [SHQRScannerHelper changeColorForQRImage:qrImage backgroundColor:[UIColor purpleColor] frontColor:[UIColor blueColor]];
    if (logo) {
        qrImage = [SHQRScannerHelper compposeQRCodeImage:qrImage withImage:logo withImageSideLength:40.f];
    }
    self.qrImage = qrImage;
}
-(void)recognizedQRImage:(UIImage *)qrImage{
    NSString * result = [SHQRScannerHelper recognizeQRCodeFromImage:qrImage];
    NSLog(@"二维码的内容%@",result);
}
-(void)setQrImage:(UIImage *)qrImage{
    _imageView = [[UIImageView alloc]initWithImage:qrImage];
    _imageView.center = self.view.center;
    [self.view addSubview:_imageView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
