//
//  GTNormalTableViewCell.h
//  whatFuckingShitiOSApp
//
//  Created by 张建东 on 2020/2/10.
//  Copyright © 2020 张建东. All rights reserved.
//

#import <UIKit/UIKit.h>

@class GTListItem;
NS_ASSUME_NONNULL_BEGIN

@protocol GTNormalTableViewCellDelegate <NSObject>//定义协议

-(void)tableViewCell:(UITableViewCell *)tableViewCell clickDeleteButton:(UIButton *)deleteButton;

@end



//新闻列表
@interface GTNormalTableViewCell : UITableViewCell

@property(nonatomic,weak,readwrite) id<GTNormalTableViewCellDelegate> delegate;
-(void)layoutTableViewCellWithItem:(GTListItem *)item;

@end

NS_ASSUME_NONNULL_END
