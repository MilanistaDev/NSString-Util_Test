//
//  ViewController.m
//  NSStringCategoryTest
//
//  Created by 麻生 拓弥 on 2015/09/16.
//  Copyright (c) 2015年 麻生 拓弥. All rights reserved.
//

#import "ViewController.h"
#import "NSString+Util.h"

@interface ViewController () <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UILabel *normalStringLabel;
@property (weak, nonatomic) IBOutlet UILabel *categoryStringLabel;

@end

@implementation ViewController

// 決まった文字列はバグを生むので積極的に定数化
NSString *const kSpecialString = @"ふなっしー";
NSString *const kDelimiter = @"_";
static const NSInteger kMaxCharacterCount = 5;
NSString *const kPlaceholderText = @"ふなっしーの後につけたい文字列を入力";
NSString *const kExampleString = @"例：ふなっしー_マジでかっ";
NSString *const kExampleString2 = @"例：ふなっしー_大好き";

# pragma mark - Life Cycle

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.textField.delegate = self;
    
    // テキストフィールドのPlaceholder
    self.textField.placeholder = kPlaceholderText;
    
    // ラベルの初期値
    self.normalStringLabel.text = kExampleString;
    self.categoryStringLabel.text = kExampleString2;
}


# pragma mark - Action Method

// 普通にこの m ファイルに整形処理を記載
- (IBAction)makeStringAction:(id)sender {
    
    NSString *formattedString;
    
    if (self.textField.text.length > kMaxCharacterCount) {
        NSString *tempStr = [self.textField.text substringToIndex:kMaxCharacterCount];
        formattedString = [NSString stringWithFormat:@"%@%@%@", kSpecialString, kDelimiter, tempStr];
    } else {
        formattedString = [NSString stringWithFormat:@"%@%@%@", kSpecialString, kDelimiter, self.textField.text];
    }
    self.normalStringLabel.text = formattedString;
}

// NSString+Util というカテゴリで処理
- (IBAction)makeStringWithCategoryAction:(id)sender {
    
    // ふなっしーの後に_5文字をつける処理をカテゴリで処理
    NSString *formattedString  = [kSpecialString addSuffixWithDelimiter:kDelimiter
                                                           suffixString:self.textField.text
                                  ];
    self.categoryStringLabel.text = formattedString;
}

# pragma mark - UITextFieldDelegate method

/**
 * キーボードとじる
 * @param textField イベントが発生したテキストフィールド
 */
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    // キーボードを隠す
    [self.view endEditing:YES];
    
    return YES;
}


# pragma mark - Memory Warning

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
