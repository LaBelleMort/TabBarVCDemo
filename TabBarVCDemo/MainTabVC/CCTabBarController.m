//
//  CCTabBarController.m
//  TabBarVCDemo
//
//  Created by 满脸胡茬的怪蜀黍 on 2017/7/26.
//  Copyright © 2017年 PuChin·chen. All rights reserved.
//

#import "CCTabBarController.h"
#import "CCNavigationController.h"
#import "CCMineController.h"
#import "CCFriendController.h"
#import "CCShareController.h"
#import "CCWriteController.h"
#import "CCTabBar.h"

@interface CCTabBarController ()

@property(nonatomic, strong) CCMineController   *mineVC;
@property(nonatomic, strong) CCShareController  *shareVC;
@property(nonatomic, strong) CCWriteController  *writeVC;
@property(nonatomic, strong) CCFriendController *friendVC;
@end

@implementation CCTabBarController

- (void)viewDidLoad {
    self.view.backgroundColor = [UIColor whiteColor];
    _writeVC = [[CCWriteController alloc] init];
    [self addChildViewController:_writeVC
                     normalImage:[UIImage imageNamed:@"write"]
                     selectImage:[UIImage imageNamed:@"write"]
                           title:@"记录"];
    
    _friendVC = [[CCFriendController alloc] init];
    [self addChildViewController:_friendVC
                     normalImage:[UIImage imageNamed:@"friend"]
                     selectImage:[UIImage imageNamed:@"friend"]
                           title:@"好友"];
    
    _shareVC = [[CCShareController alloc] init];
    [self addChildViewController:_shareVC
                     normalImage:[UIImage imageNamed:@"main"]
                     selectImage:[UIImage imageNamed:@"main"]
                           title:@"朋友圈"];
    
    _mineVC = [[CCMineController alloc] init];
    [self addChildViewController:_mineVC
                     normalImage:[UIImage imageNamed:@"me"]
                     selectImage:[UIImage imageNamed:@"me"]
                           title:@"我"];
    
    [UINavigationBar appearance].translucent = NO;
    
    
    
    //去除导航栏上返回按钮的文字
    [[UIBarButtonItem appearance] setBackButtonTitlePositionAdjustment:UIOffsetMake(0, -60) forBarMetrics:UIBarMetricsDefault];
    [[UINavigationBar appearance] setTintColor:[UIColor lightGrayColor]];
    
    NSDictionary *dic = @{NSForegroundColorAttributeName : [UIColor grayColor],
                          NSFontAttributeName : [UIFont fontWithName:@"PingFang SC" size:17.f]};
    [[UINavigationBar appearance] setTitleTextAttributes:dic];
    //使用 KVC 替换原来的tabBar
    [self setValue:[[CCTabBar alloc] init] forKey:@"tabBar"];
}

- (void)addChildViewController:(UIViewController *)childController
                   normalImage:(UIImage*) image
                   selectImage:(UIImage*) seleceImage
                         title:(NSString *) title{
    CCNavigationController * nav = [[CCNavigationController alloc]
                                    initWithRootViewController:childController];
    nav.tabBarItem.image = image;
    nav.tabBarItem.selectedImage = seleceImage;
    nav.tabBarItem.title = title;
    childController.title =title;
    
    self.tabBar.tintColor = [UIColor colorWithRed:202/255.0
                                            green:193/255.0
                                             blue:104/255.0 alpha:1];
    
    
    [nav.tabBarItem setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor colorWithRed:202/255.0
                                                                                            green:193/255.0
                                                                                             blue:104/255.0
                                                                                            alpha:1],
                                             NSFontAttributeName:[UIFont fontWithName:@"Helvetica" size:1.0]} forState:UIControlStateSelected];
    
    
    [self addChildViewController: nav];
}




@end
