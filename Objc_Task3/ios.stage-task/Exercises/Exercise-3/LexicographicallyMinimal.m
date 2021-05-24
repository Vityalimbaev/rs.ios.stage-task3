#import "LexicographicallyMinimal.h"

@interface LexicographicallyMinimal()

@property (nonatomic, strong) NSMutableString *resultString;

@end

@implementation LexicographicallyMinimal

-(NSString *)findLexicographicallyMinimalForString1:(NSString *)string1 andString2:(NSString *)string2 {
    NSMutableString *result = [NSMutableString new];
    [self processor:result string1:[string1 mutableCopy] andString2:[string2 mutableCopy]];
    return result;
}

-(void)processor:(NSMutableString *)result string1:(NSMutableString *)string1 andString2:(NSMutableString *)string2 {
    if ( string1.length > 0  && string2.length > 0) {
        NSString *min;
        if ([string1 characterAtIndex:0] > [string2 characterAtIndex:0]) {
            min = [NSString stringWithFormat:@"%C",[string2 characterAtIndex:0]];
            [string2 replaceCharactersInRange:NSMakeRange(0,1) withString:@""] ;
        } else {
            min = [NSString stringWithFormat:@"%C",[string1 characterAtIndex:0]];
            [string1 replaceCharactersInRange:NSMakeRange(0,1) withString:@""];
        }
        
        [result appendString:min];
        [self processor:result string1:string1 andString2:string2];
    }else{
        if (string1.length > 0 ) {
            [result appendString:[string1 substringFromIndex:0]];
        } else {
            [result appendString:[string2 substringFromIndex:0]];
        }
    }
}

@end
