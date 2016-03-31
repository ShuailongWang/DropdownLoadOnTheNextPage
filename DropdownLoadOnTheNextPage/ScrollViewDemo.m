//
//  ScrollViewDemo.m
//  DropdownLoadOnTheNextPage
//
//  Created by 武建明 on 16/3/30.
//  Copyright © 2016年 Four_w. All rights reserved.
//

#import "ScrollViewDemo.h"
#import <MJRefresh/MJRefresh.h>
#import "UIView+Extension.h"

@interface ScrollViewDemo ()

@property (strong, nonatomic) UIScrollView *bgScrollView;
@property (strong, nonatomic) UIScrollView *subScrollView;
@property (strong, nonatomic) UIImageView *imageView;
@property (strong, nonatomic) UIWebView *webView;

@end

@implementation ScrollViewDemo

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.bgScrollView];
    [self.bgScrollView addSubview:self.subScrollView];
    [self.bgScrollView addSubview:self.webView];
    [self.subScrollView addSubview:self.imageView];
    [self setSubScrollViewRefreshFooter];
    [self setWebViewRefreshHeader];
}

#pragma mark - Property
- (UIScrollView *)bgScrollView
{
    
    if (!_bgScrollView) {
        _bgScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kSMainScreenWidth, kSMainScreenHeight)];
        /*
         底层ScrollView必须scrollEnabled = NO
        */
        _bgScrollView.scrollEnabled = NO;
        _bgScrollView.backgroundColor = [UIColor lightTextColor];
        _bgScrollView.contentSize = CGSizeMake(kSMainScreenWidth, kSMainScreenHeight*2);
    }
    return _bgScrollView;
}
- (UIScrollView *)subScrollView
{
    if (!_subScrollView) {
        _subScrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, kSMainScreenWidth, kSMainScreenHeight-64)];
        _subScrollView.scrollEnabled = YES;

    }
    return _subScrollView;
}
- (UIImageView *)imageView
{
    if (!_imageView) {
        _imageView = [[UIImageView alloc] initWithFrame:self.subScrollView.bounds];
        _imageView.image = [UIImage imageNamed:@"pic"];
    }
    return _imageView;
}
- (UIWebView *)webView
{
    if (!_webView) {
        _webView = [[UIWebView alloc] initWithFrame:CGRectMake(0, kSMainScreenHeight, kSMainScreenWidth, kSMainScreenHeight-64)];
        _webView.backgroundColor = [UIColor whiteColor];
    }
    return _webView;
}
#pragma mark - SetUp
- (void)setSubScrollViewRefreshFooter
{
    _subScrollView.contentSize = CGSizeMake(kSMainScreenWidth, kSMainScreenHeight-64);
    
    __weak typeof(self) weakSelf = self;
    
    MJRefreshBackNormalFooter *refreshFooter = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [weakSelf.bgScrollView scrollRectToVisible:CGRectMake(0, self.webView.originY-64, kSMainScreenWidth, kSMainScreenHeight) animated:YES];
        
        [weakSelf.subScrollView.mj_footer endRefreshing];
        [weakSelf.webView loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"http://m.bing.com"]]];
    }];
    
    refreshFooter.arrowView.image = nil;
    
    [refreshFooter setTitle:@"下拉去往项目信息" forState:MJRefreshStateIdle];
    [refreshFooter setTitle:@"释放到达项目信息" forState:MJRefreshStatePulling];
    [refreshFooter setTitle:@"释放到达项目信息" forState:MJRefreshStateRefreshing];
    [refreshFooter setTitle:@"释放到达项目信息" forState:MJRefreshStateWillRefresh];
    [refreshFooter setTitle:@"下拉去往项目信息" forState:MJRefreshStateNoMoreData];
    // 隐藏状态
//    refreshFooter.stateLabel.hidden = YES;
    self.subScrollView.mj_footer = refreshFooter;
    
}
- (void)setWebViewRefreshHeader
{
    __weak typeof(self) weakSelf = self;

    MJRefreshNormalHeader *refreshHeader = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [weakSelf.bgScrollView scrollRectToVisible:CGRectMake(0, 0, kSMainScreenWidth, kSMainScreenHeight) animated:YES];
        [weakSelf.webView.scrollView.mj_header endRefreshing];
    }];
    refreshHeader.lastUpdatedTimeLabel.hidden = YES;
    [refreshHeader setTitle:@"下拉回到项目详情" forState:MJRefreshStateIdle];
    [refreshHeader setTitle:@"释放回到项目详情" forState:MJRefreshStatePulling];
    [refreshHeader setTitle:@"释放回到项目详情" forState:MJRefreshStateRefreshing];
    [refreshHeader setTitle:@"释放回到项目详情" forState:MJRefreshStateWillRefresh];
    [refreshHeader setTitle:@"下拉回到项目详情" forState:MJRefreshStateNoMoreData];
    
    self.webView.scrollView.mj_header = refreshHeader;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
