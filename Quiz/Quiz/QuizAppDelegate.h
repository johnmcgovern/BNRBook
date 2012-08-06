//
//  QuizAppDelegate.h
//  Quiz
//
//  Created by John McGovern on 7/28/12.
//  Copyright (c) 2012 John McGovern. All rights reserved.
//

#import <UIKit/UIKit.h>

@class QuizViewController;

@interface QuizAppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) QuizViewController *viewController;

@end
