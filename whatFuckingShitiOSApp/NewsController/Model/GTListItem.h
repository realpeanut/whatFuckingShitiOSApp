//
//  GTListItem.h
//  whatFuckingShitiOSApp
//
//  Created by 张建东 on 2020/2/23.
//  Copyright © 2020 张建东. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN



///列表机构化数数据
@interface GTListItem : NSObject <NSSecureCoding>

@property(nonatomic,copy,readwrite) NSString *titile;
@property(nonatomic, assign)long views;
@property(nonatomic,copy,readwrite) NSString *date;
@property(nonatomic, assign)long articleId;

-(void)configWithDictionary:(NSDictionary *)dictionary;

@end

NS_ASSUME_NONNULL_END
