Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CB5B54E69A7
	for <lists+freedreno@lfdr.de>; Thu, 24 Mar 2022 21:10:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B90210E268;
	Thu, 24 Mar 2022 20:10:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oo1-xc33.google.com (mail-oo1-xc33.google.com
 [IPv6:2607:f8b0:4864:20::c33])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E11E610E268
 for <freedreno@lists.freedesktop.org>; Thu, 24 Mar 2022 20:10:56 +0000 (UTC)
Received: by mail-oo1-xc33.google.com with SMTP id
 v19-20020a056820101300b0032488bb70f5so968588oor.5
 for <freedreno@lists.freedesktop.org>; Thu, 24 Mar 2022 13:10:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=tYvk6mZupwR6ob13Q9q/8W1K8ygzY6C/xq72yUYMIqE=;
 b=kcOz4sNHlAPOruy7YCAfNWOY1Gd/j/5RqZFCbHSd3KEUCGEtbWxia0dq3R0vcmxkRU
 vqPA3yD3ug1UmK2QW4h/2ZY29MaIJekC67w+7BZNk7EDgZkZ0pJzb4MyR72evX3wksDl
 HA8f2MHUbOW7qeuHOtp8o++v1e95s8lLdm8sg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=tYvk6mZupwR6ob13Q9q/8W1K8ygzY6C/xq72yUYMIqE=;
 b=Gy0+91Cu72OBDOOqb8CjG5EcXSLB2M+n9BiPAyLzbRYuEuMyRUS5A/OqDqBRASJeky
 0e8NsPlCAfnFk1uyBn6zpDaUWljSUvzUPxGp/jLl3kZ/jBGHUVrjGp/oqIxa01a8oDtd
 gvIggIWDjPfvIeRyQqL+humpHC6Z+TaY5lb9OXH9DaKCgwQvbp1ssAYVyikQsXU4d0kt
 HFoLwBND4zs09LCKDS5NZ4xe++kssk8eI7gY4Ar1omhbcT6Bjnv9Yj8Ps11Y6OqMNgrE
 LBFHWGBbNzbFiKh8+MlUAJtrSaleIcL7Yw+9K/c4CRY+MoTCx0XKMaiGUjFFVlAA1CjP
 o5eQ==
X-Gm-Message-State: AOAM531aNvqFIbJKI0qUR+CVqyB21UkQt8In1LWZTGOUFAqVNW6fcb/e
 vantOUrB7UK0MgU3sgqWwFmYawRJA6KGaKdXXOT7YA==
X-Google-Smtp-Source: ABdhPJzVqotRv3dsKpqXe41FlcBvnEMyajt3qss8lRnEfrhr4dODFNc3DYv6JPQ1uI1GUFupgzeU+ZOO6Qs85MrhkTc=
X-Received: by 2002:a4a:650c:0:b0:324:b0a0:2d23 with SMTP id
 y12-20020a4a650c000000b00324b0a02d23mr2658457ooc.25.1648152656210; Thu, 24
 Mar 2022 13:10:56 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 24 Mar 2022 15:10:55 -0500
MIME-Version: 1.0
In-Reply-To: <20220323103546.1772673-4-dmitry.baryshkov@linaro.org>
References: <20220323103546.1772673-1-dmitry.baryshkov@linaro.org>
 <20220323103546.1772673-4-dmitry.baryshkov@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Thu, 24 Mar 2022 15:10:55 -0500
Message-ID: <CAE-0n53pUrV77PiYDpaoNX-wkaiJOWzPApokrk1bQhiWbL_=VQ@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>, 
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH 3/3] drm/msm/dp: remove max_pclk_khz field
 from dp_panel/dp_display
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org,
 =?UTF-8?B?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Dmitry Baryshkov (2022-03-23 03:35:46)
> Since the last commit, the max_pclk_khz became constant, it's set to
> DP_MAX_PIXEL_CLK_KHZ and never changed afterwards. Remove it completely
> and use DP_MAX_PIXEL_CLK_KHZ directly.
>
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

> diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
> index af5f1b001192..a94c9b34f397 100644
> --- a/drivers/gpu/drm/msm/dp/dp_drm.c
> +++ b/drivers/gpu/drm/msm/dp/dp_drm.c
> @@ -88,9 +88,7 @@ static enum drm_mode_status dp_connector_mode_valid(
>
>         dp_disp = to_dp_connector(connector)->dp_display;
>
> -       if ((dp_disp->max_pclk_khz <= 0) ||
> -                       (dp_disp->max_pclk_khz > DP_MAX_PIXEL_CLK_KHZ) ||
> -                       (mode->clock > dp_disp->max_pclk_khz))
> +       if (mode->clock > DP_MAX_PIXEL_CLK_KHZ)
>                 return MODE_BAD;

Can we have a followup patch to return MODE_CLOCK_HIGH?
