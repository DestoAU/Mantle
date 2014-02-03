//
//  MTLQueryAdapter.h
//  Mantle
//
//  Created by Robert Amos on 01/02/2014.
//  Copyright (c) 2014 Robert Amos. All rights reserved.
//

#import <Foundation/Foundation.h>

@class MTLModel;

@protocol MTLQuerySerializing

@required

+ (NSDictionary *)queryStringKeyPathsByPropertyKey;

@optional

+ (NSValueTransformer *)queryStringTransformerForKey:(NSString *)key;

@end

@interface MTLQueryAdapter : NSObject

@property (nonatomic, strong, readonly) MTLModel<MTLQuerySerializing> *model;

//+ (id)modelOfClass:(Class)modelClass fromQueryString:(NSString *)queryString error:(NSError **)error;

+ (NSString *)queryStringFromModel:(MTLModel<MTLQuerySerializing> *)model;

//- (id)initWithQueryString:(NSString *)querystring modelClass:(Class)modelClass error:(NSError **)error;

- (id)initWithModel:(MTLModel<MTLQuerySerializing> *)model;

- (NSString *)queryString;

@end
