//
//  UnitTestDemoTestsUITests.m
//  UnitTestDemoTestsUITests
//
//  Created by meitianhui2 on 2018/1/5.
//  Copyright © 2018年 DeLongYang. All rights reserved.
//

#import <XCTest/XCTest.h>

@interface UnitTestDemoTestsUITests : XCTestCase

@end

@implementation UnitTestDemoTestsUITests

- (void)setUp {
    [super setUp];
    
    // Put setup code here. This method is called before the invocation of each test method in the class.
    
    // In UI tests it is usually best to stop immediately when a failure occurs.
    self.continueAfterFailure = NO;
    // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
    [[[XCUIApplication alloc] init] launch];
    
    // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
}

- (void)tearDown {
    // Put teardown code here. This method is called after the invocation of each test method in the class.
    [super tearDown];
}

- (void)testExample {
    // Use recording to get started writing UI tests.
    // Use XCTAssert and related functions to verify your tests produce the correct results.
}

- (void)testLogin
{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    XCUIElement *element = [[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"View"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element;
    XCUIElement *textField = [[element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:0];
    [textField tap];
    [textField typeText:@"123"];
    
    XCUIElement *textField2 = [[element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:1];
    [textField2 tap];
    [textField2 tap];
    [textField2 typeText:@"123"];
    [app.buttons[@"login"] tap];
    [app.navigationBars[@"loginSuccess"].buttons[@"Back"] tap];
    
}


/**
 使用系统的录制 中文 会报错
 出现 Incomplete universal character name  的错误 ！
 */
- (void)testLoginTwo
{
    
//    XCUIApplication *app = [[XCUIApplication alloc] init];
//    XCUIElement *element = [[[[app.otherElements containingType:XCUIElementTypeNavigationBar identifier:@"View"] childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element childrenMatchingType:XCUIElementTypeOther].element;
//    [[[element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:0] tap];
//    [app/*@START_MENU_TOKEN@*/.buttons[@"\U4f60"]/*[[".keyboards",".buttons[@\"\\U4f60, \\U4f60\\U4eec\\U7684\\U4f60\"]",".buttons[@\"\\U4f60\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/ tap];
//    [app/*@START_MENU_TOKEN@*/.buttons[@"\U597d"]/*[[".keyboards",".buttons[@\"\\U597d, \\U597d\\U53cb\\U7684\\U597d\"]",".buttons[@\"\\U597d\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/ tap];
//
//    XCUIElement *textField = [[element childrenMatchingType:XCUIElementTypeTextField] elementBoundByIndex:1];
//    [textField tap];
//
//    XCUIElement *moreKey = app/*@START_MENU_TOKEN@*/.keys[@"more"]/*[[".keyboards",".keys[@\"\\U6578\\U5b57\\U9375\\U76e4\"]",".keys[@\"more\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/;
//    [moreKey tap];
//    [moreKey tap];
//    [textField typeText:@"123"];
//    [element tap];
//    [app.buttons[@"login"] tap];
    
}


/**
 我们查看 APP 的目录结构 自己写这些测试语句
 不需要系统录制生成的 语句
 */
- (void)testLoginThree
{
    XCUIApplication *app = [[XCUIApplication alloc] init];
    
    // 下面这是一种通过 遍历 获取的形式
    for (NSInteger i = 0;i < app.textFields.count; i++) {
        if ([[app.textFields elementBoundByIndex:i] exists]) {//判断是否存在
            [[app.textFields elementBoundByIndex:i] tap];//输入框要获取焦点后才能给输入框自动赋值
            
            if (i == 0 ) {
                // 给 第一个userName 自动赋值 你好
                [[app.textFields elementBoundByIndex:i] typeText:@"你好"];
            }
            
            // 给 第二个userPass 自动赋值 德龙
            if (i == 1) {
                  [[app.textFields elementBoundByIndex:i] typeText:@"德龙"];
            }
           
        }
    }
    
}

- (void)testLoginFour
{
    XCUIApplication *app = [[XCUIApplication alloc] init];
//    //XCUIElement 这是 UI 元素的代理。元素都有类型和唯一标识。可以结合使用来找到元素在哪里，如当前界面上的一个输入框
    XCUIElementQuery *textFields = app.textFields;
//    XCUIElement *usernameTextField = [textFields objectForKeyedSubscript:@"username:"];
    XCUIElement *usernameTextField = textFields[@"username:"];

    [usernameTextField tap];
    [usernameTextField typeText:@"德龙"];

    XCUIElement *passwordTextField = app.textFields[@"password:"];
    [passwordTextField tap];
    [passwordTextField tap];
    [passwordTextField typeText:@"杨"];
   
    // 
    [app.buttons[@"login"] tap];
    
    //登录成功后的控制器的title为loginSuccess，只需判断控制器的title时候一样便可判断登录是否成功
    NSLog(@"title is %@",app.navigationBars.element.identifier);
   XCTAssertEqualObjects(app.navigationBars.element.identifier, @"loginSuccess");
    
    // 延时 3s 再消失
    XCUIElement *window = [app.windows elementBoundByIndex:0];
    [window pressForDuration:3];

}


/**
 这是cell 录制生成的
 */
- (void)testTableViewCell
{
    
    XCUIApplication *app = [[XCUIApplication alloc] init];
    // 点击整个 cell
    [[[[app.tabBars childrenMatchingType:XCUIElementTypeButton] matchingIdentifier:@"Item"] elementBoundByIndex:1] tap];
    
    // 点击cell中的 名称为 Name 的Lable
    XCUIElement *cell = [[app.tables childrenMatchingType:XCUIElementTypeCell] elementBoundByIndex:0];
    XCUIElement *nameStaticText = cell.staticTexts[@"Name"];
    [nameStaticText tap];
    
    // cell 中的名称为 Button 点击 
    [[cell childrenMatchingType:XCUIElementTypeTextField].element tap];
    [cell.buttons[@"Button"] tap];
    
}













@end
