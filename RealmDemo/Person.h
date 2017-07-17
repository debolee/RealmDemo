//
//  Person.h
//  RealmDemo
//
//  Created by lidebo on 2017/7/17.
//  Copyright © 2017年 lidebo. All rights reserved.
//

#import <Realm/Realm.h>
#import "Dog.h"

@interface Person : RLMObject<NSCopying>
@property (nonatomic, strong) NSString *name;
@property RLMArray<Dog *><Dog> *dogs;

//创建，或更新数据
+ (void)createOrUpdate:(Person *)person;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Person>
RLM_ARRAY_TYPE(Person)
