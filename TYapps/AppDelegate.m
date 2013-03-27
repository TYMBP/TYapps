#import "AppDelegate.h"
#import "MViewControllerA.h"
#import "MViewControllerB.h"

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    _window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    //[_window makeKeyAndVisible];
    
    UIViewController* viewCtlA = [[MViewControllerA alloc] init];
    UIViewController* viewCtlB = [[MViewControllerB alloc] init];
    
    [_window addSubview:viewCtlA.view];
    [_window addSubview:viewCtlB.view];
    
    [_window bringSubviewToFront:viewCtlA.view];

    [_window makeKeyAndVisible];
    
    return YES;
    
}

- (void)dealloc
{
    
    [_window release];
    [super dealloc];
}

@end
