#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    
    NSMutableArray *arrayOfNumber = [NSMutableArray new];
    NSMutableArray *arrayOfString = [NSMutableArray new];
    NSMutableArray *sortedArray = [NSMutableArray new];
    
    for (NSArray *itemArray in array) {
        
        if ([itemArray isKindOfClass: [NSArray class]]) {
            
            for (int i = 0; i < itemArray.count; i++) {
                
                if ([itemArray[i] isKindOfClass: [NSNumber class]]) {
                    [arrayOfNumber addObject: itemArray[i]];
                } else if ([itemArray[i] isKindOfClass: [NSString class]]) {
                    [arrayOfString addObject: itemArray[i]];
                }
            }
            
        } else {
            return @[];
        }
    }
    
    [arrayOfNumber sortUsingSelector: @selector(compare:)];
    [arrayOfString sortUsingSelector: @selector(compare:)];
    
    NSArray *reversArrayString = [[arrayOfString reverseObjectEnumerator] allObjects];
    
    if ((arrayOfNumber.count != 0) && (arrayOfString.count != 0)) {
        [sortedArray addObjectsFromArray: @[arrayOfNumber]];
        [sortedArray addObjectsFromArray: @[reversArrayString]];
    } else {
        [sortedArray addObjectsFromArray: arrayOfNumber];
        [sortedArray addObjectsFromArray: arrayOfString];
    }
    
    return sortedArray;
}

@end
