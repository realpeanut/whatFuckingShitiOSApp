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
    self.source  = [dictionary objectForKey:@"org_name"];
    self.comment = [dictionary objectForKey:@"org_name"];
    self.date    = [dictionary objectForKey:@"created_at"];
    self.url     = [dictionary objectForKey:@"id"];
}
@end
