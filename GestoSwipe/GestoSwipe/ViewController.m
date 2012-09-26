#import "ViewController.h"

@implementation ViewController

-(void) adicionaGesto:(UISwipeGestureRecognizerDirection) direcao {
	UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] 
		initWithTarget:self action:@selector(jogaQuadrado:)];
	swipe.direction = direcao;
	[self.view addGestureRecognizer:swipe];
	[swipe release];
}

-(void) registraGestos {
	[self adicionaGesto:UISwipeGestureRecognizerDirectionRight];
	[self adicionaGesto:UISwipeGestureRecognizerDirectionLeft];
}

-(void) jogaQuadrado:(UIGestureRecognizer *) gesto {
	CGPoint location = [gesto locationInView:quadrado];

	if ([quadrado pointInside:location withEvent:nil]) {
		UISwipeGestureRecognizer *swipe = (UISwipeGestureRecognizer *)gesto;

		float novoX = swipe.direction == UISwipeGestureRecognizerDirectionLeft
			? 0
			: (self.view.frame.size.width - quadrado.frame.size.width);
			
		[UIView animateWithDuration:0.3 delay:0 
			options:UIViewAnimationCurveEaseInOut 
			animations:^ {
				CGRect frame = quadrado.frame;
				frame.origin.x = novoX;
				quadrado.frame = frame;
			} completion:nil];
	}	
}

-(void) criaQuadrado {
	quadrado = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
	quadrado.backgroundColor = [UIColor yellowColor];
	[self.view addSubview:quadrado];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	[self registraGestos];
	[self criaQuadrado];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

-(void) dealloc {
	[quadrado release];
	[super dealloc];
}

@end
