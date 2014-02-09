//
//  NSValueTransformer+MTLQueryStringTransformerAdditions.m
//  Mantle
//
//  Created by Rob Amos on 9/02/2014.
//  Copyright (c) 2014 GitHub. All rights reserved.
//

#import "NSValueTransformer+MTLQueryStringTransformerAdditions.h"
#import "MTLQueryAdapter.h"
#import "MTLModelProtocol.h"
#import "MTLValueTransformer.h"

@implementation NSValueTransformer (MTLQueryStringTransformerAdditions)

+ (NSValueTransformer *)mtl_QueryStringDictionaryTransformerWithModelClass:(Class)modelClass {
	NSParameterAssert([modelClass conformsToProtocol:@protocol(MTLModel)]);
	NSParameterAssert([modelClass conformsToProtocol:@protocol(MTLQuerySerializing)]);
	
	return [MTLValueTransformer
			reversibleTransformerWithForwardBlock:^ id (id dictionary) {
				
				NSAssert(NO, @"Forward serialization with query strings isn't supported yet.");
				return nil;
//				if (JSONDictionary == nil) return nil;
//				
//				NSAssert([JSONDictionary isKindOfClass:NSDictionary.class], @"Expected a dictionary, got: %@", JSONDictionary);
//				
//				return [MTLQueryAdapter modelOfClass:modelClass fromJSONDictionary:JSONDictionary error:NULL];
			}
			reverseBlock:^ id (id model) {
				if (model == nil) return nil;
				
				NSAssert([model conformsToProtocol:@protocol(MTLModel)], @"Expected a model object conforming to <MTLModel> object, got %@", model);
				NSAssert([model conformsToProtocol:@protocol(MTLQuerySerializing)], @"Expected a model object conforming to <MTLJSONSerializing>, got %@", model);
				
				MTLQueryAdapter *adapter = [[MTLQueryAdapter alloc] initWithModel:model];
				return [adapter dictionary];
			}];
}

+ (NSValueTransformer *)mtl_QueryStringArrayTransformerWithModelClass:(Class)modelClass {
	NSValueTransformer *dictionaryTransformer = [self mtl_QueryStringDictionaryTransformerWithModelClass:modelClass];
	
	return [MTLValueTransformer
			reversibleTransformerWithForwardBlock:^ id (NSArray *dictionaries) {
				
				NSAssert(NO, @"Forward serialization with query strings isn't supported yet.");
				return nil;
//				if (dictionaries == nil) return nil;
//				
//				NSAssert([dictionaries isKindOfClass:NSArray.class], @"Expected a array of dictionaries, got: %@", dictionaries);
//				
//				NSMutableArray *models = [NSMutableArray arrayWithCapacity:dictionaries.count];
//				for (id JSONDictionary in dictionaries) {
//					if (JSONDictionary == NSNull.null) {
//						[models addObject:NSNull.null];
//						continue;
//					}
//					
//					NSAssert([JSONDictionary isKindOfClass:NSDictionary.class], @"Expected a dictionary or an NSNull, got: %@", JSONDictionary);
//					
//					id model = [dictionaryTransformer transformedValue:JSONDictionary];
//					if (model == nil) continue;
//					
//					[models addObject:model];
//				}
//				
//				return models;
			}
			reverseBlock:^ id (NSArray *models) {
				if (models == nil) return nil;
				
				NSAssert([models isKindOfClass:NSArray.class], @"Expected a array of MTLModels, got: %@", models);
				
				NSMutableArray *dictionaries = [NSMutableArray arrayWithCapacity:models.count];
				for (id model in models) {
					if (model == NSNull.null) {
						[dictionaries addObject:NSNull.null];
						continue;
					}
					
					NSAssert([model conformsToProtocol:@protocol(MTLModel)], @"Expected a model object conforming to MTLModel or an NSNull, got: %@", model);
					
					NSDictionary *dict = [dictionaryTransformer reverseTransformedValue:model];
					if (dict == nil) continue;
					
					[dictionaries addObject:dict];
				}
				
				return dictionaries;
			}];
}

@end
