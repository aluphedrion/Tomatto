//
//  Recipe.h
//  Tomatto
//
//  Created by bluezy on 30/03/13.
//  Copyright (c) 2013 bluezy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Recipe : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSMutableArray *ingredients;
@property (nonatomic, strong) NSString *instrucciones;

-(id)initWithNumberOfIngredients:(int)number;

@end
