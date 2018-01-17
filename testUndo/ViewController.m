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

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    //test for push
    [_tf addTarget:self action:@selector(textFieldTextDidChanged:) forControlEvents:UIControlEventEditingChanged];
    
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapToEndEdit)];
    [self.view addGestureRecognizer:tap];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)tapToEndEdit
{
    [self.view endEditing:YES];
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
        
        //手动注册
//        [sender updateText:[tempString substringToIndex:kMaxLength]];
    }
}

//微信
//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    
//    //退格
//    if([string isEqualToString:@""])
//    {
//        return YES;
//    }
//    
//    //文本长度满不允许编辑 防止系统九宫格键盘在此时传入数字标号字符
//    if(textField.text.length >= kMaxLength)
//    {
//        return NO;
//    }
//    
//    //非联想状态
//    if(!textField.markedTextRange)
//    {
//        NSString * tempString = [textField.text stringByReplacingCharactersInRange:range withString:string];
//        NSLog(@"%@",tempString);
//        
//        if (tempString.length > kMaxLength)
//        {
//            textField.text = [tempString substringToIndex:kMaxLength];
//            return NO;
//        }
//    }
//    
//    return YES;
//}

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
