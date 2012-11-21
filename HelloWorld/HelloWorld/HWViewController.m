#import "HWViewController.h"

@interface HWViewController ()

@end

@implementation HWViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (void)viewDidUnload
{
	[self setWorkingView:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
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

- (void)dealloc {
	[_workingView release];
	[super dealloc];
}
@end
