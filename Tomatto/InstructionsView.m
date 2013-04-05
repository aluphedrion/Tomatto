//
//  InstructionsView.m
//  Tomatto
//
//  Created by bluezy on 29/03/13.
//  Copyright (c) 2013 bluezy. All rights reserved.
//

#import "InstructionsView.h"

@interface InstructionsView ()

@property (weak) IBOutlet UILabel *instructions;

@end
@implementation InstructionsView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
