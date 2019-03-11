//
//  ViewController.m
//  ESCCameraDemo
//
//  Created by xiang on 2019/3/11.
//  Copyright © 2019 xiang. All rights reserved.
//

#import "ViewController.h"
#import "ESCCameraTool.h"

@interface ViewController () <AVCaptureVideoDataOutputSampleBufferDelegate>

@property(nonatomic,strong)ESCCameraTool* cameraTool;

@property(nonatomic,assign)BOOL isRuning;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.cameraTool = [[ESCCameraTool alloc] init];
    self.cameraTool.delegate = self;
    
    CALayer *layer = [self.cameraTool cameraLayer];
    layer.frame = CGRectMake(0, 100, self.view.frame.size.width, 400);
    [self.view.layer addSublayer:layer];
}

- (void)captureOutput:(AVCaptureOutput *)output didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection {
//    NSLog(@"get %@",sampleBuffer);
}

- (void)captureOutput:(AVCaptureOutput *)output didDropSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection NS_AVAILABLE(10_7, 6_0) {
//    NSLog(@"drop %@",sampleBuffer);
}

- (IBAction)didClickFlashSegmentedControl:(UISegmentedControl *)sender {
    if (sender.selectedSegmentIndex == 0) {
        self.cameraTool.torchSwitch = YES;
    }else {
        self.cameraTool.torchSwitch = NO;
    }
}

- (IBAction)didClickStartButton:(UIButton *)sender {
    if (self.isRuning) {
        [self.cameraTool stop];
        [sender setTitle:@"开始" forState:UIControlStateNormal];
        self.isRuning = NO;
    }else {
        [sender setTitle:@"停止" forState:UIControlStateNormal];
        [self.cameraTool start];
        self.isRuning = YES;
    }
}

@end
