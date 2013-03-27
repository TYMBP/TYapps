#import "MViewControllerB.h"

@implementation MViewControllerB

- (void)viewDidLoad
{
    [super viewDidLoad];

    //UIImage *bgImage = [UIImage imageNamed:@"background.png"];
    //UILabel* label = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)]autorelease];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [button setTitle:@"login" forState:UIControlStateNormal];
    [button sizeToFit];
    CGPoint newPoint = self.view.center;
    newPoint.y += 50;
    button.center = newPoint;
    button.autoresizingMask =
    UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
    [button addTarget:self
               action:@selector(buttonDidPush)
     forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    //label.text = @"ログイン";
    
    //self.view.backgroundColor=[UIColor colorWithPatternImage: bgImage];
    //[self.view addSubview:label];
    //[bgImage release];
    //[label release];

}

-(void)buttonDidPush {
    NSLog(@"button push");
    [self.view.window sendSubviewToBack:self.view];
}
@end
