//
//  GTPicViewController.m
//  whatFuckingShitiOSApp
//
//  Created by 张建东 on 2020/2/9.
//  Copyright © 2020 张建东. All rights reserved.
//

#import "GTPicViewController.h"

@interface GTPicViewController ()<UICollectionViewDelegate,UICollectionViewDataSource>

@end

@implementation GTPicViewController

-(instancetype)init
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
    uiCollectionViewFlowLayout.itemSize = CGSizeMake((self.view.frame.size.width - 10)/2, 300);
    UICollectionView *uiCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:uiCollectionViewFlowLayout];
    
    uiCollectionView.delegate = self;
    uiCollectionView.dataSource = self;
    [uiCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
    [self.view addSubview:uiCollectionView];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 20;
}

// The cell that is returned must be retrieved from a call to -dequeueReusableCellWithReuseIdentifier:forIndexPath:
- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = [UIColor whiteColor];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.item%3 == 0) {
        return CGSizeMake(self.view.frame.size.width, 100);
    } else {
        return CGSizeMake((self.view.frame.size.width - 10)/2, 100);
    }
}

@end
