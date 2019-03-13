//
//  User.h
//  UnitTestDemoTests
//
//  Created by meitianhui2 on 2018/1/5.
//  Copyright © 2018年 Rason. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface User : NSObject

@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *passWord;

/**
 *  判断字符串中是否有中文
 */
- (BOOL)isChinese:(NSString *)string;


@end
