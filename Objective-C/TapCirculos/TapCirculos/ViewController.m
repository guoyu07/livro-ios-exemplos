#import "ViewController.h"
#import "TapCirculoView.h"

@implementation ViewController

-(void) loadView {
	TapCirculoView *c = [[TapCirculoView alloc] init];
	c.backgroundColor = [UIColor whiteColor];
	self.view = c;
}

@end
