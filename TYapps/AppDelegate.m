#import "AppDelegate.h"

@implementation AppDelegate

@synthesize window;

- (void)applicationDidFinishLaunching:(UIApplication *)application
{
    CGRect bounds = [[UIScreen mainScreen] bounds];
    window = [[UIWindow alloc] initWithFrame:bounds];
    
    UILabel* label = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)]autorelease];
    UILabel* label2 = [[[UILabel alloc] initWithFrame:CGRectZero]autorelease];
    
    label.text = @"Test Test";
    label2.frame = CGRectMake(0, 0, 100, 100);
    label2.center = CGPointMake(100, 100);
    label2.backgroundColor = [UIColor redColor];
    
    NSLog(@"x=%f",label2.frame.origin.x);
    NSLog(@"y=%f",label2.frame.origin.y);
    NSLog(@"width=%f",label2.frame.size.width);
    NSLog(@"height=%f",label2.frame.size.height);
    NSLog(@"x=%f",label2.center.x);
    NSLog(@"x=%f",label2.center.x);
    
    [window addSubview:label];
    [window addSubview:label2];
    [label release];
    [label2 release];
    [window makeKeyAndVisible];
}

- (void)dealloc
{
    [window release];
    [super dealloc];
}

@end
