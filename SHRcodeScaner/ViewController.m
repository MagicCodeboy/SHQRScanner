//
//  ViewController.m
//  SHRcodeScaner
//
//  Created by lalala on 2017/5/3.
//  Copyright © 2017年 lsh. All rights reserved.
//

#import "ViewController.h"
#import "SHQRScannerHelper.h"
#import "SHCannerViewController.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property(nonatomic,strong) UITableView * tableView;
@property(nonatomic,strong) NSArray * titleArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _titleArray = @[@"扫描二维码", @"识别图片中的二维码",  @"生成二维码", @"生成带有头像的二维码"];
    
    [self.view addSubview:self.tableView];
}
#pragma mark --tableViewDelegate--
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.titleArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * const kCellID = @"kCellID";
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:kCellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:kCellID];
    }
    cell.textLabel.text = self.titleArray[indexPath.row];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    switch (indexPath.row) {
        case 0: {
            //真机测试
            SHCannerViewController * testVc = [SHCannerViewController new];
            [testVc startScanner];
            [self.navigationController showViewController:testVc sender:nil];
        }
            break;
        case 1: {
            //模拟相册选择了一张图片
            UIImage * qrImage = [SHQRScannerHelper createQRcodeWithString:@"这是二维码" withSideLength:200.f];
            
            SHCannerViewController * testVc = [SHCannerViewController new];
            [testVc createCodeWithQRString:@"这是二维码" andLogoImage:nil];
            
            [testVc recognizedQRImage:qrImage];
            
            [self.navigationController showViewController:testVc sender:nil];
        }
            break;
        case 2: {
            //生成二维码
            SHCannerViewController * testVc = [SHCannerViewController new];
            [testVc createCodeWithQRString:@"这是没有logo的二维码" andLogoImage:nil];
            [self.navigationController showViewController:testVc sender:nil];
        }
            break;
        case 3: {
            //生成带有头像的二维码
            SHCannerViewController * testVc = [SHCannerViewController new];
            [testVc createCodeWithQRString:@"这是没有logo的二维码" andLogoImage:[UIImage imageNamed:@"1-开心"]];
            [self.navigationController showViewController:testVc sender:nil];
        }
            break;
        default:
            break;
    }
}

-(void)viewWillLayoutSubviews{
    [super viewWillLayoutSubviews];
    
}
-(UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc]initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
