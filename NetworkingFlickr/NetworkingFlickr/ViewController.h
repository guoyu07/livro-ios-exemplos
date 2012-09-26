#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate> {
	NSArray *elementos;
	NSMutableArray *imagens;
	int paginaAtual;
}

@property (retain, nonatomic) IBOutlet UIScrollView *scroll;

@end
