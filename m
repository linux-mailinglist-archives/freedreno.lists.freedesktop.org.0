Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7489535D5DE
	for <lists+freedreno@lfdr.de>; Tue, 13 Apr 2021 05:28:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E978F89AEE;
	Tue, 13 Apr 2021 03:28:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com
 [IPv6:2607:f8b0:4864:20::629])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C175F89B01
 for <freedreno@lists.freedesktop.org>; Tue, 13 Apr 2021 03:28:29 +0000 (UTC)
Received: by mail-pl1-x629.google.com with SMTP id u7so5652059plr.6
 for <freedreno@lists.freedesktop.org>; Mon, 12 Apr 2021 20:28:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=5tAqdlQ65Xiy+ghk0KtAk1i63l3pg3LrUb/XYFsIE98=;
 b=Nfix/WkJaJUAKI5kzwmzy6o8D/QWeDAJW9sMJF9vWnsyFpc8m2qPM5EWSmJNQdir1S
 XN8xWkassirzbxD2RBEQoRrFuHo4mAz3CBSFijL8jhg5IrBQ5eF2KzC9jtgBBokqEmzk
 YrumnjWs5OcgFJ5XcS0JMgbFuzR1kCjtwpSTM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=5tAqdlQ65Xiy+ghk0KtAk1i63l3pg3LrUb/XYFsIE98=;
 b=GGiMRcO34olORaXL0hXecpAdOkTjMRmW3uZg4m6a859eixImlfL49n+x2PFmIgkQHx
 fweFE8OgEtMFQxZ/Grx3rVz+VMmhZYId6VHfgkkmW4nJ2qkqAv+lER3yYNGu010IrU61
 GfrgnNq46m4SnE9ztsvsK7zEjTr7ZoDJ4TaBZolXW+Zw+V1sbxVcUNTalmYcx8v3LQtH
 SUN09UTIx8L+cMziki70rFdrhjN5k6gNRLFhQ/9hMKBy4aLCjeWwKYJvdiVwVl0MiqkZ
 +r7Awh4vzPDOa6CBP7sUb1oA0qaTZy0U0nIRcfpB2u+1Rokn3kRMhRg3BgC9fBh369Kn
 /XyQ==
X-Gm-Message-State: AOAM5338f31/yvn6NxprToVC+Sf2UP4xU7rCeikiyOxHqo0KJ5dYhZf+
 fc4Rp99WQ5ekNJJ+Ski7+aALIA==
X-Google-Smtp-Source: ABdhPJwA98EjR7+OT0INNOhv3xQakqX0UmgvB9kA2eTAH8O7BGt3i6R1pqXCVGJZFOjEtvyKvmJNkQ==
X-Received: by 2002:a17:90b:b03:: with SMTP id
 bf3mr2544178pjb.223.1618284509395; 
 Mon, 12 Apr 2021 20:28:29 -0700 (PDT)
Received: from chromium.org ([2620:15c:202:201:1d18:a339:7993:e548])
 by smtp.gmail.com with ESMTPSA id ir3sm685864pjb.42.2021.04.12.20.28.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 12 Apr 2021 20:28:28 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1618246971-28754-1-git-send-email-khsieh@codeaurora.org>
References: <1618246971-28754-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Mon, 12 Apr 2021 20:28:26 -0700
Message-ID: <161828450691.3764895.11632559645161458427@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/dp: check sink_count before
 update is_connected status
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
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 daniel@ffwll.ch, aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-04-12 10:02:51)
> At pm_resume check link sisnk_count before update is_connected status

s/sisnk_count/sink_count/

> base on HPD real time link status. Also print out error message only
> when either EV_CONNECT_PENDING_TIMEOUT or EV_DISCONNECT_PENDING_TIMEOUT
> happen.

Can you add "why"? I think the why is something like "link status is
different from display connected status in the case of something like an
Apple dongle where the type-c plug can be connected, and therefore the
link is connected, but no sink is connected until an HDMI cable is
plugged into the dongle". This still doesn't explain why it's important
to check at resume time though.

> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Any Fixes tag?

>  drivers/gpu/drm/msm/dp/dp_display.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 5a39da6..4992a049 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -587,7 +587,7 @@ static int dp_connect_pending_timeout(struct dp_display_private *dp, u32 data)
>  
>         state = dp->hpd_state;
>         if (state == ST_CONNECT_PENDING) {
> -               dp_display_enable(dp, 0);
> +               DRM_ERROR("EV_CONNECT_PENDING_TIMEOUT error\n");

Can we get rid of these messages?

>                 dp->hpd_state = ST_CONNECTED;
>         }
>  
> @@ -670,7 +670,7 @@ static int dp_disconnect_pending_timeout(struct dp_display_private *dp, u32 data
>  
>         state =  dp->hpd_state;
>         if (state == ST_DISCONNECT_PENDING) {
> -               dp_display_disable(dp, 0);
> +               DRM_ERROR("EV_DISCONNECT_PENDING_TIMEOUT error\n");

And this one? If it happens it will just sit in the logs when probably
the user can't do anything about it. Timeouts are just a fact of life.

>                 dp->hpd_state = ST_DISCONNECTED;
>         }
>  
> @@ -1272,7 +1272,7 @@ static int dp_pm_resume(struct device *dev)
>  
>         status = dp_catalog_link_is_connected(dp->catalog);
>  
> -       if (status)
> +       if (status && dp->link->sink_count)

Can we add a comment above this if? Otherwise it doesn't make much
sense why sink_count is important.

	/*
	 * Only consider the display as connected, and send a connected
	 * notification to userspace in
	 * dp_display_send_hpd_notification(), if there's actually a
	 * sink connected. Otherwise, the link could be up/connected or 
	 * in the process of being established, but there isn't actually
	 * anything to display to on the other side yet.
	 */

>                 dp->dp_display.is_connected = true;
>         else
>                 dp->dp_display.is_connected = false;
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
