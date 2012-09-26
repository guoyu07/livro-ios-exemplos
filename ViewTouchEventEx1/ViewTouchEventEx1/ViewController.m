#import "ViewController.h"
#import "CirculoView.h"

@implementation ViewController

-(void) loadView {
	CirculoView *c = [[[CirculoView alloc] init] autorelease];
	c.backgroundColor = [UIColor whiteColor];
	self.view = c;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
