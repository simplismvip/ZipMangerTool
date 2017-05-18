//
//  ZipArchiveTool.m
//  FileZip
//
//  Created by Mac on 16/5/31.
//  Copyright © 2016年 yijia. All rights reserved.
//

#import "ZipArchiveTool.h"
#import "SSZipArchive.h"

@implementation ZipArchiveTool
#pragma mark -- 不带密码压缩
+ (BOOL)createZipNewFile:(NSString *)name AtPath:(NSString *)path withFilesAtPaths:(NSArray *)paths
{
    // 拼接出文件全路径
    if (path == nil || path.length == 0 || paths.count == 0) return NO;
    NSString *zippedPath = [NSString stringWithFormat:@"%@/%@.apf", path, name];
    
    __block BOOL isBool;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
         isBool = [SSZipArchive createZipFileAtPath:zippedPath withFilesAtPaths:paths];
    });
    
    return isBool;
}

+ (BOOL)unzipFileAtPath:(NSString *)path toNewDestination:(NSString *)destination
{
    __block BOOL isBool;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        isBool = [SSZipArchive unzipFileAtPath:path toDestination:destination];
    });
    
    return isBool;
}

#pragma mark -- 带密码压缩/解压缩
+ (BOOL)createZipNewFile:(NSString *)name AtPath:(NSString *)path withFilesAtPaths:(NSArray *)paths withPwd:(NSString *)pwd
{
    // 拼接出文件全路径
    if (path == nil || path.length == 0 || paths.count == 0) return NO;
    NSString *zippedPath = [NSString stringWithFormat:@"%@/%@.apf", path, name];
    
    __block BOOL isBool;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        isBool = [SSZipArchive createZipFileAtPath:zippedPath withFilesAtPaths:paths withPassword:pwd];
    });
    
    return isBool;
}

+ (BOOL)unzipFileAtPath:(NSString *)path toNewDestination:(NSString *)destination withPwd:(NSString *)pwd
{
    __block BOOL isBool;
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        isBool = [SSZipArchive unzipFileAtPath:path toDestination:destination overwrite:YES password:pwd error:nil];
    });
    
    return isBool;
}


/*
 NSArray *inputPaths = [NSArray arrayWithObjects:
 [NSString stringWithFormat:@"%@/mp3/V_0_0_1464148965405.m4a", NSHomeDirectory()],
 [NSString stringWithFormat:@"%@/mp3/V_0_1_1464148965405.m4a", NSHomeDirectory()],
 [NSString stringWithFormat:@"%@/mp3/V_0_2_1464148965405.m4a", NSHomeDirectory()],
 [NSString stringWithFormat:@"%@/mp3/V_0_3_1464148965405.m4a", NSHomeDirectory()],
 nil];
 
 测试使用
 NSFileManager *manger = [NSFileManager defaultManager];
 NSArray *arr = [manger contentsOfDirectoryAtPath:[NSString stringWithFormat:@"%@/mp3", NSHomeDirectory()] error:nil];
 NSMutableArray *array = [NSMutableArray array];
 for (NSString *name in arr) {
 
 if ([name isEqualToString:@".DS_Store"]) continue;
 [array addObject:[NSString stringWithFormat:@"%@/mp3/%@", NSHomeDirectory(), name]];
 }
 
 */

@end
