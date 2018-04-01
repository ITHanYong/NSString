//
//  ViewController.m
//  NSString
//
//  Created by HanYong on 2018/4/1.
//  Copyright © 2018年 HanYong. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSRange range = [self rangeComponents:@"asdddsffewfwqwop" withString:@"wq"];
    if (range.location == NSNotFound) {
        NSLog(@"找不到");
    }
    [self subStringWith:@"hello world" withIndex:4 withLength:0];
    [self separatedWithComponents:@"hello;hi;ha" byString:@";"];
    [self replacingComponents:@"happy a year" oldString:@" a " newString:@" new "];
    [self verifyString:@"http://www" hasString:@"http" preOrSuf:0];
    
    [self encodingString:@"积极向上"];
    [self decodeString:@"%E7%A7%AF%E6%9E%81%E5%90%91%E4%B8%8A"];
}

//编码
-(NSString *) encodingString:(NSString *)string{
    
    //iOS9之前
    //NSString *str = [string stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    //iOS9之后
    NSString *str = [string stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    NSLog(@"编码 -- %@",str);
    return str;
}

//解码
-(NSString *)decodeString:(NSString *)string{
    
    //iOS9之前
    //NSString *str = [string stringByReplacingPercentEscapesUsingEncoding:NSUTF8StringEncoding];
    
    //iOS9之后
    NSString *str = [string stringByRemovingPercentEncoding];
    NSLog(@"解码 -- %@",str);
    return str;
}

//改变大小写
-(NSString *)changeStringToUpperOrLower:(NSString *)components type:(NSInteger)type{
    NSString *str;
    if (type == 0) {
        str = [components uppercaseString];//转成大写
    }else if (type == 1){
        str = [components lowercaseString];//转成小写
    }else{
        str = [components capitalizedString];//首字母大写 其余小写
    }
    NSLog(@"StringToUpperOrLower--%@",str);
    return str;
}

//验证字符串 - hasPrefix:0、hasSuffix:1
-(BOOL)verifyString:(NSString *)string hasString:(NSString *)str preOrSuf:(NSInteger)preOrSuf{
    BOOL ishas;
    if (preOrSuf == 0) {
        //头部
        ishas = [string hasPrefix:str];
    }else {
        //尾部
        ishas = [string hasSuffix:str];
    }
    
    NSLog(@"验证字符串  %ld -- %d",preOrSuf,ishas);
    return ishas;
}


//替换字符串 -
-(NSString *)replacingComponents:(NSString *)components oldString:(NSString *)old newString:(NSString *)new{
    NSString *str = [components stringByReplacingOccurrencesOfString:old withString:new];
    NSLog(@"替换字符串 -- %@",str);
    return str;
}

//查找字符串 - 返回range
-(NSRange)rangeComponents:(NSString *)components withString:(NSString *)string{
    NSRange range = [components rangeOfString:string];
    
    NSLog(@"range -- %@",NSStringFromRange(range));
    return range;
}

//截取字符串 - 返回字符串
-(NSString *)subStringWith:(NSString *) string withIndex:(NSInteger)index withLength:(NSInteger)length{
    
    NSString *str;
    if (index>0&&length>0) {
        //从下标index字符串开始截取length长度的字符串
        str = [string substringWithRange:NSMakeRange(index, length)];
    }else if (index==0&&length>0){
        //从首字符开始截取length个字符
        str = [string substringToIndex:length];
    }else if(index>0&&length==0){
        //从第index位开始截取,至字符串最后
        str = [string substringFromIndex:index];
    }
    
    NSLog(@"subString -- %@",str);
    return str;
}

//分隔字符串 - 返回数组
-(NSArray *)separatedWithComponents:(NSString *)components byString:(NSString *)string{
    
    NSArray *array = [components componentsSeparatedByString:string];
    NSLog(@"array -- %@",array);
    return array;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
