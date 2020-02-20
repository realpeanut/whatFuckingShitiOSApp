//
//  GTNormalTableViewCell.m
//  whatFuckingShitiOSApp
//
//  Created by 张建东 on 2020/2/10.
//  Copyright © 2020 张建东. All rights reserved.
//

#import "GTNormalTableViewCell.h"

@interface GTNormalTableViewCell()

@property(nonatomic,strong,readwrite) UILabel *titleLabel;
@property(nonatomic,strong,readwrite) UILabel *sourceLabel;
@property(nonatomic,strong,readwrite) UILabel *commentLabel;
@property(nonatomic,strong,readwrite) UILabel *timeLabel;
@property(nonatomic,strong,readwrite) UIImageView *rightImageView;
@property(nonatomic,strong,readwrite) UIButton *uiButton;

@end

@implementation GTNormalTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(nullable NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self) {
        
        [self.contentView addSubview:({
            self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 50, 300, 20)];
            self.titleLabel.backgroundColor = [UIColor whiteColor];
            self.titleLabel.font = [UIFont systemFontOfSize:16];
            self.titleLabel.textColor = [UIColor blackColor];
            self.titleLabel;
        })];
        
        [self.contentView addSubview:({
            self.sourceLabel = [[UILabel alloc] initWithFrame:CGRectMake(20, 80, 20, 30)];
            self.sourceLabel.backgroundColor = [UIColor whiteColor];
            self.sourceLabel.font = [UIFont systemFontOfSize:12];
            self.sourceLabel.textColor = [UIColor blackColor];
            self.sourceLabel;
        })];
        
        [self.contentView addSubview:({
            self.commentLabel = [[UILabel alloc] initWithFrame:CGRectMake(100, 80, 50, 20)];
            self.commentLabel.backgroundColor = [UIColor whiteColor];
            self.commentLabel.font = [UIFont systemFontOfSize:12];
            self.commentLabel.textColor = [UIColor blackColor];
            self.commentLabel;
        })];
        
        [self.contentView addSubview:({
            self.timeLabel = [[UILabel alloc] initWithFrame:CGRectMake(150, 80, 50, 20)];
            self.timeLabel.backgroundColor = [UIColor whiteColor];
            self.timeLabel.font = [UIFont systemFontOfSize:12];
            self.timeLabel.textColor = [UIColor blackColor];
            self.timeLabel;
        })];
        
        //图片
        [self.contentView addSubview:({
            self.rightImageView = [[UIImageView alloc] initWithFrame:CGRectMake(300, 15, 70, 70)];
            self.rightImageView.backgroundColor = [UIColor redColor];
            self.rightImageView.contentMode = UIViewContentModeScaleAspectFit;
            self.rightImageView;
        })];
        //按钮视图
        [self.contentView addSubview:({
            self.uiButton = [[UIButton alloc] initWithFrame:CGRectMake(260, 80, 30, 20)];
            self.uiButton.backgroundColor = [UIColor blueColor];
            [self.uiButton setTitle:@"X" forState:UIControlStateNormal];//通常状态
            [self.uiButton setTitle:@"V" forState:UIControlStateHighlighted];//点击状态
            [self.uiButton addTarget:self action:@selector(deleteButtonfunc) forControlEvents:UIControlEventTouchUpInside];//绑定点击事件
            self.uiButton;
        })];
        
        //   ---------手势 相关操作
        
    }
    return self;
}

-(void)deleteButtonfunc
{
    
}

-(void)layoutTableViewCell
{
    self.titleLabel.text = @"标题";
    
    self.sourceLabel.text = @"来源";
    [self.sourceLabel sizeToFit];
    
    self.commentLabel.text = @"评论";
    [self.commentLabel sizeToFit];
    self.commentLabel.frame = CGRectMake(self.sourceLabel.frame.origin.x + self.sourceLabel.frame.size.width + 15, self.commentLabel.frame.origin.y, self.commentLabel.frame.size.width, self.commentLabel.frame.size.height);
    
    self.timeLabel.text = @"2020-02-10";
    [self.timeLabel sizeToFit];
    
    self.timeLabel.frame = CGRectMake(self.commentLabel.frame.origin.x + self.commentLabel.frame.size.width + 15, self.commentLabel.frame.origin.y, self.timeLabel.frame.size.width, self.timeLabel.frame.size.height);
    //self.rightImageView.image = [UIImage imageNamed:@""];
}

-(void)deleteButtonClick
{
    if (self.delegate && [self.delegate  respondsToSelector:@selector(tableViewCell:clickDeleteButton:)]) {
        [self.delegate tableViewCell:self clickDeleteButton:self.uiButton];
    }
}

@end


