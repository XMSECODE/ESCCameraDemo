//
//  ESCCameraTool.h
//  ESCHeartRateDemo
//
//  Created by xiang on 2019/3/7.
//  Copyright © 2019 xiang. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <VideoToolbox/VideoToolbox.h>

NS_ASSUME_NONNULL_BEGIN

typedef enum : NSUInteger {
    ESCMediaTypeVideo,
    ESCMediaTypePhoto
} ESCMediaType;


@interface ESCCameraTool : NSObject

@property(nonatomic,strong)CALayer* cameraLayer;

@property(nonatomic,weak)id<AVCaptureVideoDataOutputSampleBufferDelegate> delegate;

@property(nonatomic,assign)BOOL torchSwitch;

- (void)start;

- (void)stop;

@end

NS_ASSUME_NONNULL_END
