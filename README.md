# iOS APP初体验
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
NSArray  *pathArray = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES);
    NSString *cachePath = [pathArray firstObject];
    //创建fileManager
    NSFileManager *fileManager = [NSFileManager defaultManager];
    //创建文件夹
    NSString *dataPath = [cachePath stringByAppendingPathComponent:@"CachePeanut"];
    NSError *createError;
    [fileManager createDirectoryAtPath:dataPath withIntermediateDirectories:YES attributes:Nil error:&createError];
    //创建完成
    //----------------
    //在文件夹中创建文件list
    NSString *list = [dataPath stringByAppendingPathComponent:@"list"];
    //文件内容
    NSData *content = [@"文件内容" dataUsingEncoding:NSUTF8StringEncoding];
    [fileManager createFileAtPath:list contents:content attributes:nil];
    
    //查询文件
    BOOL fileExist= [fileManager fileExistsAtPath:list];
    
    //删除文件
    if (fileExist) {
        [fileManager removeItemAtPath:list error:nil];
    }
```

- NSFileHandle
> 文件读取、修改