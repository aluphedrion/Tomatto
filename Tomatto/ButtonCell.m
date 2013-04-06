//
//  ButtonCell.m
//  Tomatto
//
//  Created by bluezy on 29/03/13.
//  Copyright (c) 2013 bluezy. All rights reserved.
//

#import "ButtonCell.h"

@implementation ButtonCell

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

-(void)prepareForReuse{
    
    self.backgroundColor = [UIColor blackColor];
    self.label.textColor = [UIColor whiteColor];
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
