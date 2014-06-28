//
//  BNRItem.m
//  RandomItems
//
//  Created by Kenji Crosland on 4/28/14.
//  Copyright (c) 2014 Big Nerd Ranch. All rights reserved.
//

#import "BNRItem.h"

@implementation BNRItem

+(instancetype)randomItem
{
    //Create an immutable array of three adjectives
    NSArray *randomAdjectiveList = @[@"Fluffy", @"Rusty", @"Shiny"];
    
    //Create an immutable array for three nouns
    NSArray *randomNounList = @[@"Bear", @"Spork", @"Mac"];
    
    //Get the index of a random adjective/noun from the lists
    NSInteger adjectiveIndex = arc4random() % [randomAdjectiveList count];
    NSInteger nounIndex = arc4random() % [randomNounList count];
    
    NSString *randomName = [NSString stringWithFormat:@"%@ %@", randomAdjectiveList[adjectiveIndex], randomNounList[nounIndex]];
    
    int randomValue = arc4random() % 100;
    
    NSString *randomSerialNumber = [NSString stringWithFormat:@"%c%c%c%c%c",
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10,
                                    'A' + arc4random() % 26,
                                    '0' + arc4random() % 10];
    
    BNRItem *newItem = [[self alloc] initWithItemName:randomName
                        valueinDollars:randomValue serialNumber:randomSerialNumber];
    
    return newItem;

}

-(instancetype)initWithItemName:(NSString *)name
                 valueinDollars:(int)value
                   serialNumber:(NSString *)sNumber
{
    self = [super init];
    if (self){
    _itemName = name;
    _valueInDollars = value;
    _serialNumber = sNumber;
    _dateCreated = [[NSDate alloc]init];
    }
    return self;
}

-(instancetype)initWithItemName:(NSString *)name
{
    return [self initWithItemName:name valueinDollars:0 serialNumber:@""];
}
-(instancetype)initWithItemName:(NSString *)name serialNumber:(NSString *)sNumber
{
    return [self initWithItemName:name serialNumber:sNumber];
}
-(instancetype)init
{
    return [self initWithItemName:@"Item"];
}

-(NSString *)description
{
    NSString *descriptionString = [[NSString alloc]initWithFormat:@"%@ (%@): Worth $%d, recorded on %@",
                                   self.itemName,
                                   self.serialNumber,
                                   self.valueInDollars,
                                   self.dateCreated];
    return descriptionString;
}

-(void)dealloc
{
    NSLog(@"Destroyed: %@", self);
}

@end
