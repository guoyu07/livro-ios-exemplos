#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UITableViewDelegate, UITableViewDataSource> {
	NSMutableArray *contatos;
}

@property (retain, nonatomic) IBOutlet UITableView *tabelaContatos;

@end
