Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 29C095B5FD7
	for <lists+freedreno@lfdr.de>; Mon, 12 Sep 2022 20:06:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BE5610E08A;
	Mon, 12 Sep 2022 18:06:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D96D810E07A
 for <freedreno@lists.freedesktop.org>; Mon, 12 Sep 2022 18:06:30 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id z25so16212085lfr.2
 for <freedreno@lists.freedesktop.org>; Mon, 12 Sep 2022 11:06:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=kYN4sSnKsnkXEFWeYDTU7HvcPZgEZ/o2shM14281xec=;
 b=UIQYoaC8p51/CcywfdQZB00kFNr5wACgEmQKBjj6VwI91WaPvwOYgu8e5JY6mbLUT7
 ev3HQVjiMNncyGfjUTPN6ZKKD1eYclE00Wf0ymkPdhBSknRXHAzI4+PJdDF6VYw4qVo+
 ooHegD6DcIMWhri6PnnR9QkKEMzuK6rpOpYeCZN1feOq27CAqA5zGPbJWPlg1E7Cobwg
 LzSiMGfWRk8E8QzpQvNXv74fNVSzugWkyFnMDw0mOhA6ILdCowPjYLGn3Tp+ITJsruiB
 BSlgyJuds7AgR25yS9OJSpex3SIVxKXXLHceATcFzRmT1Jd5UBhts65A7PS58HznEXTB
 5cPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=kYN4sSnKsnkXEFWeYDTU7HvcPZgEZ/o2shM14281xec=;
 b=fzEw8ReSicd9zlMg+/jZ5FfIHDFMJDZC9IDwC5Xjf5FFpsRkxgLC76kAdGuYEN6nm6
 G+5D4sssTxVhefSxgX6nSMJOwuMoVtlUj2yyAOEcv7zBKls39QRQUJzDbz3cHGs6bZpi
 pznfttUpZvICcedH4XnN1tWQWO8in4an4SmD3PQP0QgTVf98t8/3VQaTUWN17yd8gvAn
 hi3kbc1KPh9CVo3+wQRe2YX0/WK89kbG0wnXyKNCFFDr1f7UA+tZ/eqUxF+kSBJ+S6Hf
 yIyLVm+K6tYZcHr3uedF0SXoGX1b9NP1rB+SaVJ70bsA2plEA/MSkGnGzfaYsajoCmwN
 s2xw==
X-Gm-Message-State: ACgBeo39RDLRQV3gi2riMTZUmcP5WUmNnB0TwHMEsR6btjHd4RoQ8my3
 uTHJOrFWcDbclEMNph4mvtvv8A==
X-Google-Smtp-Source: AA6agR6cA3jIvYOUKP8VSPHJk6ux8JJLyK8cw7y4HqFQKiFhwUGDtUOZq7UW1ujHaN1ejgyp9zqS3A==
X-Received: by 2002:a05:6512:1056:b0:498:efaf:5bd1 with SMTP id
 c22-20020a056512105600b00498efaf5bd1mr6964212lfb.64.1663005989237; 
 Mon, 12 Sep 2022 11:06:29 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 g1-20020a0565123b8100b00492dba3c85asm1195593lfv.220.2022.09.12.11.06.28
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 12 Sep 2022 11:06:28 -0700 (PDT)
Message-ID: <39cbf0cb-9f25-6a0d-6e56-3f9e0aaa0296@linaro.org>
Date: Mon, 12 Sep 2022 21:06:28 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.1
Content-Language: en-GB
To: Johan Hovold <johan+linaro@kernel.org>,
 Douglas Anderson <dianders@chromium.org>, Rob Clark <robdclark@gmail.com>
References: <20220912154046.12900-1-johan+linaro@kernel.org>
 <20220912154046.12900-8-johan+linaro@kernel.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20220912154046.12900-8-johan+linaro@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 7/7] drm/msm: drop modeset sanity checks
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
Cc: dri-devel@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Jonas Karlman <jonas@kwiboo.se>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Jernej Skrabec <jernej.skrabec@gmail.com>, Stephen Boyd <swboyd@chromium.org>,
 Robert Foss <robert.foss@linaro.org>, Andrzej Hajda <andrzej.hajda@intel.com>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 12/09/2022 18:40, Johan Hovold wrote:
> Drop the overly defensive modeset sanity checks of function parameters
> which have already been checked or used by the callers.
> 
> Signed-off-by: Johan Hovold <johan+linaro@kernel.org>

Again, please split into dp and dsi patches. After that:

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

> ---
>   drivers/gpu/drm/msm/dp/dp_display.c | 7 +------
>   drivers/gpu/drm/msm/dsi/dsi.c       | 7 +------
>   2 files changed, 2 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 393af1ea9ed8..8ad28bf81abe 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -1597,15 +1597,10 @@ static int dp_display_get_next_bridge(struct msm_dp *dp)
>   int msm_dp_modeset_init(struct msm_dp *dp_display, struct drm_device *dev,
>   			struct drm_encoder *encoder)
>   {
> -	struct msm_drm_private *priv;
> +	struct msm_drm_private *priv = dev->dev_private;
>   	struct dp_display_private *dp_priv;
>   	int ret;
>   
> -	if (WARN_ON(!encoder) || WARN_ON(!dp_display) || WARN_ON(!dev))
> -		return -EINVAL;
> -
> -	priv = dev->dev_private;
> -
>   	if (priv->num_bridges == ARRAY_SIZE(priv->bridges)) {
>   		DRM_DEV_ERROR(dev->dev, "too many bridges\n");
>   		return -ENOSPC;
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.c b/drivers/gpu/drm/msm/dsi/dsi.c
> index 8a95c744972a..31fdee2052be 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi.c
> @@ -211,14 +211,9 @@ void __exit msm_dsi_unregister(void)
>   int msm_dsi_modeset_init(struct msm_dsi *msm_dsi, struct drm_device *dev,
>   			 struct drm_encoder *encoder)
>   {
> -	struct msm_drm_private *priv;
> +	struct msm_drm_private *priv = dev->dev_private;
>   	int ret;
>   
> -	if (WARN_ON(!encoder) || WARN_ON(!msm_dsi) || WARN_ON(!dev))
> -		return -EINVAL;
> -
> -	priv = dev->dev_private;
> -
>   	if (priv->num_bridges == ARRAY_SIZE(priv->bridges)) {
>   		DRM_DEV_ERROR(dev->dev, "too many bridges\n");
>   		return -ENOSPC;

-- 
With best wishes
Dmitry

