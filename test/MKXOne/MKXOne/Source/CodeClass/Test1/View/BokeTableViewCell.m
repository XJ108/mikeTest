//
//  BokeTableViewCell.m
//  MKXOne
//
//  Created by mike on 16/5/12.
//  Copyright © 2016年 mike. All rights reserved.
//

#import "BokeTableViewCell.h"
#define Number15 15
#define NUmber40 40
#define Number20 20
#define Number10 10
#define Number5   5


@interface BokeTableViewCell ()
@property (nonatomic, strong) UIImageView *iconImageView;
@property (nonatomic, strong) UILabel *usernameLabel;
@property (nonatomic, strong) UILabel *detailLabel;
@property (nonatomic, strong) UILabel *lastReturn;
@property (nonatomic, strong) UILabel *lastReturnTime;
@property (nonatomic, strong) UILabel *commentNumberLabel;
@property (nonatomic, strong) UIImageView *hotImageView;
@property (nonatomic, strong) MASConstraint *leftConstraint;


@end

@implementation BokeTableViewCell
-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self setupView];
    }
    return self;
}


- (void)setupView {
    self.isAccessibilityElement = YES;
    self.iconImageView = [UIImageView new];
    self.usernameLabel = [UILabel new];
    self.detailLabel = [UILabel new];
    self.lastReturn = [UILabel new];
    self.lastReturnTime = [UILabel new];
    self.commentNumberLabel = [UILabel new];
    self.hotImageView = [UIImageView new];
    self.detailLabel.numberOfLines = 2;
    self.iconImageView.image = [UIImage imageNamed:@"icon"];
    
    self.iconImageView.backgroundColor = [UIColor redColor];
    self.usernameLabel.backgroundColor = [UIColor greenColor];
    self.detailLabel.backgroundColor = [UIColor grayColor];
    self.lastReturn.backgroundColor = [UIColor purpleColor];
    self.lastReturnTime.backgroundColor = [UIColor orangeColor];
    self.commentNumberLabel.backgroundColor = [UIColor blueColor];
    self.hotImageView.backgroundColor = [UIColor blackColor];
    
    [self addSubviews:@[self.iconImageView, self.usernameLabel, self.detailLabel, self.lastReturn, self.lastReturnTime, self.commentNumberLabel, self.hotImageView]];
    [self setupConstraint];
}

-(void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
}

-(void)setHighlighted:(BOOL)highlighted animated:(BOOL)animated {
    [super setHighlighted:highlighted animated:animated];

}


- (void)setupConstraint {
    WeakObj(self);
    [self.iconImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.equalTo(selfWeak.contentView).with.offset(Number20);
        make.width.height.mas_equalTo(NUmber40);
    }];
    
    [self.usernameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(selfWeak.iconImageView);
        make.left.mas_equalTo(selfWeak.iconImageView.mas_right).with.offset(Number20);
        make.right.equalTo(selfWeak.contentView).with.offset(-Number20);
        make.height.mas_equalTo(Number20);
    }];
    
//    if (self.isAccessibilityElement == YES) {
        [self.hotImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(selfWeak.usernameLabel);
            make.height.width.mas_equalTo(Number20);
            make.top.mas_equalTo(selfWeak.usernameLabel.mas_bottom).with.offset(Number5);
        }];
        
        [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.equalTo(selfWeak.hotImageView);
            make.left.equalTo(selfWeak.usernameLabel).with.offset(Number5 + Number20);
            make.right.equalTo(selfWeak.usernameLabel);
            make.height.mas_equalTo(50);
        }];
    
        [self.lastReturn mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(selfWeak.hotImageView);
            make.width.mas_equalTo(60);
            make.height.mas_equalTo(30);
            make.top.mas_equalTo(selfWeak.detailLabel.mas_bottom).with.offset(Number10);
        }];
        
        
//    }
    
    
}

-(void)setIndex:(int)index {
    if (_index != index) {
        _index = index;
    }
    if (index == 1) {
        [self changeDetailLabelConstraint:25];
    }else {
        [self changeDetailLabelConstraint:50];
    }
}

- (void) changeDetailLabelConstraint: (CGFloat) height{
    [self.detailLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo(height);
        [super updateConstraints];
    }];
}

-(void)setIsAppearHotImageView:(BOOL)isAppearHotImageView{
    if (_isAppearHotImageView != isAppearHotImageView) {
        _isAppearHotImageView = isAppearHotImageView;
    }
    [self hiddenHotImageView:isAppearHotImageView];
}

- (void) hiddenHotImageView: (BOOL)hidden {
    WeakObj(self);
    if (hidden) {
        self.hotImageView.hidden = YES;
        [self.detailLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(selfWeak.usernameLabel);
            [super updateConstraints];
        }];

    }else {
        self.hotImageView.hidden = NO;
        [self.detailLabel mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.equalTo(selfWeak.usernameLabel).with.offset(Number5 + Number20);
            [super updateConstraints];
        }];
        
    }
}



- (void)awakeFromNib {
    // Initialization code
}


@end
