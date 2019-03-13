//
//  TabBarVC.m
//  XSchoolParents
//
//  Created by 李秋 on 2017/10/12.
//  Copyright © 2017年 李秋. All rights reserved.
//

#import "TabBarVC.h"
#import "LQMessageVC.h"
#import "LQContactVC.h"
#import "LQMoreVC.h"
@interface TabBarVC ()
@property (nonatomic,assign) NSInteger index;
@end

@implementation TabBarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createTabBar];
}

- (void)createTabBar{
     [self createControllerWithTitle:@"消息" image:@"menu-message-normal"selectedimage:@"menu-message-down" className:[LQMessageVC class]];
     [self createControllerWithTitle:@"联系人" image:@"menu-contact-normal"selectedimage:@"menu-contact-down" className:[LQContactVC class]];
     [self createControllerWithTitle:@"更多" image:@"menu-more-normal"selectedimage:@"menu-more-down" className:[LQMoreVC class]];
    
}

//提取公共方法
- (void)createControllerWithTitle:(NSString *)title image:(NSString *)image selectedimage:(NSString *)selectedimage  className:(Class)class{
    
    UIViewController *vc = [[class alloc]init];
    UINavigationController *nav = [[UINavigationController alloc]initWithRootViewController:vc];
    nav.tabBarItem.title = title;
    nav.tabBarItem.image = [[UIImage imageNamed:image] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    nav.tabBarItem.selectedImage = [[UIImage imageNamed:selectedimage] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    [self addChildViewController:nav];
    nav.tabBarController.tabBar.backgroundColor = [UIColor whiteColor];
    
    [[UITabBarItem appearance] setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor colorWithRed:18.0/255 green:183.0/255 blue:245.0/255 alpha:1.0], NSForegroundColorAttributeName,
                                                       nil,nil] forState:UIControlStateSelected];
}

// 点击tabbarItem自动调用
-(void)tabBar:(UITabBar *)tabBar didSelectItem:(UITabBarItem *)item
{
    NSInteger index = [self.tabBar.items indexOfObject:item];
#pragma mark 放大缩小
//    if (index != _index) {
//
//    }
#pragma mark Y轴方向运动....
    if([item.title isEqualToString:@"联系人"])
    {
        // 也可以判断标题,然后做自己想做的事
        [self animationWithY:index];
        _index = index;
    }else if ([item.title isEqualToString:@"消息"]){
        [self animationWithIndex:index];
        _index = index;
    }else if ([item.title isEqualToString:@"更多"]) {
        [self animationWithZ:index];
        _index = index;
    }
}
// 以动画的方式布局所有button
- (void)animationWithIndex:(NSInteger) index {
    NSMutableArray * tabbarbuttonArray = [NSMutableArray array];
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabbarbuttonArray addObject:tabBarButton];
        }
    }
    /**
     CABasicAnimation类的使用方式就是基本的关键帧动画。
     所谓关键帧动画，就是将Layer的属性作为KeyPath来注册，指定动画的起始帧和结束帧，然后自动计算和实现中间的过渡动画的一种动画方式。
     */
    CABasicAnimation*pulse = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    
    pulse.timingFunction= [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pulse.duration = 0.2;
    pulse.repeatCount= 1;
    pulse.autoreverses= YES;
    pulse.fromValue= [NSNumber numberWithFloat:0.7];
    pulse.toValue= [NSNumber numberWithFloat:1.3];
    [[tabbarbuttonArray[index] layer]
     addAnimation:pulse forKey:nil];
    
}
//2.Y轴位移
-(void)animationWithY:(NSInteger)index {
    NSMutableArray * tabbarbuttonArray = [NSMutableArray array];
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabbarbuttonArray addObject:tabBarButton];
        }
    }
   //向上移动
    CABasicAnimation *animation =[CABasicAnimation animationWithKeyPath:@"transform.translation.y"];
   //速度控制函数，控制动画运行的节奏
    animation.timingFunction =[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.duration = 0.2;
    animation.repeatCount = 1;
    animation.removedOnCompletion =YES;
    animation.fromValue =[NSNumber numberWithFloat:0];
    animation.toValue =[NSNumber numberWithFloat:-10];
    
    [[tabbarbuttonArray[index] layer]
     addAnimation:animation forKey:nil];
}

//3.Z轴旋转
-(void)animationWithZ:(NSInteger)index {
    
    NSMutableArray * tabbarbuttonArray = [NSMutableArray array];
    for (UIView *tabBarButton in self.tabBar.subviews) {
        if ([tabBarButton isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
            [tabbarbuttonArray addObject:tabBarButton];
        }
    }
    //向上移动
    CABasicAnimation *animation =[CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    //速度控制函数，控制动画运行的节奏
    animation.timingFunction =[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    animation.duration = 0.2;
    animation.repeatCount = 1;
    animation.removedOnCompletion =YES;
    animation.fromValue =[NSNumber numberWithFloat:0];
    animation.toValue =[NSNumber numberWithFloat:M_PI];
    [[tabbarbuttonArray[index] layer]
     addAnimation:animation forKey:nil];
    
}
@end
