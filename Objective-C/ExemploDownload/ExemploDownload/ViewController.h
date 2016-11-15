#import <UIKit/UIKit.h>

@interface ViewController : UIViewController
@property (nonatomic, weak) IBOutlet UITextField *downloadField;
@property (nonatomic, weak) IBOutlet UIProgressView *progressBar;
@property (nonatomic, weak) IBOutlet UIActivityIndicatorView *loading;
-(IBAction)startDownload:(id)sender;
@end
