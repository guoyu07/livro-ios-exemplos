#import "ViewController.h"
#import "AFNetworking.h"
#import "UIImageView+AFNetworking.h"

@interface ViewController ()

@end

@implementation ViewController

-(void) scrollViewDidScroll:(UIScrollView *)scrollView {
	int x = (int)self.scroll.contentOffset.x;
	int largura = self.scroll.frame.size.width;
	
	// Somente carrega a próxima imagem
	// caso o scroll tenha parado em uma página
	if (x % largura == 0) {
		int pagina = x / largura;
		[self carregaImagemRemota:pagina];
	}
}

-(void) carregaImagemRemota:(int) indice {
	paginaAtual = indice;
	
	NSDictionary *item = _elementos[indice];
	NSDictionary *imageInfo = item[@"images"][0];
	NSString *url = imageInfo[@"url"];
	
	NSLog(@"Carregando a URL %@", url);
	
	UIImageView *img = _imagens[indice];
	img.contentMode = UIViewContentModeScaleAspectFit;
	[img setImageWithURL:[NSURL URLWithString:url]];
}

-(void) inicializaScroll {
	float largura = self.scroll.bounds.size.width;
	float altura = self.scroll.bounds.size.height;
	
	self.scroll.contentSize = CGSizeMake(largura * _elementos.count, altura);
	self.scroll.pagingEnabled = YES;
	
	_imagens = [[NSMutableArray alloc] init];
	
	// Cria todos os lugares onde uma imagem pode
	// aparecer, para facilitar as coisas na hora
	// de carregar a imagem de fato do Flickr
	int indice = 0;
	
	for (NSDictionary *item in _elementos) {
		CGRect posicao = CGRectMake(indice++ * largura, 0, largura, altura);
		UIImageView *img = [[UIImageView alloc] initWithFrame:posicao];
		
		[_scroll addSubview:img];
		[_imagens addObject:img];
	}
	
	// Adiciona a primeira imagem só para não ficar com a tela vazia
	[self carregaImagemRemota:0];
}

-(void) viewDidLoad
{
	[super viewDidLoad];
	
	NSString *url = @"http://bit.ly/livroios-500px";
	AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager
											  manager];
	
	manager.responseSerializer = [AFJSONResponseSerializer serializer];
	
	[manager GET:url parameters:nil
		 success:^(AFHTTPRequestOperation *operation, id json) {
			 _elementos = json[@"photos"];
			 [self mostraMensagem:[NSString
								   stringWithFormat:@"%d imagens encontradas",
								   _elementos.count]];
			 
			 if (_elementos.count > 0) {
				 [self inicializaScroll];
			 }
		 }
		 failure:^(AFHTTPRequestOperation *operation, NSError *error) {
			 [self mostraMensagem:[NSString stringWithFormat:@"Erro: %@",
								   [error localizedDescription]]];
		 }
	 ];
}

-(void) mostraMensagem:(NSString *) message {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Aviso"
													message:message
												   delegate:nil
										  cancelButtonTitle:@"OK"
										  otherButtonTitles:nil];
	
	[alert show];
}

-(void) didRotateFromInterfaceOrientation: (UIInterfaceOrientation)orientacao {
	float largura = self.scroll.frame.size.width;
	float altura = self.scroll.frame.size.height;
	int indice = 0;
	
	self.scroll.contentSize = CGSizeMake(largura * _elementos.count, altura);
	
	for (UIImageView *img in self.scroll.subviews) {
		if (img.frame.size.width > 7 && img.frame.size.height > 7) {
			img.frame = CGRectMake(indice++ * largura, 0, largura,
								   altura);
		}
	}
	
	CGPoint novaPosicao = CGPointMake(largura * paginaAtual, 0);
	[_scroll setContentOffset:novaPosicao animated:NO];
}

-(BOOL) shouldAutorotate {
	return YES;
}

@end
