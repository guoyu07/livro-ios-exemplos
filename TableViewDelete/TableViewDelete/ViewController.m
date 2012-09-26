#import "ViewController.h"
#import "Contato.h"

@interface ViewController ()
-(void) loadContacts;
@end

@implementation ViewController
@synthesize tabelaContatos;

- (void)viewDidLoad {
    [super viewDidLoad];
	[self loadContacts];
}

-(void) loadContacts {
	// O arquivo "contatos.plist" é organizado no formato
	// chave => valor, sendo que a chave principal no nosso
	// caso é "contatos", que por sua vez é do tipo array. 
	// Cada um dos elementos deste array é outro dicionário
	// contendo as chaves "nome" e "telefone", os quais lemos e 
	// organizamos em uma estrutura de dados especializada
	NSString *plistCaminho = [[NSBundle mainBundle] 
		pathForResource:@"contatos"  ofType:@"plist"];
	NSDictionary *pl = [NSDictionary dictionaryWithContentsOfFile:plistCaminho];
	NSArray *dados = [pl valueForKey:@"contatos"];

	contatos = [[NSMutableArray alloc] init];
	
	for (NSDictionary *item in dados) {
		NSString *nome = [item valueForKey:@"nome"];
		NSString *telefone = [item valueForKey:@"telefone"];
		
		Contato *c = [[Contato alloc] initWithNome:nome andTelefone:telefone];
		[contatos addObject:c];
		
		[c release];
	}
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return UIInterfaceOrientationIsPortrait(interfaceOrientation);
}

- (void)dealloc {
	[contatos release];
	[tabelaContatos release];
    [super dealloc];
}

- (void)viewDidUnload {
	[self setTabelaContatos:nil];
    [super viewDidUnload];
}

#pragma mark -
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return contatos.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	static NSString *CelulaContatoCacheID = @"CelulaContatoCacheID";
	UITableViewCell *cell = [tabelaContatos dequeueReusableCellWithIdentifier:CelulaContatoCacheID];

	if (!cell) {
		cell = [[[UITableViewCell alloc] 
		 	initWithStyle:UITableViewCellStyleDefault
			reuseIdentifier:CelulaContatoCacheID] autorelease];
	}
	
	Contato *contato = [contatos objectAtIndex:indexPath.row];
	cell.textLabel.text = contato.nome;
	
	return cell;
}

// O simples fato de implementar este método já informa a table view
// que o botão "Deletar" deve ser apresentado no momento em que o 
// usuário faz o movimento de swipe. Já a responsabilidade do método em si
// é realizar a ação de deletar de fato, caso o usuário tenha clicado no botão
-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
	[contatos removeObjectAtIndex:indexPath.row];
	
	// Muito importante - não esqueça de chamar reloadData, caso contrário
	// a table view não irá ficar sabendo da mudança, e você pode ter problemas
	// em alguma outra parte do aplicativo
	[tabelaContatos reloadData];
}

#pragma mark -
#pragma mark UITableViewDelegate
-(NSString *) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
	return @"Remover";
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	Contato *contato = [contatos objectAtIndex:indexPath.row];
	NSString *msg = [NSString stringWithFormat:@"Nome: %@\nTelefone: %@", 
		contato.nome, contato.telefone];
		
	UIAlertView *alert = [[[UIAlertView alloc] initWithTitle:@"Contato" 
		message:msg 
		delegate:nil 
		cancelButtonTitle:@"OK" 
		otherButtonTitles:nil] autorelease];
	[alert show];
	
	[tabelaContatos deselectRowAtIndexPath:indexPath animated:YES];
}

@end
