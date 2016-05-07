//
//  Person.h
//  testRealm
//
//  Created by csj on 16/5/7.
//  Copyright © 2016年 csj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Realm/Realm.h>

//@interface Dog : RLMObject
//
//@property NSString * name;
//
//@end
//
//RLM_ARRAY_TYPE(Dog)
//
//@interface Person : RLMObject
//
//@property NSString * name;
//
//@end
//
//RLM_ARRAY_TYPE(Person)

//@interface PDson : RLMObject
//
//@property NSString * name;
//
//@end
//
//RLM_ARRAY_TYPE(PDson)

@interface PD : RLMObject

@property NSString * pname;
@property NSString * dname;
@property NSString * sonname;

@end

RLM_ARRAY_TYPE(PD)
