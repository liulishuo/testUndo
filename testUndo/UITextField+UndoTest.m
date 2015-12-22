//
//  UITextField+UndoTest.m
//  testUndo
//
//  Created by liulishuo on 15/12/22.
//  Copyright © 2015年 liulishuo. All rights reserved.
//

#import "UITextField+UndoTest.h"

@implementation UITextField (UndoTest)

- (void)updateText:(NSString *)text
{
    [self.undoManager registerUndoWithTarget:self selector:@selector(setText:) object:text];
    [self.undoManager setActionName:@"upDateText"];
    self.text = text;
}

@end
