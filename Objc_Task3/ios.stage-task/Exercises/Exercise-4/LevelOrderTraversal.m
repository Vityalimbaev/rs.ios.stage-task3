#import "LevelOrderTraversal.h"

NSInteger createLevelOrderTravelsal(NSArray *tree, NSMutableArray *result, NSInteger index, NSInteger level) {
    typedef enum {
        left,
        right
    } Node;
    
    for (Node node = left; (level < [tree count]) && (node <= right); node++) {
        NSObject *node = [tree objectAtIndex:level];
        level+=1;
        if ([node isKindOfClass:NSNumber.class]) {
            if ([result count] <= index) {
                [result addObject:[NSMutableArray new]];
            }
            [result[index] addObject:node];
            level = createLevelOrderTravelsal(tree, result, index+1, level);
        }
    }
    return level;
}


NSArray *LevelOrderTraversalForTree(NSArray *tree) {
    NSMutableArray *result = [NSMutableArray new];
    createLevelOrderTravelsal(tree, result, 0, 0);
    return [result copy];
}
