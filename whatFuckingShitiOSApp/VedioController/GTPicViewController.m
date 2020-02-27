//
//  GTPicViewController.m
//  whatFuckingShitiOSApp
//
//  Created by 张建东 on 2020/2/9.
//  Copyright © 2020 张建东. All rights reserved.
//

#import "GTPicViewController.h"
#import "GTVedioCoverViewCollecion.h"

@interface GTPicViewController ()<UICollectionViewDelegate, UICollectionViewDataSource>

@end

@implementation GTPicViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        self.tabBarItem.title = @"发现";
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor whiteColor];
    UICollectionViewFlowLayout *uiCollectionViewFlowLayout = [[UICollectionViewFlowLayout alloc] init];
    uiCollectionViewFlowLayout.minimumLineSpacing = 10;
    uiCollectionViewFlowLayout.minimumInteritemSpacing = 10;
    uiCollectionViewFlowLayout.itemSize = CGSizeMake(self.view.bounds.size.width, self.view.bounds.size.width * 9 / 16);
    UICollectionView *uiCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:uiCollectionViewFlowLayout];

    uiCollectionView.delegate = self;
    uiCollectionView.dataSource = self;
    [uiCollectionView registerClass:[GTVedioCoverViewCollecion class] forCellWithReuseIdentifier:@"GTVedioCoverViewCollecion"];
    [self.view addSubview:uiCollectionView];
}

#pragma mark - Navigation

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"GTVedioCoverViewCollecion" forIndexPath:indexPath];
    if ([cell isKindOfClass:[GTVedioCoverViewCollecion class]]) {
        [((GTVedioCoverViewCollecion *)cell) layoutWithVideoCoverUrl:@"90" vedioUrl:@"http://learn.laravel.com/1.mp4"];
    }
    return cell;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    if (indexPath.item%3 == 0) {
//        return CGSizeMake(self.view.frame.size.width, 100);
//    } else {
//        return CGSizeMake((self.view.frame.size.width - 10)/2, 100);
//    }
//}

@end
