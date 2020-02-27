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
    [coder encodeObject:self.titile forKey:@"name"];
    [coder encodeDouble:self.views forKey:@"views"];
    [coder encodeObject:self.date forKey:@"created_at"];
    //注意事项
    [coder encodeDouble:self.articleId forKey:@"id"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        self.titile = [coder decodeObjectForKey:@"name"];
        self.views = [coder decodeDoubleForKey:@"views"];
        self.date = [coder decodeObjectForKey:@"created_at"];
        self.articleId = [coder decodeDoubleForKey:@"id"];
    }
    return self;
}

+ (BOOL)supportsSecureCoding
{
    return YES;
}

- (void)configWithDictionary:(NSDictionary *)dictionary
{
    self.titile = [dictionary objectForKey:@"name"];
    self.views = [[dictionary objectForKey:@"views"] intValue];
    self.date = [dictionary objectForKey:@"created_at"];
    self.articleId = [[dictionary objectForKey:@"id"] intValue];
}

@end
