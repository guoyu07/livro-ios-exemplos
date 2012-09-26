#import <UIKit/UIKit.h>

@interface HWViewController : UIViewController
- (IBAction)hideView:(id)sender;
- (IBAction)showView:(id)sender;
@property (retain, nonatomic) IBOutlet UIView *workingView;

@end
