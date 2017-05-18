//
//  ZipArchiveTool.h
//  FileZip
//
//  Created by Mac on 16/5/31.
//  Copyright © 2016年 yijia. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ZipArchiveTool : NSObject
/**
 *  压缩文件
 *  @param name  压缩文件名字
 *  @param path  新生成压缩文件路径
 *  @param paths 要压缩文件路径
 *
 *  @return 返回布尔值
 */
+ (BOOL)createZipNewFile:(NSString *)name AtPath:(NSString *)path withFilesAtPaths:(NSArray *)paths;
/**
 *  解压文件
 *
 *  @param path  要解压文件路径
 *  @param destination 加压到文件路径
 *
 *  @return 返回布尔值
 */
+ (BOOL)unzipFileAtPath:(NSString *)path toNewDestination:(NSString *)destination;

#pragma mark -- 以下为带密码压缩/解压缩
/**
 *  压缩文件
 *  @param name  压缩文件名字
 *  @param path  新生成压缩文件路径
 *  @param paths 要压缩文件路径
 *  @param pwd   压缩密码
 *
 *  @return 返回布尔值
 */
+ (BOOL)createZipNewFile:(NSString *)name AtPath:(NSString *)path withFilesAtPaths:(NSArray *)paths withPwd:(NSString *)pwd;

/**
 *  解压文件
 *
 *  @param path  要解压文件路径
 *  @param destination 加压到文件路径
 *  @param pwd   压缩密码
 *
 *  @return 返回布尔值
 */
+ (BOOL)unzipFileAtPath:(NSString *)path toNewDestination:(NSString *)destination withPwd:(NSString *)pwd;

@end
