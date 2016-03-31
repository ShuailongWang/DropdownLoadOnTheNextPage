//
//  ViewController.m
//  DropdownLoadOnTheNextPage
//
//  Created by 武建明 on 16/3/30.
//  Copyright © 2016年 Four_w. All rights reserved.
//

#import "ViewController.h"
#import "ScrollViewDemo.h"
#import "TableViewDemo.h"

@interface ViewController ()
@property(strong, nonatomic) UIButton *scrollDemoBtn;
@property(strong, nonatomic) UIButton *tableDemoBtn;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.title = @"首页";
    [self.view addSubview:self.scrollDemoBtn];
    [self.view addSubview:self.tableDemoBtn];
    
}
#pragma mark - Property
- (UIButton *)scrollDemoBtn
{
 
    if (!_scrollDemoBtn) {
        _scrollDemoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _scrollDemoBtn.frame = CGRectMake(50, 100, [UIScreen mainScreen].bounds.size.width-100, 30);
        [_scrollDemoBtn setTitle:@"顶部是scrollView的Demo" forState:UIControlStateNormal];
        [_scrollDemoBtn setTitleColor:[UIColor  lightGrayColor] forState:UIControlStateNormal];
        _scrollDemoBtn.tag = 100;
        [_scrollDemoBtn addTarget:self action:@selector(dealBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _scrollDemoBtn;
}
- (UIButton *)tableDemoBtn
{
    
    if (!_tableDemoBtn) {
        _tableDemoBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        _tableDemoBtn.frame = CGRectMake(50, 200, [UIScreen mainScreen].bounds.size.width-100, 30);
        [_tableDemoBtn setTitle:@"顶部是tableView的Demo" forState:UIControlStateNormal];
        [_tableDemoBtn setTitleColor:[UIColor  lightGrayColor] forState:UIControlStateNormal];
        _tableDemoBtn.tag = 200;
        [_tableDemoBtn addTarget:self action:@selector(dealBtn:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _tableDemoBtn;
}
#pragma mark - Action
- (void)dealBtn:(UIButton *)button
{
    if (button.tag == 100) {
        [self.navigationController pushViewController:[[ScrollViewDemo alloc]init] animated:YES];
    }else{
        [self.navigationController pushViewController:[[TableViewDemo alloc]init] animated:YES];
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
