#import "ConfiguracoesController.h"
#import "DadosAcessoController.h"

@interface ConfiguracoesController ()

@end

@implementation ConfiguracoesController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated {
	[self.navigationController setNavigationBarHidden:NO animated:YES];
}


- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)abreDadosAcesso:(id)sender {
	DadosAcessoController *c = [[DadosAcessoController alloc] init];
	[self.navigationController pushViewController:c animated:YES];
	[c release];
}
@end
