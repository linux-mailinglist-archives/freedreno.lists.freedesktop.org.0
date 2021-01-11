Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E6A432F201A
	for <lists+freedreno@lfdr.de>; Mon, 11 Jan 2021 20:55:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CC8689E03;
	Mon, 11 Jan 2021 19:55:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com
 [IPv6:2607:f8b0:4864:20::102e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC5389E05
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jan 2021 19:55:21 +0000 (UTC)
Received: by mail-pj1-x102e.google.com with SMTP id j13so192927pjz.3
 for <freedreno@lists.freedesktop.org>; Mon, 11 Jan 2021 11:55:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:content-transfer-encoding:in-reply-to:references
 :subject:from:cc:to:date:message-id:user-agent;
 bh=x1kEK/qhNdROptR6SyV1mmKseA6+oUbWg4LW5g3LzE0=;
 b=hRnDQcZQXrF7xHbgGwWWWW+3sdndqXrcQ+SW4lu0ULqzpK81pHZW3zcA4U8UxHDh/r
 QPL4v1rIH6LCKv55YiBpMJxl8YhCuB6MSZjjS/p8D0VZ4SNnck2ldoIo26/q1LxeqOlx
 64kowb2YDUHl2pAU/Wiz70Ddg5B8xFYlA5Rcg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:content-transfer-encoding
 :in-reply-to:references:subject:from:cc:to:date:message-id
 :user-agent;
 bh=x1kEK/qhNdROptR6SyV1mmKseA6+oUbWg4LW5g3LzE0=;
 b=otVngbNbiU2jxYdXRg2jdBemm7N4um85ntxOPIhkyqZG7ig8pqSp+eTeyJ+G6Jy81O
 b8cT93bhH/FVzZnFkYgVJI63JeG02cf7xvjkPeoUNMf8kcdE44ALkq8/0fcIoxodR3we
 6bvmjLot3iQYLfMBRk6RsK5lts5lX6mKU71TVVpp3Y8PNHqkrlGjWr5gP0uDHi/vzlVA
 6Om+2UrlF6ExQZbmQ86hGmoni6dam4WPPFWvM6Vs+uGBVdb5AgNd5nxlvDBJrAhsjZu5
 7Nk2t20lirJM023jFZv6HmXaRkkcYTp3Jo2HuLw3RmeX4ktM6+Mrx/EuHf+9ayX8jeYh
 klfQ==
X-Gm-Message-State: AOAM530ljj5lJOk7Y4cQn05QI6xoIAqYD9uOZlKoD+nSpFw15p0UiTtN
 xBUwnqPjKuY1UXIo9RiywjHitjJdhTzi9w==
X-Google-Smtp-Source: ABdhPJzc4P554z1bLWeSmnfZa/mKVXF6a1Yj65oFD7L91wgvOd94GvhF8PnuSgnP7DhqQAen3NX7IQ==
X-Received: by 2002:a17:902:7001:b029:da:bbb6:c7e2 with SMTP id
 y1-20020a1709027001b02900dabbb6c7e2mr932791plk.50.1610394920963; 
 Mon, 11 Jan 2021 11:55:20 -0800 (PST)
Received: from chromium.org ([2620:15c:202:201:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id z15sm443642pfn.34.2021.01.11.11.55.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 11 Jan 2021 11:55:20 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1610051425-20632-2-git-send-email-khsieh@codeaurora.org>
References: <y> <1610051425-20632-1-git-send-email-khsieh@codeaurora.org>
 <1610051425-20632-2-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
To: Kuogee Hsieh <khsieh@codeaurora.org>, dri-devel@lists.freedesktop.org,
 robdclark@gmail.com, sean@poorly.run
Date: Mon, 11 Jan 2021 11:55:18 -0800
Message-ID: <161039491877.3661239.1387205899512360969@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9.1
Subject: Re: [Freedreno] [PATCH 1/2] drm/msm/dp: postpone irq_hpd event
 during connection pending state
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
 Kuogee Hsieh <khsieh@codeaurora.org>, tanmay@codeaurora.org, daniel@ffwll.ch,
 aravindh@codeaurora.org, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-01-07 12:30:24)
> irq_hpd event can only be executed at connected state. Therefore
> irq_hpd event should be postponed if it happened at connection
> pending state. This patch also make sure both link rate and lane

Why does it happen at connection pending state?

> are valid before start link training.

Can this part about link rate and lane being valid be split off into
another patch?

> 
> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---

Any fixes tag?

>  drivers/gpu/drm/msm/dp/dp_display.c |  7 +++++++
>  drivers/gpu/drm/msm/dp/dp_panel.c   | 12 +++++++++---
>  2 files changed, 16 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 6e971d5..3bc7ed2 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -693,6 +693,13 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
>                 return 0;
>         }
>  
> +       if (state == ST_CONNECT_PENDING) {
> +               /* wait until ST_CONNECTED */
> +               dp_add_event(dp, EV_IRQ_HPD_INT, 0, 1); /* delay = 1 */
> +               mutex_unlock(&dp->event_mutex);
> +               return 0;
> +       }
> +
>         ret = dp_display_usbpd_attention_cb(&dp->pdev->dev);
>         if (ret == -ECONNRESET) { /* cable unplugged */
>                 dp->core_initialized = false;
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
