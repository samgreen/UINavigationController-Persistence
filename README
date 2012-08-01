#### UINavigationController Persistence ####

UINavigationController is one of the core building blocks on iOS. This category will allow you to save and load a UINavigationController's view controller stack. This will allow you to instantly return your users to their exact location in your app's view hierarchy.

### Usage ###

Copy UINavigationController+Persistence.m and the corresponding header in to your Xcode project. Then simply import the category in any class you would like to use it.

    #import "UINavigationController+Persistence.h"

Any time you would like to save the stack, call this method from any view controller in the stack:

    [self.navigationController saveNavigationStack];

When your application starts up, you can check if you have a saved state like so:

	// Class method
	UINavigationController *navigationController = nil;

	// Check for a saved state
    if ([UINavigationController hasSavedStack]) {
        
        // Load the saved state
        navigationController = [[UINavigationController alloc] init];
        [navigationController loadNavigationStack];
    } else {
        
        // Construct the starting state
        UIViewController *someViewController = [[UIViewController alloc] init];
        navigationController = [[UINavigationController alloc] initWithRootViewController:someViewController];
        [someViewController release];
    }

In case the default locations don't work for your application, or if you would like to persist multiple UINavigationController stacks, you may optionally pass an NSString as a path to serialize the data.

	// Save to a custom path
	[navigationController saveNavigationStack:@"/some/other/path/file.data"];
	// Load from a custom path
	[navigationController loadNavigationStack:@"/some/other/path/file.data"];