## # iOS APP version:12.2
## WebView
> #import <WebKit/WebKit.h>
# CocoaPods
- [更换清华源](https://mirror.tuna.tsinghua.edu.cn/help/CocoaPods/)

```
$ cd ~/.cocoapods/repos 
$ pod repo remove master
$ git clone https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git master

//最后进入自己的工程，在自己工程的podFile第一行加上：

source 'https://mirrors.tuna.tsinghua.edu.cn/git/CocoaPods/Specs.git'
```


## 网络管理

- AFNetworking

## JSON

## 数据模型
> NSData - > json -> model
- YYModel  
- MJExtension 

## 文件管理
- NSFileManager
> 文件创建、删除

```
//获取缓存文件目录
NSArray  *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
NSString *cachePath = [pathArray firstObject];
    
//创建fileManager
NSFileManager *fileManager = [NSFileManager defaultManager];
    
//创建CachePeanut文件夹
NSString *dataPath = [cachePath stringByAppendingPathComponent:@"CachePeanut"];
NSError *createError;
[fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:Nil error:&createError];
    
//在文件夹中创建文件filePeanut
NSString *filePeanut = [dataPath stringByAppendingPathComponent:@"filePeanut"];
//文件内容
NSData *content = [@"文件内容" dataUsingEncoding:NSUTF8StringEncoding];
//开始创建文件
[fileManager createFileAtPath:filePeanut contents:content attributes:nil];
    
//判断文件是否存在
BOOL fileExist= [fileManager fileExistsAtPath:filePeanut];
    
//删除文件
if (fileExist) {
        [fileManager removeItemAtPath:filePeanut error:nil];
}
```

- NSFileHandle
> 文件读取、修改

```
//在文件末尾追加内容  filePeanut 是上文中未被删除的文件地址
NSFileHandle *fileHandle = [NSFileHandle fileHandleForUpdatingAtPath:filePeanut];
//文件指针指向末尾
[fileHandle seekToEndOfFile];
NSString *addContent = @"这是追加的内容";
//设置utf8编码并进行内容追加写入
[fileHandle writeData:[addContent dataUsingEncoding:NSUTF8StringEncoding]];
//刷新文件
[fileHandle synchronizeFile];
//关闭文件句柄
[fileHandle closeFile];
```
## NSDictionary字典

```
// dictionary  id 值为int类型需注意  调用 intValue方法
self.detail  = [[dictionary objectForKey:@"id"] intValue];
```


## 序列化存储

- NSCoder

```
//头文件实现NSSecureCoding协议
@interface someClass <NSSecureCoding>

//实现文件中实现具体方法
- (void)encodeWithCoder:(NSCoder *)coder
{
    //序列化title属性指定key 为title
    [coder encodeObject:self.titile forKey:@"title"];
    //注意  encodeDouble
    [coder encodeDouble:self.detail forKey:@"id"];
}

- (nullable instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        //通过指定key反序列化对象
        self.titile  = [coder decodeObjectForKey:@"titile"];
        //反序列化long、double型
        self.detail  = [coder decodeDoubleForKey:@"id"];
    }
    return self;
}

//确认支持安全协议
+ (BOOL) supportsSecureCoding
{
    return YES;
}
```
- NSKeyedArchiver NSKeyedUnarchiver

```
//序列化
NSData *content = [NSKeyedArchiver archivedDataWithRootObject:array requiringSecureCoding:YES error:Nil];

//反序列化
id unarchivObj  = [NSKeyedUnarchiver unarchivedObjectOfClasses:[NSSet setWithObjects:[NSArray class],[GTListItem class], nil] fromData:readList error:nil];
```

## k-v形式存储
- NSUserDefaults
```
//NSUserDefaults 是一个单例
NSUserDefaults *ndf = [NSUserDefaults standardUserDefaults];
//字符串存入    
[ndf setObject:@"存取内容" forKey:@"ourKey"];
//字符串取出
NSString * contents = [ndf stringForKey:@"ourKey"];
NSLog(@"%@",contents);
//output 存取内容
```
- LevelDB/MMKV/Realm

## 关系型数据库
- SQLite/FMDB/WCDB/CoreData
## 线程管理









---
### Tips

```
//整型转为字符串
NSString *B = [numberFormatter stringFromNumber:[NSNumber numberWithLong:items.detail]];
```
