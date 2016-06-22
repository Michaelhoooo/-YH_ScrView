//
//  mainViewController.m
//  侧滑2点33
//
//  Created by hezihao on 16/4/8.
//  Copyright © 2016年 webuddy. All rights reserved.
//

#import "mainViewController.h"

@interface mainViewController ()
@property (nonatomic,assign)BOOL flag;
@end

@implementation mainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor grayColor];
    UIButton *btn = [[UIButton alloc]initWithFrame:CGRectMake(5, 20, 30, 30)];
    btn.backgroundColor = [UIColor blackColor];
    [btn addTarget:self action:@selector(btnClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    self.flag = YES;
}
- (void)btnClick
{
    if (self.flag==YES) {
        [UIView animateWithDuration:0.5 animations:^{
            self.view.transform = CGAffineTransformMakeTranslation(320, 0) ;
            self.flag=NO;
        }];

    }else{
        [UIView animateWithDuration:0.5 animations:^{
            self.view.transform = CGAffineTransformIdentity;
            self.flag = YES;
        }];
    }
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
