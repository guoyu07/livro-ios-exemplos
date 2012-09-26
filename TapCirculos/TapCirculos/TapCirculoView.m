#import "TapCirculoView.h"

@interface TapCirculoView()
-(void) registraEventos;
@end

@implementation TapCirculoView

-(id) init {
	if ((self = [super init])) {
		[self registraEventos];
	}
	
	return self;
}

-(void) registraEventos {
	UITapGestureRecognizer *toque = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(toqueRecebido:)];
	toque.numberOfTapsRequired = 1; // Valor padrão é 1
	[self addGestureRecognizer:toque];
	[toque release];
}

-(void) toqueRecebido:(UIGestureRecognizer *) gesto {
	if (!circulos) {
		circulos = [[NSMutableArray alloc] init];
	}
	
	CGPoint localizacaoToque = [gesto locationInView:self];
	[circulos addObject:[NSValue valueWithCGPoint:localizacaoToque]];
	[self setNeedsDisplay];
}

-(void) drawRect:(CGRect)rect {
	CGContextRef contexto = UIGraphicsGetCurrentContext();
	CGContextSetLineWidth(contexto, 2.0);
	CGColorRef corFundo = [UIColor redColor].CGColor;
	CGContextSetFillColor(contexto, CGColorGetComponents(corFundo));
	int tamanho = 25;
	
	for (NSValue *item in circulos) {
		CGPoint ponto = [item CGPointValue];
		CGRect regiao = CGRectMake(ponto.x, ponto.y, tamanho, tamanho);
		CGContextAddEllipseInRect(contexto, regiao);
		CGContextFillEllipseInRect(contexto, regiao);
	}
	
	CGContextStrokePath(contexto);
}

-(void) dealloc {
	[circulos release];
	[super dealloc];
}

@end
