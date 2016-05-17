//
//  ViewController.m
//  LFNetWorkingDemo
//
//  Created by MacBook_liufei on 15/5/12.
//  Copyright © 2016年 Madiffer. All rights reserved.
//

#import "ViewController.h"
#import "LFNetworking.h"


@interface ViewController ()

@property (weak, nonatomic) IBOutlet UIButton *start;
@property (weak, nonatomic) IBOutlet UIButton *suspend;
@property (weak, nonatomic) IBOutlet UIButton *resume;

// 显示进度的label
@property (weak, nonatomic) IBOutlet UILabel *progressLab;

@property (nonatomic,strong) LFURLSessionTask *task;

@end

@implementation ViewController

- (IBAction)startLoad:(id)sender {
    
    NSString *path = [NSHomeDirectory() stringByAppendingString:[NSString stringWithFormat:@"/Documents/image.jpg"]];
    
    _task = [LFNetworking downloadWithUrl:@"http://www.aomy.com/attach/2012-09/1347583576vgC6.jpg" saveToPath:path progress:^(int64_t bytesProgress, int64_t totalBytesProgress) {
        
        _progressLab.text = [NSString stringWithFormat:@"%.2f",1.00 * bytesProgress/totalBytesProgress];
        
    } success:^(id response) {
        
        NSLog(@"---- %@",response);
        
    } failure:^(NSError *error) {
        
        NSLog(@" ---- %@",error);
        
    } showHUD:NO];
    
    
}
- (IBAction)suspend:(id)sender {
    
    [_task suspend];
}

- (IBAction)resume:(id)sender {
    
    [_task resume];
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
