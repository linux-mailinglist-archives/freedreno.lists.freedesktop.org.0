Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3936F3F7EED
	for <lists+freedreno@lfdr.de>; Thu, 26 Aug 2021 01:11:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A7ED46E43C;
	Wed, 25 Aug 2021 23:11:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x235.google.com (mail-oi1-x235.google.com
 [IPv6:2607:f8b0:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F43F6E43B
 for <freedreno@lists.freedesktop.org>; Wed, 25 Aug 2021 23:11:52 +0000 (UTC)
Received: by mail-oi1-x235.google.com with SMTP id q39so1644867oiw.12
 for <freedreno@lists.freedesktop.org>; Wed, 25 Aug 2021 16:11:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=QtXruHF4bnU6OyDGPGjhakaBMSfcI7KwDzUGtKN2MR0=;
 b=LSQ+Qs6HQ2tLgxADlDiknTiMlunVRVb2oTaqttGBCOLAy9cTuB2yKsogtfZ8PG903O
 h5M4uHZCfTCPEuGn7ae6aRomz+teFyOfwAahWuOVl0gm1XPoAx+WvuUlkgUfrzsn0Id7
 CFrxc8Q0QMTEBu528ANT70QfY/opiUACSIL1COUemir8eKja0ZTWsAzP7Oa07wR0hm1a
 nLkMWdmsttzoVcCUK3Qb8RLDR6lRWrUQ0Zj9YaiEgYAJ7ztDcSfp5MR4FZhS1DY6ygcR
 WA5rYjmlAuOugXKoPtKAfIFNkysDmGpBisdF8/Fayee8kQNXGIRAvBgw9C1nOlVy0aO6
 +GZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=QtXruHF4bnU6OyDGPGjhakaBMSfcI7KwDzUGtKN2MR0=;
 b=DScWr1G4aUkyM5D4cBlu38YJZAjWmBR9OBuRSI4ne+BtJdE7FO+mx/yDVXT/LLM4vU
 JmWYu9f0JKG5XOAvf7/FW5iog7Ew8BsZgSysUJDHeTsx9l9hMEcz8scqGIJgKrrFrq7i
 kLxrEU5ZcHkExVaaPxFy4WPXtI+9rJfCkOWaThCog4XyOI9qCgqb9rS53Bj89BbcEa59
 hCG6G9jsMZup2s+sKtRndhKyloYtWoKtVQui9fipjjDleq6ZXY6wgulf6Vqx48ZhHU53
 xX2EGRUmR+WF9VCNL7Jo2eYbr8VOAxcxOCYLe6T9tnOZQZZ9y3i+C37uc+tqfsMEyOD8
 VEjw==
X-Gm-Message-State: AOAM531La92bZ2i1jrn+BwzbajvV+A2vpQNGt8rkMmQtptRBgMnpzyb9
 WkLC3MmILIa4KugGccB5018hpg==
X-Google-Smtp-Source: ABdhPJwWtrUIdXOLEe63DVJX0W3pVBZSObgJ/P3jgP1myOd0+jMUDpnSf5bYJKY/guCKP8rvzghCnA==
X-Received: by 2002:a05:6808:21a5:: with SMTP id
 be37mr326536oib.172.1629933111367; 
 Wed, 25 Aug 2021 16:11:51 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186])
 by smtp.gmail.com with ESMTPSA id l67sm265529otl.3.2021.08.25.16.11.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 25 Aug 2021 16:11:50 -0700 (PDT)
Date: Wed, 25 Aug 2021 18:11:48 -0500
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: sbillaka@codeaurora.org
Cc: Stephen Boyd <swboyd@chromium.org>, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com,
 seanpaul@chromium.org, kalyan_t@codeaurora.org,
 abhinavk@codeaurora.org, dianders@chromium.org,
 khsieh@codeaurora.org, mkrishn@codeaurora.org
Message-ID: <YSbONPNITH6dIECr@builder.lan>
References: <1628726882-27841-1-git-send-email-sbillaka@codeaurora.org>
 <1628726882-27841-2-git-send-email-sbillaka@codeaurora.org>
 <CAE-0n52=mR0Zt8UZ3vOM-nt0UJszcFhi-eYfzDtD0bt3zhNA_Q@mail.gmail.com>
 <0b2aa426c8f511a29143f2a1117fe9a2@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0b2aa426c8f511a29143f2a1117fe9a2@codeaurora.org>
Subject: Re: [Freedreno] [PATCH v1 1/2] drm/msm/dp: Add support for SC7280
 eDP
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

On Thu 12 Aug 19:28 CDT 2021, sbillaka@codeaurora.org wrote:

> On 2021-08-12 06:11, Stephen Boyd wrote:
> > Quoting Sankeerth Billakanti (2021-08-11 17:08:01)
[..]
> > > +static int dp_parser_gpio(struct dp_parser *parser)
> > > +{
> > > +       struct device *dev = &parser->pdev->dev;
> > > +       int ret;
> > > +
> > > +       parser->panel_bklt_gpio = devm_gpiod_get(dev, "panel-bklt",
> > > +                       GPIOD_OUT_HIGH);
> > > +       if (IS_ERR(parser->panel_bklt_gpio)) {
> > > +               ret = PTR_ERR(parser->panel_bklt_gpio);
> > > +               parser->panel_bklt_gpio = NULL;
> > > +               DRM_ERROR("%s: cannot get panel-bklt gpio, %d\n",
> > > __func__, ret);
> > > +               goto fail;
> > > +       }
> > > +
> > > +       parser->panel_pwm_gpio = devm_gpiod_get(dev, "panel-pwm",
> > > GPIOD_OUT_HIGH);
> > > +       if (IS_ERR(parser->panel_pwm_gpio)) {
> > > +               ret = PTR_ERR(parser->panel_pwm_gpio);
> > > +               parser->panel_pwm_gpio = NULL;
> > > +               DRM_ERROR("%s: cannot get panel-pwm gpio, %d\n",
> > > __func__, ret);
> > > +               goto fail;
> > > +       }
> > > +
> > > +       DRM_INFO("gpio on");
> > > +fail:
> > > +       return 0;
> > > +}
> > 
> > Don't we have pwm backlight drivers like
> > drivers/video/backlight/pwm_bl.c to support this? This sort of thing
> > doesn't belong in the dp driver.
> 
> Okay. I will explore it.
> 

I proposed that we attach a drm_panel and allow that to control the
(pwm-)backlight. Here's the link for the DP patch:

https://lore.kernel.org/linux-arm-msm/20210726231351.655302-1-bjorn.andersson@linaro.org/

Regards,
Bjorn
