#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	scroll = [[UIScrollView alloc] initWithFrame:self.view.bounds];
	scroll.delegate = self;
	scroll.minimumZoomScale = 1;
	scroll.maximumZoomScale = 3;
	
	[self.view addSubview:scroll];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

-(void) dealloc {
	[scroll release];
	[super dealloc];
}

@end
