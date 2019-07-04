//
//  ViewController.m
//  TestDemo
//
//  Created by tianmaotao on 2018/5/25.
//  Copyright © 2018年 tianmaotao. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"

@interface TestLabel : UILabel

@end

@implementation TestLabel

- (CGRect)textRectForBounds:(CGRect)bounds limitedToNumberOfLines:(NSInteger)numberOfLines {
    CGRect textRect = [super textRectForBounds:bounds limitedToNumberOfLines:numberOfLines];
    textRect.origin.y = bounds.origin.y;
    return textRect;
}

-(void)drawTextInRect:(CGRect)requestedRect {
    CGRect actualRect = [self textRectForBounds:requestedRect limitedToNumberOfLines:self.numberOfLines];
    [super drawTextInRect:actualRect];
}
@end

@interface ViewController ()
@property (nonatomic, strong) TestLabel *tView;
@property (nonatomic, copy) NSString *testStr;
@property (nonatomic, assign) BOOL isSure;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.isSure = NO;
    
    self.testStr = @"原作：丸户史明（富士见Fantasia文库）\r\n角色原案：深崎暮人\r\n监督：龟井干太";
    self.tView = [[TestLabel alloc] initWithFrame:CGRectZero];
    self.tView.numberOfLines = 0;
    self.tView.text = self.testStr;
    self.tView.backgroundColor = [UIColor lightGrayColor];
    self.tView.userInteractionEnabled = NO;
    self.tView.lineBreakMode = NSLineBreakByWordWrapping;
    self.tView.font = [UIFont fontWithName:@"PingFangSC-Regular" size:14];
    [self.view addSubview:self.tView];
    [self.tView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(12);
        make.top.equalTo(self.view.mas_top).offset(100);
        make.height.equalTo(@(100));
        make.width.equalTo(@(300));
    }];
}
- (IBAction)action1:(id)sender {
    NSDictionary *attributes = @{NSFontAttributeName : [UIFont fontWithName:@"PingFangSC-Regular" size:14]};
    CGFloat evaluateHeight = [self heightWithText:self.testStr attributes:attributes width:300];
    CGFloat height = 0;
    if (self.isSure) {
        height = 59;
        self.isSure = NO;
    } else{
        height = evaluateHeight;
        self.isSure = YES;
    }
    [self.tView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.equalTo(@(height));
    }];
}

- (CGFloat)heightWithText:(NSString *)text attributes:(NSDictionary *)attributes width:(CGFloat)width {
    if (text.length < 0 || width <= 0 || !attributes) {
        return 0;
    }
    
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading attributes:attributes context:nil];
    return rect.size.height;
}

- (void)viewDidLayoutSubviews {
    [super viewDidLayoutSubviews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)work1Function {
    NSLog(@"work 1");
}

@end
