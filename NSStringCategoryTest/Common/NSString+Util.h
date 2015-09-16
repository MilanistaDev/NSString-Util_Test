//
//  NSString+Util.h
//  
//
//  Created by 麻生 拓弥 on 2015/09/16.
//
//

#import <Foundation/Foundation.h>

@interface NSString (Util)

/**
 * テキストフィールドに入力された文字列を5文字以下なら切ってふなっしーの後に結合して返すメソッド
 * @param delimiter 区切り文字
 * @param suffix テキストフィールドに入力された文字列
 * @param count 切り出す文字数
 */
- (NSString*)addSuffixWithDelimiter:(NSString*)delimiter suffixString:(NSString*)suffix count:(NSInteger)count;

/**
 * テキストフィールドに入力された文字列を5文字以下なら切ってふなっしーの後に結合して返すメソッド
 * @param delimiter 区切り文字
 * @param suffixString テキストフィールドに入力された文字列
 */
- (NSString*)addSuffixWithDelimiter:(NSString*)delimiter suffixString:(NSString*)suffix;

@end