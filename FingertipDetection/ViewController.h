//
//  ViewController.h
//  FingertipDetection
//
//  Created by jianing on 03/11/2016.
//  Copyright © 2016 jianing. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <opencv2/highgui/ios.h>
#import "FingerDetect.hpp"
#include <vector>
#include <algorithm>

@interface ViewController : UIViewController<CvVideoCameraDelegate>
{
    CvVideoCamera* videoCamera;
    BOOL showLines;
    cv::Ptr<FingerDetect> fingerDetect;
}

@property (nonatomic, strong) CvVideoCamera* videoCamera;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UISwitch *detectSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *showLineSwitch;
@property (weak, nonatomic) IBOutlet UIImageView *fingerImageView;
@property (weak, nonatomic) IBOutlet UILabel *fingerLabel;

@end

