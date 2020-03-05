//
//  GTLocation.m
//  whatFuckingShitiOSApp
//
//  Created by 张建东 on 2020/3/4.
//  Copyright © 2020 张建东. All rights reserved.
//

#import "GTLocation.h"
#import <CoreLocation/CoreLocation.h>

@interface GTLocation()<CLLocationManagerDelegate>
@property(nonatomic,strong,readwrite)CLLocationManager * manager;

@end

@implementation GTLocation
+(GTLocation *)locationManager
{
    static GTLocation *location;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        location = [[GTLocation alloc] init];
    });
    return location;
}
-(instancetype)init{
    self = [super init];
    if (self) {
        _manager = [[CLLocationManager alloc] init];
        self.manager.delegate = self;
    }
    return  self;
}

-(void)checkLocationAuthorization
{
    //判断权限是否开启
    if ([CLLocationManager locationServicesEnabled]) {
        //引导开启
    }
    
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusNotDetermined) {
        [self.manager requestWhenInUseAuthorization];
    }
}

/**
 delegate回调
 */
- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status
{
    if (status == kCLAuthorizationStatusAuthorizedWhenInUse) {
        [self.manager stopUpdatingLocation];
    } else if(status == kCLAuthorizationStatusDenied){
        
    }
}

- (void)locationManager:(CLLocationManager *)manager
didUpdateToLocation:(CLLocation *)newLocation
       fromLocation:(CLLocation *)oldLocation{
    
}
@end
