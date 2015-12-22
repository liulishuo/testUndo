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
    
    [_tf addTarget:self action:@selector(textFieldTextDidChanged:) forControlEvents:UIControlEventEditingChanged];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)click:(id)sender {
//    _tf.text = @"123";
    
    
    [self.undoManager registerUndoWithTarget:self selector:@selector(setTest:) object:@"123"];
    [self.undoManager setActionName:@"ABC"];
    self.test = @"123";
}


//微信
- (void)textFieldTextDidChanged:(UITextField *)sender
{
    NSString * toBeString = sender.text;
    
    //同一个action不能注册两次 否则redo有问题
//    [sender updateText:toBeString];
    
    if (sender.markedTextRange == nil && toBeString.length > kMaxLength)
    {
        sender.text = [toBeString substringToIndex:kMaxLength];
        [sender.undoManager removeAllActions];
//        [sender updateText:[toBeString substringToIndex:kMaxLength]];
    }
}

//- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string
//{
//    
//    
//    
//    if([string isEqualToString:@""])
//    {
//        return YES;
//    }
//    
//    NSInteger kMaxLength = 6;
//
//    if(textField.text.length == kMaxLength)
//    {
//        return NO;
//    }
//    
//    NSString * toBeString = [textField.text stringByReplacingCharactersInRange:range withString:string];
//    NSLog(@"%@",toBeString);
//    
//    if (toBeString.length > kMaxLength && range.length!=1 && ![string isEqualToString:@"\n"])
//    {
//        textField.text = [toBeString substringToIndex:kMaxLength];
//        return NO;
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
