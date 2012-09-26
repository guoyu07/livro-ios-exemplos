#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController
@synthesize mapa, gerenciadorLocalizacao;

- (void)viewDidLoad {
    [super viewDidLoad];
	mapa.showsUserLocation = YES;
	mapa.delegate = self;
	
	UILongPressGestureRecognizer *longPress = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(adicionaPino:)];
	longPress.minimumPressDuration = 0.5;
	[mapa addGestureRecognizer:longPress];
	[longPress release];
}

-(void) adicionaPino:(UIGestureRecognizer *) gesto {
	if (gesto.state == UIGestureRecognizerStateBegan) {
		CGPoint ponto = [gesto locationInView:self.view];
		CLLocationCoordinate2D coordenadas = [mapa convertPoint:ponto toCoordinateFromView:mapa];
		MKPointAnnotation *pino = [[MKPointAnnotation alloc] init];
		pino.coordinate = coordenadas;
		[mapa addAnnotation:pino];
		[pino release];
	}
}

- (void)mapView:(MKMapView *)mapView didSelectAnnotationView:(MKAnnotationView *) pino {
	NSLog(@"Pino %@ selecionado", pino);
}

-(void) mapView:(MKMapView *)mapView didAddAnnotationViews:(NSArray *)views {
	MKAnnotationView *v = [views objectAtIndex:0];
	CLLocationDistance distancia = 400;
	MKCoordinateRegion regiao = MKCoordinateRegionMakeWithDistance(
		[v.annotation coordinate], distancia, distancia);
	[mapa setRegion:regiao animated:YES];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
	return YES;
}

- (void)dealloc {
    [mapa release];
    [super dealloc];
}
@end
