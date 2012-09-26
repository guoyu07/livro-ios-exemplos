#import <UIKit/UIKit.h>

@interface ViewController : UIViewController {
	NSMutableArray *catalogo;
}

@property (retain, nonatomic) IBOutlet UITextField *nomeField;
@property (retain, nonatomic) IBOutlet UITextField *quantidadeField;
@property (retain, nonatomic) IBOutlet UILabel *avisoSucessoLabel;
- (IBAction)incrementadorAlterado:(id)sender;
- (IBAction)salvar:(id)sender;

@end
