//
//  HTTPCookiesUtil.m
//  HTTPSession
//
//  Created by 安宁 on 2017/7/31.
//  Copyright © 2017年 安宁. All rights reserved.
//

#import "HTTPCookiesUtil.h"

@implementation HTTPCookiesUtil


/**
    获取所有Cookie

 */
+(NSArray <NSHTTPCookie *> *)getCookies
{
    NSArray <NSHTTPCookie *> * cookies =[[NSHTTPCookieStorage sharedHTTPCookieStorage]cookies] ;
    
    return cookies ;
}


/**
    获取session id
 */
+(NSString *)getSessionID
{
    for (NSHTTPCookie * cookie in [self getCookies])
    {
        if ([[cookie name] isEqualToString:@"JSESSIONID"])
        {
            return [cookie value] ;
        }
    }
    
    return nil ;
}


/**
    清空所有cookie
 */
+(void)deleteAllCookies
{
    NSHTTPCookieStorage * storage = [NSHTTPCookieStorage sharedHTTPCookieStorage] ;
    
    NSArray <NSHTTPCookie *> * cookies = [storage cookies];
    
    for (NSHTTPCookie * cookie in cookies)
    {
        [storage deleteCookie:cookie];
    }
    
}


/**
    根据name删除cookie
 */
+(BOOL)deleteCookieByName:(NSString *)name
{
    NSHTTPCookieStorage * storage = [NSHTTPCookieStorage sharedHTTPCookieStorage] ;
    
    NSArray <NSHTTPCookie *> * cookies = [storage cookies];
    
    for (NSHTTPCookie * cookie in cookies)
    {
        if ([[cookie name] isEqualToString:name])
        {
            [storage deleteCookie:cookie];
            
            return YES ;
        }
    }

    return NO ;
}
/**
    根据value删除cookie
 */
+(BOOL)deleteCookieByValue:(NSString *)value
{
    NSHTTPCookieStorage * storage = [NSHTTPCookieStorage sharedHTTPCookieStorage] ;
    
    NSArray <NSHTTPCookie *> * cookies = [storage cookies];
    
    for (NSHTTPCookie * cookie in cookies)
    {
        if ([[cookie value] isEqualToString:value])
        {
            [storage deleteCookie:cookie];
            
            return YES ;
        }
    }
    
    return NO ;
}


/**
    设置Cookie

 */
+(void)setCookieWithName:(NSString * )name value:(NSString *)value domain:(NSString *)domain originURL:(NSString *)originURL path:(NSString *)path version:(NSString *)version expiresDate:(NSString *)expiresDate createdDate:(NSString *)createdDate sessionOnly:(BOOL)sessionOnly isSecure:(BOOL)isSecure
{
    NSMutableDictionary * cookieProperties = [NSMutableDictionary dictionary];
    
    if (name)
    {
        [cookieProperties setObject:name forKey:NSHTTPCookieName] ;
    }
    
    if (value)
    {
        [cookieProperties setObject:value forKey:NSHTTPCookieValue];
    }
    
    if (domain)
    {
        [cookieProperties setObject:domain forKey:NSHTTPCookieDomain];

    }
    
    if (originURL)
    {
        [cookieProperties setObject:originURL forKey:NSHTTPCookieOriginURL];
    }
    
    if (path)
    {
        [cookieProperties setObject:path forKey:NSHTTPCookiePath];
    }
    
    if (version)
    {
        [cookieProperties setObject:version forKey:NSHTTPCookieVersion];
    }
    
    if (expiresDate)
    {
        [cookieProperties setObject:expiresDate forKey:NSHTTPCookieExpires];
    }
    
    if (isSecure)
    {
        [cookieProperties setObject:@(isSecure) forKey:NSHTTPCookieSecure];
    }
    
    
    
    NSHTTPCookie *cookie = [NSHTTPCookie cookieWithProperties:cookieProperties];
    [[NSHTTPCookieStorage sharedHTTPCookieStorage] setCookie:cookie];
}



@end
