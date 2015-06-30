//
//  NSString+NaraPathlib.m
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

#import "NSString+NaraPathlib.h"

@implementation NSString (NaraPathlib)

- (NSString *)stringByExpandingRelativePathAtDirectory:(NSString *__nullable)directory {
    if (self.absolutePath) {
        return self;
    } else {
        @autoreleasepool {
            directory = directory ?: [[NSFileManager defaultManager] currentDirectoryPath];

            NSArray *directoryPathComps = directory.pathComponents;
            NSArray *selfPathComps = self.pathComponents;
            NSMutableArray *pathComponents = [[NSMutableArray alloc]
                                              initWithCapacity:directoryPathComps.count+selfPathComps.count];
            void(^pathCompProcessor)(NSString *, NSUInteger, BOOL *) = ^(NSString *comp, NSUInteger idx, BOOL *stop) {
                if ([comp isEqualToString:@"."] || [comp isEqualToString:@""]) {
                    return;  // pass
                } else if ([comp isEqualToString:@".."]) {
                    [pathComponents removeLastObject];  // pop
                } else {
                    [pathComponents addObject:comp];  // push
                }
            };

            [directoryPathComps enumerateObjectsUsingBlock:pathCompProcessor];
            [selfPathComps enumerateObjectsUsingBlock:pathCompProcessor];
            return [NSString pathWithComponents:pathComponents];
        }
    }
}

@end
