//
//  ArcSliderView.m
//  QiQiRobot
//
//  Created by yuzeux on 2017/12/15.
//  Copyright © 2017年 Qunyu. All rights reserved.
//

#import "ArcSliderView.h"


typedef struct{
    double radius;
    double angle;
} PolarCoordinate;

//整个slider需要的信息参数结构体
typedef struct{
    CGPoint circleCenter;
    CGFloat radius;
    
    double fullLine;
    double circleOffset;
    double circleLine;
    double circleEmpty;
    
    double circleOffsetAngle;
    double circleLineAngle;
    double circleEmptyAngle;
    
    CGPoint startMarkerCenter;
    CGPoint endMarkerCenter;
    
    CGFloat startMarkerRadius;
    CGFloat endMarkerRadius;
    
    CGFloat startMarkerFontSize;
    CGFloat endMarkerFontize;
    
    CGFloat startMarkerAlpha;
    CGFloat endMarkerAlpha;
    
} SectorDrawingInformation;

@interface ArcSliderView()
@property (nonatomic, strong)UILabel * numLable;
@end

@implementation ArcSliderView{
    Sector *trackingSector;//变化的点
    SectorDrawingInformation trackingSectorDrawInf;//变化点的信息
    BOOL trackingSectorStartMarker;
    UIButton     * _addBtn;
    UIButton     * _reduceBtn;
    UIView       * _numView;
  
}

#pragma mark - Initializators

- (instancetype)init{
    if(self = [super init]){
        [self setupDefaultConfigurations];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder{
    if(self = [super initWithCoder:aDecoder]){
        [self setupDefaultConfigurations];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame{
    if(self = [super initWithFrame:frame]){
        [self setupDefaultConfigurations];
    }
    return self;
}
//初始化
- (void) setupDefaultConfigurations{
    self.backgroundColor = [UIColor clearColor];
    self.startAngle = toRadians(135);
    self.endAngle = toRadians(45);
    self.markRadius = 10;
    self.circleLineWidth = 25;
    self.lineWidth = 1;
    
//    WEAKSELF;
    _addBtn = [[UIButton alloc]init];
    [_addBtn setImage:[UIImage imageNamed:@"Programe_add"] forState:UIControlStateNormal];
//    [_addBtn addClickBlock:^(UIButton *sender) {
//        [weakSelf setChangeNum:1];
//    } for:UIControlEventTouchUpInside];
    [self addSubview:_addBtn];
//    [_addBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.right.mas_equalTo(0);
//        make.top.mas_equalTo(turn6(51));
//        make.size.mas_equalTo(CGSizeMake(turn6(15.75), turn6(15.75)));
//    }];
 
    _reduceBtn = [[UIButton alloc]init];
    [_reduceBtn setImage:[UIImage imageNamed:@"Programe_minus"] forState:UIControlStateNormal];
//    [_reduceBtn addClickBlock:^(UIButton *sender) {
//        [weakSelf setChangeNum:0];
//    } for:UIControlEventTouchUpInside];
    [self addSubview:_reduceBtn];
//    [_reduceBtn mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(0);
//        make.top.mas_equalTo(turn6(51));
//        make.size.mas_equalTo(CGSizeMake(turn6(15.75), turn6(15.75)));
//    }];
    
    _numView = [[UIView alloc]init];
    [self addSubview:_numView];
//    [_numView mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.centerX.mas_equalTo(0);
//        make.top.mas_equalTo(turn6(59));
//        make.size.mas_equalTo(CGSizeMake(turn6(39.65), turn6(19.96)));
//    }];
    
    UIImageView * icon = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0, 39.65, 19.96)];
    icon.image = [UIImage imageNamed:@"Programe_angles_box"];
    [_numView addSubview:icon];
//    [icon mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.and.bottom.and.right.and.left.mas_equalTo(0);
//        make.size.mas_equalTo(CGSizeMake(turn6(39.65), turn6(19.96)));
//    }];
    
    self.numLable = [[UILabel alloc]init];
    self.numLable.font = [UIFont systemFontOfSize:18];
//    self.numLable .textColor     = ColorFromHex(0x777777);
    self.numLable .textAlignment = NSTextAlignmentCenter;
    [_numView addSubview:self.numLable];
//    [self.numLable  mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.center.mas_equalTo(0);
//        make.size.mas_equalTo(CGSizeMake(turn6(39.65), turn6(19.96)));
//    }];
    
}

#pragma mark - Setters

- (void)setSectorsRadius:(double)sectorsRadius{
    _sectorsRadius = sectorsRadius;
    [self setNeedsDisplay];
}

#pragma mark - Events manipulator
//开始
- (BOOL) beginTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint touchPoint = [touch locationInView:self];
    
    Sector *sector = self.sector;
    SectorDrawingInformation drawInf =[self sectorToDrawInf:sector];
    
    if([self touchInCircleWithPoint:touchPoint circleCenter:drawInf.endMarkerCenter]){
        trackingSector = sector;
        trackingSectorDrawInf = drawInf;
        trackingSectorStartMarker = NO;
        return YES;
    }
    
    if([self touchInCircleWithPoint:touchPoint circleCenter:drawInf.startMarkerCenter]){
        trackingSector = sector;
        trackingSectorDrawInf = drawInf;
        trackingSectorStartMarker = YES;
        return YES;
    }
    
    return NO;
}
//持续
- (BOOL) continueTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    CGPoint touchPoint = [touch locationInView:self];
    CGPoint ceter = [self multiselectCenter];
    PolarCoordinate polar = decartToPolar(ceter, touchPoint);
    
    double correctedAngle;
    if(polar.angle < self.startAngle) correctedAngle = polar.angle + (2 * M_PI - self.startAngle);
    else correctedAngle = polar.angle - self.startAngle;
    
    double procent = correctedAngle / (M_PI * 2);
    
    double newValue = procent * (trackingSector.maxValue - trackingSector.minValue) + trackingSector.minValue;
    
    if(trackingSectorStartMarker){
        if(newValue > trackingSector.startValue){
            double diff = newValue - trackingSector.startValue;
            if(diff > ((trackingSector.maxValue - trackingSector.minValue)/2)){
                trackingSector.startValue = trackingSector.minValue;
                [self valueChangedNotification];
                [self setNeedsDisplay];
                return YES;
            }
        }
        if(newValue >= trackingSector.endValue) {
            trackingSector.startValue = trackingSector.endValue;
            [self valueChangedNotification];
            [self setNeedsDisplay];
            return YES;
        }
        trackingSector.startValue = newValue;
        [self valueChangedNotification];
    }else{
        if(newValue < trackingSector.endValue){
            double diff = trackingSector.endValue - newValue;
            if(diff > ((trackingSector.maxValue - trackingSector.minValue)/2)){
                trackingSector.endValue = trackingSector.maxValue;
                [self valueChangedNotification];
                [self setNeedsDisplay];
                return YES;
            }
        }
        if(newValue <= trackingSector.startValue){
            trackingSector.endValue = trackingSector.startValue;
            [self valueChangedNotification];
            [self setNeedsDisplay];
            return YES;
        }
        trackingSector.endValue = newValue;
        [self valueChangedNotification];
    }
    
    [self setNeedsDisplay];
    self.numLable.text = [NSString stringWithFormat:@"%.0f°",trackingSector.startValue];
    if (self.numBlock) {
        self.numBlock([NSString stringWithFormat:@"%.0f",trackingSector.startValue]);
    }
    return YES;
}
//结束
- (void) endTrackingWithTouch:(UITouch *)touch withEvent:(UIEvent *)event{
    trackingSector = nil;
    trackingSectorStartMarker = NO;
}

- (CGPoint) multiselectCenter{
    return CGPointMake(self.bounds.size.width/2, self.bounds.size.width/2);
}

//判断点击的位置是否是mark内
- (BOOL) touchInCircleWithPoint:(CGPoint)touchPoint circleCenter:(CGPoint)circleCenter{
    PolarCoordinate polar = decartToPolar(circleCenter, touchPoint);
    if(polar.radius >= self.markRadius)
        return NO;
    else
        return YES;
}

- (void) valueChangedNotification{
    [self sendActionsForControlEvents:UIControlEventValueChanged];
}


#pragma mark - Drawing

- (void)drawRect:(CGRect)rect{
    
    [self drawSector:self.sector];
}

- (void)drawSector:(Sector *)sector{
    //    1、获取当前上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    //    CGContextSetLineWidth(context, self.circleLineWidth);
    
//    UIColor *startCircleColor = ColorFromHex(0xBABABA);
    UIColor *startCircleColor = [UIColor blackColor];
    //    UIColor *markBackcolor = [UIColor whiteColor];
    
    SectorDrawingInformation drawInf = [self sectorToDrawInf:sector];
    CGFloat x = drawInf.circleCenter.x;
    CGFloat y = drawInf.circleCenter.y;
    CGFloat r = drawInf.radius;
    CGFloat len = r/sqrt(2);
    
    //2.描述路径
    //ArcCenter:中心点
    //radius:半径
    //startAngle：起始角度
    //endAngle：结束角度
    //clockwise：是否逆时针
    UIBezierPath * path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(x, y) radius:r startAngle: self.startAngle endAngle:self.endAngle clockwise:YES];
    
    CGContextSetLineWidth(context, 20);
    CGContextSetLineCap(context, kCGLineCapRound);
    //4.设置颜色
    [[UIColor whiteColor]setStroke];
    [path closePath];  //关闭路径
    //3.添加路径到上下文
    CGContextAddPath(context, path.CGPath);
    //显示一个空心圆，描边
    CGContextStrokePath(context);
    
    //外圆弧
    CGContextSetLineWidth(context, self.lineWidth);
    [[startCircleColor colorWithAlphaComponent:drawInf.startMarkerAlpha] setStroke];
    CGContextAddArc(context, x, y, r+10, self.startAngle, M_PI_4, 0);
    CGContextStrokePath(context);
    
    //中间弧
    CGContextSetLineWidth(context, self.lineWidth);
    [[startCircleColor colorWithAlphaComponent:drawInf.startMarkerAlpha] setStroke];
    CGContextAddArc(context, x, y, r, self.startAngle, M_PI_4, 0);
    CGContextStrokePath(context);
    
    //左端点
    CGContextSaveGState(context);
    [[startCircleColor colorWithAlphaComponent:drawInf.startMarkerAlpha] setStroke];
    CGContextAddArc(context, x-len, y+len, 10, -M_PI_4, M_PI_4*3, 0);
    CGContextStrokePath(context);
    
    //内圆弧
    CGContextSaveGState(context);
    [[startCircleColor colorWithAlphaComponent:drawInf.startMarkerAlpha] setStroke];
    CGContextAddArc(context, x, y, r-10, self.startAngle, M_PI_4, 0);
    CGContextStrokePath(context);
    
    //右端点
    CGContextSaveGState(context);
    [[startCircleColor colorWithAlphaComponent:drawInf.startMarkerAlpha] setStroke];
    CGContextAddArc(context, x+len, y+len, 10, M_PI_4, M_PI_4*5, 0);
    CGContextStrokePath(context);
    
    //标记
//    UIColor *markingColor = ColorFromHex(0x5B94FD);
    UIColor *markingColor = [UIColor yellowColor];
    CGContextSetLineWidth(context, 10);
    CGContextSaveGState(context);
    [[markingColor colorWithAlphaComponent:drawInf.startMarkerAlpha] setStroke];
    CGContextAddArc(context, drawInf.startMarkerCenter.x, drawInf.startMarkerCenter.y, drawInf.startMarkerRadius, 0.0, 6.28, 0);
    CGContextStrokePath(context);
    
}


- (SectorDrawingInformation) sectorToDrawInf:(Sector *)sector {
    SectorDrawingInformation drawInf;
    
    //圆中心
    drawInf.circleCenter = CGPointMake(self.bounds.size.width / 2, self.bounds.size.width   /2);
    //圆半径
    drawInf.radius = self.sectorsRadius;
    //完整的线
    drawInf.fullLine = sector.maxValue - sector.minValue;
    //圆偏移
    drawInf.circleOffset = sector.startValue - sector.minValue;
    NSLog(@"%f",drawInf.circleOffset);
    //圆的线
    drawInf.circleLine = sector.endValue - sector.startValue;
    //空圆
    drawInf.circleEmpty = sector.maxValue - sector.endValue;
    
    //圆偏移角度
    drawInf.circleOffsetAngle = (drawInf.circleOffset/drawInf.fullLine) * M_PI * 2 + self.startAngle;
    
    //圆线角度
    drawInf.circleLineAngle = (drawInf.circleLine/drawInf.fullLine) * M_PI * 2 + drawInf.circleOffsetAngle;
    
    //空圆角度
    drawInf.circleEmptyAngle = M_PI * 2 + self.startAngle;
    
    //开始标记中心
    drawInf.startMarkerCenter = polarToDecart(drawInf.circleCenter, drawInf.radius, drawInf.circleOffsetAngle);
    
    //开始标记角度
    drawInf.startMarkerRadius = self.markRadius;
    
    drawInf.startMarkerFontSize = 18;
    drawInf.startMarkerAlpha = 1.0;
    
    return drawInf;
}



CGFloat toDegrees (CGFloat radians){
    return radians * 180 / M_PI;
}

CGFloat toRadians (CGFloat degrees){
    return degrees * M_PI / 180;
}

CGFloat segmentAngle (CGPoint startPoint, CGPoint endPoint){
    CGPoint v = CGPointMake(endPoint.x-startPoint.x, endPoint.y-startPoint.y);
    float vmag = sqrt(powf(v.x, 2.0) + powf(v.y, 2.0));
    v.x /= vmag;
    v.y /= vmag;
    double radians = atan2(v.y,v.x);
    return radians;
}

CGFloat segmentLength(CGPoint startPoint, CGPoint endPoint){
    return decartToPolar(startPoint, endPoint).radius;
}

CGPoint polarToDecart(CGPoint startPoint, CGFloat radius, CGFloat angle){
    CGFloat x = radius * cos(angle) + startPoint.x;
    CGFloat y = radius * sin(angle) + startPoint.y;
    return CGPointMake(x, y);
}

PolarCoordinate decartToPolar(CGPoint center, CGPoint point){
    double x = point.x - center.x;
    double y = point.y - center.y;
    
    PolarCoordinate polar;
    polar.radius = sqrt(pow(x, 2.0) + pow(y, 2.0));
    polar.angle = acos(x/(sqrt(pow(x, 2.0) + pow(y, 2.0))));
    if(y < 0) polar.angle = 2 * M_PI - polar.angle;
    return polar;
}


-(void)setChangeNum:(NSInteger )type{
    
    NSInteger nums = [self.numLable.text integerValue];
    if (type) {
        nums++;
        if (nums >= 90) {
            nums  = 90;
        }
    }else{
        nums--;
        if (nums < -90) {
            nums = -90;
        }
    }
    self.numLable.text = [NSString stringWithFormat:@"%ld°",nums];
    if (self.numBlock) {
        self.numBlock([NSString stringWithFormat:@"%ld",nums]);
    }
}



@end





@implementation Sector

- (instancetype)init{
    if(self = [super init]){
        self.minValue = -90.0;
        self.maxValue = 90;
        self.startValue = -90.0;
        self.endValue = 90;
        self.tag = 0;
        self.color = [UIColor greenColor];
    }
    return self;
}

+ (instancetype) sector{
    return [[Sector alloc] init];
}

+ (instancetype) sectorWithColor:(UIColor *)color {
    Sector *sector = [self sector];
    sector.color = color;
    return sector;
}

+ (instancetype) sectorWithColor:(UIColor *)color maxValue:(double)maxValue {
    Sector *sector = [self sectorWithColor:color];
    sector.maxValue = maxValue;
    return sector;
}

+ (instancetype) sectorWithColor:(UIColor *)color minValue:(double)minValue maxValue:(double)maxValue {
    Sector *sector = [self sectorWithColor:color maxValue:maxValue];
    sector.minValue = minValue;
    return sector;
}


@end
