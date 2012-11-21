#import "ViewController.h"
#import "Empresa.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.avisoSucessoLabel.hidden = YES;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

- (void)dealloc {
	[_nomeField release];
	[_quantidadeField release];
	[_avisoSucessoLabel release];
	[super dealloc];
}


- (IBAction)incrementadorAlterado:(id)sender {
	UIStepper *incrementador = (UIStepper *)sender;
	self.quantidadeField.text = [NSString stringWithFormat:@"%d", (int)incrementador.value];
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
	[self.nomeField resignFirstResponder];

	Empresa *e = [[Empresa alloc] init];
	e.nome = self.nomeField.text;
	e.quantidadeFuncionarios = [self.quantidadeField.text intValue];
	
	[self salvaEmpresa:e];
	[self mostraCatalogo];
			
	[e release];
	
	// Mostra a mensagem de sucesso por alguns instantes
	self.avisoSucessoLabel.alpha = 0;
	self.avisoSucessoLabel.hidden = NO;
	
	[UIView animateWithDuration:1 animations:^{
		self.avisoSucessoLabel.hidden = NO;
		self.avisoSucessoLabel.alpha = 1;
	} completion:^(BOOL finalizado) {
		[UIView animateWithDuration:1 delay:2 options:0 animations:^{
			self.avisoSucessoLabel.alpha = 0;
		} completion:^(BOOL finalizado) {
			self.avisoSucessoLabel.hidden = YES;
		}];
	}];
}
@end
