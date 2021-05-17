#import "ReverseBinary.h"

UInt8 ReverseInteger(UInt8 n) {
    if(n == 0){
        return 0;
    }
        
    UInt8 res = 0;
    int c = 8;
    
    while(c--){
        res = res * 2 + (n % 2);
        n = n / 2;
    }
    
    return res;
}
