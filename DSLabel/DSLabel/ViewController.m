//
//  ViewController.m
//  DSLabel
//
//  Created by YMY on 15/8/3.
//  Copyright (c) 2015年 dasheng. All rights reserved.
//

#import "ViewController.h"
#import "AttributedLabelViewController.h"
#import "OnmasonryViewController.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>{
    
    NSArray *_dataArray;
    
    NSArray *_dataArray2;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _dataArray = @[@"FontColor",@"lineBreakMode",@"Alignment"];
    
    _dataArray2 = @[@"画线",@"行间距",@"富文本不同字体大小"];
    UITableView *_table = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.height)];
    
    _table.delegate = self;
    _table.dataSource = self;
    [self.view addSubview:_table];
    // Do any additional setup after loading the view, typically from a nib.
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (section == 0) {
        return [_dataArray count];
    }else{
        return [_dataArray2 count];
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    return 44;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString * cellName = @"UITableViewCell";
    
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:cellName];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellName];
    }
    [cell.textLabel setTextColor:[UIColor blackColor]];
    
    if (indexPath.section == 0) {
        cell.textLabel.text = [_dataArray objectAtIndex:indexPath.row];
    }else{
        cell.textLabel.text = [_dataArray2 objectAtIndex:indexPath.row];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 0) {
        AttributedLabelViewController *attributedVC = [[AttributedLabelViewController alloc] init];
        
        switch (indexPath.row) {
            case 0:
                attributedVC.labelType = labelTypeFontColor;
                break;
            case 1:
                attributedVC.labelType = labelTypeLineBreakMode;
                break;
            case 2:
                attributedVC.labelType = labelTypeAlignment ;
                break;
            default:
                break;
        }
        [self.navigationController pushViewController:attributedVC animated:YES];
    }else{
        OnmasonryViewController *VC = [[OnmasonryViewController alloc] init];
        switch (indexPath.row) {
            case 0:
                VC.type = dsLabelTypeLine;
                break;
            case 1:
                VC.type = dsLabelTypeSpace;
                break;
            case 2:
                VC.type = dsLabelTypeAttrFont;
                break;
            default:
                break;
        }
        [self.navigationController pushViewController:VC animated:YES];
    }
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
