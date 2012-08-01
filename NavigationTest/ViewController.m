//
//  ViewController.m
//  NavigationTest
//
//  Created by Sam Green on 8/1/12.
//  Copyright (c) 2012 Sam Green. All rights reserved.
//

#import "ViewController.h"

#import "UINavigationController+Persistence.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.title = @"Some VC";
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
        return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
    } else {
        return YES;
    }
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    ViewController *newVC = [[ViewController alloc] init];
    [self.navigationController pushViewController:newVC animated:YES];
    [newVC release];
    
    [self.navigationController saveNavigationStack];
}

@end
