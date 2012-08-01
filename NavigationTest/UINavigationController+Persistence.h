//
//  UINavigationController+Persistence.h
//  NavigationTest
//
//  Created by Sam Green on 8/1/12.
//  Copyright (c) 2012 Sam Green. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UINavigationController (Persistence)

- (void)saveNavigationStack;
- (void)saveNavigationStack:(NSString *)path;

- (void)loadNavigationStack;
- (void)loadNavigationStack:(NSString *)path;

+ (BOOL)hasSavedStack;

@end
