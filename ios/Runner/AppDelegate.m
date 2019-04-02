#include "AppDelegate.h"
#include "GeneratedPluginRegistrant.h"
#import "HelloViewController.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
  [GeneratedPluginRegistrant registerWithRegistry:self];
//	self.window = [[UIWindow alloc] init];
//	self.window.frame = [UIScreen mainScreen].bounds;
//	self.window.backgroundColor = [UIColor whiteColor];
//	HelloViewController *helloVC = [[HelloViewController alloc] init];
//	UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:helloVC];
//	self.window.rootViewController = nav;
//	[self.window makeKeyAndVisible];
  // Override point for customization after application launch.
  return [super application:application didFinishLaunchingWithOptions:launchOptions];
}

@end
