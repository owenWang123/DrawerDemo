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

@interface CenterSecondViewController ()
@property (nonatomic, strong) UIButton *nextBtn;

@end

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
    
    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.contentMode = UIViewContentModeScaleAspectFill;
    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
    imageView.image = [UIImage imageNamed:@"Stars"];
    [self.view addSubview:imageView];
    
    self.nextBtn = [[UIButton alloc]initWithFrame:CGRectMake(50, self.view.frame.size.height/2 -30, self.view.frame.size.width-100, 60)];
    [self.view addSubview:self.nextBtn];
    self.nextBtn.backgroundColor = [UIColor whiteColor];
    [self.nextBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    self.nextBtn.layer.masksToBounds = YES;
    self.nextBtn.layer.cornerRadius = 30;
    [self.nextBtn setTitle:@"Next Page" forState:UIControlStateNormal];
    [self.nextBtn addTarget:self action:@selector(nextButtonAction) forControlEvents:UIControlEventTouchUpInside];
}

- (void)nextButtonAction{
    InfoViewController *controller = [[InfoViewController alloc]init];
    
    [self.navigationController pushViewController:controller animated:YES];
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
