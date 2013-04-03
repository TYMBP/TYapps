#import <UIKit/UIKit.h>

@interface MViewControllerB : UIViewController

@end

@interface ModalDialog : UIViewController {
  id delegate;
}
@property(nonatomic,retain)id delegate;

@end