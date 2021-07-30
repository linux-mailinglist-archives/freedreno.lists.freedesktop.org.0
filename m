Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B799E3DBE90
	for <lists+freedreno@lfdr.de>; Fri, 30 Jul 2021 20:57:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 64A2D6E1E0;
	Fri, 30 Jul 2021 18:57:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oi1-x233.google.com (mail-oi1-x233.google.com
 [IPv6:2607:f8b0:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0103E6E43F
 for <freedreno@lists.freedesktop.org>; Fri, 30 Jul 2021 18:57:25 +0000 (UTC)
Received: by mail-oi1-x233.google.com with SMTP id q6so14484423oiw.7
 for <freedreno@lists.freedesktop.org>; Fri, 30 Jul 2021 11:57:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=R52SkjmgEOTUBqEHYa4AfMHcfuuZbXxc9uqTeblsMI4=;
 b=cHDqg/JVMq/KqDermTQjYQh3zJXJCgTPV0eNVwov0YhCZHuLgysibPpi3PiXwC8AL/
 r7BYwYGHH616M3q6D5LlbG06SRra2HKOgobDs6tHNk6qKcizFKqbOz2O8tuMAjVa0e98
 AFfaruS7lNYtXfYX7BcUXNpVasZSMNkgguCmo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=R52SkjmgEOTUBqEHYa4AfMHcfuuZbXxc9uqTeblsMI4=;
 b=QILVCJH3cUXIVHPxcoJTsycYza+g5IVaaN4QieZt9P0nbo3AVvL1WXB+vRo+cW4Q9J
 AFETRcgtjydaJ+DFFA8HFYcLOQU+V+w3CXbgaelj9gWLare3YW4z8ygKEW0ZvLNAIsel
 6LlT2O+tNrEHGAYlis5WLS3EQL6wJkbPSBJ/GbFtpp7wcEIsr64SiHTnf45fO+ycHMfK
 XstnVA2Ydxl7ZZ4133BgyJ/MilA3qowJCZl+Q7gl9JfR67c+RDzPpRG0bSfpQIp+1kfU
 2fGvm62iCd5nVQiyumP9V4aR14/633RWRl4UWESSU3lPocHbPIMRxLRM4QmaBB1QU/ug
 FbrQ==
X-Gm-Message-State: AOAM533iQ5HVW3R8xLS7/f8mSzZfqivoTxVkQGxsJsnGf0oDfhtD51Rk
 BWC5pr5wqjNpa+M3Mkv0ioBtBhSrR1mu1GNEXfM/UA==
X-Google-Smtp-Source: ABdhPJxNDgMIs+i6xUVmTNkHBOhTrdiS70/qH/dNqao4vmx6KI2snPhoSDEX5E4jN4uKjzYEP/Dq7jJoDsUvXCG78qo=
X-Received: by 2002:a05:6808:619:: with SMTP id
 y25mr3062792oih.166.1627671445211; 
 Fri, 30 Jul 2021 11:57:25 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 30 Jul 2021 11:57:24 -0700
MIME-Version: 1.0
In-Reply-To: <1627507854-16733-1-git-send-email-khsieh@codeaurora.org>
References: <1627507854-16733-1-git-send-email-khsieh@codeaurora.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Fri, 30 Jul 2021 11:57:24 -0700
Message-ID: <CAE-0n51cNywB2ThQxqS4iX-d7wR+rYXt8P33o9cUq9J6tT915A@mail.gmail.com>
To: Kuogee Hsieh <khsieh@codeaurora.org>, agross@kernel.org,
 bjorn.andersson@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Cc: abhinavk@codeaurora.org, aravindh@codeaurora.org, 
 freedreno@lists.freedesktop.org, dri-devel@lists.freedesktop.org, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: update is_connected status base
 on sink count at dp_pm_resume()
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

Quoting Kuogee Hsieh (2021-07-28 14:30:54)
> Currently at dp_pm_resume() is_connected state is decided base on hpd connection
> status only. This will put is_connected in wrongly "true" state at the scenario
> that dongle attached to DUT but without hmdi cable connecting to it. Fix this
> problem by adding read sink count from dongle and decided is_connected state base
> on both sink count and hpd connection status.
>

Please add a Fixes tag.

> Signed-off-by: Kuogee Hsieh <khsieh@codeaurora.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 23 +++++++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 2b660e9..9bcb261 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1308,6 +1308,17 @@ static int dp_display_remove(struct platform_device *pdev)
>         return 0;
>  }
>
> +static int dp_get_sink_count(struct dp_display_private *dp)
> +{
> +       u8 sink_count;
> +
> +       sink_count = drm_dp_read_sink_count(dp->aux);

drm_dp_read_sink_count() returns an int, not a u8. Comparing a u8 to
less than zero doesn't make any sense as it isn't signed.

> +       if (sink_count < 0)
> +               return 0;
> +
> +       return sink_count;
> +}

We can drop this function and just have an int count in dp_pm_resume()
that is compared to < 0 and then ignored.

> +
>  static int dp_pm_resume(struct device *dev)
>  {
>         struct platform_device *pdev = to_platform_device(dev);
> @@ -1327,14 +1338,22 @@ static int dp_pm_resume(struct device *dev)
>
>         dp_catalog_ctrl_hpd_config(dp->catalog);
>
> -       status = dp_catalog_link_is_connected(dp->catalog);
> +       /*
> +        * set sink to normal operation mode -- D0
> +        * before dpcd read
> +        */
> +       dp_link_psm_config(dp->link, &dp->panel->link_info, false);
>
> +       if ((status = dp_catalog_link_is_connected(dp->catalog)))
> +               dp->link->sink_count = dp_get_sink_count(dp);

Do we need to call drm_dp_read_sink_count_cap() as well?

> +       else
> +               dp->link->sink_count = 0;
>         /*
>          * can not declared display is connected unless
>          * HDMI cable is plugged in and sink_count of
>          * dongle become 1
>          */
> -       if (status && dp->link->sink_count)

Is 'status' used anymore? If not, please remove it.

> +       if (dp->link->sink_count)
>                 dp->dp_display.is_connected = true;
>         else
>                 dp->dp_display.is_connected = false;
