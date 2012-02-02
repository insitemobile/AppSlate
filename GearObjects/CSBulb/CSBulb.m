//
//  CSBulb.m
//  AppSlate
//
//  Created by 김 태한 on 12. 1. 31..
//  Copyright (c) 2012년 ChocolateSoft. All rights reserved.
//

#import "CSBulb.h"

@implementation CSBulb

-(id) object
{
    return ((UIView*)csView);
}

//===========================================================================
#pragma mark -

-(void) setLightColor:(UIColor*)color
{
    if( [color isKindOfClass:[UIColor class]] )
        [light setBackgroundColor:color];

//    [self drawBulb];
}

-(UIColor*) getLightColor
{
    return light.backgroundColor;
}

-(void) setOnValue:(NSNumber*)BoolValue
{
    onValue = [BoolValue boolValue];
    
    [self drawBulb];
}

-(NSNumber*) getOnValue
{    
    return [NSNumber numberWithBool:onValue];
}

//===========================================================================

#pragma mark -

-(id) initGear
{
    if( ![super init] ) return nil;

    csView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 28, 28)];
    [(UIImageView*)csView setImage:[UIImage imageNamed:@"bulbOff.png"]];
    [csView setUserInteractionEnabled:YES];

    light = [[UIView alloc] initWithFrame:CGRectMake(8, 8, 12, 12)];
    [light setClipsToBounds:YES];
    [light.layer setCornerRadius:6];
    [light setBackgroundColor:[UIColor redColor]];
    [csView addSubview:light];
    
    onValue = YES;

    csCode = CS_BULB;
    csResizable = NO;

    self.info = NSLocalizedString(@"Light Bulb", @"Light Bulb");

    NSDictionary *d1 = MAKE_PROPERTY_D(@"Light Color", P_COLOR, @selector(setLightColor:),@selector(getLightColor));
    NSDictionary *d2 = MAKE_PROPERTY_D(@"On Value", P_BOOL, @selector(setOnValue:),@selector(getOnValue));
    pListArray = [NSArray arrayWithObjects:d1,d2, nil];

    return self;
}

-(void) drawBulb
{
    if( onValue )
        [light setAlpha:1.0];
    else
        [light setAlpha:0.0];
}

@end
