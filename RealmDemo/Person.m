//
//  Person.m
//  RealmDemo
//
//  Created by lidebo on 2017/7/17.
//  Copyright © 2017年 lidebo. All rights reserved.
//

#import "Person.h"

@implementation Person

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


//实现Person对象的深拷贝
- (id)copyWithZone:(NSZone *)zone {
    
    Person * obj=[[Person allocWithZone:zone]init];
    obj.name = [self.name copy];
    
    //1、正确的拷贝
    for (Dog *dog in self.dogs) {
        [obj.dogs addObject:[dog copy]];
    }
    
    //2、错误的拷贝
//    obj.dogs = self.dogs; //只是把引用赋值给了obj.dogs,引用指向的对象是同一个
//    obj.dogs = [self.dogs copy]; //RLMArray没有实现NSCopying协议，会直接崩溃
    
    return obj;
}

@end
