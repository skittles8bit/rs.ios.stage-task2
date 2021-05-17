#import "TwoDimensionalArraySorter.h"

@implementation TwoDimensionalArraySorter

- (NSArray *)twoDimensionalSort:(NSArray<NSArray *> *)array {
    
    NSMutableArray *arrStr = [NSMutableArray new];
    NSMutableArray *arrNum = [NSMutableArray new];

    for (int i = 0; i < array.count; i++) {
        
        if ([array[i] isKindOfClass: NSArray.class]) {
            if ([array[i].firstObject isKindOfClass: NSString.class]) {
                [arrStr addObjectsFromArray: array[i]];
            } else if ([array[i].firstObject isKindOfClass: NSNumber.class]) {
                [arrStr addObjectsFromArray: array[i]];
            }
        } else {
            return @[];
        }
        
    }
        
    if (arrNum.count > 0 && arrStr.count > 0) {
        [arrNum sortUsingDescriptors:
         [NSArray arrayWithObjects: [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES], nil]];
        [arrStr sortUsingDescriptors:
         [NSArray arrayWithObjects: [NSSortDescriptor sortDescriptorWithKey:@"self" ascending:NO], nil]];
        
        return @[arrNum, arrStr];
    } else if (arrNum.count == 0) {
        [arrStr sortUsingDescriptors:
         [NSArray arrayWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES], nil]];
        
        return arrStr;
    } else {
        [arrNum sortUsingDescriptors:
         [NSArray arrayWithObjects:[NSSortDescriptor sortDescriptorWithKey:@"self" ascending:YES], nil]];
        
        return arrNum;
    }
}

@end
