Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E51FE50BFDF
	for <lists+freedreno@lfdr.de>; Fri, 22 Apr 2022 20:39:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E9910E592;
	Fri, 22 Apr 2022 18:39:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x2a.google.com (mail-oa1-x2a.google.com
 [IPv6:2001:4860:4864:20::2a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F65510E592
 for <freedreno@lists.freedesktop.org>; Fri, 22 Apr 2022 18:39:19 +0000 (UTC)
Received: by mail-oa1-x2a.google.com with SMTP id
 586e51a60fabf-e5e433d66dso9509865fac.5
 for <freedreno@lists.freedesktop.org>; Fri, 22 Apr 2022 11:39:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=6gjAV10Iy0bb8vJ2mOVMB0SZrY0b5n77L6j1RU8VdXM=;
 b=UQLEZxu3Gnefj4+OtaImRrfZBjyDsrGOwqT3L4D8+PELfmRybKg6N+U9kwXbBNec8B
 qKpVkU06TkaCo4dktwV6f4nhGtJIzV103OXK13R6QipAYixnIGfC1U+WJMelXl3+cQ94
 IIkClZnxp2vThBevLk9Vg09fFu4m+FnV5PonI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=6gjAV10Iy0bb8vJ2mOVMB0SZrY0b5n77L6j1RU8VdXM=;
 b=QT6Jxfj+E5gQV6N4U5VW+zpG7dzrK95HCVzDMiJ4jj1dQ8IbQopUvwTOlBMcE7kzpI
 9w6T0O6G1OBaCP9VPJkE4O0HFqQ5wa1QOecgIhiYSkSRwm6OLeu6F9/LO4vZZqXpP+YB
 YWGO3aKcd7hY4dN5EUH0PB1R2CDNXow5S1+CFuSLYDBRdYCxGHhYEcMwzFlNgPBytp6w
 cbT21L/n6iCEutoZWAYhvcOkl2Ejw8Dkp6JITk2s28hNUeRW8JkumN5w3xK2jk18jxYp
 B+KN5Pfqm8YSA1ZEpYB9mRhN+wNYE0wCblBilehqiaKkzq6T7ZXqL08I7WVDY28Jd6bB
 yEbg==
X-Gm-Message-State: AOAM5335JxKruF577ZbbAEBaJ78gk5wWJBGFkFe2xs+hFApiMZetVWNT
 H3EvmtZUN7aMM6WXRKx3D+p9aP1WVcrNE2LUjqYl1w==
X-Google-Smtp-Source: ABdhPJxjCR1tRv5Vi4Nt0QWTz2GZsD8/5wZBQ5hBZZW11jMP7uvutfanuEQOvf2fWtfAZz7mqXvfI8Y23sNg2MX1b3Q=
X-Received: by 2002:a05:6870:15ca:b0:e9:551:6d1c with SMTP id
 k10-20020a05687015ca00b000e905516d1cmr1291139oad.193.1650652758892; Fri, 22
 Apr 2022 11:39:18 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Fri, 22 Apr 2022 11:39:18 -0700
MIME-Version: 1.0
In-Reply-To: <20220422084951.2776123-1-lv.ruyi@zte.com.cn>
References: <20220422084951.2776123-1-lv.ruyi@zte.com.cn>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Fri, 22 Apr 2022 11:39:18 -0700
Message-ID: <CAE-0n52nFSUA-3CWa81mE-WUFW8pjOwYsFp-eGOkzupg2cZ9Yg@mail.gmail.com>
To: cgel.zte@gmail.com, quic_abhinavk@quicinc.com, robdclark@gmail.com, 
 sean@poorly.run
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH] drm/msm/dp: fix error check return value of
 irq_of_parse_and_map()
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
 Lv Ruyi <lv.ruyi@zte.com.cn>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org, daniel@ffwll.ch,
 dmitry.baryshkov@linaro.org, quic_khsieh@quicinc.com,
 freedreno@lists.freedesktop.org, Zeal Robot <zealci@zte.com.cn>,
 linux@roeck-us.net
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting cgel.zte@gmail.com (2022-04-22 01:49:51)
> From: Lv Ruyi <lv.ruyi@zte.com.cn>
>
> The irq_of_parse_and_map() function returns 0 on failure, and does not
> return an negative value.
>
> Fixes:  8ede2ecc3e5e ("drm/msm/dp: Add DP compliance tests on Snapdragon Chipsets")
> Reported-by: Zeal Robot <zealci@zte.com.cn>
> Signed-off-by: Lv Ruyi <lv.ruyi@zte.com.cn>
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index a42732b67349..3926d2ac107d 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1239,7 +1239,7 @@ int dp_display_request_irq(struct msm_dp *dp_display)
>         dp = container_of(dp_display, struct dp_display_private, dp_display);
>
>         dp->irq = irq_of_parse_and_map(dp->pdev->dev.of_node, 0);

Why can't platform_get_irq() be used?

> -       if (dp->irq < 0) {
> +       if (!dp->irq) {
>                 rc = dp->irq;

zero as an error return value is an error?

>                 DRM_ERROR("failed to get irq: %d\n", rc);
>                 return rc;
