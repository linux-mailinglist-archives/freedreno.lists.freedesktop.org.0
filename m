Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DB32B320171
	for <lists+freedreno@lfdr.de>; Fri, 19 Feb 2021 23:46:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27FCA6E0CB;
	Fri, 19 Feb 2021 22:46:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB5076E0DE
 for <freedreno@lists.freedesktop.org>; Fri, 19 Feb 2021 22:46:44 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id j1so2717838pgh.4
 for <freedreno@lists.freedesktop.org>; Fri, 19 Feb 2021 14:46:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=77aFN3X3B8ZOa2LFV3nt5PPEdkKjE+anr2eIHArGBZI=;
 b=mNayBvgQSMayniwbb1d97dRJpctfMgOIorNOVhijMSM+SLYhY7+q7UyttewTf9a2Hp
 B3Jp3CFUjbYUJfipkc3GFgul0vtBVKZAasjqy/DQskZ8j9FkqI0Wvgx3wDdMzisNK43X
 YkWW/eknmby9epgU1tvmCJXUYmOHkCdklRSmE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=77aFN3X3B8ZOa2LFV3nt5PPEdkKjE+anr2eIHArGBZI=;
 b=qVAMFXfiZE1/MDXYnpkwTBYj0AxyHw587x7FHZJRS45QQg5HPmmKEJHuek3rsyEIe+
 Q0E5Pc/6NW7G5vj2AoY+03X+LUFCdjNpk6pjK7PevvKGurLWdqeDtkFIP91yFYdrM245
 YD32z6ituMTH6rEVTAcIy8NORO0Pqa/i5c0h/J+44534N2g1MuoAoU6bvfuSPchYC2bq
 xb56XeKTuxpNis0y/ybWpGF3sZqnaSMLhWFGwCe+v4E8waUKPNVtERHKSK6KMHGtTTKZ
 0BNj2fLci2vAOcRwcjVMyRvBm1gSMXEZF/dEvN+NoY2b0TVRtjfut4GEdwM6p8fREl0b
 1sFg==
X-Gm-Message-State: AOAM532zQk1H4iCfD2CbaieMqw2gd9z9CBxqeMrokFTat7PjaMdJtuFM
 3erZMoNYw+EaptiWYOLOzHaS1g==
X-Google-Smtp-Source: ABdhPJyphuJcAQ8DmrcSWPjKefON0H2PGIBTxC+RlzDXEyHoy4w2bBE6hWP83maxY6SZS9eKqjnzGw==
X-Received: by 2002:a62:e703:0:b029:1ed:5a8b:4308 with SMTP id
 s3-20020a62e7030000b02901ed5a8b4308mr2846228pfh.67.1613774804277; 
 Fri, 19 Feb 2021 14:46:44 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:dd53:b29e:3c8:33ae])
 by smtp.gmail.com with ESMTPSA id x9sm9342392pjp.29.2021.02.19.14.46.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Feb 2021 14:46:43 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <7af07dcacd5b68087cc61e467e9c57ea@codeaurora.org>
References: <1613681704-12539-1-git-send-email-khsieh@codeaurora.org>
 <161368935031.1254594.14384765673800900954@swboyd.mtv.corp.google.com>
 <7af07dcacd5b68087cc61e467e9c57ea@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: khsieh@codeaurora.org
Date: Fri, 19 Feb 2021 14:46:41 -0800
Message-ID: <161377480166.1254594.16557636343276220817@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH v2 2/2] drm/msm/dp: add supported max link
 rate specified from dtsi
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org, robdclark@gmail.com,
 tanmay@codeaurora.org, daniel@ffwll.ch, aravindh@codeaurora.org,
 sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting khsieh@codeaurora.org (2021-02-19 08:39:38)
> On 2021-02-18 15:02, Stephen Boyd wrote:
> > Quoting Kuogee Hsieh (2021-02-18 12:55:04)
> >> Allow supported link rate to be limited to the value specified at
> >> dtsi. If it is not specified, then link rate is derived from dpcd
> >> directly. Below are examples,
> >> link-rate = <162000> for max link rate limited at 1.62G
> >> link-rate = <270000> for max link rate limited at 2.7G
> >> link-rate = <540000> for max link rate limited at 5.4G
> >> link-rate = <810000> for max link rate limited at 8.1G
> >> 
> >> Changes in V2:
> >> -- allow supported max link rate specified from dtsi
> > 
> > Please don't roll this into the patch that removes the limit. The
> > previous version of this patch was fine. The part that lowers the limit
> > back down should be another patch.
> > 
> > We rejected link-rate in DT before and we should reject it upstream
> > again. As far as I can tell, the maximum link rate should be determined
> > based on the panel or the type-c port on the board. The dp controller
> > can always achieve HBR3, so limiting it at the dp controller is
> > incorrect. The driver should query the endpoints to figure out if they
> > want to limit the link rate. Is that done automatically sometimes by
> > intercepting the DPCD?
> 
> ok, i will roll back to original patch and add the second patch for max 
> link rate limited purpose.
> panel dpcd specified max link rate it supported.
> At driver, link rate is derived from dpcd directly since driver will try 
> to use the maximum supported link rate and less lane to save power.
> Therefore it is not possible that limit link rate base on dpcd.
> AS i understand we are going to do max link rate limitation is due to 
> old redriver chip can not support HBR3.
> How can I acquire which type-c port on the board so that I can trigger 
> max link rate limitation?
> 
> 

The driver already seems to support lowering the link rate during link
training. Can't we try to train at the highest rate and then downgrade
the link speed until it trains properly? I sort of fail to see why we
need to introduce a bunch of complexity around limiting the link rate on
certain boards if the driver can figure out that link training doesn't
work at HBR3 so it should try to train at HBR2 instead.
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
