//
//  NSValueTransformer+MTLQueryStringTransformerAdditions.h
//  Mantle
//
//  Created by Rob Amos on 9/02/2014.
//  Copyright (c) 2014 GitHub. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSValueTransformer (MTLQueryStringTransformerAdditions)

// Creates a reversible transformer to convert a Query String dictionary into a MTLModel
// object, and vice-versa.
//
// modelClass - The MTLModel subclass to attempt to parse from the JSON. This
//              class must conform to <MTLQuerySerializing>. This argument must
//              not be nil.
//
// Returns a reversible transformer which uses MTLQueryAdapter for transforming
// values back and forth.
+ (NSValueTransformer *)mtl_QueryStringDictionaryTransformerWithModelClass:(Class)modelClass;

// Creates a reversible transformer to convert an array of Query String dictionaries
// into an array of MTLModel objects, and vice-versa.
//
// modelClass - The MTLModel subclass to attempt to parse from each JSON
//              dictionary. This class must conform to <MTLQuerySerializing>.
//              This argument must not be nil.
//
// Returns a reversible transformer which uses MTLQueryAdapter for transforming
// array elements back and forth.
+ (NSValueTransformer *)mtl_QueryStringArrayTransformerWithModelClass:(Class)modelClass;

@end
