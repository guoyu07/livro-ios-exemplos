#import "ViewController.h"
#import "TremeTremeView.h"

@implementation ViewController

-(void) criaTremeTremeView:(CGPoint) posicao comCor:(UIColor *) cor {
	CGRect r = CGRectMake(posicao.x, posicao.y, 60, 60);
	TremeTremeView *t = [[TremeTremeView alloc] initWithFrame:r];
	t.backgroundColor = cor;
	[self.view addSubview:t];
}

- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
	
	[self criaTremeTremeView:CGPointMake(50, 50)
		comCor:[UIColor blueColor]];
	[self criaTremeTremeView:CGPointMake(200, 150)
		comCor:[UIColor greenColor]];
	[self criaTremeTremeView:CGPointMake(110,250)
		comCor:[UIColor purpleColor]];
}

@end
