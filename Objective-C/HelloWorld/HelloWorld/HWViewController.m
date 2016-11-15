#import "HWViewController.h"

@interface HWViewController ()

@end

@implementation HWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)hideView:(id)sender {
	[UIView beginAnimations:nil context:nil];
	self.workingView.alpha = 0;
	[UIView commitAnimations];
}

- (IBAction)showView:(id)sender {
	[UIView beginAnimations:nil context:nil];
	self.workingView.alpha = 1;
	[UIView commitAnimations];
}
@end
