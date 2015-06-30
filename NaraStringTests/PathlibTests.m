//
//  PathlibTests.m
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
#import <XCTest/XCTest.h>
#import <NaraString/NSString+NaraPathlib.h>

@interface PathlibTests : XCTestCase

@end

@implementation PathlibTests

- (void)testExpandingRelativePath {
    XCTAssertEqualObjects([@"../a.txt" stringByExpandingRelativePathAtDirectory:@"/Users/sodas/Desktop"],
                          @"/Users/sodas/a.txt");
    XCTAssertEqualObjects([@"/etc/sshd/sshd.config" stringByExpandingRelativePathAtDirectory:@"/Users/sodas/Desktop"],
                          @"/etc/sshd/sshd.config");
    XCTAssertEqualObjects([@"images/image.png" stringByExpandingRelativePathAtDirectory:@"sodas/Desktop"],
                          @"sodas/Desktop/images/image.png");
    XCTAssertEqualObjects([@"../Pictures/image.png" stringByExpandingRelativePathAtDirectory:@"sodas/Desktop"],
                          @"sodas/Pictures/image.png");
}

@end
