//
//  MyViewController.m
//  MKXOne
//
//  Created by mike on 16/5/12.
//  Copyright © 2016年 mike. All rights reserved.
//

#import "MyViewController.h"

#define animationTime 0.5
#define viewHeight 100.0
#define buttonWidth 60.0

@interface MyViewController()


@property (nonatomic, strong) UIView *firstView;
@property (nonatomic, strong) UIView *secondView;
@property (nonatomic, strong) UIPanGestureRecognizer *pan;
@property (nonatomic, strong) UITapGestureRecognizer *tap;
@property (nonatomic, assign) CGPoint startPoint;
@property (nonatomic, assign) CGPoint stopPoint;


@end



@implementation MyViewController

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setupView];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self setupView];
    }
    return self;
}

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self setupView];
    }
    return self;
}


- (void) setupView
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.firstView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, viewHeight)];
    self.secondView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, viewHeight)];
    self.firstView.backgroundColor = [UIColor lightGrayColor];
    self.secondView.backgroundColor = [UIColor orangeColor];
    
    [self.view addSubview:self.secondView];
    [self.view addSubview:self.firstView];
    
    self.pan = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(panAction:)];
    [self.firstView addGestureRecognizer:self.pan];
    
    self.tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapAction:)];
    [self.firstView addGestureRecognizer:self.tap];
    
    [self createLeftButtons];
    [self createRightButtons];
    

    
}
- (void)viewDidLoad {
    [super viewDidLoad];

    
}


#pragma mark 手势
- (void) tapAction: (UITapGestureRecognizer *)tap
{
    if (self.firstView.frame.origin.x == 0) {
        UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"wwwww" message:@"wwww" preferredStyle:UIAlertControllerStyleAlert];
        [self presentViewController:alert animated:YES completion:nil];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [alert dismissViewControllerAnimated:YES completion:nil];
        });
    }else {
        [self firstViewReduction];
    }

}

- (void) panAction: (UIPanGestureRecognizer *)pan
{
    if (pan.state == UIGestureRecognizerStateBegan) {
        self.startPoint = [pan locationInView:self.firstView];
    }
    if (pan.state == UIGestureRecognizerStateChanged) {
        self.stopPoint = [pan locationInView:self.firstView];
        self.firstView.transform = CGAffineTransformTranslate(self.firstView.transform, self.stopPoint.x - self.startPoint.x, 0);
    }
    if (pan.state == UIGestureRecognizerStateEnded) {
        if (self.firstView.frame.origin.x > - buttonWidth && self.firstView.frame.origin.x < buttonWidth) {
            [UIView animateWithDuration:animationTime animations:^{
                _firstView.frame = CGRectMake(0, 0, _firstView.frame.size.width, _firstView.frame.size.height);
            }];
        }else {
            if (self.leftButtonArray.count > 0 && self.firstView.frame.origin.x > (self.leftButtonArray.count * buttonWidth)) {
                [UIView animateWithDuration:animationTime animations:^{
                    _firstView.frame = CGRectMake(CGRectGetMaxX([[_leftButtonArray lastObject] frame]), 0, kScreenWidth, viewHeight);
                }];
            }else if (self.leftButtonArray.count > 0 && self.firstView.frame.origin.x > buttonWidth && self.firstView.frame.origin.x < (self.leftButtonArray.count * buttonWidth)){
                [UIView animateWithDuration:animationTime animations:^{
                    _firstView.frame = CGRectMake(CGRectGetMaxX([[_leftButtonArray lastObject] frame]), 0, kScreenWidth, viewHeight);
                }];
            } else if (self.rightButtonArray.count > 0 && self.firstView.frame.origin.x < - (self.rightButtonArray.count * buttonWidth)) {
                [UIView animateWithDuration:animationTime animations:^{
                    _firstView.frame = CGRectMake(- (self.rightButtonArray.count * buttonWidth), 0, _firstView.frame.size.width, _firstView.frame.size.height);
                }];
            }else if (self.rightButtonArray.count > 0 && self.firstView.frame.origin.x > - (self.rightButtonArray.count * buttonWidth) && self.firstView.frame.origin.x < -buttonWidth ){
                [UIView animateWithDuration:animationTime animations:^{
                    _firstView.frame = CGRectMake(- (self.rightButtonArray.count * buttonWidth), 0, _firstView.frame.size.width, _firstView.frame.size.height);
                }];
                
            }
        }
    }
}


#pragma mark  创建左侧按钮和点击时间
- (void) createLeftButtons
{
//    if (self.leftButtonArray.count <= 0) {
        self.leftButtonArray = [NSMutableArray array];
        for (int i = 0; i < 3; i++) {
            @autoreleasepool {
                UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(buttonWidth * i, 0, buttonWidth, viewHeight)];
                btn.tag = 101 + 1 * i;
                [btn setTitle:[NSString stringWithFormat:@"%d", i] forState:UIControlStateNormal];
                btn.backgroundColor = [UIColor greenColor];
                [btn addTarget:self action:@selector(leftButtonAction:) forControlEvents:UIControlEventTouchUpInside];
                [self.leftButtonArray  addObject:btn];
                [self.secondView addSubview:btn];
            }
        }
//    }
}

- (void)leftButtonAction: (UIButton *)sender
{
    if (sender.tag == 101) {
        NSLog(@"left1111");
    }else if (sender.tag == 102) {
        NSLog(@"left2222");
    }else if (sender.tag == 103) {
        NSLog(@"left3333");
    }
    [self firstViewReduction];
}

#pragma mark 创建右侧按钮和点击时间

- (void) createRightButtons
{
    self.rightButtonArray = [NSMutableArray array];
    for (int i = 0; i < 2; i++) {
        @autoreleasepool {
            UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth - buttonWidth * (i + 1), 0, buttonWidth, viewHeight)];
            if (i == 0) {
                [btn setTitle:@"delete" forState:UIControlStateNormal];
            }else {
                [btn setTitle:@"more" forState:UIControlStateNormal];
            }
            btn.tag = 200 + i + 1;
            btn.backgroundColor = [UIColor darkGrayColor];
            [btn addTarget:self action:@selector(rightButtonAction:) forControlEvents:UIControlEventTouchUpInside];
            [self.rightButtonArray addObject:btn];
            [self.secondView addSubview:btn];
            
        }
    }
}

- (void) rightButtonAction: (UIButton *)sender
{
    if (sender.tag == 201) {
        NSLog(@"right delete");
    }else if (sender.tag == 202) {
        NSLog(@"right more");
    }
    [self firstViewReduction];
    
}

#pragma mark  FirstView 位置还原
- (void) firstViewReduction
{
    WeakObj(self);
    [UIView animateWithDuration:animationTime animations:^{
        selfWeak.firstView.frame = CGRectMake(0, 0, selfWeak.firstView.frame.size.width, selfWeak.firstView.frame.size.height);
    }];
}


@end
