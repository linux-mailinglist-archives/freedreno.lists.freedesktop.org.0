Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BB1FD2A340E
	for <lists+freedreno@lfdr.de>; Mon,  2 Nov 2020 20:29:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B9D46E50C;
	Mon,  2 Nov 2020 19:29:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com
 [IPv6:2607:f8b0:4864:20::441])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7BAB56E580
 for <freedreno@lists.freedesktop.org>; Mon,  2 Nov 2020 19:29:30 +0000 (UTC)
Received: by mail-pf1-x441.google.com with SMTP id y14so11988698pfp.13
 for <freedreno@lists.freedesktop.org>; Mon, 02 Nov 2020 11:29:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=uoOxuimGqR/XZohg3kDNnqLGh44Gb3rHGmhcimxdOOY=;
 b=X/cJK6On7gCEku6gf7AommmoOsjU/a5tlIE4w3Lty5H00mkIV5rNXD2hV5drnpvER7
 RuQ18vm1/trkX2my4c491xbgR8ybadobgs5JQu9jdUO4SKrwVCrwCmQKiE9mgwhrJdMR
 byvh/r5+J24rf4ov9GZLSpFpLphkTvgaKkm0c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=uoOxuimGqR/XZohg3kDNnqLGh44Gb3rHGmhcimxdOOY=;
 b=jX2wokeWlIb6Yf/iiK9LUSLeqCnqmh8xEIYUx5QvvU2vNfvd2uh8z1vMoUrHR8JdbV
 LNl1awCc1gmtRaIWOKlDqK9jOh9srGVQfuZpSFha493zKG4L3BHD7D9+78Dc0e4IEmLF
 6diK/j6J//rol2p9l2zUO/nsLTOY6fNEL4ejnIthRNGslHzx7LEB+cYl6El/UjhAZ3hA
 RRomboFCweNhDXB8QzBzEEn6i34/dEWgf2Pe4nFA7rPxXEqGzMoUZHLJc6fvy8kULDPt
 YtprG6pnep4xlwsuv36LTPzvZB68T8UAtxcF5rKLOR2czgedFsJB4Wb5oeG/1c5bcjZC
 28fw==
X-Gm-Message-State: AOAM533bUxE0IKF5mjTfGIevi5N/H0w8c3A5gtAu0D01pBi9rMxzj0es
 HuEvkruE/Oug7u09oXWvWJUyfg==
X-Google-Smtp-Source: ABdhPJxVKt+kRsHzbnU0rETD6G/1efTmJN02g/NGxauAmXXTQrMIxC6/YcVUoL/EqVkPVsDTdrz6Ow==
X-Received: by 2002:aa7:8548:0:b029:164:769a:353 with SMTP id
 y8-20020aa785480000b0290164769a0353mr23105505pfn.45.1604345370040; 
 Mon, 02 Nov 2020 11:29:30 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id j11sm14286248pfh.143.2020.11.02.11.29.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Nov 2020 11:29:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20201030232324.11170-1-khsieh@codeaurora.org>
References: <20201030232324.11170-1-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, robdclark@gmail.com, sean@poorly.run
Date: Mon, 02 Nov 2020 11:29:28 -0800
Message-ID: <160434536802.884498.16389146296525781476@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: promote irq_hpd handle to
 handle link trainign correctly
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
Cc: rnayak@codeaurora.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 abhinavk@codeaurora.org, khsieh@codeaurora.org, tanmay@codeaurora.org,
 daniel@ffwll.ch, aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Subject has a typo in "training".

Quoting Kuogee Hsieh (2020-10-30 16:23:24)
> Some dongles, such as Apple, required link training done at irq_hpd

s/required/require/

> request instead of plugin request. This patch promote irq_hpd hanlder

s/hanlder/handler/

> to handle link training and setup hpd_state correctly.
> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Any Fixes tag?

>  drivers/gpu/drm/msm/dp/dp_display.c | 20 ++++++++++++++++++--
>  1 file changed, 18 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 13b66266cd69..55627530957c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -483,10 +485,24 @@ static int dp_display_usbpd_attention_cb(struct device *dev)
>                 return -ENODEV;
>         }
>  
> +       hpd = dp->usbpd;
> +
>         /* check for any test request issued by sink */
>         rc = dp_link_process_request(dp->link);
> -       if (!rc)
> -               dp_display_handle_irq_hpd(dp);
> +       if (!rc) {
> +               sink_request = dp->link->sink_request;
> +               if (sink_request & DS_PORT_STATUS_CHANGED) {
> +                       dp->hpd_state = ST_CONNECT_PENDING;
> +                       hpd->hpd_high = 1;
> +               }
> +
> +               rc = dp_display_handle_irq_hpd(dp);
> +
> +               if (rc && sink_request & DS_PORT_STATUS_CHANGED) {

Can you add parenthesis around this?

		if (rc && (sink_request & DS_PORT_STATUS_CHANGED)) {


I honestly don't know what's going on in this patch. It talks about
making link training happen during irq hpd handler but this is the
attention handler and we're checking port status changed? This is
related? The code is really not clear.

> +                       hpd->hpd_high = 0;
> +                       dp->hpd_state = ST_DISCONNECTED;
> +               }
> +       }
>  
>         return rc;
>  }
> 
> base-commit: 0e162b10644605428cd2596c12f8ed410cf9d2d9

What commit is this?
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
