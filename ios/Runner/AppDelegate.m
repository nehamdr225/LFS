#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#include "GoogleMaps/GoogleMaps.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [GeneratedPluginRegistrant registerWithRegistry:self];
    [GMSServices provideAPIKey:@"AIzaSyBdi_FEFNEPkiTy1cvQTFSToudQuWZ0kI8"];  
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end


