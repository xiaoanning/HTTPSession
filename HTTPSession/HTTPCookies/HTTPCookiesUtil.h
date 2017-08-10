//
//  HTTPCookiesUtil.h
//  HTTPSession
//
//  Created by 安宁 on 2017/7/31.
//  Copyright © 2017年 安宁. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HTTPCookiesUtil : NSObject


/**
 获取所有Cookie
 
 */
+(NSArray <NSHTTPCookie *> *)getCookies ;


/**
 获取session id
 */
+(NSString *)getSessionID ;

/**
 清空所有cookie
 */
+(void)deleteAllCookies ;


/**
 根据name删除cookie
 */
+(BOOL)deleteCookieByName:(NSString *)name ;
/**
 根据value删除cookie
 */
+(BOOL)deleteCookieByValue:(NSString *)value ;


/**
 设置Cookie
 
 */
+(void)setCookieWithName:(NSString * )name value:(NSString *)value domain:(NSString *)domain originURL:(NSString *)originURL path:(NSString *)path version:(NSString *)version expiresDate:(NSString *)expiresDate createdDate:(NSString *)createdDate sessionOnly:(BOOL)sessionOnly isSecure:(BOOL)isSecure ;

@end
