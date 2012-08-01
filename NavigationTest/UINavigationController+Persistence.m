//
//  UINavigationController+Persistence.m
//  NavigationTest
//
//  Created by Sam Green on 8/1/12.
//  Copyright (c) 2012 Sam Green. All rights reserved.
//

#import "UINavigationController+Persistence.h"

static NSString *const kNavigationFile = @"NavigationStack.data";

@implementation UINavigationController (Persistence)

#pragma mark - Save
- (void)saveNavigationStack {
    [self saveNavigationStack:[UINavigationController pathToData]];
}

- (void)saveNavigationStack:(NSString *)path {
    NSMutableArray *viewControllerNames = [NSMutableArray array];
    
    for (UIViewController *viewController in self.viewControllers) {
        
        NSString *className = NSStringFromClass([viewController class]);
        [viewControllerNames addObject:className];
    }
    
    [viewControllerNames writeToFile:path atomically:YES];
}

#pragma mark - Load
- (void)loadNavigationStack {
    [self loadNavigationStack:[UINavigationController pathToData]];
}

- (void)loadNavigationStack:(NSString *)path {
    NSArray *viewControllerNames = [NSArray arrayWithContentsOfFile:path];
    
    for (NSString *viewControllerClass in viewControllerNames) {
        
        UIViewController *viewController = [[NSClassFromString(viewControllerClass) alloc] init];
        [self pushViewController:viewController animated:NO];
    }
}

#pragma mark - Util
+ (BOOL)hasSavedStack {
    return [[NSFileManager defaultManager] isReadableFileAtPath:[UINavigationController pathToData]];
}

+ (NSString *)pathToData {
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    return [documentsDirectory stringByAppendingPathComponent:kNavigationFile];
}

@end
