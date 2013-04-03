#import "MViewControllerB.h"

@implementation MViewControllerB

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  UINavigationBar *naviBarTop = [[UINavigationBar alloc] initWithFrame:CGRectMake(0, 0, 320, 40)];
  naviBarTop.alpha = 0.7f;
  UINavigationItem *title = [[UINavigationItem alloc] initWithTitle:@"TOP"];
  UIBarButtonItem *btnItemBack = [[UIBarButtonItem alloc] initWithTitle:@"Back" style:UIBarButtonItemStyleBordered target:self action:@selector(clickBack)];
  title.rightBarButtonItem = btnItemBack;
  [naviBarTop pushNavigationItem:title animated:YES];
  [self.view addSubview:naviBarTop];

  self.view.backgroundColor = [UIColor whiteColor];
    
  UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button setTitle:@"click" forState:UIControlStateNormal];
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
//  [self.view.window sendSubviewToBack:self.view];
  id dialog = [[[ModalDialog alloc] init] autorelease];
  [self presentModalViewController:dialog animated:YES];
}
@end

@implementation ModalDialog 

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  
  UILabel *label = [[[UILabel alloc] initWithFrame:self.view.bounds] autorelease];
  label.backgroundColor = [UIColor blackColor];
  label.textColor = [UIColor whiteColor];
  label.textAlignment = NSTextAlignmentCenter;
  label.text = @"モーダルテスト";
  [self.view addSubview:label];
  
  UIButton *goodbyeButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [goodbyeButton setTitle:@"GoodBye" forState:UIControlStateNormal];
  [goodbyeButton sizeToFit];
  CGPoint newPoint = self.view.center;
  newPoint.y += 80;
  goodbyeButton.center = newPoint;
  [goodbyeButton addTarget:self action:@selector(goodbyeDidPush) forControlEvents:UIControlEventTouchUpInside];
  [self.view addSubview:goodbyeButton];


}

- (void)goodbyeDidPush
{
  [self dismissModalViewControllerAnimated:YES];
}

@end