#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize minhaView;

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (void)dealloc {
    [minhaView release];
    [super dealloc];
}
- (IBAction)animar:(id)sender {
	[UIView animateWithDuration:2 animations:^ {
		minhaView.frame = CGRectMake(20, 308, 280, 132);
		minhaView.alpha = 0.3;
	}];
}
@end
