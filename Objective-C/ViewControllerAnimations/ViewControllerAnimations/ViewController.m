
#import "ViewController.h"
#import "OpcoesController.h"

@interface ViewController ()

@end

@implementation ViewController


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
	return YES;
}

- (IBAction)showDissolve:(id)sender {
	[self mostraControllerComAnimacao:UIModalTransitionStyleCrossDissolve];
}

- (IBAction)showPageCurl:(id)sender {
	[self mostraControllerComAnimacao:UIModalTransitionStylePartialCurl];
}

- (IBAction)showVertical:(id)sender {
	[self mostraControllerComAnimacao:UIModalTransitionStyleCoverVertical];
}

- (IBAction)showHorizontal:(id)sender {
	[self mostraControllerComAnimacao:UIModalTransitionStyleFlipHorizontal];
}

-(void) mostraControllerComAnimacao:(UIModalTransitionStyle) estilo {
	OpcoesController *c = [[OpcoesController alloc] init];
	
	c.modalTransitionStyle = estilo;
	
	[self presentModalViewController:c animated:YES];
	[c release];
}
@end
