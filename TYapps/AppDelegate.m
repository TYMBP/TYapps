#import "AppDelegate.h"
#import "MViewControllerA.h"
#import "MViewControllerB.h"

@implementation AppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
    CGRect bounds = [[UIScreen mainScreen] bounds];
    window = [[UIWindow alloc] initWithFrame:bounds];
    
    viewController1_ = [[MViewControllerA alloc] init];
    viewController2_ = [[MViewControllerB alloc] init];
    [window addSubview:viewController1_.view];
    [window addSubview:viewController2_.view];
   
    [window bringSubviewToFront:viewController1_.view];
    [window makeKeyAndVisible];
    
}

- (void)dealloc
{
    [viewController1_ release];
    [viewController2_ release];
    [window release];
    [super dealloc];
}

@end

