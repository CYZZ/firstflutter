//
//  HelloViewController.m
//  Runner
//
//  Created by chiyz on 2019/2/28.
//  Copyright © 2019年 The Chromium Authors. All rights reserved.
//

#import "HelloViewController.h"
#import <Flutter/Flutter.h>

@interface HelloViewController ()

@end

@implementation HelloViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.view.backgroundColor = [UIColor lightGrayColor];
	// Do any additional setup after loading the view from its nib.
}
- (IBAction)jumpButtonClick:(UIButton *)sender {
	
	NSLog(@"点击了按钮 %s",__func__);
	// flutter代码
	/*
	 void main() => runApp(_widgetForRouter(window.defaultRouteName));
	 
	 Widget _widgetForRouter(String route) {
	 switch (route) {
	 case 'zhihu':
	 return ZhiHu();
	 default:
	 return ZhiHu();
	 }
	 }
	 
	 class ZhiHu extends StatelessWidget {
	 @override
	 Widget build(BuildContext context) {
	 // TODO: implement build
	 return MaterialApp(
	 title: '网易新闻',
	 home: Index(),
	 );
	 }
	 */
	FlutterViewController *flutterVC = [[FlutterViewController alloc] initWithProject:nil nibName:nil bundle:nil];
	[flutterVC setInitialRoute:@"idea"];
	__weak typeof(self) weakSelf = self;
	
	// 要与main.dartd中一致
	NSString *channelName = @"com.page.your/native_get";
	FlutterMethodChannel *messageChannel = [FlutterMethodChannel methodChannelWithName:channelName binaryMessenger:flutterVC];
	[messageChannel setMethodCallHandler:^(FlutterMethodCall * _Nonnull call, FlutterResult  _Nonnull result) {
		// call.method 获取flutter给回到的方法名，要匹配到c
		NSLog(@"method%@ ----arguments = %@-----",call.method, call.arguments);
		
		if ([call.method isEqualToString:@"iOSFlutter"]) {
			NSLog(@"iOS收到了flutter的点击事件:----");
		}
		
		// flutter传参给iOS
		if ([call.method isEqualToString:@"iOSFlutter1"]) {
			NSDictionary *dic = call.arguments;
			NSLog(@"arguments1====%@",dic);
			NSLog(@"code type = %@",[dic[@"code"] class]);
			NSLog(@"data type = %@",[dic[@"data"] class]);
			
		}
		
		// iOS给flutter的值
		if ([call.method isEqualToString:@"iOSFlutter2"]) {
			NSLog(@"调用了方法3");
			if (result) {
//				result(@{@"hello":@"执行了回调方法"});
				result(@"789000000h哈哈哈哈");
			}
		}
	}];
	
	[self.navigationController pushViewController:flutterVC animated:YES];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

@end
