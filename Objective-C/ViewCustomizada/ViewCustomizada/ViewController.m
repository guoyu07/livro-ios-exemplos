#import "ViewController.h"
#import "LoginView.h"

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	LoginView *lv = [[[LoginView alloc] init] autorelease];
	[self.view addSubview:lv];
}

@end
