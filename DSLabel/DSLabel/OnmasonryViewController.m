//
//  OnmasonryViewController.m
//  DSLabel
//
//  Created by YMY on 15/8/8.
//  Copyright (c) 2015年 dasheng. All rights reserved.
//

#import "OnmasonryViewController.h"
#import "DSAttributedLabel.h"
#import "Masonry.h"

@implementation OnmasonryViewController

-(void)viewDidLoad{
    
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    switch (self.type) {
        case 0:
            [self drawLine];
            break;
        case 1:
            [self lineSpace];
            break;
        case 2:
            [self differentFont];
            break;
        default:
            break;
    }
    
}

-(void)drawLine{
    
    UIView *textView = [[UIView alloc] initWithFrame:CGRectMake(10, 70, 200, 200)];
    textView.backgroundColor = [UIColor blueColor];
    
    DSAttributedLabel *labelVer2 = [[DSAttributedLabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-20, 100)];
    labelVer2.backgroundColor = [UIColor redColor];
    labelVer2.textColor = [UIColor blackColor];
    labelVer2.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    labelVer2.textAlignment = NSTextAlignmentLeft;
    labelVer2.verticalAlignment = VerticalAlignmentTop;
    labelVer2.numberOfLines = 0;
    labelVer2.text = @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈";
    labelVer2.lineBreakMode = NSLineBreakByCharWrapping;
    labelVer2.lineColor = [UIColor blackColor];
    labelVer2.lineHeight = 1;
    labelVer2.lineType = LineTypeMiddle;
    [textView addSubview:labelVer2];
    
    [labelVer2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(textView).offset(10);
        make.right.equalTo(textView.right).offset(-10);
        make.top.equalTo(textView.top).offset(10);
    }];
    
    [self.view addSubview:textView];
}

-(void)lineSpace{
    
    UIView *textView = [[UIView alloc] initWithFrame:CGRectMake(10, 70, 200, 200)];
    textView.backgroundColor = [UIColor blueColor];
    
    DSAttributedLabel *labelVer2 = [[DSAttributedLabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width-20, 100)];
    labelVer2.backgroundColor = [UIColor redColor];
    labelVer2.textColor = [UIColor blackColor];
    labelVer2.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    labelVer2.textAlignment = NSTextAlignmentLeft;
    labelVer2.verticalAlignment = VerticalAlignmentTop;
    labelVer2.numberOfLines = 0;
    labelVer2.text = @"哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈哈";
    labelVer2.lineBreakMode = NSLineBreakByCharWrapping;
    labelVer2.lineSpace = 10;
    [textView addSubview:labelVer2];
    
    [labelVer2 mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(textView).offset(10);
        make.right.equalTo(textView.right).offset(-10);
        make.top.equalTo(textView.top).offset(10);
    }];
    
    [self.view addSubview:textView];
}

-(void)differentFont{
    
    DSAttributedLabel *labelVer2 = [[DSAttributedLabel alloc] initWithFrame:CGRectMake(10, 100, self.view.frame.size.width-20, 100)];
    labelVer2.backgroundColor = [UIColor redColor];
    labelVer2.textColor = [UIColor blackColor];
    labelVer2.font = [UIFont fontWithName:@"Helvetica-Bold" size:18];
    labelVer2.textAlignment = NSTextAlignmentLeft;
    labelVer2.verticalAlignment = VerticalAlignmentTop;
    labelVer2.numberOfLines = 0;
    labelVer2.lineBreakMode = NSLineBreakByCharWrapping;
    
    
    NSString *textString = @"我生在北方的小城，静静的潮白河边，为纪念她的宁静，我的名字叫做安";
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:textString];
    
    [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:10] range:[textString rangeOfString:@"我生在"]];
    [attrString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:[textString rangeOfString:@"北方的小城"]];
    labelVer2.attributedText = attrString;
    //labelVer2.lineSpace = 10;
    
    [self.view addSubview:labelVer2];
}

@end
