#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
	IBOutlet UITextField *downloadField;
	IBOutlet UIProgressView *progressBar;
	IBOutlet UIActivityIndicatorView *loadingIndicator;
}

-(IBAction)startDownload:(id)sender;

@end
