#import <Foundation/Foundation.h>

@interface Contato : NSObject {
	NSString *nome;
	NSString *telefone;
}

-(id) initWithNome:(NSString *) nomeInicial andTelefone:(NSString *) telInicial;

@property (nonatomic, retain) NSString *nome;
@property (nonatomic, retain) NSString *telefone;

@end
