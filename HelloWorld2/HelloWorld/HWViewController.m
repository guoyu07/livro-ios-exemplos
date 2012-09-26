#import "HWViewController.h"

@interface HWViewController ()

@end

@implementation HWViewController
@synthesize workingView;

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
	workingView.alpha = 0;
	[UIView commitAnimations];
}

- (IBAction)showView:(id)sender {
	[UIView beginAnimations:nil context:nil];
	workingView.alpha = 1;
	[UIView commitAnimations];
}

- (void)dealloc {
	[workingView release];
	[super dealloc];
}
@end
