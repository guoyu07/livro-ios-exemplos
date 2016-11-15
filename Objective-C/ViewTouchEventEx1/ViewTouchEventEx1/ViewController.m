#import "ViewController.h"
#import "CirculoView.h"

@implementation ViewController

-(void) loadView {
	CirculoView *c = [[CirculoView alloc] init];
	c.backgroundColor = [UIColor whiteColor];
	self.view = c;
}

@end
