#import <UIKit/UIKit.h>

@interface ViewController : UIViewController<UIScrollViewDelegate> {
	int paginaAtual;
}

@property (retain, nonatomic) NSMutableArray *imagens;
@property (retain, nonatomic) NSArray *elementos;
@property (weak, nonatomic) IBOutlet UIScrollView *scroll;

@end
