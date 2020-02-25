# iOS APP version:12.2
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
