//
//  PackagePathPlugin.m
//  Runner
//
//  Created by chiyz on 2019/6/11.
//  Copyright © 2019年 The Chromium Authors. All rights reserved.
//

#import "PackagePathPlugin.h"

@implementation PackagePathPlugin

+ (void)registerWithRegistrar:(nonnull NSObject<FlutterPluginRegistrar> *)registrar {
	FlutterMethodChannel* channel =
	[FlutterMethodChannel methodChannelWithName:@"plugins.PackagePath"
								binaryMessenger:[registrar messenger]];
	PackagePathPlugin* instance = [[PackagePathPlugin alloc] init];
	[registrar addMethodCallDelegate:instance channel:channel];
}

- (void)handleMethodCall:(FlutterMethodCall *)call result:(FlutterResult)result {
	
	if ([call.method isEqualToString:@"getrooDirectory"]) {
		NSString *string = [NSBundle mainBundle].bundlePath;
		result(string);
	} else if ([call.method isEqualToString:@"getAppConfigPath"]) {
		NSString *string = [[NSBundle mainBundle] pathForResource:@"AppConfig" ofType:nil];
		result(string);
	} else if ([call.method isEqualToString:@"getpackageConfig"]) {
		NSString *configPath = [[NSBundle mainBundle] pathForResource:@"AppConfig" ofType:nil];
		NSData *data = [NSData dataWithContentsOfFile:configPath];
//		NSString *aString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
		if (data.length == 0) {
			result(@{});
			return;
		}
		NSError *error;
		NSDictionary *param = [NSJSONSerialization JSONObjectWithData:data
															options:NSJSONReadingMutableLeaves
															  error:&error];
		result(param);
	}
}
@end
