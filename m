Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4599B46EDDE
	for <lists+freedreno@lfdr.de>; Thu,  9 Dec 2021 17:54:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A3D810E45C;
	Thu,  9 Dec 2021 16:52:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1409789ABE
 for <freedreno@lists.freedesktop.org>; Thu,  9 Dec 2021 05:59:34 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id q74so11144932ybq.11
 for <freedreno@lists.freedesktop.org>; Wed, 08 Dec 2021 21:59:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=ySPyFFqtdyuBIHLLUyShef42vTuQW5UVEw4YMSFTCGs=;
 b=fcOFBaKN8igGFkv5Hq4B7LT8hZS+vXtlE7scQQo7aB4iwIcYau2OHRYW5Hr8XJtXdY
 FPxqyzqqLvqLUKNKzo55KbG2bwgwxVsHz5NfdwiuH2UTcoA//BK4vw2rotjNxRBdIYjS
 tXawiWlofuozRlbcisqruXLxzXU4PeKNd8N7Q=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=ySPyFFqtdyuBIHLLUyShef42vTuQW5UVEw4YMSFTCGs=;
 b=hIes/sLwSsn6eMPXTfS8NX40mafH3bLaPcopYRXDThx/5T79i3WfnLVkqNeF45n6G5
 +to4Xgw1EXGrp0DV4A9HxN2chbNwmYexn0DtA3lvfAhLbb8Qgv4KF+OM7wYvu5/HUYrd
 YL25vbnaNdlfD9dXacXonuL1/kNh/yH29DjGEpO5R6igX0pCJmulPWqJAhtYD6hiwinr
 vUtekHp2/tzRWL+WnYxMZFkbQCaUVqHxmHGOv1sXqw963M/cuvv7lmt5cdDuCNDBSKl9
 IwJoRAinMkcN6aLlXyJ9c56hlVpRZB/uMPHKATSmKtW7bu++FLejZTNJo6r/YmrC/XJY
 QuYw==
X-Gm-Message-State: AOAM532bbRsOXHPrI4yzuQGZ14HcEklHd+icVwxO0LVNREPRyfjt8Wl9
 Q8LX66+OhJbsJtcZ+N0FfvZQxzLzg9aWzVhnlhwpnEpb3yU=
X-Google-Smtp-Source: ABdhPJzfm1mjganFNfDgL21KPQZnDL2HCeKKT5S1lwgHg6taD+gRMfe1My60dFjkJru25ZQx0pTSz4jer+PE/I2RKY0=
X-Received: by 2002:a4a:cf12:: with SMTP id l18mr2340150oos.25.1639018897050; 
 Wed, 08 Dec 2021 19:01:37 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 8 Dec 2021 19:01:36 -0800
MIME-Version: 1.0
In-Reply-To: <1638985262-2072-1-git-send-email-quic_khsieh@quicinc.com>
References: <1638985262-2072-1-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Wed, 8 Dec 2021 19:01:36 -0800
Message-ID: <CAE-0n51FCOwPeWz=SFaRY58J3=yGnKdE5aHMCGx-tzK_CVEUQQ@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 robdclark@gmail.com, sean@poorly.run, vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v5] drm/msm/dp: dp_link_parse_sink_count()
 return immediately if aux read failed
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, aravindh@codeaurora.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2021-12-08 09:41:02)
> Add checking aux read/write status at both dp_link_parse_sink_count()
> and dp_link_parse_sink_status_filed() to avoid long timeout delay if
> dp aux read/write failed at timeout due to cable unplugged.
>
> Changes in V4:
> -- split this patch as stand alone patch
>
> Changes in v5:
> -- rebase on msm-next branch
>
> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>

Remove this newline please.

> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> Tested-by: Stephen Boyd <swboyd@chromium.org>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 12 +++++++++---
>  drivers/gpu/drm/msm/dp/dp_link.c    | 19 ++++++++++++++-----
>  2 files changed, 23 insertions(+), 8 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 3d61459..0766752 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -692,9 +692,15 @@ static int dp_irq_hpd_handle(struct dp_display_private *dp, u32 data)
>                 return 0;
>         }
>
> -       ret = dp_display_usbpd_attention_cb(&dp->pdev->dev);
> -       if (ret == -ECONNRESET) { /* cable unplugged */
> -               dp->core_initialized = false;
> +       /*
> +        * dp core (ahb/aux clks) must be initialized before
> +        * irq_hpd be handled
> +        */
> +       if (dp->core_initialized) {

This part of the commit isn't described in the commit text. Can you add
some more details in the commit text about this?

> +               ret = dp_display_usbpd_attention_cb(&dp->pdev->dev);
> +               if (ret == -ECONNRESET) { /* cable unplugged */
> +                       dp->core_initialized = false;
> +               }
>         }
>         DRM_DEBUG_DP("hpd_state=%d\n", state);
>
