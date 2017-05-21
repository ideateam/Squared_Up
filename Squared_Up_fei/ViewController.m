//
//  ViewController.m
//  Squared_Up_fei
//
//  Created by Derek on 2017/5/21.
//  Copyright © 2017年 Derek. All rights reserved.
//存在的问题：对于不同屏幕，需要考虑每一种屏幕的宽度，手动设置对应的格子宽高和每一行数量。解决方法：直接添加一个判断屏幕宽度的语句，然后自动设置对应的每一行格子数量即可

#import "ViewController.h"
#define screen_width self.view.frame.size.width
#define screen_heght self.view.frame.size.height
@interface ViewController ()
{
    int num_of_squareness;//九宫格的矩形数量，多少个
    int num_of_squareness_horizontal; //每一行数量
    int squareness_width;//矩形宽
    int squareness_height;//矩形高
    int squareness_padding_to_top;//矩形距离上方的距离
    int squareness_padding_to_bottom;//矩形距离下方的距离
    int squareness_avage_distence_horizental;//水平方向每一个的平均距离

    int squareness_avage_distence_vertical;//垂直方向的每一个的平均距离
    UIView *squareness_view;//矩形视图
    
    //统计各自的数量
    int k_num;
    
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //先定义你的九宫格的具体需要
    num_of_squareness=24;
    num_of_squareness_horizontal=8;
    
    //在设定每一个格子的宽和高时候，要明确屏幕的宽度，否则会出现重叠，超过屏幕。
    squareness_width=30;
    squareness_height=100;
    squareness_avage_distence_horizental=(screen_width-squareness_width * num_of_squareness_horizontal)/(num_of_squareness_horizontal+1);
    squareness_avage_distence_vertical=30;

    
    k_num=0;
    
    NSLog(@"screen=%lf",screen_width);
    NSLog(@"h=%d",squareness_avage_distence_horizental);
    
    //开始自动绘制九宫格
    for (int i=0; i<100; i++) {
        for (int j=0; j<num_of_squareness_horizontal; j++) {
            
            if (k_num==num_of_squareness) {
                NSLog(@"k_um=%d",k_num);
                break;//达到设定的数量就停止追加格子
            }

            
            
            squareness_view= [[UIView alloc]initWithFrame:CGRectMake(squareness_avage_distence_horizental * (j+1)+(j)*squareness_width, squareness_height * (i)+(i+1)*squareness_avage_distence_vertical, squareness_width, squareness_height)];
            squareness_view.backgroundColor=[UIColor redColor
                                             ];
            [self.view addSubview:squareness_view];
            
            k_num=k_num+1;//计算数量
        }
    }
    
    

}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
