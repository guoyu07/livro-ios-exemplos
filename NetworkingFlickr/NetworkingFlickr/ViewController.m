#import "ViewController.h"
#import "AFJSONRequestOperation.h"
#import "UIImageView+AFNetworking.h"

@implementation ViewController
@synthesize scroll;

-(void) mostraMensagem:(NSString *) mensagem {
	UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Aviso" 
		message:mensagem 
		delegate:nil 
		cancelButtonTitle:@"OK" 
		otherButtonTitles:nil];
	[alert show];
	[alert release];
}

- (void)viewDidLoad {
    [super viewDidLoad];
	
	NSURL *url = [NSURL URLWithString:@"http://api.flickr.com/services/feeds/photos_public.gne?format=json&nojsoncallback=1"];
	NSURLRequest *request = [NSURLRequest requestWithURL:url];
	
	AFJSONRequestOperation *operacao = [AFJSONRequestOperation 
		JSONRequestOperationWithRequest:request success:^(NSURLRequest *request, NSHTTPURLResponse *response, id json) {
			elementos = [[json valueForKey:@"items"] retain];
			[self mostraMensagem:[NSString stringWithFormat:@"%d imagens encontradas", elementos.count]];

			if (elementos.count > 0) {
				[self inicializaScroll];
			}
			
	} failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error, id json) {
		[self mostraMensagem:[NSString stringWithFormat:@"Erro: %@", [error localizedDescription]]];
	}];
	
	[AFJSONRequestOperation addAcceptableContentTypes:[NSSet setWithObject:@"application/x-javascript"]];
	
	[operacao start];
}

-(void) inicializaScroll {
	float largura = scroll.frame.size.width;
	float altura = scroll.frame.size.height;

	scroll.contentSize = CGSizeMake(largura * elementos.count, altura);
	scroll.pagingEnabled = YES;
	
	imagens = [[NSMutableArray alloc] init];
	
	// Pré-cria todos os lugares onde uma imagem pode
	// aparecer, para facilitar as coisas na hora
	// de carregar a imagem de fato do Flickr
	int indice = 0;
	
	for (NSDictionary *item in elementos) {
		CGRect posicao = CGRectMake(indice++ * largura, 0, largura, altura);
		UIImageView *img = [[UIImageView alloc] initWithFrame:posicao];

		[scroll addSubview:img];
		[imagens addObject:img];

		[img release];
	}
	
	// Adiciciona a primeira imagem só para não ficar com a tela vazia
	[self carregaImagemRemota:0];
}

-(void) didRotateFromInterfaceOrientation:(UIInterfaceOrientation)fromInterfaceOrientation {
	float largura = scroll.frame.size.width;
	float altura = scroll.frame.size.height;
	int indice = 0;
	
	scroll.contentSize = CGSizeMake(largura * elementos.count, altura);

	for (UIImageView *img in scroll.subviews) {
		if (img.frame.size.width > 7 && img.frame.size.height > 7) {
			img.frame = CGRectMake(indice++ * largura, 0, largura, altura);
		}
	}	
	
	CGPoint novaPosicao = CGPointMake(largura * paginaAtual, 0);
	[scroll setContentOffset:novaPosicao animated:NO];
}

-(void) carregaImagemRemota:(int) indice {
	paginaAtual = indice;

	NSDictionary *item = [elementos objectAtIndex:indice];
	NSString *url = [[item valueForKey:@"media"] valueForKey:@"m"];
	
	NSLog(@"Carregando a URL %@", url);
	
	UIImageView *img = [imagens objectAtIndex:indice];
	img.contentMode = UIViewContentModeScaleAspectFit;
	[img setImageWithURL:[NSURL URLWithString:url]];
}

-(void) scrollViewDidScroll:(UIScrollView *)scrollView {
	int x = (int)scroll.contentOffset.x;
	int largura = scroll.frame.size.width;
	
	// Somente carrega a próxima imagem
	// caso o scroll tenha parado em uma página
	if (x % largura == 0) {
		int pagina = x / largura;
		[self carregaImagemRemota:pagina];
	}
}

- (void)viewDidUnload {
	[self setScroll:nil];
    [super viewDidUnload];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

- (void)dealloc {
	[scroll release];
	[imagens release];
	[super dealloc];
}
@end
