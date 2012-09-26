#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>
#import <CoreLocation/CoreLocation.h>

@interface ViewController : UIViewController<MKMapViewDelegate>

@property (retain, nonatomic) IBOutlet MKMapView *mapa;
@property (nonatomic, retain) CLLocationManager *gerenciadorLocalizacao;

@end
