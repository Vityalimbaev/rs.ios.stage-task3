#import "DateHelper.h"

@implementation DateHelper

#pragma mark - First

-(NSString *)monthNameBy:(NSUInteger)monthNumber {
    
    
    if(monthNumber < 1 || monthNumber > 12) {
        return nil;
    }
    
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents *dateComponents = [[NSDateComponents alloc] init];
    [dateComponents setMonth:monthNumber];
    NSDate *dateFromDateComponents = [calendar dateFromComponents:dateComponents];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"en_US"];
    dateFormatter.dateFormat=@"MMMM";
    NSString *monthName = [[dateFormatter stringFromDate:dateFromDateComponents] capitalizedString];
    NSLog(@"month: %@", monthName);

    return monthName;
}

#pragma mark - Second

- (long)dayFromDate:(NSString *)date {
    NSString *dateFormat = @"yyyy-MM-dd'T'HH:mm:ss'Z";
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.dateFormat = dateFormat;

    NSDate *dateFromString = [dateFormatter dateFromString:date];
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents * dayComponent = [calendar components:NSCalendarUnitDay fromDate:dateFromString];
    
    return (long)dayComponent.day;
}

#pragma mark - Third

- (NSString *)getDayName:(NSDate*) date {
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    dateFormatter.locale = [[NSLocale alloc] initWithLocaleIdentifier:@"ru_RU"];
    dateFormatter.dateFormat=@"EE";
    NSString *weekDayName = [[dateFormatter stringFromDate:date] capitalizedString];
    return weekDayName;
}

#pragma mark - Fourth

- (BOOL)isDateInThisWeek:(NSDate *)date {
    NSDate *curDate = [NSDate now];
    NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
    NSDateComponents * weekComponentImput = [calendar components:NSCalendarUnitWeekOfYear fromDate:date];
    NSDateComponents * weekComponentNow = [calendar components:NSCalendarUnitWeekOfYear fromDate:curDate];
    return (weekComponentNow.weekOfYear == weekComponentImput.weekOfYear);
}

@end
