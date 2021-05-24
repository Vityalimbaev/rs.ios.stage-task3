#import "PlayersSeparator.h"

@implementation PlayersSeparator

struct Descriptor
{
    bool asceding;
    int level;
    int count;
    NSMutableArray<NSNumber *> *combination;
};

- (NSInteger)dividePlayersIntoTeams:(NSArray<NSNumber *>*)ratingArray {
    struct Descriptor descriptorASC;
    descriptorASC.level = 0;
    descriptorASC.count = 0;
    descriptorASC.asceding = true;
    descriptorASC.combination = [@[@0,@0,@0] mutableCopy];
    
    struct Descriptor descriptorDESC = descriptorASC;
    descriptorDESC.asceding = false;
   
    for(int i = 0; i < (NSInteger)[ratingArray count]-2; i++) {
        descriptorASC.combination[descriptorASC.level] = ratingArray[i];
        descriptorASC.level +=1;
        [self separator:ratingArray offset:i+1 descriptor:&descriptorASC];
    }
  
    for(int i = 0; i < (NSInteger)[ratingArray count]-2; i++) {
        descriptorDESC.combination[descriptorDESC.level] = ratingArray[i];
        descriptorDESC.level +=1;
        [self separator:ratingArray offset:i+1 descriptor:&descriptorDESC];
    }
    
    return (NSInteger)(descriptorASC.count + descriptorDESC.count);
}

-(void)separator:(NSArray<NSNumber *>*)ratingArray offset:(NSInteger)offset descriptor:(struct Descriptor *)descriptor {
    if(!(descriptor->asceding ^ ([ratingArray[offset]intValue] > [descriptor->combination[descriptor->level-1]intValue]))) {
        if(descriptor->level == 2){
            descriptor->count += 1;
        }else{
            descriptor->combination[descriptor->level] = ratingArray[offset];
            descriptor->level +=1;
            
            [self separator:ratingArray offset:offset+1 descriptor:descriptor];
        }
    }
    
    if(offset >= ((NSInteger)[ratingArray count]-1) || (descriptor->level==1 && offset >= ((NSInteger)[ratingArray count]-2))) {
        descriptor->level-=1;
        return;
    }else{
        [self separator:ratingArray offset:offset+1 descriptor:descriptor];
    }

}
@end
