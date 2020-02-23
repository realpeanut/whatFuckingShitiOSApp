//
//  GTListItem.m
//  whatFuckingShitiOSApp
//
//  Created by 张建东 on 2020/2/23.
//  Copyright © 2020 张建东. All rights reserved.
//

#import "GTListItem.h"

@implementation GTListItem


//YYModel  MJExtension   NSData - > json -> model

-(void)configWithDictionary:(NSDictionary *)dictionary
{
    self.titile  = [dictionary objectForKey:@"course_name"];
    NSLog(@"%@", self.titile);
    self.source  = [dictionary objectForKey:@"org_name"];
    NSLog(@"%@", self.source);
    self.comment = [dictionary objectForKey:@"course_teacher"];
    NSLog(@"%@", self.comment);
    self.date    = [dictionary objectForKey:@"created_at"];
    NSLog(@"%@", self.date);
}
@end
