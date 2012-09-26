#import <Foundation/Foundation.h>

@interface Empresa : NSObject {
	NSString *nome;
	int quantidadeFuncionarios;
}

@property (nonatomic, retain) NSString *nome;
@property (nonatomic, assign) int quantidadeFuncionarios;

@end
