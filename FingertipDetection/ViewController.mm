//
//  ViewController.m
//  FingertipDetection
//
//  Created by jianing on 03/11/2016.
//  Copyright © 2016 jianing. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize imageView;
@synthesize videoCamera;
@synthesize fingerLabel;
@synthesize fingerImageView;

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.videoCamera = [[CvVideoCamera alloc]
                        initWithParentView:imageView];
    self.videoCamera.delegate = self;
    self.videoCamera.defaultAVCaptureDevicePosition =
    AVCaptureDevicePositionBack;
    self.videoCamera.defaultAVCaptureSessionPreset =
    AVCaptureSessionPreset640x480;
    self.videoCamera.defaultAVCaptureVideoOrientation =
    AVCaptureVideoOrientationPortrait;
    self.videoCamera.defaultFPS = 30;
    
    fingerDetect = new FingerDetect();
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)processImage:(cv::Mat&)image
{
    int i = fingerDetect->detectFinger(image);
    fingerDetect->showLines = showLines;
    dispatch_async(dispatch_get_main_queue(), ^{
        fingerLabel.text = [NSString stringWithFormat:@"%d", i];
        if ( i>0 && i<6 ) {
            fingerImageView.image = [UIImage imageNamed:[NSString stringWithFormat:@"%@%d", @"finger",i]];
        }else{
            fingerImageView.image = nil;
        }
    });
}

- (void)dealloc
{
    videoCamera.delegate = nil;
}

- (IBAction)detectSwitchTapped:(id)sender {
    BOOL isOn = [sender isOn];
    if (isOn) {
        [videoCamera start];
    } else {
        [videoCamera stop];
    }
}

- (IBAction)showLinesSwitchTapped:(id)sender {
    showLines = [sender isOn];
}

@end
