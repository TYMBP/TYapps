#import "MViewControllerA.h"

@implementation MViewControllerA

- (UITextField*)makeTextField:(CGRect)rect text:(NSString*)text {
    UITextField* textField = [[[UITextField alloc] init] autorelease];
    [textField setText:text];
    [textField setFrame:rect];
    [textField setReturnKeyType:UIReturnKeyDone];
    [textField setBackgroundColor:[UIColor whiteColor]];
    [textField setBorderStyle:UITextBorderStyleRoundedRect];
    [_textField01 setDelegate:self];;
    return textField;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIImage *bgImage = [UIImage imageNamed:@"background.png"];
    UIImage *logoImage = [UIImage imageNamed:@"logoImage.png"];
    UIImageView *logo = [[UIImageView alloc] initWithImage:logoImage];
    CGPoint newPointL = self.view.center;
    newPointL.y -= 200;
    logo.center = newPointL;
    
    //NSLog(@"ViewDidLoad:width:%f",self.view.frame.size.width);
    //NSLog(@"ViewDidLoad:heght:%f",self.view.frame.size.height);
    //a = self.view.frame.size.width/2;
    //NSLog(@"%@",hogesize);
    //CGPoint newPointT = self.view.center;
    //newPointT.y -=100;
    //_textField01.center = newPointT;
    //_textField01 =
    _textField01 = [self makeTextField:CGRectMake(10, 200, 300, 32) text:@""];
    
    self.view.backgroundColor=[UIColor colorWithPatternImage: bgImage];
    [self.view addSubview:logo];
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
    [self.view addSubview:_textField01];
}

- (void)buttonDidPush {
    NSLog(@"push buttonA");
    [self.view.window sendSubviewToBack:self.view];
}


@end
