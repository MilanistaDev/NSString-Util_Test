//
//  NSString+Util.m
//  
//
//  Created by 麻生 拓弥 on 2015/09/16.
//
//

#import "NSString+Util.h"

@implementation NSString (Util)

static const NSInteger kMaxCharacterCount = 5;

// テキストフィールドに入力された文字列を5文字以下なら切ってふなっしーの後に結合して返すメソッド
// 5文字以内なら何もしない(より汎用性がある)
- (NSString*)addSuffixWithDelimiter:(NSString*)delimiter suffixString:(NSString*)suffix count:(NSInteger)count
{
    // 可変
    NSMutableString *name = [self mutableCopy];
    
    if ([suffix length] > count) {
        NSString *suffixTempStr = [suffix substringToIndex:count];
        [name appendFormat:@"%@%@", delimiter, suffixTempStr];
    } else {
        [name appendFormat:@"%@%@", delimiter, suffix];
    }
    
    return [name copy];
}

// テキストフィールドに入力された文字列を5文字以下なら切ってふなっしーの後に結合して返すメソッド
// 5文字パターン決め打ち(特に決まった実装の場合)
- (NSString*)addSuffixWithDelimiter:(NSString*)delimiter suffixString:(NSString*)suffix
{
    // 汎用性のあるメソッドにテキストフィールドの文字列と5を渡してる
    return [self addSuffixWithDelimiter:delimiter suffixString:suffix count:kMaxCharacterCount];
}

/*
 分ける基準
 　あるメソッドファイル内のみの実装でかつ一度しか出てこない。--> そのまま書く
 　あるメソッドファイル内のみの実装でかつ複数出てくる場合   --> メソッド化(同じファイル内)
 　複数のメソッドファイルで使う場合                     --> 他クラスでメソッド化 or カテゴリ拡張
 */


@end
