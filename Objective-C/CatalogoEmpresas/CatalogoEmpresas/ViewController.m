#import "ViewController.h"
#import "Empresa.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	self.avisoSucessoLabel.hidden = YES;
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

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)incrementadorAlterado:(id)sender {
	UIStepper *incrementador = (UIStepper *)sender;
	self.quantidadeField.text = [NSString stringWithFormat:@"%d",
								 (int)incrementador.value];
}

- (IBAction)salvar:(id)sender {
	[self.nomeField resignFirstResponder];

	Empresa *e = [[Empresa alloc] init];
	e.nome = self.nomeField.text;
	e.quantidadeFuncionarios = [self.quantidadeField.text intValue];
	
	[self salvaEmpresa:e];
	[self mostraCatalogo];
	
	self.avisoSucessoLabel.alpha = 0;
	
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
