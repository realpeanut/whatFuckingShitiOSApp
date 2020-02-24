//
//  GTDetailViewController.m
//  whatFuckingShitiOSApp
//
//  Created by 张建东 on 2020/2/11.
//  Copyright © 2020 张建东. All rights reserved.
//

#import "GTDetailViewController.h"
#import <WebKit/WebKit.h>

@interface GTDetailViewController ()<WKNavigationDelegate>
@property(nonatomic,strong,readwrite) WKWebView *wkWebView;
@property(nonatomic,strong,readwrite) UIProgressView * uiprogressView;
@property(nonatomic,strong,readwrite) NSString * detailUrl;
@end

@implementation GTDetailViewController

-(instancetype)initWithStringUrl:(NSString *)url{
    self = [super init];
    if (self) {
        _detailUrl = url;
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view addSubview:({
        self.wkWebView = [[WKWebView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, self.view.frame.size.height)];
        self.wkWebView.navigationDelegate = self;
        self.wkWebView;
    })];
    [self.wkWebView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:_detailUrl]]];
    [self.wkWebView addSubview:({
        self.uiprogressView = [[UIProgressView alloc] initWithFrame:CGRectMake(0, 88, self.view.frame.size.width, 20)];
        self.uiprogressView;
    })];
    
    //GTDetailViewController监听wkWebView的loadRequest属性  注册监听
    [self.wkWebView addObserver:self forKeyPath:@"estimatedProgress" options:NSKeyValueObservingOptionNew context:nil];
}

- (void)webView:(WKWebView *)webView decidePolicyForNavigationAction:(WKNavigationAction *)navigationAction decisionHandler:(void (^)(WKNavigationActionPolicy))decisionHandler
{
    decisionHandler(WKNavigationActionPolicyAllow);
}

- (void)webView:(WKWebView *)webView didFinishNavigation:(null_unspecified WKNavigation *)navigation
{
    
}


//监听回调
- (void)observeValueForKeyPath:(nullable NSString *)keyPath ofObject:(nullable id)object change:(nullable NSDictionary<NSKeyValueChangeKey, id> *)change context:(nullable void *)context
{
    self.uiprogressView.progress = self.wkWebView.estimatedProgress;
}

-(void)dealloc
{
    [self.wkWebView removeObserver:self forKeyPath:@"estimatedProgress"];
}

@end
