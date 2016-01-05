//
//  BaseModel.h
//  BaseProject
//
//  Created by 孙伟 on 15/12/15.
//  Copyright © 2015年 sunwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NSObject+Parse.h"
//#import <MJExtension.h>
//#import "NSObject+MJParse.h"

@class SWT1348647853363Model,SWAdsModel,SWImgextraModel,SWT1348648517839Model;

@interface BaseModel : NSObject

@end

@interface SWT1348648517839Model : NSObject

@property (nonatomic, copy) NSString *tname;
@property (nonatomic, copy) NSString *ptime;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSArray<SWImgextraModel *> *imgextra;
@property (nonatomic, copy) NSString *photosetID;
@property (nonatomic, assign) NSInteger hasHead;
@property (nonatomic, assign) NSInteger hasImg;
@property (nonatomic, copy) NSString *lmodify;
@property (nonatomic, copy) NSString *atemplate;
@property (nonatomic, copy) NSString *skipType;
@property (nonatomic, assign) NSInteger replyCount;
@property (nonatomic, copy) NSString *alias;
@property (nonatomic, copy) NSString *docid;
@property (nonatomic, assign) BOOL hasCover;
@property (nonatomic, assign) NSInteger hasAD;
@property (nonatomic, assign) NSInteger priority;
@property (nonatomic, copy) NSString *cid;
@property (nonatomic, copy) NSString *imgsrc;
@property (nonatomic, assign) BOOL hasIcon;
@property (nonatomic, strong) NSArray<SWAdsModel *> *ads;
@property (nonatomic, copy) NSString *ename;
@property (nonatomic, copy) NSString *skipID;
@property (nonatomic, assign) NSInteger order;
@property (nonatomic, copy) NSString *digest;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *url_3w;

@end

@interface SWT1348647853363Model : NSObject

@property (nonatomic, copy) NSString *tname;
@property (nonatomic, copy) NSString *ptime;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, strong) NSArray<SWImgextraModel *> *imgextra;
@property (nonatomic, copy) NSString *photosetID;
@property (nonatomic, assign) NSInteger hasHead;
@property (nonatomic, assign) NSInteger hasImg;
@property (nonatomic, copy) NSString *lmodify;
@property (nonatomic, copy) NSString *atemplate;
@property (nonatomic, copy) NSString *skipType;
@property (nonatomic, assign) NSInteger replyCount;
@property (nonatomic, copy) NSString *alias;
@property (nonatomic, copy) NSString *docid;
@property (nonatomic, assign) BOOL hasCover;
@property (nonatomic, assign) NSInteger hasAD;
@property (nonatomic, assign) NSInteger priority;
@property (nonatomic, copy) NSString *cid;
@property (nonatomic, copy) NSString *imgsrc;
@property (nonatomic, assign) BOOL hasIcon;
@property (nonatomic, strong) NSArray<SWAdsModel *> *ads;
@property (nonatomic, copy) NSString *ename;
@property (nonatomic, copy) NSString *skipID;
@property (nonatomic, assign) NSInteger order;
@property (nonatomic, copy) NSString *digest;
@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *url_3w;

@end

@interface SWAdsModel : NSObject

@property (nonatomic, copy) NSString *url;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;
@property (nonatomic, copy) NSString *tag;
@property (nonatomic, copy) NSString *imgsrc;
@end

@interface SWImgextraModel : NSObject

@property (nonatomic, copy) NSString *imgsrc;

@end