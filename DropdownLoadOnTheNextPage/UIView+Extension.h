//
//  UIView+Extension.h
//  JKPlus
//
//  Created by WJM on 15/10/28.
//  Copyright © 2015年 WJM. All rights reserved.
//

#import <UIKit/UIKit.h>

#define kSMainScreenWidth [UIScreen mainScreen].bounds.size.width
#define kSMainScreenHeight [UIScreen mainScreen].bounds.size.height

@interface UIView (Extension)

///该View所在的Controller
- (UIViewController *)viewController;
///该View的原点X值
@property (assign, nonatomic) CGFloat originX;
///该View的原点Y值
@property (assign, nonatomic) CGFloat originY;
///该View的宽度
@property (assign, nonatomic) CGFloat width;
///该View的高度
@property (assign, nonatomic) CGFloat height;
///该View的Size大小
@property (assign, nonatomic) CGSize size;
///该View的原点坐标
@property (assign, nonatomic) CGPoint origin;
///该View的原点X值+宽度
@property (assign, nonatomic) CGFloat right;
///该View的原点Y值+高度
@property (assign, nonatomic) CGFloat bottom;
/**
 *  删除所有的子类视图
 */
- (void)removeAllSubViews;
/**
 *  删除视图中特定类别的子类视图
 *
 *  @param cls 制定类别
 */
- (void)removeSubviewsWithSubviewClass:(Class)cls;
/**
 *  删除视图中特定Tag的子类视图
 *
 *  @param tag zilei
 */
- (void)removeSubviewsWithSubviewTag:(NSInteger)tag;
/**
 *  判断该View 是否 在屏幕上
 */
- (BOOL)isDisplayedInScreen;

/**
 *  连接到单击事件的接收器,并给它一个block;
 *
 *  @param block 要执行的block
 */
- (void)setTapActionWithBlock:(void (^)(void))block;


/**
 *  连接到长按事件的接收器,并给它一个block;
 *
 *  @param block 要执行的block
 */
- (void)setLongPressActionWithBlock:(void (^)(void))block;

@end
