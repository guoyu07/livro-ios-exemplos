#import "TremeTremeView.h"
#import <QuartzCore/QuartzCore.h>

#define RADIANS(degrees) ((degrees * M_PI) / 180.0)

@interface TremeTremeView ()
-(void) registraGestos;
-(void) enfeitaView;
@end

@implementation TremeTremeView

-(id) initWithFrame:(CGRect)frame {
	if ((self = [super initWithFrame:frame])) {
		[self enfeitaView];
		[self registraGestos];
	}
	
	return self;
}

-(void) enfeitaView {
	self.layer.masksToBounds = NO;
	self.layer.cornerRadius = 8;
	self.layer.shadowOffset = CGSizeMake(-2, 2);
	self.layer.shadowRadius = 5;
	self.layer.shadowOpacity = 0.5;
}

-(void) registraGestos {
	UILongPressGestureRecognizer *toqueLongo =
	[[UILongPressGestureRecognizer alloc] initWithTarget:self
		action:@selector(iniciaTremedeira:)];
	toqueLongo.minimumPressDuration = 0.3;
	[self addGestureRecognizer:toqueLongo];
	
	UITapGestureRecognizer *toqueParar =
	[[UITapGestureRecognizer alloc] initWithTarget:self
		action:@selector(pararAnimacao)];
	toqueParar.numberOfTapsRequired = 2;
	[self addGestureRecognizer:toqueParar];
}

-(void) iniciaTremedeira:(UIGestureRecognizer *) gesto {
	CGAffineTransform oscilaEsquerda = CGAffineTransformRotate(
		CGAffineTransformIdentity, RADIANS(-10.0));
	
	CGAffineTransform oscilaDireita = CGAffineTransformRotate(
		CGAffineTransformIdentity, RADIANS(10.0));
	
	self.transform = oscilaEsquerda;
	
	UIViewAnimationOptions opcoes = UIViewAnimationOptionRepeat
	| UIViewAnimationOptionAllowUserInteraction
	| UIViewAnimationOptionAutoreverse
	| UIViewAnimationCurveEaseInOut;
	
	[UIView animateWithDuration:0.1 delay:0 options:opcoes animations:^{
		self.transform = oscilaDireita;
	} completion:nil];
}

-(void) pararAnimacao {
	UIViewAnimationOptions opcoes =
		UIViewAnimationOptionBeginFromCurrentState;
	
	[UIView animateWithDuration:0 delay:0 options:opcoes animations:^{
		self.transform = CGAffineTransformIdentity;
	}completion:nil];
}

@end