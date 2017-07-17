//
//  Dog.h
//  RealmDemo
//
//  Created by lidebo on 2017/7/17.
//  Copyright © 2017年 lidebo. All rights reserved.
//

#import <Realm/Realm.h>

@interface Dog : RLMObject<NSCopying>
@property (nonatomic, strong) NSString *name;


//Inverse Relationship
@property (readonly) RLMLinkingObjects *owners;

@end

// This protocol enables typed collections. i.e.:
// RLMArray<Dog>
RLM_ARRAY_TYPE(Dog)
