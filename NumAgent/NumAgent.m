
#import "NumAgent.h"

@implementation NumAgent

+ (NSString *)roundPlain:(NSString *)num ifKeep:(BOOL)ifKeep {
    num = [NumAgent numberPreproccessed:num];
    // 先对数字进行四舍五入操作
    NSDecimalNumberHandler *round = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain
                                                                                           scale:2
                                                                                raiseOnExactness:NO
                                                                                 raiseOnOverflow:NO
                                                                                raiseOnUnderflow:NO
                                                                             raiseOnDivideByZero:YES];
    NSDecimalNumber *inputNumber = [NSDecimalNumber decimalNumberWithString:num];
    NSDecimalNumber *outputNumber = [inputNumber decimalNumberByRoundingAccordingToBehavior:round];
    // 格式化:对数字是否强制保留两位(强制保留两位的话小数点后不足两位补0)进行处理
    NSString *outputStr = [NSString stringWithFormat:@"%@",outputNumber];
    if (ifKeep) {
        NSRange range = [outputStr rangeOfString:@"."];
        if (range.length) {
            // 截取小数部分
            NSString *subStr = [outputStr substringFromIndex:range.location + 1];
            // 如果小数部分的位数小于2，只可能有一种情况:就是小数点后只有一位，所以需要补0。
            if (subStr.length < 2) {
                outputStr = [NSString stringWithFormat:@"%@0",outputStr];
            }
        }
        else {
            // outputStr所代表的数字是一个证书这里要拼上.00
            outputStr = [NSString stringWithFormat:@"%@.00",outputStr];
        }
    }
    
    return outputStr;
}

+ (NSString *)roundPlain:(NSString *)num
                  ifKeep:(BOOL)ifKeep
             ifThousands:(BOOL)ifThousands
                  prefix:(NSString *)prefix suffix:(NSString *)suffix {
    num = [NumAgent numberPreproccessed:num];
    // 先对数字进行四舍五入操作
    NSDecimalNumberHandler *round = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundPlain
                                                                                           scale:2
                                                                                raiseOnExactness:NO
                                                                                 raiseOnOverflow:NO
                                                                                raiseOnUnderflow:NO
                                                                             raiseOnDivideByZero:YES];
    NSDecimalNumber *inputNumber = [NSDecimalNumber decimalNumberWithString:num];
    NSDecimalNumber *outputNumber = [inputNumber decimalNumberByRoundingAccordingToBehavior:round];
    // 格式化:对数字是否强制保留两位(强制保留两位的话小数点后不足两位补0)进行处理
    NSString *outputStr = [NSString stringWithFormat:@"%@",outputNumber];
    if (ifKeep) {
        NSRange range = [outputStr rangeOfString:@"."];
        if (range.length) {
            // 截取小数部分
            NSString *subStr = [outputStr substringFromIndex:range.location + 1];
            // 如果小数部分的位数小于2，只可能有一种情况:就是小数点后只有一位，所以需要补0。
            if (subStr.length < 2) {
                outputStr = [NSString stringWithFormat:@"%@0",outputStr];
            }
        }
        else {
            // outputStr所代表的数字是一个证书这里要拼上.00
            outputStr = [NSString stringWithFormat:@"%@.00",outputStr];
        }
    }
    // 千分位
    if (ifThousands) {
        outputStr = [NumAgent countNumAndChangeformat:outputStr];
    }
    // 拼接前缀
    if (prefix.length) {
        outputStr = [NSString stringWithFormat:@"%@%@",prefix,outputStr];
    }
    // 拼接后缀
    if (suffix.length) {
        outputStr = [NSString stringWithFormat:@"%@%@",outputStr,suffix];
    }
    
    return outputStr;
}


+ (NSString *)roundPlainAndKeepFeature:(NSString *)num {
    num = [NumAgent numberPreproccessed:num];
    NSString *outputStr = [NumAgent roundPlain:num ifKeep:YES];
    if ([outputStr hasSuffix:@".00"]) {
        outputStr = [outputStr substringWithRange:NSMakeRange(0, outputStr.length - 3)];
    }
    
    return outputStr;
}

+ (NSString *)roundPlainAndKeepFeature:(NSString *)num
                           ifThousands:(BOOL)ifThousands
                                prefix:(NSString *)prefix suffix:(NSString *)suffix {
    num = [NumAgent numberPreproccessed:num];
    NSString *outputStr = [NumAgent roundPlain:num ifKeep:YES];
    if ([outputStr hasSuffix:@".00"]) {
        outputStr = [outputStr substringWithRange:NSMakeRange(0, outputStr.length - 3)];
    }
    // 千分位
    if (ifThousands) {
        outputStr = [NumAgent countNumAndChangeformat:outputStr];
    }
    // 拼接前缀
    if (prefix.length) {
        outputStr = [NSString stringWithFormat:@"%@%@",prefix,outputStr];
    }
    // 拼接后缀
    if (suffix.length) {
        outputStr = [NSString stringWithFormat:@"%@%@",outputStr,suffix];
    }
    
    return outputStr;
}


+ (NSString *)roundDown:(NSString *)num ifKeep:(BOOL)ifKeep {
    num = [NumAgent numberPreproccessed:num];
    // 先对数字进行截位操作
    NSDecimalNumberHandler *round = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown
                                                                                           scale:2
                                                                                raiseOnExactness:NO
                                                                                 raiseOnOverflow:NO
                                                                                raiseOnUnderflow:NO
                                                                             raiseOnDivideByZero:YES];
    NSDecimalNumber *inputNumber = [NSDecimalNumber decimalNumberWithString:num];
    NSDecimalNumber *outputNumber = [inputNumber decimalNumberByRoundingAccordingToBehavior:round];
    // 格式化:对数字是否强制保留两位(强制保留两位的话小数点后不足两位补0)进行处理
    NSString *outputStr = [NSString stringWithFormat:@"%@",outputNumber];
    if (ifKeep) {
        NSRange range = [outputStr rangeOfString:@"."];
        if (range.length) {
            // 截取小数部分
            NSString *subStr = [outputStr substringFromIndex:range.location + 1];
            // 如果小数部分的位数小于2，只可能有一种情况:就是小数点后只有一位，所以需要补0。
            if (subStr.length < 2) {
                outputStr = [NSString stringWithFormat:@"%@0",outputStr];
            }
        }
        else {
            // outputStr所代表的数字是一个证书这里要拼上.00
            outputStr = [NSString stringWithFormat:@"%@.00",outputStr];
        }
    }
    
    return outputStr;
}

+ (NSString *)roundDown:(NSString *)num
                 ifKeep:(BOOL)ifKeep
            ifThousands:(BOOL)ifThousands
                 prefix:(NSString *)prefix suffix:(NSString *)suffix {
    num = [NumAgent numberPreproccessed:num];
    // 先对数字进行截位操作
    NSDecimalNumberHandler *round = [NSDecimalNumberHandler decimalNumberHandlerWithRoundingMode:NSRoundDown
                                                                                           scale:2
                                                                                raiseOnExactness:NO
                                                                                 raiseOnOverflow:NO
                                                                                raiseOnUnderflow:NO
                                                                             raiseOnDivideByZero:YES];
    NSDecimalNumber *inputNumber = [NSDecimalNumber decimalNumberWithString:num];
    NSDecimalNumber *outputNumber = [inputNumber decimalNumberByRoundingAccordingToBehavior:round];
    // 格式化:对数字是否强制保留两位(强制保留两位的话小数点后不足两位补0)进行处理
    NSString *outputStr = [NSString stringWithFormat:@"%@",outputNumber];
    if (ifKeep) {
        NSRange range = [outputStr rangeOfString:@"."];
        if (range.length) {
            // 截取小数部分
            NSString *subStr = [outputStr substringFromIndex:range.location + 1];
            // 如果小数部分的位数小于2，只可能有一种情况:就是小数点后只有一位，所以需要补0。
            if (subStr.length < 2) {
                outputStr = [NSString stringWithFormat:@"%@0",outputStr];
            }
        }
        else {
            // outputStr所代表的数字是一个证书这里要拼上.00
            outputStr = [NSString stringWithFormat:@"%@.00",outputStr];
        }
    }
    // 千分位
    if (ifThousands) {
        outputStr = [NumAgent countNumAndChangeformat:outputStr];
    }
    // 拼接前缀
    if (prefix.length) {
        outputStr = [NSString stringWithFormat:@"%@%@",prefix,outputStr];
    }
    // 拼接后缀
    if (suffix.length) {
        outputStr = [NSString stringWithFormat:@"%@%@",outputStr,suffix];
    }
    
    return outputStr;
}

+ (NSString *)roundDownAndKeepFeature:(NSString *)num {
    num = [NumAgent numberPreproccessed:num];
    NSString *outputStr = [NumAgent roundDown:num ifKeep:YES];
    if ([outputStr hasSuffix:@".00"]) {
        outputStr = [outputStr substringWithRange:NSMakeRange(0, outputStr.length - 3)];
    }
    
    return outputStr;
}

+ (NSString *)roundDownAndKeepFeature:(NSString *)num
                          ifThousands:(BOOL)ifThousands
                               prefix:(NSString *)prefix suffix:(NSString *)suffix {
    num = [NumAgent numberPreproccessed:num];
    NSString *outputStr = [NumAgent roundDown:num ifKeep:YES];
    if ([outputStr hasSuffix:@".00"]) {
        outputStr = [outputStr substringWithRange:NSMakeRange(0, outputStr.length - 3)];
    }
    // 千分位
    if (ifThousands) {
        outputStr = [NumAgent countNumAndChangeformat:outputStr];
    }
    // 拼接前缀
    if (prefix.length) {
        outputStr = [NSString stringWithFormat:@"%@%@",prefix,outputStr];
    }
    // 拼接后缀
    if (suffix.length) {
        outputStr = [NSString stringWithFormat:@"%@%@",outputStr,suffix];
    }
    
    return outputStr;
}

+ (NSString *)countNumAndChangeformat:(NSString *)num
{
    long long number = [num longLongValue];
    NSString *last = @"";
    NSString *xiaoshu = @"";//小数部分的字符串
    NSString *b = [NSString stringWithFormat:@"%lld",number];
    NSString *shuchu;
    if (b.length == num.length) {
        last = num;
    }
    else {
        last = [num substringWithRange:NSMakeRange(0, b.length)];
        xiaoshu = [num substringWithRange:NSMakeRange(b.length, (num.length-b.length))];
    }
    
    NSString *eastNum = @"";
    NSString *help;
    
    if (num.length <= 3) {
        eastNum = last;
    }
    else {
        for (int i = (int)last.length - 1; i >= 0; i --) {
            help = [last substringWithRange:NSMakeRange(i, 1)];
            if ((last.length - i) % 3 == 0 && i > 0) {
                help = [NSString stringWithFormat:@",%@",[last substringWithRange:NSMakeRange(i, 1)]];
            }
            eastNum = [NSString stringWithFormat:@"%@%@",help,eastNum];
            
        }
    }
    shuchu = [NSString stringWithFormat:@"%@%@",eastNum,xiaoshu];
    
    return shuchu;
}

+ (BOOL)isApproximateInteger:(double)num
{
    long long a = (long long)num * 1000000;
    long long b = (long long)(num * 1000000);
    if (a == b) {
        return YES;
    }
    else {
        return NO;
    }
}

+ (NSString *)formatAmount:(NSString *)amount type:(AmountFormatType)type
{
    if (type == FormatTypeA) {
        NSString *outputStr = [NumAgent roundPlainAndKeepFeature:amount];
        outputStr = [NumAgent countNumAndChangeformat:outputStr];
        outputStr = [NSString stringWithFormat:@"¥%@",outputStr];
        
        return outputStr;
    }
    else if (type == FormatTypeB) {
        NSString *outputStr = [NumAgent roundPlain:amount ifKeep:YES];
        outputStr = [NumAgent countNumAndChangeformat:outputStr];
        outputStr = [NSString stringWithFormat:@"¥%@",outputStr];
        
        return outputStr;
    }
    else if (type == FormatTypeC) {
        NSString *outputStr = [NumAgent roundPlain:amount ifKeep:NO];
        outputStr = [NumAgent countNumAndChangeformat:outputStr];
        outputStr = [NSString stringWithFormat:@"¥%@",outputStr];
        
        return outputStr;
    }
    else if (type == FormatTypeD) {
        NSString *outputStr = [NumAgent roundPlainAndKeepFeature:amount];
        outputStr = [NumAgent countNumAndChangeformat:outputStr];
        outputStr = [NSString stringWithFormat:@"%@元",outputStr];
        
        return outputStr;
    }
    else if (type == FormatTypeE) {
        NSString *outputStr = [NumAgent roundPlain:amount ifKeep:YES];
        outputStr = [NumAgent countNumAndChangeformat:outputStr];
        outputStr = [NSString stringWithFormat:@"%@元",outputStr];
        
        return outputStr;
    }
    else if (type == FormatTypeF) {
        NSString *outputStr = [NumAgent roundPlain:amount ifKeep:NO];
        outputStr = [NumAgent countNumAndChangeformat:outputStr];
        outputStr = [NSString stringWithFormat:@"%@元",outputStr];
        
        return outputStr;
    }
    else if (type == FormatTypeG) {
        NSString *outputStr = [NumAgent roundDownAndKeepFeature:amount];
        outputStr = [NumAgent countNumAndChangeformat:outputStr];
        outputStr = [NSString stringWithFormat:@"¥%@",outputStr];
        
        return outputStr;
    }
    else if (type == FormatTypeH) {
        NSString *outputStr = [NumAgent roundDown:amount ifKeep:YES];
        outputStr = [NumAgent countNumAndChangeformat:outputStr];
        outputStr = [NSString stringWithFormat:@"¥%@",outputStr];
        
        return outputStr;
    }
    else if (type == FormatTypeI) {
        NSString *outputStr = [NumAgent roundDown:amount ifKeep:NO];
        outputStr = [NumAgent countNumAndChangeformat:outputStr];
        outputStr = [NSString stringWithFormat:@"¥%@",outputStr];
        
        return outputStr;
    }
    else if (type == FormatTypeJ) {
        NSString *outputStr = [NumAgent roundDownAndKeepFeature:amount];
        outputStr = [NumAgent countNumAndChangeformat:outputStr];
        outputStr = [NSString stringWithFormat:@"%@元",outputStr];
        
        return outputStr;
    }
    else if (type == FormatTypeK) {
        NSString *outputStr = [NumAgent roundDown:amount ifKeep:YES];
        outputStr = [NumAgent countNumAndChangeformat:outputStr];
        outputStr = [NSString stringWithFormat:@"%@元",outputStr];
        
        return outputStr;
    }
    else if (type == FormatTypeL) {
        NSString *outputStr = [NumAgent roundDown:amount ifKeep:NO];
        outputStr = [NumAgent countNumAndChangeformat:outputStr];
        outputStr = [NSString stringWithFormat:@"%@元",outputStr];
        
        return outputStr;
    }
    
    return nil;
}

+ (NSDictionary *)convertUnitIfNeeded:(NSString *)amount
{
    if (!amount.length) {
        return nil;
    }
    
    // 将数字分解成整数部分和小数部分
    NSArray *arr = [amount componentsSeparatedByString:@"."];
    // 取到整数部分
    NSString *integerPart = [arr firstObject];
    // 取到小数部分
    NSString *decimalPart = nil;
    if (arr.count > 1) {
        decimalPart = [arr lastObject];
    }
    
    if (integerPart.length >= 9) { // 整数部分大于或等于1亿
        // 去拼装转化为以亿为单位后数字
        NSMutableString *newAmount = [NSMutableString string];
        [newAmount appendString:[integerPart substringWithRange:NSMakeRange(0, integerPart.length - 8)]];
        [newAmount appendString:@"."];
        [newAmount appendString:[integerPart substringWithRange:NSMakeRange(integerPart.length - 8, 8)]];
        if (decimalPart) [newAmount appendString:decimalPart];
        
        return @{@"amount":newAmount,@"unit":@"亿"};
    }
    else if (integerPart.length >= 5 && integerPart.length < 9) { // 整数部分大于或等于10万并且小于1亿
        // 去拼装转化为以万为单位后数字
        NSMutableString *newAmount = [NSMutableString string];
        [newAmount appendString:[integerPart substringWithRange:NSMakeRange(0, integerPart.length - 4)]];
        [newAmount appendString:@"."];
        [newAmount appendString:[integerPart substringWithRange:NSMakeRange(integerPart.length - 4, 4)]];
        if (decimalPart) [newAmount appendString:decimalPart];
        
        return @{@"amount":newAmount,@"unit":@"万"};
    }
    else { // 整数部分小于10w
        return @{@"amount":amount,@"unit":@"元"};
    }
}

+ (NSString *)numberPreproccessed:(NSString *)num {
    if (!num.length) {
        return @"0";
    }
    return num;
}


@end
