//
//  NSString+NaraEnumerate.m
//  NaraString
//
//  Copyright 2015 Dian-Je Tsai
//
//  Licensed under the Apache License, Version 2.0 (the "License");
//  you may not use this file except in compliance with the License.
//  You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
//  Unless required by applicable law or agreed to in writing, software
//  distributed under the License is distributed on an "AS IS" BASIS,
//  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//  See the License for the specific language governing permissions and
//  limitations under the License.
//

#import "NSString+NaraEnumerate.h"

@implementation NSString (NaraEnumerate)

- (void)enumerateCharacterFromSet:(NSCharacterSet *)aSet
                        withBlock:(void(^ __nullable)(unichar character, NSUInteger position, BOOL *stop))block {
    [self enumerateCharacterFromSet:aSet options:0 range:NSMakeRange(0, self.length) withBlock:block];
}

- (void)enumerateCharacterFromSet:(NSCharacterSet *)aSet
                          options:(NSStringCompareOptions)mask
                        withBlock:(void(^ __nullable)(unichar character, NSUInteger position, BOOL *stop))block {
    [self enumerateCharacterFromSet:aSet options:mask range:NSMakeRange(0, self.length) withBlock:block];
}

- (void)enumerateCharacterFromSet:(NSCharacterSet *)characterSet
                          options:(NSStringCompareOptions)options
                            range:(NSRange)targetRange
                        withBlock:(void(^ __nullable)(unichar character, NSUInteger position, BOOL *stop))block {
    block = block ?: ^(unichar _1, NSUInteger _2, BOOL *_3) {};

    NSUInteger searchRangeUpperBound = targetRange.location + targetRange.length;
    NSRange searchRange = NSMakeRange(targetRange.location, targetRange.length);
    while (searchRange.location < searchRangeUpperBound) {
        searchRange.length = searchRangeUpperBound - searchRange.location;
        NSRange foundRange = [self rangeOfCharacterFromSet:characterSet options:options range:searchRange];
        if (foundRange.location != NSNotFound) {
            searchRange.location = foundRange.location + foundRange.length;
            BOOL shouldStop = NO;
            unichar character = [self characterAtIndex:foundRange.location];
            block(character, foundRange.location, &shouldStop);
            if (shouldStop) {
                break;
            }
        } else {
            break;
        }
    }
}

@end
