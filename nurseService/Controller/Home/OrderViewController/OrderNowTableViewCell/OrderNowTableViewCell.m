//
//  OrderNowTableViewCell.m
//  nurseService
//
//  Created by 梅阳阳 on 17/1/1.
//  Copyright © 2017年 iMac. All rights reserved.
//

#import "OrderNowTableViewCell.h"

@implementation OrderNowTableViewCell
@synthesize serviceContentL;
@synthesize stopTimeL;
@synthesize orderMoney;
@synthesize addressL;
@synthesize userInfoL;
@synthesize userInfoL1;
@synthesize orderInfoDict;
@synthesize oderStateL;

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier cellSize:(CGSize)cellsize
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier cellSize:cellsize];
    if (self) {
        
        CGFloat bgView_W = SCREENWIDTH-10;
        CGFloat bgView_H = 170;
        UIView *bgView = [[UIView alloc] initWithFrame:CGRectMake(5, 0, bgView_W, 170)];
        bgView.backgroundColor = [UIColor whiteColor];
        bgView.userInteractionEnabled = YES;
        [self addSubview:bgView];
        [bgView.layer setMasksToBounds:YES];
        bgView.layer.cornerRadius = 4.0;
        
        CGFloat serviceContentLX = 10;
        CGFloat serviceContentLY = 5;
        CGFloat serviceContentLW = bgView_W - 160;
        CGFloat serviceContentLH = 35;
        
        serviceContentL = [[UILabel alloc] initWithFrame:CGRectMake(serviceContentLX, serviceContentLY, serviceContentLW, serviceContentLH)];
        serviceContentL.userInteractionEnabled = YES;
        serviceContentL.textColor = APPDEFAULTORANGE;
        serviceContentL.adjustsFontSizeToFitWidth = YES;
        serviceContentL.font = [UIFont systemFontOfSize:15.0];
        serviceContentL.backgroundColor = [UIColor clearColor];
        [bgView addSubview:serviceContentL];
        
        orderMoney = [[UILabel alloc] initWithFrame:CGRectMake(SCREENWIDTH-150, 11, 130, 20)];
        orderMoney.textColor = [UIColor redColor];
        orderMoney.textAlignment = NSTextAlignmentRight;
        orderMoney.font = [UIFont systemFontOfSize:12.0];
        orderMoney.backgroundColor = [UIColor clearColor];
        [bgView addSubview:orderMoney];

        
        UILabel *line = [[UILabel alloc] initWithFrame:CGRectMake(5, 44, bgView_W-10, 1)];
        [bgView addSubview:line];
        line.backgroundColor = [UIColor colorWithWhite:237.0 / 255.0 alpha:1.0];
        
    
        UILabel *line1 = [[UILabel alloc] initWithFrame:CGRectMake(5, 44+40, bgView_W-10, 1)];
        [bgView addSubview:line1];
        line1.backgroundColor = [UIColor colorWithWhite:237.0 / 255.0 alpha:1.0];
        
        CGFloat tipX = 10;
        CGFloat tipY = CGRectGetMaxY(line1.frame);
        CGFloat tipW = 30;
        CGFloat tipH = (bgView_H - tipY-5)/3.0;
        

        UILabel *stopTimeTip = [[UILabel alloc] initWithFrame:CGRectMake(tipX, tipY, tipW, tipH)];
        stopTimeTip.textColor = [UIColor grayColor];
        stopTimeTip.font = [UIFont systemFontOfSize:12.0];
        stopTimeTip.backgroundColor = [UIColor clearColor];
        [bgView addSubview:stopTimeTip];
        stopTimeTip.text = @"时间";
        
        CGFloat labelX = CGRectGetMaxX(stopTimeTip.frame);
        CGFloat labelW = bgView_W-labelX-30;
        stopTimeL = [[UILabel alloc] initWithFrame:CGRectMake(labelX, tipY, labelW, tipH)];
        stopTimeL.textColor = [UIColor blackColor];
        stopTimeL.font = [UIFont systemFontOfSize:12.0];
        stopTimeL.backgroundColor = [UIColor clearColor];
        [bgView addSubview:stopTimeL];
        
        tipY = CGRectGetMaxY(stopTimeL.frame);
        UILabel *userTip = [[UILabel alloc] initWithFrame:CGRectMake(tipX, tipY, tipW, tipH)];
        userTip.textColor = [UIColor grayColor];
        userTip.text = @"姓名";
        userTip.font = [UIFont systemFontOfSize:12.0];
        userTip.backgroundColor = [UIColor clearColor];
        [bgView addSubview:userTip];
        
        userInfoL = [[UILabel alloc] initWithFrame:CGRectMake(labelX, tipY, labelW, tipH)];
        userInfoL.textColor = [UIColor blackColor];
        userInfoL.userInteractionEnabled = YES;
        userInfoL.font = [UIFont systemFontOfSize:12.0];
        userInfoL.backgroundColor = [UIColor clearColor];
        [bgView addSubview:userInfoL];
        
        UIImageView *rightV = [[UIImageView alloc] initWithFrame:CGRectMake(bgView_W-30, tipY, 20, 20)];
        rightV.backgroundColor = [UIColor clearColor];
        rightV.image = [UIImage imageNamed:@"icon_into_right"];
        rightV.userInteractionEnabled = YES;
        [bgView addSubview:rightV];
        
        
        tipY = CGRectGetMaxY(userInfoL.frame)-10;
        userInfoL1 = [[UILabel alloc] initWithFrame:CGRectMake(labelX, tipY, labelW, tipH+20)];
        userInfoL1.textColor = [UIColor blackColor];
        userInfoL1.userInteractionEnabled = YES;
        userInfoL1.numberOfLines = 2;
        userInfoL1.font = [UIFont systemFontOfSize:12.0];
        userInfoL1.backgroundColor = [UIColor clearColor];
        [bgView addSubview:userInfoL1];
        
        

        
//        UITapGestureRecognizer *showOrderDetailTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showOrderDetail)];
//        [bgView addGestureRecognizer:showOrderDetailTap];

//        addressL = [[UILabel alloc] initWithFrame:CGRectMake(10, CGRectGetMaxY(stopTimeL.frame), 300, 20)];
//        addressL.textColor = [UIColor blackColor];
//        addressL.font = [UIFont systemFontOfSize:12.0];
//        addressL.backgroundColor = [UIColor clearColor];
//        [timeAddressView addSubview:addressL];
        
//        UIImageView *locationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(SCREENWIDTH - 50, CGRectGetMaxY(stopTimeL.frame), 20, 20)];
//        [locationImageView setBackgroundColor:[UIColor clearColor]];
//        locationImageView.userInteractionEnabled = YES;
//        locationImageView.image = [UIImage imageNamed:@"icon_address"];
//        [timeAddressView addSubview:locationImageView];
//        
//        UITapGestureRecognizer *locationTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(goToLocationView)];
//        locationTap.numberOfTapsRequired = 1;
//        locationTap.numberOfTouchesRequired = 1;
//        [timeAddressView addGestureRecognizer:locationTap];
        
//        UILabel *line1 = [[UILabel alloc] initWithFrame:CGRectMake(5, 91, bgView_W-10, 1)];
//        [bgView addSubview:line1];
//        line1.backgroundColor = [UIColor colorWithWhite:237.0 / 255.0 alpha:1.0];
        /*
        CGFloat lineY = CGRectGetMaxY(line1.frame);
        
        UILabel *userTip = [[UILabel alloc] initWithFrame:CGRectMake(10, lineY, 200, 35)];
        userTip.textColor = [UIColor blackColor];
        userTip.text = @"患者信息";
        userTip.font = [UIFont systemFontOfSize:12.0];
        userTip.backgroundColor = [UIColor clearColor];
        [bgView addSubview:userTip];

        userInfoL = [[UILabel alloc] initWithFrame:CGRectMake(SCREENWIDTH-160, lineY, 130, 35)];
        userInfoL.textColor = [UIColor blackColor];
        userInfoL.userInteractionEnabled = YES;
        userInfoL.font = [UIFont systemFontOfSize:12.0];
        userInfoL.textAlignment = NSTextAlignmentRight;
        userInfoL.backgroundColor = [UIColor clearColor];
        [bgView addSubview:userInfoL];

        UIImageView *rightV1 = [[UIImageView alloc] initWithFrame:CGRectMake(bgView_W-20, lineY+13, 10, 10)];
        rightV1.backgroundColor = [UIColor clearColor];
        rightV1.image = [UIImage imageNamed:@"icon_into_right"];
        rightV1.userInteractionEnabled = YES;
        [bgView addSubview:rightV1];
        
        UITapGestureRecognizer *userInfoTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(showUserInfo)];
        [userInfoL addGestureRecognizer:userInfoTap];
        
        lineY = CGRectGetMaxY(userTip.frame);
//        UILabel *line3 = [[UILabel alloc] initWithFrame:CGRectMake(5, lineY, bgView_W-10, 1)];
//        [bgView addSubview:line3];
//        line3.backgroundColor = [UIColor colorWithWhite:237.0 / 255.0 alpha:1.0];
        
        UILabel *cancleL = [[UILabel alloc] initWithFrame:CGRectMake(0, lineY, 90, 35)];
        cancleL.textColor = [UIColor redColor];
        cancleL.userInteractionEnabled = YES;
        cancleL.textAlignment = NSTextAlignmentCenter;
        cancleL.font = [UIFont systemFontOfSize:12.0];
        cancleL.text = @"请求取消";
        cancleL.backgroundColor = [UIColor clearColor];
        [bgView addSubview:cancleL];
        
        UITapGestureRecognizer *cancleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(cancleRequst)];
        [cancleL addGestureRecognizer:cancleTap];

        UILabel *line2 = [[UILabel alloc] initWithFrame:CGRectMake(90, lineY+2, 1, 30)];
        [bgView addSubview:line2];
        line2.backgroundColor = [UIColor colorWithWhite:237.0 / 255.0 alpha:1.0];

        CGFloat nextStepW = (SCREENWIDTH-100)*2/5.0;
        UILabel *nextStepL = [[UILabel alloc] initWithFrame:CGRectMake(90, lineY, nextStepW, 35)];
        nextStepL.textColor = APPDEFAULTORANGE;
        nextStepL.userInteractionEnabled = YES;
        nextStepL.textAlignment = NSTextAlignmentRight;
        nextStepL.font = [UIFont systemFontOfSize:12.0];
        nextStepL.backgroundColor = [UIColor clearColor];
        nextStepL.text = @"下一步";
        [bgView addSubview:nextStepL];

        CGFloat oderStateX = 90 + nextStepW;
        CGFloat oderStateW = (SCREENWIDTH-100)*3/5.0;
        oderStateL = [[UILabel alloc] initWithFrame:CGRectMake(oderStateX, lineY, oderStateW, 35)];
        oderStateL.textColor = [UIColor grayColor];
        oderStateL.userInteractionEnabled = YES;
        oderStateL.font = [UIFont systemFontOfSize:12.0];
        oderStateL.backgroundColor = [UIColor clearColor];
        [bgView addSubview:oderStateL];
        
        UITapGestureRecognizer *nextStepTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nextStepRequst)];
        [nextStepL addGestureRecognizer:nextStepTap];
        
        UITapGestureRecognizer *nextStepTap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(nextStepRequst)];
        [oderStateL addGestureRecognizer:nextStepTap1];
        */
    }
    return self;
}

- (void)showOrderDetail{
    if (self.showOrderDetailBlock) {
        self.showOrderDetailBlock();
    }
}

- (void)cancleRequst{
    if (self.cancleRequstBlock) {
        self.cancleRequstBlock();
    }
}

- (void)nextStepRequst{
    if (self.nextStepBlock) {
        self.nextStepBlock();
    }
}

- (void)goToLocationView{
    if (self.locationBlock) {
        self.locationBlock();
    }
}

- (void)showUserInfo{
    if (self.showUserInfoBlock) {
        self.showUserInfoBlock();
    }
}
@end
