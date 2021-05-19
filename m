Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 87DB538859F
	for <lists+freedreno@lfdr.de>; Wed, 19 May 2021 05:41:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6C0246ECD2;
	Wed, 19 May 2021 03:41:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from m43-7.mailgun.net (m43-7.mailgun.net [69.72.43.7])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A86516ECD2
 for <freedreno@lists.freedesktop.org>; Wed, 19 May 2021 03:41:47 +0000 (UTC)
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org;
 q=dns/txt; 
 s=smtp; t=1621395711; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=WqoS9E4WNEnuTzuu8mBefr5gA3kuqZaXEvJiKfOXllI=;
 b=aV2OnXbPGLtBH2d8qpzwYBDhXWtbgiaHZZSILFbpDXajj9qm9ClT0FcmnsQnwEe/WGj6cbNo
 T6ZOMd9eIndAXmz1djBAYy6g1TS0KBfSES1xkLDdA6vJJlFJNmPJ4i4bRcjRMcW+c5BfRXul
 JrFZuPfpvZtj3A3cc4ipwIpCX30=
X-Mailgun-Sending-Ip: 69.72.43.7
X-Mailgun-Sid: WyI3ZjZmNCIsICJmcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnIiwgImJlOWU0YSJd
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n01.prod.us-west-2.postgun.com with SMTP id
 60a488f62bff04e53b6e38a8 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Wed, 19 May 2021 03:41:42
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
 id B6959C4323A; Wed, 19 May 2021 03:41:42 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
 aws-us-west-2-caf-mail-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=2.0 tests=ALL_TRUSTED,BAYES_00
 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
 (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
 (No client certificate requested) (Authenticated sender: abhinavk)
 by smtp.codeaurora.org (Postfix) with ESMTPSA id EA3C2C433F1;
 Wed, 19 May 2021 03:41:41 +0000 (UTC)
MIME-Version: 1.0
Date: Tue, 18 May 2021 20:41:41 -0700
From: abhinavk@codeaurora.org
To: Bjorn Andersson <bjorn.andersson@linaro.org>
In-Reply-To: <20210511042043.592802-1-bjorn.andersson@linaro.org>
References: <20210511042043.592802-1-bjorn.andersson@linaro.org>
Message-ID: <40f6aefd3fa341e2bec2060106389be7@codeaurora.org>
X-Sender: abhinavk@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Subject: Re: [Freedreno] [PATCH 0/4] drm/msm/dp: Add support for SC8180x eDP
 controller
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 Tanmay Shah <tanmay@codeaurora.org>, Stephen Boyd <swboyd@chromium.org>,
 Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, sbillaka@codeaurora.org,
 Sean Paul <sean@poorly.run>, Chandan Uddaraju <chandanu@codeaurora.org>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain; charset="us-ascii"; Format="flowed"
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Bjorn

I had a quick glance on the series and before getting to other things 
wanted to know how you are initializing two different connectors for
DP & EDP resp.

The connector type for DP should be DRM_MODE_CONNECTOR_DisplayPort and 
eDP should be DRM_MODE_CONNECTOR_eDP.
We need both to be created so that both EDP and DP can be supported 
concurrently.

Will these changes work for concurrent eDP and DP case?

Thanks

Abhinav

On 2021-05-10 21:20, Bjorn Andersson wrote:
> The first patch in the series is somewhat unrelated to the support, but
> simplifies reasoning and debugging of timing related issues.
> 
> The second patch introduces support for dealing with different register 
> block
> layouts, which is used in the forth patch to describe the hardware 
> blocks found
> in the SC8180x eDP block.
> 
> The third patch configures the INTF_CONFIG register, which carries the
> configuration for widebus handling. As with the DPU the bootloader 
> enables
> widebus and we need to disable it, or implement support for adjusting 
> the
> timing.
> 
> Bjorn Andersson (4):
>   drm/msm/dp: Simplify the mvid/nvid calculation
>   drm/msm/dp: Store each subblock in the io region
>   drm/msm/dp: Initialize the INTF_CONFIG register
>   drm/msm/dp: Add support for SC8180x eDP
> 
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 99 +++++++----------------------
>  drivers/gpu/drm/msm/dp/dp_display.c |  1 +
>  drivers/gpu/drm/msm/dp/dp_parser.c  | 22 +++++++
>  drivers/gpu/drm/msm/dp/dp_parser.h  |  8 +++
>  4 files changed, 53 insertions(+), 77 deletions(-)
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
