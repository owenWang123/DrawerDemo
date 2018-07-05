//
//  CenterSecondViewController.m
//  HTDrawerDemo
//
//  Created by admin on 2018/7/3.
//  Copyright © 2018年 owen. All rights reserved.
//

#import "CenterSecondViewController.h"
#import "RESideMenu.h"
#import "InfoViewController.h"

@interface CenterSecondViewController ()<UIScrollViewDelegate>
@property (nonatomic, strong) UIScrollView *scrollView;
@property (nonatomic, assign) BOOL canPresentMenu;
@end

#define HT_isiPhoneX ([UIScreen instancesRespondToSelector:@selector(currentMode)] ? CGSizeEqualToSize(CGSizeMake(1125, 2436), [[UIScreen mainScreen] currentMode].size) : NO)
#define HT_TabbarSafeBottomMargin         (HT_isiPhoneX ? 34.f : 0.f)
#define HT_StatusBarAndNavigationBarHeight  (HT_isiPhoneX ? 88.f : 64.f)
@implementation CenterSecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configUI];
}

- (void)configUI{
    self.title = @"Second Center";
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:@"Left"
                                                                             style:UIBarButtonItemStylePlain
                                                                            target:self
                                                                            action:@selector(presentLeftMenuViewController:)];
    
    self.scrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, HT_StatusBarAndNavigationBarHeight, self.view.bounds.size.width, self.view.bounds.size.height-HT_StatusBarAndNavigationBarHeight)];
    [self.view addSubview:self.scrollView];
    self.scrollView.delegate = self;
    self.scrollView.pagingEnabled = YES;
    self.scrollView.backgroundColor = [UIColor whiteColor];
    self.scrollView.contentSize = CGSizeMake(self.view.bounds.size.width *2, self.view.bounds.size.height-HT_StatusBarAndNavigationBarHeight-HT_TabbarSafeBottomMargin);
    
    UIImageView *imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, self.view.bounds.size.width, self.view.bounds.size.height-HT_StatusBarAndNavigationBarHeight)];
    [self.scrollView addSubview:imageView1];
    imageView1.contentMode = UIViewContentModeScaleToFill;
    imageView1.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    imageView1.image = [UIImage imageNamed:@"Stars"];
    
    UIImageView *imageView2 = [[UIImageView alloc] initWithFrame:CGRectMake(self.view.bounds.size.width, 0, self.view.bounds.size.width, self.view.bounds.size.height-HT_StatusBarAndNavigationBarHeight)];
    [self.scrollView addSubview:imageView2];
    imageView2.contentMode = UIViewContentModeScaleToFill;
    imageView2.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    imageView2.image = [UIImage imageNamed:@"Balloon"];
}
#pragma mark- ScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    CGPoint offset = scrollView.contentOffset;
    NSLog(@"Begin:%f,%f",offset.x,offset.y);
    if (offset.x == 0) {
        self.canPresentMenu = YES;
    }else{
        self.canPresentMenu = NO;
    }
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGPoint offset = scrollView.contentOffset;
    NSLog(@"Did:%f,%f",offset.x,offset.y);
    if (offset.x < 0 && self.canPresentMenu) {
        self.canPresentMenu = NO;
        //切换侧边栏
        [self presentLeftMenuViewController:self.navigationItem.leftBarButtonItem];
    }
}
#pragma mark-
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
