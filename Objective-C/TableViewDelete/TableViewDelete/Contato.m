#import "Contato.h"

@implementation Contato
@synthesize nome, telefone;

-(id) initWithNome:(NSString *) nomeInicial andTelefone:(NSString *) telInicial {
	if ((self = [super init])) {
		self.nome = nomeInicial;
		self.telefone = telInicial;
	}
	
	return self;
}

-(void) dealloc {
	[nome release];
	[telefone release];
	[super dealloc];
}

@end
