#import "MViewControllerA.h"

@implementation MViewControllerA

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *bgImage = [UIImage imageNamed:@"background.png"];
    UIImage *logoImage = [UIImage imageNamed:@"logoImage.png"];
    UIImageView *logo = [[UIImageView alloc] initWithImage:logoImage];
    //UILabel* label = [[[UILabel alloc] initWithFrame:CGRectMake(0, 0, 200, 50)]autorelease];
    UILabel* label2 = [[[UILabel alloc] initWithFrame:CGRectZero]autorelease];
    
    //label.text = @"Test Test";
    label2.frame = CGRectMake(0, 0, 100, 100);
    label2.center = CGPointMake(100, 100);
    label2.backgroundColor = [UIColor redColor];
    
    NSLog(@"x=%f",label2.frame.origin.x);
    NSLog(@"y=%f",label2.frame.origin.y);
    NSLog(@"width=%f",label2.frame.size.width);
    NSLog(@"height=%f",label2.frame.size.height);
    NSLog(@"x=%f",label2.center.x);
    NSLog(@"x=%f",label2.center.x);
    
    self.view.backgroundColor=[UIColor colorWithPatternImage: bgImage];
    [self.view addSubview:logo];
    //[self.view addSubview:label];
    [self.view addSubview:label2];
    [bgImage release];
    [logo release];
    //[label release];
    [label2 release];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
