//
//  RMSingleton.h
//  宏实现的 GCD方式的 单例模式通用代码
//  适用于ARC和MRC
//
//  Created by chd on 15-4-17.
//  Copyright (c) 2015年 CHD. All rights reserved.
//

/**
 * 单例模式.h文件
 */
#define RMSingletonH(name) + (instancetype)shared##name;

/**
 * 单例模式.m文件
 */
#if __has_feature(objc_arc)

    #define RMSingletonM(name) \
    static id _instance;\
    + (id)allocWithZone:(struct _NSZone *)zone  {\
        \
        static dispatch_once_t onceToken;\
        dispatch_once(&onceToken, ^{\
            _instance = [super allocWithZone:zone];\
        });\
        return _instance;\
    }\
    + (instancetype)shared##name {\
        \
        static dispatch_once_t onceToken;\
        dispatch_once(&onceToken, ^{\
            _instance = [[self alloc] init];\
        });\
        return _instance;\
    }\
    - (id)copyWithZone:(NSZone *)zone {\
        return _instance;\
    }

#else

    #define RMSingletonM(name) \
    static id _instance;\
    + (id)allocWithZone:(struct _NSZone *)zone  {\
        static dispatch_once_t onceToken;\
        dispatch_once(&onceToken, ^{\
            _instance = [super allocWithZone:zone];\
        });\
        return _instance;\
    }\
    + (instancetype)shared##name {\
        static dispatch_once_t onceToken;\
        dispatch_once(&onceToken, ^{\
            _instance = [[self alloc] init];\
        });\
        return _instance;\
    }\
    - (id)copyWithZone:(NSZone *)zone {\
        return _instance;\
    }\
    - (oneway void)release { }\
    - (id)autorelease { return self; }\
    - (id)retain { return self; }\
    - (NSUInteger)retainCount { return 1; }

#endif

