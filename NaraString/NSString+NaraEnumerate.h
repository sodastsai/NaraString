//
//  NSString+NaraEnumerate.h
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

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (NaraEnumerate)

- (void)enumerateCharacterFromSet:(NSCharacterSet *)aSet
                        withBlock:(void(^ __nullable)(unichar character, NSUInteger position, BOOL *stop))block;

- (void)enumerateCharacterFromSet:(NSCharacterSet *)aSet
                          options:(NSStringCompareOptions)mask
                        withBlock:(void(^ __nullable)(unichar character, NSUInteger position, BOOL *stop))block;

- (void)enumerateCharacterFromSet:(NSCharacterSet *)aSet
                          options:(NSStringCompareOptions)mask
                            range:(NSRange)aRange
                        withBlock:(void(^ __nullable)(unichar character, NSUInteger position, BOOL *stop))block;

@end

NS_ASSUME_NONNULL_END
