# DropdownLoadOnTheNextPage
类似于淘宝,京东的上拉加载图文详情.下拉返回商品详情.使用MJRefresh.代码简单实用

#pragma mark - viewDidLoad
    [self.view addSubview:self.bgScrollView];
    [self.bgScrollView addSubview:self.subTableView];
    [self.bgScrollView addSubview:self.webView];

#pragma mark - SetUp
- (void)setSubTableViewRefreshFooter
{
    __weak typeof(self) weakSelf = self;
    
    MJRefreshBackNormalFooter *refreshFooter = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
        
        [weakSelf.bgScrollView scrollRectToVisible:CGRectMake(0, self.webView.originY-64, kSMainScreenWidth, kSMainScreenHeight) animated:YES];
        
        [weakSelf.subTableView.mj_footer endRefreshing];
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
    
    self.subTableView.mj_footer = refreshFooter;
    
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

