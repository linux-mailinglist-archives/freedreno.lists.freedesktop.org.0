Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C27163BF5E9
	for <lists+freedreno@lfdr.de>; Thu,  8 Jul 2021 09:03:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DAAD6E092;
	Thu,  8 Jul 2021 07:03:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32c.google.com (mail-ot1-x32c.google.com
 [IPv6:2607:f8b0:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79AAF6E092
 for <freedreno@lists.freedesktop.org>; Thu,  8 Jul 2021 07:03:24 +0000 (UTC)
Received: by mail-ot1-x32c.google.com with SMTP id
 59-20020a9d0ac10000b0290462f0ab0800so4875348otq.11
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jul 2021 00:03:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=e6F7jpKZgLK0g03ikV1DlLAQGZ9FCDYcFLY+NH5H2aM=;
 b=Djs5afqAC6AxTyRA78ZOnar6Uy1KsZPKM46v6cMxRutda3qAl0rMc29SQFeYmcTVV2
 bHQzlb7Hrg/3l8KKovEXvZw4Vu7s9Y0oqhDIseA7kQwbnhunBuh89Uf71cJDQKipvOhx
 acz2ky+Q04C+NbMI2SDQUCNXaauTAxxkQPI+g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=e6F7jpKZgLK0g03ikV1DlLAQGZ9FCDYcFLY+NH5H2aM=;
 b=F4pwr/rq3zDuSEvuDffuUEQF2DouMS1KOnkk2Yreo1eBO9mZRq03MfrRTtZ2Z8JYOB
 JzS9dSL8gkId+UrVNlcU5GFbnJuBHSlqw0kxZ/UavhNiqi4kDC+L2DhgCJNrq4RGklKz
 TXuKgDHVIfjcI87dANayJmy+yiKkEngjTD5f8M3nvb49FG7hXo+pEqxzl+rJ/fCJ74fX
 wl/Aqpkl256b9XIubUfO/Ty5nkkrSKwhe3UgLXKWhf6DAPNhYw4usNbHRvRuCyIn/5wq
 jt3gMEXnwIF3BZWfHOSzBiruhYGXmU0Sy5cKqm631GmzK/rrac1LoaZPnR1ulj7HvvUe
 wGHg==
X-Gm-Message-State: AOAM531sY1Xg9psMCABG1UpFpvxbBwo+pCNdx0/JK1BPH3n+8eMdfkdi
 jDWWWWIqQeg4kQIu6cvGSy392qsIf1qM7Lz/PV6GDg==
X-Google-Smtp-Source: ABdhPJzv/+s+l3IZI9ThycAUNiy4ELjrN4eN6oM11SYrQzEXtZPCGXuXmoPGSwVp0XoUtbH4vMfH0qB1UZFeF4HeV1o=
X-Received: by 2002:a9d:2781:: with SMTP id c1mr22106411otb.34.1625727803794; 
 Thu, 08 Jul 2021 00:03:23 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 8 Jul 2021 07:03:23 +0000
MIME-Version: 1.0
In-Reply-To: <1625592020-22658-2-git-send-email-khsieh@codeaurora.org>
References: <1625592020-22658-1-git-send-email-khsieh@codeaurora.org>
 <1625592020-22658-2-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 8 Jul 2021 07:03:23 +0000
Message-ID: <CAE-0n52SxJx8kOwQddWF096PsPy-0f8bDq_ss=u6i-hisD54Hg@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run
Subject: Re: [Freedreno] [PATCH 1/7] drm/msm/dp: use dp_ctrl_off_link_stream
 during PHY compliance test run
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-07-06 10:20:14)
> DP cable should always connect to DPU during the entire PHY compliance
> testing run. Since DP PHY compliance test is executed at irq_hpd event
> context, dp_ctrl_off_link_stream() should be used instead of dp_ctrl_off().
> dp_ctrl_off() is used for unplug event which is triggered when DP cable is
> dis connected.
>
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Is this

Fixes: f21c8a276c2d ("drm/msm/dp: handle irq_hpd with sink_count = 0 correctly")

or

Fixes: c943b4948b58 ("drm/msm/dp: add displayPort driver support")

? It's not clear how dp_ctrl_off() was working for compliance tests
before commit f21c8a276c2d.

>  drivers/gpu/drm/msm/dp/dp_ctrl.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index caf71fa..27fb0f0 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1530,7 +1530,7 @@ static int dp_ctrl_process_phy_test_request(struct dp_ctrl_private *ctrl)
>          * running. Add the global reset just before disabling the
>          * link clocks and core clocks.
>          */
> -       ret = dp_ctrl_off(&ctrl->dp_ctrl);
> +       ret = dp_ctrl_off_link_stream(&ctrl->dp_ctrl);
>         if (ret) {
>                 DRM_ERROR("failed to disable DP controller\n");
>                 return ret;
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
