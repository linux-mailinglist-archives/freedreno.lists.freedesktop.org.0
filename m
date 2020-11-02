Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 30B052A35E7
	for <lists+freedreno@lfdr.de>; Mon,  2 Nov 2020 22:20:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E84636E3D2;
	Mon,  2 Nov 2020 21:19:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 59CB36E3D2
 for <freedreno@lists.freedesktop.org>; Mon,  2 Nov 2020 21:19:57 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id r186so11897985pgr.0
 for <freedreno@lists.freedesktop.org>; Mon, 02 Nov 2020 13:19:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=MmgoczohG/k+ZwjVQUASoG236fzfrYemlbvsaHENUT0=;
 b=YTyfXrFe7avSZYrfT69J72tFfPArIv0rq/MD9TDv0mLzf6VGWkkmFcKLaIhBwmtYUV
 OfI7prs1PEvecIN7s+lp+6dqs88D/AcB5zxmRQbRU5+T7LYqs5YcZXW2j/TeqUUSvLym
 IX+z+LzhG5wJpNoytNzrqunBgNq55+SHD64dA=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=MmgoczohG/k+ZwjVQUASoG236fzfrYemlbvsaHENUT0=;
 b=uHUE5oYuR+QhjveBzxt9o1PBze2IMeukvsQjYQI9re0oYHwcDFpYCM7+wvBzq7d9dJ
 5Qji/CRHi5wK8aKv227Bt99Xk3k2jhsrdgpSHjU0X15/mcKxvd6dk0oc2iX/fVLgfDh/
 ag3mhjETcz/7k4RHk5hCUstMF55YugrbA9COUlNru/gOBrqQF5jv1Zr00pWkCGp2PdMx
 71GaLASLMt1qM5z0ZjEDnlxDPP8kqPpmU4U0lMWwfKTuRpTiz+81TgpXPocG26uvmz8J
 q9afWJzIiZ3SjBr1zSKgUMkSSjLOmoM3aAc2hDeD92DWzkic2fot6NJbrlxLh1PHnzm5
 djqg==
X-Gm-Message-State: AOAM532kzkvVsq9qvKqe4koDoXzLmaaG4q3UILVb5sGPZ2/2FTfBOReU
 DZOc0mAfLqSqvzRjAxvgJIUzVQ==
X-Google-Smtp-Source: ABdhPJxfOk0mmqX0RpZ2O0ZHRlCvjeMDUMHlxvxspXmVFF9ZtFhc0xavIb+wi6/woPUaiNH7hebN0g==
X-Received: by 2002:a63:4f5f:: with SMTP id p31mr12022620pgl.158.1604351996950; 
 Mon, 02 Nov 2020 13:19:56 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id u124sm15320487pfc.21.2020.11.02.13.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 13:19:56 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20201029205509.13192-1-abhinavk@codeaurora.org>
References: <20201029205509.13192-1-abhinavk@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Abhinav Kumar <abhinavk@codeaurora.org>, dri-devel@lists.freedesktop.org
Date: Mon, 02 Nov 2020 13:19:54 -0800
Message-ID: <160435199458.884498.6173218904854698184@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: do not notify audio subsystem
 if sink doesn't support audio
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
Cc: linux-arm-msm@vger.kernel.org, Abhinav Kumar <abhinavk@codeaurora.org>,
 khsieh@codeaurora.org, robdclark@gmail.com, nganji@codeaurora.org,
 seanpaul@chromium.org, tanmay@codeaurora.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org, cychiang@chromium.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Abhinav Kumar (2020-10-29 13:55:09)
> For sinks that do not support audio, there is no need to notify
> audio subsystem of the connection event.
> 
> This will make sure that audio routes only to the primary display
> when connected to such sinks.
> 

Does this need a Fixes tag? Or it's just an optimization patch?

> Signed-off-by: Abhinav Kumar <abhinavk@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 12 ++++++++++--
>  1 file changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 4a5735564be2..d970980b0ca5 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -555,8 +555,16 @@ static int dp_connect_pending_timeout(struct dp_display_private *dp, u32 data)
>  static void dp_display_handle_plugged_change(struct msm_dp *dp_display,
>                 bool plugged)
>  {
> -       if (dp_display->plugged_cb && dp_display->codec_dev)
> -               dp_display->plugged_cb(dp_display->codec_dev, plugged);
> +       struct dp_display_private *dp;
> +
> +       dp = container_of(g_dp_display,

What is g_dp_display? I guess this doesn't compile?

> +                       struct dp_display_private, dp_display);
> +
> +       if (dp_display->plugged_cb && dp_display->codec_dev) {
> +               /* notify audio subsystem only if sink supports audio */
> +               if (dp->audio_supported)

Can we combine this into the above if statement?

> +                       dp_display->plugged_cb(dp_display->codec_dev, plugged);

Then this isn't as nested.

> +       }
>  }
>  
>  static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
