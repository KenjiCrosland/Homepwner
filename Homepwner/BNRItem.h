//
//  BNRItem.h
//  RandomItems
//
//  Created by Kenji Crosland on 4/28/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BNRItem : NSObject

@property (nonatomic, copy) NSString *itemName;
@property (nonatomic, copy) NSString *serialNumber;
@property (nonatomic) int valueInDollars;
@property (nonatomic, readonly, strong) NSDate *dateCreated;

+(instancetype)randomItem;

//Designated initializer for BNR Item

-(instancetype)initWithItemName:(NSString *)name
                 valueinDollars:(int)value
                   serialNumber:(NSString *)sNumber;

-(instancetype)initWithItemName:(NSString *)name
                   serialNumber:(NSString *)sNumber;

-(instancetype)initWithItemName:(NSString *)name;

@end
