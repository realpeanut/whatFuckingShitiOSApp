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

- (void)encodeWithCoder:(NSCoder *)coder
{
    [coder encodeObject:self.titile forKey:@"title"];
    [coder encodeObject:self.source forKey:@"source"];
    [coder encodeObject:self.comment forKey:@"comment"];
    [coder encodeObject:self.date forKey:@"date"];
    //注意事项
    [coder encodeDouble:self.detail forKey:@"id"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        self.titile  = [coder decodeObjectForKey:@"titile"];
        self.source  = [coder decodeObjectForKey:@"source"];
        self.comment = [coder decodeObjectForKey:@"comment"];
        self.date    = [coder decodeObjectForKey:@"date"];
        self.detail  = [coder decodeDoubleForKey:@"id"];
    }
    return self;
}

+ (BOOL) supportsSecureCoding
{
    return YES;
}

-(void)configWithDictionary:(NSDictionary *)dictionary
{
    self.titile  = [dictionary objectForKey:@"course_name"];
    self.source  = [dictionary objectForKey:@"org_name"];
    self.comment = [dictionary objectForKey:@"org_name"];
    self.date    = [dictionary objectForKey:@"created_at"];
    self.detail  = [[dictionary objectForKey:@"id"] intValue];
}
@end
