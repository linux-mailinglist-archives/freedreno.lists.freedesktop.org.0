Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C4C383D2C55
	for <lists+freedreno@lfdr.de>; Thu, 22 Jul 2021 21:05:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A9BD6EA7D;
	Thu, 22 Jul 2021 19:05:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0939E6EAF0
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jul 2021 19:05:32 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 b18-20020a0568303112b02904cf73f54f4bso3300296ots.2
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jul 2021 12:05:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=congdFIKNx3UQvjcKCH7cpv7zvqp5GO1L/NygEo3sXY=;
 b=dDIPDFkyDDHfqVGTpIk+wx1GBgHwuS+5k3bX78JBMROdG0Il9Fa6gFRE3N4NL2Qk0f
 SqQZg2RIPA064hM8VFnMY2q+vHBzUFSnc7iN5K2p7p4BJ7A/sYHwrrcq3pXBnJC7CkMX
 6ETr8WW+bTfkdyUukPtX19G0Yed7uhKTttRjU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=congdFIKNx3UQvjcKCH7cpv7zvqp5GO1L/NygEo3sXY=;
 b=szPwEAtRMZ+URJAXa2Q8Se42JoYwvoYc5Gk19q0UgCfiUeEn5/Ez1c2sycstnnjPO/
 eWwjXyTj9qMgww7AUp6mveNx0LLYRoQohee17eBB/hEYanmxlRS4CIqf6CBqVj9LvL8S
 WXv5A715ZILRXdp28Y1wkveYZWrpiYQ49Lox8qKs8KFfHD73ZRo6YHV61CCPNh4qzlL/
 ZTdkd9TuBNGpLCmJk0fCIUcXCVhjqH22MTbheGGusObGuFp89XzoBGkos8rKcUC1cnIP
 i6RlhSkroxOQZyT7FgLa9AKcj96aXOpF2YqSaSqS2nZ7243ySnQXVS4xe8zY+UGGiX9f
 ZGXw==
X-Gm-Message-State: AOAM5307bT+oQj/hlpWJ6PjRI8rqzQGn3wyLnMFTudHpmYTmlPFsXPa3
 tK8wboRyahkwcJnau04a+dB7Qln/+zVmazN4nJtaMg==
X-Google-Smtp-Source: ABdhPJxszP1Nvb9QVLAphQ4FMRQGZNgHTiAOHsXtE6VBCSK4Mkx8qQEaF06I/qJbcI+d9b6gULejIcgtbhtlsXTT8NA=
X-Received: by 2002:a9d:8c7:: with SMTP id 65mr842433otf.25.1626980731332;
 Thu, 22 Jul 2021 12:05:31 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 19:05:30 +0000
MIME-Version: 1.0
In-Reply-To: <1626191647-13901-3-git-send-email-khsieh@codeaurora.org>
References: <1626191647-13901-1-git-send-email-khsieh@codeaurora.org>
 <1626191647-13901-3-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 22 Jul 2021 19:05:30 +0000
Message-ID: <CAE-0n52JWbqwZtSCcLyzpsaFyd8mRLiXxLO-9YDk5xMbj_uQiw@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org, 
 robdclark@gmail.com, sean@poorly.run
Subject: Re: [Freedreno] [PATCH v2 2/7] drm/msm/dp: reduce link rate if
 failed at link training 1
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

Quoting Kuogee Hsieh (2021-07-13 08:54:02)
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index 27fb0f0..92cf331 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -1634,6 +1617,24 @@ void dp_ctrl_handle_sink_request(struct dp_ctrl *dp_ctrl)
>         }
>  }
>
> +static bool dp_ctrl_clock_recovery_any_ok(
> +                       const u8 link_status[DP_LINK_STATUS_SIZE],
> +                       int lane_count)
> +{
> +       int lane_cnt;
> +
> +       /*
> +        * only interested in the lane number after reduced
> +        * lane_cnt = 4, then only interested in 2 lanes
> +        * lane_cnt = 2, then only interested in 1 lane
> +        */
> +       lane_cnt = lane_count >> 1;
> +       if (lane_cnt == 0)
> +               return false;
> +
> +       return drm_dp_clock_recovery_ok(link_status, lane_count);

This doesn't work? Because drm_dp_clock_recovery_ok() requires every
lane to be OK whereas this function wants any lane to be OK? It may make
sense to have drm_dp_clock_recovery_ok() return false if lane_count == 0
too.

> +}
> +
>  int dp_ctrl_on_link(struct dp_ctrl *dp_ctrl)
>  {
>         int rc = 0;
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
