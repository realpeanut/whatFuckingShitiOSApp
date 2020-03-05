//
//  GTLocation.h
//  whatFuckingShitiOSApp
//
//  Created by 张建东 on 2020/3/4.
//  Copyright © 2020 张建东. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GTLocation : NSObject
-(void)checkLocationAuthorization;
+(GTLocation *)locationManager;
@end

NS_ASSUME_NONNULL_END
