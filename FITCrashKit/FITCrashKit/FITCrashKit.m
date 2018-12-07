//
//  FITCrashKit.m
//  FITCrashKit
//
//  Created by wanqijian on 2018/12/6.
//  Copyright © 2018 wanqijian. All rights reserved.
//

#import "FITCrashKit.h"
#import "execinfo.h"

@implementation FITCrashKit

static FITCrashKit *_shareInstance = nil;
+ (instancetype)shareInstance {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _shareInstance = [[FITCrashKit alloc] init];
    });
    return _shareInstance;
}

+ (void)enable {
    // 处理 Exception
    NSSetUncaughtExceptionHandler(&UncaughtExceptionHandler);
    
    // 处理 异常信号
    InstallSignalHandler();
    
}

void UncaughtExceptionHandler(NSException *exception) {
//    NSLog(@"%@", [exception callStackSymbols]);
    NSString *errorMsg = [[exception callStackSymbols] componentsJoinedByString:@"\n"];
    if ([FITCrashKit shareInstance].handleCrashBlock) {
        [FITCrashKit shareInstance].handleCrashBlock(errorMsg);
    }
}

#pragma mark 异常信号处理

void InstallSignalHandler(void) {
    
    // 本信号在用户终端连接(正常或非正常)结束时发出, 通常是在终端的控制进程结束时, 通知同一session内的各个作业, 这时它们与控制终端不再关联。登录Linux时，系统会分配给登录用户一个终端(Session)。在这个终端运行的所有程序，包括前台进程组和后台进程组，一般都属于这个 Session。当用户退出Linux登录时，前台进程组和后台有对终端输出的进程将会收到SIGHUP信号。这个信号的默认操作为终止进程，因此前台进 程组和后台有终端输出的进程就会中止。不过可以捕获这个信号，比如wget能捕获SIGHUP信号，并忽略它，这样就算退出了Linux登录， wget也 能继续下载。 此外，对于与终端脱离关系的守护进程，这个信号用于通知它重新读取配置文件。
    signal(SIGHUP, handleSignalException);
    // 在用户键入INTR字符(通常是Ctrl-C)时发出，用于通知前台进程组终止进程。
    signal(SIGINT, handleSignalException);
    // 和SIGINT类似, 但由QUIT字符(通常是Ctrl-)来控制. 进程在因收到SIGQUIT退出时会产生core文件, 在这个意义上类似于一个程序错误信号。
    signal(SIGQUIT, handleSignalException);
    
    // 程序崩溃 调用abort函数生成的信号。
    signal(SIGABRT, handleSignalException);
    // 处理器指令非法 用来立即结束程序的运行. 本信号不能被阻塞、处理和忽略。如果管理员发现某个进程终止不了，可尝试发送这个信号。
    signal(SIGILL, handleSignalException);
    // 分段故障 访问已释放的对象 EXC_BAD_ACCESS 试图访问未分配给自己的内存, 或试图往没有写权限的内存地址写数据.
    signal(SIGSEGV, handleSignalException);
    // 浮点异常 算术运算无效 在发生致命的算术运算错误时发出. 不仅包括浮点运算错误, 还包括溢出及除数为0等其它所有的算术的错误。
    signal(SIGFPE, handleSignalException);
    // 总线错误 访问无效的内存地址 EXC_BAD_ACCESS 非法地址, 包括内存地址对齐(alignment)出错。比如访问一个四个字长的整数, 但其地址不是4的倍数。它与SIGSEGV的区别在于后者是由于对合法存储地址的非法访问触发的(如访问不属于自己存储空间或只读存储空间)。
    signal(SIGBUS, handleSignalException);
    // 管道破裂 这个信号通常在进程间通信产生，比如采用FIFO(管道)通信的两个进程，读管道没打开或者意外终止就往管道写，写进程会收到SIGPIPE信号。此外用Socket通信的两个进程，写进程在写Socket的时候，读进程已经终止。
    signal(SIGPIPE, handleSignalException);
}

void handleSignalException(int signal) {
    NSMutableString * crashInfo = [[NSMutableString alloc]init];
    [crashInfo appendString:[NSString stringWithFormat:@"signal:%d\n",signal]];
    [crashInfo appendString:@"Stack:\n"];
    void* callstack[128];
    int i, frames = backtrace(callstack, 128);
    char** strs = backtrace_symbols(callstack, frames);
    for (i = 0; i <frames; ++i) {
        [crashInfo appendFormat:@"%s\n", strs[i]];
    }
    
    NSString *errorMsg = [crashInfo copy];
    if ([FITCrashKit shareInstance].handleCrashBlock) {
        [FITCrashKit shareInstance].handleCrashBlock(errorMsg);
    }
}


@end
