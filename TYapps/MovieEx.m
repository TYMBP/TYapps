#import "MovieEx.h"

@implementation MovieEx

- (MPMoviePlayerController *)makeMoviePlayer:(NSString *)res {
  NSString *path = [[NSBundle mainBundle] pathForResource:res ofType:@""];
  NSURL *url = [NSURL fileURLWithPath:path];
  
  MPMoviePlayerController *player = [[[MPMoviePlayerController alloc] initWithContentURL:url] autorelease];
  player.scalingMode = MPMovieScalingModeAspectFit;
  player.controlStyle = MPMovieControlStyleEmbedded;
  return player;
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  [self.view setBackgroundColor:[UIColor blackColor]];
  
  _player = [[self makeMoviePlayer:@"sample.mp4"] retain];
  [_player.view setFrame:CGRectMake(0, 0, 320, 320)];
  [self.view addSubview:_player.view];
  
  [[NSNotificationCenter defaultCenter] addObserver:self
                                           selector:@selector(moviePlayBackDidFinish:)
                                               name:MPMoviePlayerPlaybackDidFinishNotification object:_player];
  [_player play];
  
  MPVolumeView * volumeView = [[[MPVolumeView alloc] init] autorelease];
  [volumeView setFrame:CGRectMake(0, 420, 320, 40)];
  [self.view addSubview:volumeView];
  
}

- (void)dealloc {
  [_player release];
  [super dealloc];

}

- (void)moviePlayBackDidFinish:(NSNotification *)notification {
  NSDictionary * userInfo = [notification userInfo];
  int reason = [[userInfo objectForKey:
                 @"MPMoviePlaybackDidFinishReasonUserInfoKey"] intValue];
  if (reason == MPMovieControlStyleEmbedded) {
    NSLog(@"再生終了");
  }else if (reason == MPMovieFinishReasonPlaybackError) {
    NSLog(@"エラー");
  }else if (reason == MPMovieFinishReasonUserExited) {
    NSLog(@"フルスクリーン用UIのdoneボタンで終了");
  }
}


@end
