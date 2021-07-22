Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 01DEF3D2D22
	for <lists+freedreno@lfdr.de>; Thu, 22 Jul 2021 22:07:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A71F6EE77;
	Thu, 22 Jul 2021 20:07:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32d.google.com (mail-ot1-x32d.google.com
 [IPv6:2607:f8b0:4864:20::32d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 601636EE32
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jul 2021 20:07:00 +0000 (UTC)
Received: by mail-ot1-x32d.google.com with SMTP id
 61-20020a9d0d430000b02903eabfc221a9so15091oti.0
 for <freedreno@lists.freedesktop.org>; Thu, 22 Jul 2021 13:07:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=O8dDgSeZjlhPao9QRuOYxkfISrHgO2l6PhjYbW5g3pw=;
 b=X2bvxtNR79OkmCWe08P/hN6fnPvQe9zDyBpX7Jxdc1kokI00XqWy/PrsXfH00R/5Ao
 zIw0o3tfvhRxvR6mGy/yo6dPMohc9RnVqfU8OowzBL4AynRk9iY261MysIDm+juXfIBS
 AkPkXyg7xi6gdmy/bIpZpo5OcSzAyalfJlubI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=O8dDgSeZjlhPao9QRuOYxkfISrHgO2l6PhjYbW5g3pw=;
 b=aR4thQkode9ac2Hx8FHaEXx7ubYUXZQEJIJ3MLuj/EbEm0YE9IWbUIYeem6F1gEdgS
 NI26ELHoEktvk6U4DgbdFGnkOhP3QrCVk9PUICSEMGq83387ykuwFPVnZCRi7LZS7hlO
 X/cOzX389qIcBWxg+lEx+Gl6EW3V2lIU7PcIPHAGIFH3kUgkzGBITUIBhoF64jgaD+8Z
 M3qy+dbmgJ5MjZXPK0yvuvpNSD+/DaiVwPhK3d3O1uW0nwBa3nUbZrujEpxZNT5t+uIQ
 0ePjV4D8q4AMyoLFMa7j5VTOZg6CtXZPnOSdDIHzU2ETZlmRBGz71eCaeAai36akYB9P
 F7NQ==
X-Gm-Message-State: AOAM531rSzBQUglqTRBIdJXW4YNzXnnNH2XZl30ko0VZtNjd/+LR/RlK
 +6N1FUfhjX+1Z/P/D95XcUCxpyBdOT6Uu/ANiWnI3Q==
X-Google-Smtp-Source: ABdhPJwldBK47Or1p1ivwfzx0ETv9cQ7IC2/MrivbSo7ScqHLOOcpcP56sV3AD4XttYcPbUS++a1HNWU0OWyQn9YNNI=
X-Received: by 2002:a9d:8c7:: with SMTP id 65mr978424otf.25.1626984419283;
 Thu, 22 Jul 2021 13:06:59 -0700 (PDT)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Thu, 22 Jul 2021 20:06:58 +0000
MIME-Version: 1.0
In-Reply-To: <20210722024227.3313096-3-bjorn.andersson@linaro.org>
References: <20210722024227.3313096-1-bjorn.andersson@linaro.org>
 <20210722024227.3313096-3-bjorn.andersson@linaro.org>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.9.1
Date: Thu, 22 Jul 2021 20:06:58 +0000
Message-ID: <CAE-0n53QF1vmjQDcWX8U3UFu=JtjGrK-XNk-1hcm64iRBPNYMA@mail.gmail.com>
To: Abhinav Kumar <abhinavk@codeaurora.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>, 
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
 Rob Clark <robdclark@gmail.com>, 
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>
Subject: Re: [Freedreno] [PATCH 2/5] drm/msm/dp: Use devres for ioremap()
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <khsieh@codeaurora.org>, Tanmay Shah <tanmay@codeaurora.org>,
 freedreno@lists.freedesktop.org, Chandan Uddaraju <chandanu@codeaurora.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Bjorn Andersson (2021-07-21 19:42:24)
> The non-devres version of ioremap is used, which requires manual
> cleanup. But the code paths leading here is mixed with other devres
> users, so rely on this for ioremap as well to simplify the code.
>
> Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> ---

Reviewed-by: Stephen Boyd <swboyd@chromium.org>

>  drivers/gpu/drm/msm/dp/dp_parser.c | 29 ++++-------------------------
>  1 file changed, 4 insertions(+), 25 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_parser.c b/drivers/gpu/drm/msm/dp/dp_parser.c
> index 0519dd3ac3c3..c064ced78278 100644
> --- a/drivers/gpu/drm/msm/dp/dp_parser.c
> +++ b/drivers/gpu/drm/msm/dp/dp_parser.c
> @@ -32,7 +32,7 @@ static int msm_dss_ioremap(struct platform_device *pdev,
>         }
>
>         io_data->len = (u32)resource_size(res);
> -       io_data->base = ioremap(res->start, io_data->len);
> +       io_data->base = devm_ioremap(&pdev->dev, res->start, io_data->len);
>         if (!io_data->base) {
>                 DRM_ERROR("%pS->%s: ioremap failed\n",
>                         __builtin_return_address(0), __func__);

I don't think we need this print either, but that can come later in
addition to using devm_platform_get_and_ioremap_resource().
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
