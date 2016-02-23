//
//  LPMath.m
//  LPToolKitDemo
//
//  Created by XuYafei on 15/12/8.
//  Copyright © 2015年 loopeer. All rights reserved.
//

#import "LPMath.h"

@implementation LPMath

extern double roundbyunit(double num, double unit) {
    double remain = modf(num, &unit);
    if (remain > unit / 2.0) {
        return ceilbyunit(num, unit);
    } else {
        return floorbyunit(num, unit);
    }
}

extern double ceilbyunit(double num, double unit) {
    return num - modf(num, &unit) + unit;
}

extern double floorbyunit(double num, double unit) {
    return num - modf(num, &unit);
}

extern float pixel(float num) {
    switch ((int)[UIScreen mainScreen].scale) {
        case 1:
            return roundbyunit(num, 1.0 / 1.0);
            break;
        case 2:
            return roundbyunit(num, 1.0 / 2.0);
            break;
        case 3:
            return roundbyunit(num, 1.0 / 3.0);
            break;
        default:
            return num;
            break;
    }
}

@end
