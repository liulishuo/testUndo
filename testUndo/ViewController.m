//
//  ViewController.m
//  testUndo
//
//  Created by liulishuo on 15/12/21.
//  Copyright © 2015年 liulishuo. All rights reserved.
//

#import "ViewController.h"
#import "UITextField+UndoTest.h"

static const NSInteger  kMaxLength = 6;

@interface ViewController ()<UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *tf;

@property (nonatomic, strong) NSString *test;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    //    [_tf addTarget:self action:@selector(textFieldTextDidChanged:) forControlEvents:UIControlEventEditingChanged];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)click:(id)sender {
    
    //    [_tf updateText:@"ABC"];
    _tf.text = @"ABC";
}


//微信
- (void)textFieldTextDidChanged:(UITextField *)sender
{
    NSString * tempString = sender.text;
    
    if (sender.markedTextRange == nil && tempString.length > kMaxLength)
    {
        sender.text = [tempString substringToIndex:kMaxLength];
        [sender.undoManager removeAllActions];
        //        [sender updateText:[toBeString substringToIndex:kMaxLength]];
    }
}

- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
{
    
    //退格
    if([string isEqualToString:@""])
    {
        return YES;
    }
    
    //非联想状态
    if(!textField.markedTextRange)
    {
        NSString * tempString = [textField.text stringByReplacingCharactersInRange:range withString:string];
        NSLog(@"%@",tempString);
        
        if (tempString.length > kMaxLength)
        {
            textField.text = [tempString substringToIndex:kMaxLength];
            return NO;
        }
    }
    
    //文本长度满不允许编辑
    if(textField.text.length >= kMaxLength)
    {
        return NO;
    }
    
    return YES;
}

//喜马拉雅
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    if(range.location >= kMaxLength)
//    {
//        return NO;
//    }
//    else
//    {
//        return YES;
//    }
//}
@end
