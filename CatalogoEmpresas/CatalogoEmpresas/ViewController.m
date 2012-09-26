#import "ViewController.h"
#import "Empresa.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize nomeField;
@synthesize quantidadeField;
@synthesize avisoSucessoLabel;


- (void)viewDidLoad {
	[super viewDidLoad];
	avisoSucessoLabel.hidden = YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

- (void)dealloc {
	[nomeField release];
	[quantidadeField release];
	[avisoSucessoLabel release];
	[super dealloc];
}


- (IBAction)incrementadorAlterado:(id)sender {
	UIStepper *incrementador = (UIStepper *)sender;
	quantidadeField.text = [NSString stringWithFormat:@"%d", (int)incrementador.value];
}

-(void) salvaEmpresa:(Empresa *) novaEmpresa {
	if (!catalogo) {
		catalogo = [[NSMutableArray alloc] init];
	}
	
	[catalogo addObject:novaEmpresa];
}

-(void) mostraCatalogo {
	NSLog(@"******* Listando todas empresas *******");

	for (Empresa *empresa in catalogo) {
		NSLog(@"A empresa %@ tem %d funcionários", 
			empresa.nome, empresa.quantidadeFuncionarios);
	}
}

- (IBAction)salvar:(id)sender {
	[nomeField resignFirstResponder];

	Empresa *e = [[Empresa alloc] init];
	e.nome = nomeField.text;
	e.quantidadeFuncionarios = [quantidadeField.text intValue];
	
	[self salvaEmpresa:e];
	[self mostraCatalogo];
			
	[e release];
	
	// Mostra a mensagem de sucesso por alguns instantes
	avisoSucessoLabel.alpha = 0;
	avisoSucessoLabel.hidden = NO;
	
	[UIView animateWithDuration:1 animations:^{
		avisoSucessoLabel.hidden = NO;
		avisoSucessoLabel.alpha = 1;
	} completion:^(BOOL finalizado) {
		[UIView animateWithDuration:1 delay:2 options:0 animations:^{
			avisoSucessoLabel.alpha = 0;
		} completion:^(BOOL finalizado) {
			avisoSucessoLabel.hidden = YES;
		}];
	}];
}
@end
