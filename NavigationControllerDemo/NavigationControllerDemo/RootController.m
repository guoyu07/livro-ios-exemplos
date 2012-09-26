#import "RootController.h"
#import "AdicionarController.h"
#import "ConfiguracoesController.h"

@interface RootController ()

@end

@implementation RootController

- (void) viewDidLoad {
    [super viewDidLoad];
	self.title = @"Root Controller";
}

-(void) viewWillAppear:(BOOL)animated {
	[self.navigationController setNavigationBarHidden:YES animated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

- (IBAction)abrirAdicionar:(id)sender {
	AdicionarController *c = [[AdicionarController alloc] init];
	[self.navigationController pushViewController:c animated:YES];
	[c release];
}

- (IBAction)abrirConfiguracoes:(id)sender {
	ConfiguracoesController *c = [[ConfiguracoesController alloc] init];
	[self.navigationController pushViewController:c animated:YES];
	[c release];
}
@end
