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

- (void)buttonDidPush
{
  NSString *jsonRequest = @"{\"username\":\"user\",\"password\":\"1234\"}";
  NSLog(@"Request: %@",jsonRequest);
  
  NSURL *url = [NSURL URLWithString:@"http://yamada.dev/api/api.php"];
  
  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
  NSData *requestData= [NSData dataWithBytes:[jsonRequest UTF8String] length:[jsonRequest length]];
  [request setHTTPMethod:@"POST"];
  [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
  [request setValue:@"application/x-www-form-urlencoded" forHTTPHeaderField:@"Content-Type"];
  [request setValue:[NSString stringWithFormat:@"%d",[requestData length]] forHTTPHeaderField:@"Content-Length"];
  [request setHTTPBody:requestData];
  
  [NSURLConnection connectionWithRequest:request delegate:self];
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
//  NSLog(@"button push");
  NSMutableData *d = [NSMutableData data];
  [d appendData:data];
  NSString *a = [[NSString alloc] initWithData:d encoding:NSASCIIStringEncoding];
  
  NSLog(@"Data: %@",a);
}

@end
