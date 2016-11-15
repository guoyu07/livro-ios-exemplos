#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	self.mapa.showsUserLocation = YES;
	self.mapa.delegate = self;
	
	// Adiciona ao mapa o gesto de toque longo
	UILongPressGestureRecognizer *toqueLongoMapa =
	[[UILongPressGestureRecognizer alloc] initWithTarget:self
		action:@selector(adicionaPino:)];
	
	toqueLongoMapa.minimumPressDuration = 0.5;
	[self.mapa addGestureRecognizer:toqueLongoMapa];
}

-(void) mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views {
	MKAnnotationView *v = [views objectAtIndex:0];
	CLLocationDistance distancia = 400;
	MKCoordinateRegion regiao = MKCoordinateRegionMakeWithDistance(
		[v.annotation coordinate], distancia, distancia);
	[self.mapa setRegion:regiao animated:YES];
}

-(void) adicionaPino:(UIGestureRecognizer *) gesto {
	if (gesto.state == UIGestureRecognizerStateBegan) {
		CGPoint ponto = [gesto locationInView:self.view];
		
		CLLocationCoordinate2D coordenadas = [self.mapa convertPoint:ponto
												toCoordinateFromView:self.mapa];
		
		MKPointAnnotation *pino = [[MKPointAnnotation alloc] init];
		pino.coordinate = coordenadas;
		[self.mapa addAnnotation:pino];
	}
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *) pino {
	NSLog(@"Pino %@ selecionado", pino);
}

@end
