#import "IPFormatConverter.h"

@implementation IPFormatConverter

- (NSString *)ipFormatConverter:(NSArray *)numbersArray {
    if (!numbersArray || [numbersArray isEqualToArray:@[]]){
        return @"";
    }
    
    NSMutableArray *arrIP = [NSMutableArray array];
    NSInteger n = numbersArray.count;
    
    n = n > 4 ? 4 : n;
    
    for (int i = 0; i < n; i++)
    {
        if ([numbersArray[i] intValue] < 0){
            return @"Negative numbers are not valid for input.";
        }
           
        if ([numbersArray[i] intValue] > 255){
            return @"The numbers in the input array can be in the range from 0 to 255.";
        }
        
        [arrIP addObject: numbersArray[i]];
    }
    
    NSMutableString *strIP = [arrIP componentsJoinedByString:@"."].mutableCopy;
    
    if (n < 4)
    {
        for (int i = 0; i < 4 - n; i++){
            [strIP appendString:@".0"];
        }
    }
    
    return strIP;
}

@end
