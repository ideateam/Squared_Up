//
//  SquareUpFBC.m
//  Squared_Up_fei
//
//  Created by Karl on 2018/6/27.
//  Copyright © 2018 Derek. All rights reserved.
//

#import "SquareUpFBC.h"

#define screen_width self.view.frame.size.width
#define screen_heght self.view.frame.size.height

@implementation SquareUpFBC
-(instancetype)initWithBaseFrame:(CGRect)frame andNum_of_squareness:(int)num_of_squareness andNum_of_squareness_horizontal:(int)num_of_squareness_horizontal andSquareness_width:(double)squareness_width andSquareness_height:(double)squareness_height andSquareness_padding_to_top:(double)squareness_padding_to_top andSquareness_padding_to_left:(double)squareness_padding_to_left andSquareness_padding_to_right:(double)squareness_padding_to_right andSquareness_avage_distence_horizental:(double)squareness_avage_distence_horizental andSquareness_avage_distence_vertical:(double)squareness_avage_distence_vertical{
    
    self = [super initWithFrame:frame];
    
    if (self) {
        self.userInteractionEnabled = YES;
        _baseframe = frame;
        _num_of_squareness = num_of_squareness;
        _num_of_squareness_horizontal = num_of_squareness_horizontal;
        _squareness_width = squareness_width;
        _squareness_height = squareness_height;
        _squareness_padding_to_top = squareness_padding_to_top;
        //_squareness_padding_to_bottom = squareness_padding_to_bottom;
        _squareness_padding_to_left = squareness_padding_to_left;
        _squareness_padding_to_right = squareness_padding_to_right;
        _squareness_avage_distence_vertical = squareness_avage_distence_vertical;
        _squareness_avage_distence_horizental = squareness_avage_distence_horizental;
        //_squareness_avage_distence_horizental = (_baseframe.size.width - _squareness_width * _num_of_squareness_horizontal)/(_num_of_squareness_horizontal+1);
        
        [self createSquareUpView];
    }
    
    return self;
}
-(void)createSquareUpView{
    
    _k_num=0;
    
    //开始循环自动绘制九宫格，外层默认循环100次，总的格子个数为 （100 * _num_of_squareness_horizontal），具体按照数量可自己增加
    for (int i = 0; i < 100; i++) {
        
        for (int j = 0; j < _num_of_squareness_horizontal; j++) {
            
            if (_k_num == _num_of_squareness) {
                //NSLog(@"break k_um=%d",_k_num);
                break;//达到设定的数量就停止追加格子
            }
            //生成格子,默认格子是UIview，你可以根据需要改成UIbutton或者UIimageview等都可以
            self.squareness_view = [[UIView alloc] initWithFrame: CGRectMake(_squareness_padding_to_left + _squareness_avage_distence_horizental * ( j ) + ( j ) * _squareness_width, i == 0 ? _squareness_padding_to_top : (_squareness_height * i + i * _squareness_avage_distence_vertical + _squareness_padding_to_top), _squareness_width, _squareness_height)];
            _squareness_view.userInteractionEnabled = YES;
            _squareness_view.tag = 10000 + _k_num ;// 0 到 （_k_num - 1）
            _squareness_view.backgroundColor=[UIColor redColor];
            //添加点击手势
            UITapGestureRecognizer *tapThisView = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapThisView:)];
            [_squareness_view addGestureRecognizer:tapThisView];
            //添加到父视图
            [self addSubview:_squareness_view];
            
            _k_num=_k_num + 1;//计算数量
             //NSLog(@"count k_um=%d  %ld",_k_num,_squareness_view.tag);
        }
    }
}
-(void)tapThisView:(UITapGestureRecognizer *)tapGestureRecognizer{
    
    //NSLog(@"tapThisView = %ld",tapGestureRecognizer.view.tag);
    
    if ([_delegate respondsToSelector:@selector(whichViewIsTap:)]) {
        [_delegate whichViewIsTap:tapGestureRecognizer];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
