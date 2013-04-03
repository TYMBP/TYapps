#import "MViewControllerA.h"

#define LOGIN_FLG  @"OK"
#define BTN_LOGIN  1


@implementation MViewControllerA

- (UITextField*)makeTextFieldA:(CGRect)rect text:(NSString*)text {
  UITextField* textField1 = [[[UITextField alloc] init] autorelease];
  [textField1 setText:text];
  [textField1 setFrame:rect];
  [textField1 setReturnKeyType:UIReturnKeyNext];
  [textField1 setBackgroundColor:[UIColor whiteColor]];
  [textField1 setBorderStyle:UITextBorderStyleRoundedRect];
  [_textField01 setDelegate:self];;
  return textField1;
}

- (UITextField*)makeTextFieldB:(CGRect)rect text:(NSString*)text {
  [_textField02 setDelegate:self];;
  UITextField* textField2 = [[[UITextField alloc] init] autorelease];
  [textField2 setText:text];
  [textField2 setFrame:rect];
  [textField2 setReturnKeyType:UIReturnKeyDone];
  [textField2 setBackgroundColor:[UIColor whiteColor]];
  [textField2 setBorderStyle:UITextBorderStyleRoundedRect];
  textField2.secureTextEntry = YES;
  [_textField02 setDelegate:self];
  return textField2;
}

//- (bool)textFieldShouldReturn:(UITextField *)textField {
//  [_textField02 resignFirstResponder];
//  return YES;
//}

- (UIButton *)makeButton:(CGRect)rect text:(NSString *)text tag:(int)tag {
  UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [button setFrame:rect];
  [button setTitle:text forState:UIControlStateNormal];
  [button setTag:tag];
  [button addTarget:self action:@selector(buttonDidPush) forControlEvents:UIControlEventTouchUpInside];
  return button;
}

- (void)viewDidLoad {
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
  _textField01 = [self makeTextFieldA:CGRectMake(10, 100, 300, 32) text:@"yamada"];
  _textField02 = [self makeTextFieldB:CGRectMake(10, 150, 300, 32) text:@"yamada10"];
  self.view.backgroundColor=[UIColor colorWithPatternImage: bgImage];
  [self.view addSubview:logo];
//  UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//  [button setTitle:@"login" forState:UIControlStateNormal];
//  [button sizeToFit];
//  CGPoint newPoint = self.view.center;
//  newPoint.y += 50;
//  button.center = newPoint;
//  button.autoresizingMask =
//  UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
//  [button addTarget:self
//             action:@selector(buttonDidPush)
//   forControlEvents:UIControlEventTouchUpInside];
  UIButton *btn = [self makeButton:CGRectMake(100, 200, 90, 40) text:@"login" tag:BTN_LOGIN];
  [self.view addSubview:btn];
  [self.view addSubview:_textField01];
  [self.view addSubview:_textField02];
}

- (void)buttonDidPush
{
  [_textField02 resignFirstResponder];
  NSMutableDictionary *mutableDic = [NSMutableDictionary dictionary];
  [mutableDic setValue:_textField01.text forKey:@"username"];
  [mutableDic setValue:_textField02.text forKey:@"passwd"];
  NSLog(@"t-yamada: %@", mutableDic);
  
  NSError *error = nil;
  NSData *json_Data = [NSJSONSerialization dataWithJSONObject:mutableDic options:kNilOptions error:&error];
  NSString *json_str = [[NSString alloc] initWithData:json_Data encoding:NSUTF8StringEncoding];
  
//  NSDictionary *json = [NSJSONSerialization JSONObjectWithData:[@"[1,2,3,[\"foo\",\"bar\"]]" dataUsingEncoding:NSUTF8StringEncoding]
//                                                       options:kNilOptions
//                                                         error:&error];
  NSLog(@"t-yamada %@ %@",json_str,error);
  
//  NSData *json = [NSJSONSerialization dataWithJSONObject:json
//                                                     options:kNilOptions
//                                                       error:&error];
//  NSLog(@"t-yamada %@ %@",[[NSString alloc] initWithData:jsonData encoding:NSUTF8StringEncoding],error);
  
//  NSString *jsonRequest = @"{\"username\":\"yamada\",\"password\":\"yamada10\"}";
//  NSLog(@"Request: %@",jsonRequest);
  
  NSURL *url = [NSURL URLWithString:@"http://yamada.dev/api/json/api.php"];
  
  NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
//  NSData *requestData= [NSData dataWithBytes:[jsonRequest UTF8String] length:[jsonRequest length]];
  NSData *requestData= [NSData dataWithBytes:[json_str UTF8String]  length:[json_str length]];
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
  //test = a;
  
  NSLog(@"Data: %@",a);
  
  if([a isEqualToString:@"OK"]){
    //NSLog(@"test OK");
    [self.view.window sendSubviewToBack:self.view];
  }
  
  
}

@end
