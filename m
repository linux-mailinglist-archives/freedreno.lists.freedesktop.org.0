Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9296089788D
	for <lists+freedreno@lfdr.de>; Wed,  3 Apr 2024 20:49:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F62410F1B6;
	Wed,  3 Apr 2024 18:49:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EnB0BvCn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com
 [209.85.167.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3DF5610F1B6
 for <freedreno@lists.freedesktop.org>; Wed,  3 Apr 2024 18:49:00 +0000 (UTC)
Received: by mail-lf1-f46.google.com with SMTP id
 2adb3069b0e04-516bfcc8f67so240503e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 03 Apr 2024 11:49:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712170138; x=1712774938; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=T4UlKp0+98qrBZkCwolOL0UjNpShY+5uDH6xj75f1ck=;
 b=EnB0BvCnbkWcgeYAdWaPtYDlThqTSAxSEth/+H7LbIyLH4WPlxbrxG+iMCrk8Q8Zo3
 yzZ9nCSmI7htHN+bJjiZb4Ijwg9/trb5ODrJVZvVYS88IdabLl+T32suEYKJPDdEeDPk
 CyevFHQ20ivNK/d08BW4j6SKvYNOb4sCvNWC/BAktM3moriz2YGCSw+1m0F2tJFxUMAT
 KQlUiBTwJImKyoR5fH3mC/7yaUYmNOMvi8/5o3TmPb3tExbwGKzN6AvtmSGEYsRYrm6B
 kOpn3nVbYF+4IdnRcAO7bAas3zJ0KR2v6syKhZGbdwHGmu0WHkcciGR8zyJWkf94w4VP
 JYhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712170138; x=1712774938;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=T4UlKp0+98qrBZkCwolOL0UjNpShY+5uDH6xj75f1ck=;
 b=c6nI98v3/btz7ecxb18q1ZS3sna2hOyOZl9gfaYU1tDjjDn3/NbVys93WHZPtRL5oq
 0RkBXln8tHU2WSzFbCENeFUUvKvXwoczHouNsX0Tc+e8mI9LmpWVy1dMcX/tepjuyEP3
 qpRe8dtI8V5FHz9qoxUYFo4hh373ty4vI55KimLBw0zlmyl/SJ1CBYiV1WQu+HoxEmN1
 YN7XIV2+pSG73RSB4ltALCUmE5NmLBzaxVDcUtz7BsjsGR+ea26jNDd/H8F2T1oBdl2p
 epiq3dxRfHx02/QbU5r26oIkqeuqX75+/uBRIDi7kkm2IqWIrTbq9qgruRjBh/IeojWv
 1QeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWN6O0XhfYKuRuu9EUuCSKrgNmcQevyI4ST30mmOWV3Gca5bP0UQHUDJiPRNl57areyFu253W+V+7NVTR1IuIeKecFoPmHo+paU86iUojB+
X-Gm-Message-State: AOJu0YzDKT3MxHKghCvM3nlQ2uphMavtgW2KfYlRiMv/Sft52uVzRsdT
 T+zNCfrbPS2WRaaFmyyXOR2dB93tFedPZnLmOO753T4/SH1VNF2BE8yEq/qKhZw=
X-Google-Smtp-Source: AGHT+IGZxvocFB/k0J1XWTW3eUyufirz8K/RKSIbDf1a05LsDIVRxq4ve4g34j9XhmrysecJIF9Tkg==
X-Received: by 2002:a05:6512:34ce:b0:516:a2fc:9099 with SMTP id
 w14-20020a05651234ce00b00516a2fc9099mr198845lfr.60.1712170138090; 
 Wed, 03 Apr 2024 11:48:58 -0700 (PDT)
Received: from eriador.lumag.spb.ru
 (dzyjmhyyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a00e:a300::227])
 by smtp.gmail.com with ESMTPSA id
 j21-20020a19f515000000b00513cb11cd66sm2069424lfb.219.2024.04.03.11.48.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Apr 2024 11:48:57 -0700 (PDT)
Date: Wed, 3 Apr 2024 21:48:56 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 swboyd@chromium.org, dianders@chromium.org, vkoul@kernel.org, daniel@ffwll.ch, 
 airlied@gmail.com, agross@kernel.org, abel.vesa@linaro.org,
 andersson@kernel.org, 
 quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, quic_sbillaka@quicinc.com,
 marijn.suijten@somainline.org, freedreno@lists.freedesktop.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] phy/qcom-qmp-combo: propagate correct return value at
 phy_power_on()
Message-ID: <oqqpypb7qkcjrztjpqkkqlg6m55fm6hjhts7plytr27hrdmvcp@og7gwdajvsje>
References: <1711741835-10044-1-git-send-email-quic_khsieh@quicinc.com>
 <23f591d7-a5d6-c5d1-9ba1-1584e32e5164@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <23f591d7-a5d6-c5d1-9ba1-1584e32e5164@quicinc.com>
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, Apr 03, 2024 at 10:22:37AM -0700, Kuogee Hsieh wrote:
> Dmitry,
> 
> Any more comments?
> 
> On 3/29/2024 12:50 PM, Kuogee Hsieh wrote:
> > Currently qmp_combo_dp_power_on() always return 0 in regardless of
> > return value of cfg->configure_dp_phy(). This patch propagate
> > return value of cfg->configure_dp_phy() all the way back to caller.
> > 
> > Changes in V3:
> > -- add v2 changes log
> > 
> > Changes in V2:
> > -- add Fixes tag
> > -- add dev_err() to qmp_v3_configure_dp_phy()
> > -- add dev_err() to qmp_v4_configure_dp_phy()
> > 
> > Fixes: 52e013d0bffa ("phy: qcom-qmp: Add support for DP in USB3+DP combo phy")
> > Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > ---
> >   drivers/phy/qualcomm/phy-qcom-qmp-combo.c | 13 +++++++++----
> >   1 file changed, 9 insertions(+), 4 deletions(-)
> > 
> > diff --git a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > index 36632fa..513d99d 100644
> > --- a/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > +++ b/drivers/phy/qualcomm/phy-qcom-qmp-combo.c
> > @@ -2343,8 +2343,10 @@ static int qmp_v3_configure_dp_phy(struct qmp_combo *qmp)
> >   	writel(0x05, qmp->dp_dp_phy + QSERDES_V3_DP_PHY_TX2_TX3_LANE_CTL);
> >   	ret = qmp_combo_configure_dp_clocks(qmp);
> > -	if (ret)
> > +	if (ret) {
> > +		dev_err(qmp->dev, "dp phy configure failed, err=%d\n", ret);
> >   		return ret;
> > +	}

dev_err() calls are not related to the fix itself. Please split them to
a separate patch.

> >   	writel(0x04, qmp->dp_dp_phy + QSERDES_DP_PHY_AUX_CFG2);
> >   	writel(0x01, qmp->dp_dp_phy + QSERDES_DP_PHY_CFG);
> > @@ -2519,8 +2521,10 @@ static int qmp_v4_configure_dp_phy(struct qmp_combo *qmp)
> >   	int ret;
> >   	ret = qmp_v456_configure_dp_phy(qmp);
> > -	if (ret < 0)
> > +	if (ret < 0) {
> > +		dev_err(qmp->dev, "dp phy configure failed, err=%d\n", ret);
> >   		return ret;
> > +	}
> >   	/*
> >   	 * At least for 7nm DP PHY this has to be done after enabling link
> > @@ -2754,6 +2758,7 @@ static int qmp_combo_dp_power_on(struct phy *phy)
> >   	const struct qmp_phy_cfg *cfg = qmp->cfg;
> >   	void __iomem *tx = qmp->dp_tx;
> >   	void __iomem *tx2 = qmp->dp_tx2;
> > +	int ret;
> >   	mutex_lock(&qmp->phy_mutex);
> > @@ -2766,11 +2771,11 @@ static int qmp_combo_dp_power_on(struct phy *phy)
> >   	cfg->configure_dp_tx(qmp);
> >   	/* Configure link rate, swing, etc. */
> > -	cfg->configure_dp_phy(qmp);
> > +	ret = cfg->configure_dp_phy(qmp);
> >   	mutex_unlock(&qmp->phy_mutex);
> > -	return 0;
> > +	return ret;
> >   }
> >   static int qmp_combo_dp_power_off(struct phy *phy)

-- 
With best wishes
Dmitry
