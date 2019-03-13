//
//  User.m
//  UnitTestDemoTests
//
//  Created by meitianhui2 on 2018/1/5.
//  Copyright © 2018年 Rason. All rights reserved.
//

#import "User.h"

@implementation User

- (BOOL)isChinese:(NSString *)string
{
    for(int i=0; i< [string length];i++){
        int a = [string characterAtIndex:i];
        if( a > 0x4e00 && a < 0x9fff)
        {
            return YES;
        }
    }
    return NO;
}


@end
