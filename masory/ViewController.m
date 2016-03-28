//
//  ViewController.m
//  masory
//
//  Created by 刘青山 on 16/3/28.
//  Copyright © 2016年 刘青山. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "NextViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self createNewMasory];
}

-(void)createNewMasory
{
    self.view.backgroundColor=[UIColor whiteColor];
    UIView *sv = [UIView new];
    sv.backgroundColor = [UIColor blackColor];
    [self.view addSubview:sv];
    [sv mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self.view);
        make.size.mas_equalTo(CGSizeMake(100, 100));
    }];
    
    UIView *view1=[[UIView alloc]init];
    view1.backgroundColor=[UIColor redColor];
    [sv addSubview:view1];
    [view1 mas_makeConstraints:^(MASConstraintMaker *make) {
       make.edges.equalTo(sv).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    [view1 mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(sv).with.insets(UIEdgeInsetsMake(10, 10, 10, 10));
    }];
    
    
    UIView *view2=[[UIView alloc]init];
    view2.backgroundColor=[UIColor yellowColor];
    [view1 addSubview:view2];
    
    UIView *view3=[[UIView alloc]init];
    view3.backgroundColor=[UIColor brownColor];
    [view1 addSubview:view3];
    
    
    int padding1 = 10;
    [view2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(sv.mas_centerY);
        make.left.equalTo(view1.mas_left).with.offset(padding1);
        make.right.equalTo(view3.mas_left).with.offset(-padding1);
        make.height.mas_equalTo(@50);
        make.width.equalTo(view3);
    }];
    [view3 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(view1.mas_centerY);
        make.left.equalTo(view2.mas_right).with.offset(padding1);
        make.right.equalTo(view1.mas_right).with.offset(-padding1);
        make.height.mas_equalTo(@50);
        make.width.equalTo(view2);
    }];
    
    UIButton *nextViewButton=[UIButton buttonWithType:UIButtonTypeSystem];
    [nextViewButton setTitle:@"next" forState:UIControlStateNormal];
    [nextViewButton setBackgroundColor:[UIColor blueColor]];
    [nextViewButton addTarget:self action:@selector(nextViewController) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:nextViewButton];
    [nextViewButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).with.insets(UIEdgeInsetsMake(self.view.frame.size.height-10-35, self.view.frame.size.width-10-80, 10, 10));
    }];

}



-(void)nextViewController
{
    NextViewController *ctrl=[[NextViewController alloc]init];
    [self.navigationController pushViewController:ctrl animated:YES];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
