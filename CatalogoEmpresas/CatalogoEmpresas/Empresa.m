#import "Empresa.h"

@implementation Empresa
@synthesize nome, quantidadeFuncionarios;

-(void) dealloc {
	[nome release];
	[super dealloc];
}

@end
