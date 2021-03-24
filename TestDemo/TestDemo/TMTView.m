//
//  TMTView.m
//  TestDemo
//
//  Created by 哔哩哔哩 on 2019/6/20.
//  Copyright © 2019 tianmaotao. All rights reserved.
//

#import "TMTView.h"

@interface TMTView ()
@property (nonatomic, strong) UITableView *tableView;
@end

@implementation TMTView
- (void)view_func1 {
    
}
- (void)view_func2 {
    
}
- (void)view_func3 {
    
}
- (instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style {
    if (self = [super initWithFrame:frame style:style]) {
        self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 300, 400) style:style];
        self.delegate = self;
        self.dataSource = self;
//        self.estimatedSectionHeaderHeight = 0;
//        self.estimatedSectionFooterHeight = 0;
        
        UIView *headerView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 300, 50)];
        headerView.backgroundColor = [UIColor purpleColor];
        self.tableHeaderView = headerView;
    }
    return self;
}

#pragma mark - tablViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 3;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [[UITableViewCell alloc] init];
    cell.backgroundColor = [UIColor redColor];
    return cell;
}

#pragma mark - tableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 40;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSLog(@"");
}

- (void)test {
    NSLog(@"");
}
@end
