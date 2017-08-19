
#pragma once

#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>

class FingerDetect
{
public:
    int detectFinger(cv::Mat& frame);
    float innerAngle(float px1, float py1, float px2, float py2, float cx1, float cy1);
    bool showLines = false;
};
