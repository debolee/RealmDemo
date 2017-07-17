//
//  ViewController.m
//  RealmDemo
//
//  Created by lidebo on 2017/7/17.
//  Copyright © 2017年 lidebo. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
//1、创建对象
    Dog *dogBlack = [[Dog alloc] init];
    dogBlack.name = @"Back";
    
    Dog *dogYellow = [[Dog alloc] init];
    dogYellow.name = @"Yellow";
    
    Person *person = [[Person alloc] init];
    person.name = @"person1";
    [person.dogs addObjects:@[dogBlack, dogYellow]];
    
    NSLog(@"person.name:%@ dogs.count:%ld", person.name, person.dogs.count);
    
    
//2.copy有对象
    Person *otherPerson = [person copy];
    NSLog(@"otherPerson.name:%@ dogs.count:%ld", otherPerson.name, otherPerson.dogs.count);
    
    
    
//写入person
    RLMRealm *realm = [RLMRealm defaultRealm];
    [realm beginWriteTransaction];
    [Person createInDefaultRealmWithValue:person];
    [realm commitWriteTransaction];
    
    
//写入otherPerson
    [realm beginWriteTransaction];
    [Person createInDefaultRealmWithValue:person];
    [realm commitWriteTransaction];
    
    
//查询
    RLMResults *results = [Person allObjects];
    Person *result = results[0];
    Person *otherResult = [result copy];
    
    NSLog(@"results.all.count:%ld", results.count);
    
    
    NSLog(@"result.dog.owners:%@", otherResult.dogs.firstObject.owners);
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
