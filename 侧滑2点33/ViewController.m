//
//  ViewController.m
//  侧滑2点33
//
//  Created by hezihao on 16/4/8.
//  Copyright © 2016年 webuddy. All rights reserved.
//

#import "ViewController.h"
#import "mainViewController.h"
#import "caidanViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    caidanViewController *caidanvc = [[caidanViewController alloc]init];
    caidanvc.view.frame = CGRectMake(0, 0, 320, 667);
    [self.view addSubview:caidanvc.view];
    [self addChildViewController:caidanvc];
    
    mainViewController *mainvc = [[mainViewController alloc]init];
    mainvc.view.frame = self.view.frame ;
    [self.view addSubview:mainvc.view];
    [self addChildViewController:mainvc];
    
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc]initWithTarget:self action:@selector(pan:)];
    [mainvc.view addGestureRecognizer:pan];
   
}
- (void)pan:(UIPanGestureRecognizer*)paning
{
     CGPoint point = [paning translationInView:paning.view];
       if (paning.state ==UIGestureRecognizerStateEnded||paning.state==UIGestureRecognizerStateCancelled) {
        if (paning.view.transform.tx >=160) {
            [UIView animateWithDuration:0.5 animations:^{
                paning.view.transform = CGAffineTransformMakeTranslation(320, 0) ;
            }];
        }
        else{
            [UIView animateWithDuration:0.5 animations:^{
                paning.view.transform = CGAffineTransformIdentity;            }];

        }
    }else {
       
        paning.view.transform =   CGAffineTransformTranslate(paning.view.transform, point.x, 0);
        [paning setTranslation:CGPointZero inView:paning.view];
        if (paning.view.transform.tx>=320) {
            paning.view.transform = CGAffineTransformMakeTranslation(320, 0);
        }else if (paning.view.transform.tx<=0)
        {
            paning.view.transform = CGAffineTransformIdentity ;
        }
    }
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
