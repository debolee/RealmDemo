//
//  Dog.m
//  RealmDemo
//
//  Created by lidebo on 2017/7/17.
//  Copyright © 2017年 lidebo. All rights reserved.
//

#import "Dog.h"
#import "Person.h"

@implementation Dog

// Specify default values for properties

//+ (NSDictionary *)defaultPropertyValues
//{
//    return @{};
//}

// Specify properties to ignore (Realm won't persist these)

//+ (NSArray *)ignoredProperties
//{
//    return @[];
//}

+ (NSDictionary *)linkingObjectsProperties {
    return @{
             @"owners": [RLMPropertyDescriptor descriptorWithClass:Person.class propertyName:@"dogs"],
             };
}

- (id)copyWithZone:(NSZone *)zone {
    
    Dog * obj=[[Dog allocWithZone:zone]init];
    obj.name = [self.name copy];
    
    return obj;
}

@end
