#import "AppDelegate.h"

#import "RootController.h"

@implementation AppDelegate

@synthesize window = _window;

- (void)dealloc
{
	[_window release];
    [super dealloc];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    self.window = [[[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]] autorelease];

	RootController *rootController = [[RootController alloc] init];
	UINavigationController *navController = [[UINavigationController alloc] initWithRootViewController:rootController];

	self.window.rootViewController = navController;
    [self.window makeKeyAndVisible];
	
	[rootController release];
	[navController release];
	
    return YES;
}

@end
