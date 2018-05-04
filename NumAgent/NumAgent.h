/*
 对数字的格式化处理都集中到这里
 */
#import <Foundation/Foundation.h>

typedef enum {
    FormatTypeA = 0, // 四舍五入、带¥前缀、千分位、整数显示整数、小数保留2位
    FormatTypeB,     // 四舍五入、带¥前缀、千分位、数字固定保留2位
    FormatTypeC,     // 四舍五入、带¥前缀、千分位、数字小数部分不超过2位
    FormatTypeD,     // 四舍五入、带元后缀、千分位、整数显示整数、小数保留2位
    FormatTypeE,     // 四舍五入、带元后缀、千分位、数字固定保留2位
    FormatTypeF,     // 四舍五入、带元后缀、千分位、数字小数部分不超过2位
    
    FormatTypeG,     // 截位、带¥前缀、千分位、整数显示整数、小数保留2位
    FormatTypeH,     // 截位、带¥前缀、千分位、数字固定保留2位
    FormatTypeI,     // 截位、带¥前缀、千分位、数字小数部分不超过2位
    FormatTypeJ,     // 截位、带元后缀、千分位、整数显示整数、小数保留2位
    FormatTypeK,     // 截位、带元后缀、千分位、数字固定保留2位
    FormatTypeL      // 截位、带元后缀、千分位、数字小数部分不超过2位
    
}AmountFormatType;

@interface NumAgent : NSObject

/**
 数字四舍五入格式化
 
 @param num 数字
 @param ifKeep 是否固定保留两位（位数不足补0）
 @return 四舍五入格式化后的字符串
 */
+ (NSString *)roundPlain:(NSString *)num ifKeep:(BOOL)ifKeep;


/**
 数字四舍五入格式化
 
 @param num 数字
 @param ifKeep 是否固定保留两位（位数不足补0）
 @param ifThousands 是否千分位
 @param prefix 前缀
 @param suffix 后缀
 @return 四舍五入格式化后的字符串
 */
+ (NSString *)roundPlain:(NSString *)num
                  ifKeep:(BOOL)ifKeep
             ifThousands:(BOOL)ifThousands
                  prefix:(NSString *)prefix suffix:(NSString *)suffix;




/**
 数字四舍五入格式化，整数就整数显示，小数固定保留两位
 
 @param num 数字
 @return 格式化后的数字字符串
 */
+ (NSString *)roundPlainAndKeepFeature:(NSString *)num;


/**
 数字四舍五入格式化，整数就整数显示，小数固定保留两位
 
 @param num 数字
 @param ifThousands 是否千分位
 @param prefix 前缀
 @param suffix 后缀
 @return 格式化后的数字字符串
 */
+ (NSString *)roundPlainAndKeepFeature:(NSString *)num
                           ifThousands:(BOOL)ifThousands
                                prefix:(NSString *)prefix suffix:(NSString *)suffix;


/**
 数字截位格式化
 
 @param num 数字
 @param ifKeep 是否固定保留两位（位数不足补0）
 @return 截尾格式化后的字符串
 */
+ (NSString *)roundDown:(NSString *)num ifKeep:(BOOL)ifKeep;


/**
 数字截位格式化
 
 @param num 数字
 @param ifKeep 是否固定保留两位（位数不足补0）
 @param ifThousands 是否千分位
 @param prefix 前缀
 @param suffix 后缀
 @return 截尾格式化后的字符串
 */
+ (NSString *)roundDown:(NSString *)num
                 ifKeep:(BOOL)ifKeep
            ifThousands:(BOOL)ifThousands
                 prefix:(NSString *)prefix suffix:(NSString *)suffix;


/**
 数字截位格式化，整数就整数显示，小数固定保留两位
 
 @param num 数字
 @return 格式化后的数字字符串
 */
+ (NSString *)roundDownAndKeepFeature:(NSString *)num;


/**
 数字截位格式化，整数就整数显示，小数固定保留两位
 
 @param num 数字
 @param ifThousands 是否千分位
 @param prefix 前缀
 @param suffix 后缀
 @return 格式化后的数字字符串
 */
+ (NSString *)roundDownAndKeepFeature:(NSString *)num
                          ifThousands:(BOOL)ifThousands
                               prefix:(NSString *)prefix suffix:(NSString *)suffix;


/**
 数字千分位格式化
 
 @param num 数字
 @return 千分位格式化后的字符串
 */
+ (NSString *)countNumAndChangeformat:(NSString *)num;


/**
 判断一个小数是否约等于整数(*1000000做比较)
 
 @param num 数字
 @return (BOOL)
 */
+ (BOOL)isApproximateInteger:(double)num;


/**
 格式化数字支付串
 
 @param amount 数字
 @param type 格式化类型
 @return 格式化后的数字字符串
 */
+ (NSString *)formatAmount:(NSString *)amount type:(AmountFormatType)type;


/**
 数字单位转换，满10万转单位为万
 
 @param amount 金额
 @return 转换结果，包换两个字段:amount和unit
 */
+ (NSDictionary *)convertUnitIfNeeded:(NSString *)amount;


/**
 数字预处理

 @param num 数字字符串
 @return 处理后的数字字符串
 */
+ (NSString *)numberPreproccessed:(NSString *)num;


@end

