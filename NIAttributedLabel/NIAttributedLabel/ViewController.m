//
//  ViewController.m
//  NIAttributedLabel
//
//  Created by YMY on 15/8/11.
//  Copyright (c) 2015年 dasheng. All rights reserved.
//

#import "ViewController.h"
#import "NIAttributedLabel.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    
    NIAttributedLabel *label1 = [[NIAttributedLabel alloc] initWithFrame:CGRectMake(10, 100, 200, 200)];
    label1.numberOfLines = 0;
    label1.lineHeight = 40;
    
    label1.text = @"我生在南方的小城，静静的潮白河边，为纪念她的宁静，我的名字叫做安";

    [self.view addSubview:label1];
    
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
