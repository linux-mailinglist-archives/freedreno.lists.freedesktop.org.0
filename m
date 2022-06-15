Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E3BF254C813
	for <lists+freedreno@lfdr.de>; Wed, 15 Jun 2022 14:04:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95A1410E1FA;
	Wed, 15 Jun 2022 12:04:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8F0A310E1FA
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jun 2022 12:04:19 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id l20so6237856lji.0
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jun 2022 05:04:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=message-id:date:mime-version:user-agent:subject:content-language
 :from:to:cc:references:in-reply-to:content-transfer-encoding;
 bh=iXTqTOe5xGmaUGe1huORsSfZpFx3XRNmNcB6WpH+6mw=;
 b=ec0g+iH2H1WZ6TAg373dSwMY7lpuvlaoeH0t+38efRrkBitZWDTOMV55aQR654l6t1
 PSwLA/CCuiRT9Hxi8oaGg3t6+4ZpUrptmsfvYrYTAiYvor9ucyxNz4+/zpQj8CtVFfXJ
 ZQt51/zeDGVbDBwYFKsX3/XmSlQqBK5t4YhuJmILIW33fRm3f/+9XK2Cw9VGaLydheN0
 +YWdcF8SPFtHIG0Cq2pd6wtdIPQwD6KtT+CaS/7zLUdoN2Z9Ib4DKrwxXSP02IHUuT+y
 iE0g/9YRvFZ3YCTrH9bMr0bx/vf9qFhU+FC923i4QVXcRGtR691AL/RLFZhinP0DS8ff
 /rVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
 :content-language:from:to:cc:references:in-reply-to
 :content-transfer-encoding;
 bh=iXTqTOe5xGmaUGe1huORsSfZpFx3XRNmNcB6WpH+6mw=;
 b=SXwfYuNidP8XgE4U6RD6rDnJ3Q+Vlaz/Z/ki0VI89Ad68MpBDVSGi1AQF/2T75AmhX
 sJ6SWEQqWKcMu4Q0+sC3R+J+ztyEk+l/4DQHn7tlBjLofbvUgLQHIhoU0V/J/1vwBG3p
 N1MDsPJgm5J50YnlMUQUKyj0+i6znW29epe4U5WnbWRZMePcxBN7md5yBMbKgSCueW6C
 ix/39Dx/xuudUDZmvfubqOxBaIBri35sd7bA6E3wTd9+BqlVi/NhfEPxVzQmTBFJyTzm
 kgFVgIOC+ODsMezu/Z1BXjgi6sHkQ0/Xo+lXH05vX/kiP9YataY+pDeTWZn7BmXaio9W
 Q95Q==
X-Gm-Message-State: AJIora+HkY9h2aoUNU8HzVaKXD5NZ53SotKCV7FDD48yI50cqb0SmoxI
 O9WXhHnkpJVALK7Yz/3vRVsIUg==
X-Google-Smtp-Source: AGRyM1t0B8AvkM8FcmOy8Zu8YweVXPHtZP5xqhSG54spm9zJAqUPumOZFpD4TvA/3C3bBm/DhW7tBg==
X-Received: by 2002:a2e:bf14:0:b0:255:b789:576b with SMTP id
 c20-20020a2ebf14000000b00255b789576bmr5097964ljr.47.1655294657724; 
 Wed, 15 Jun 2022 05:04:17 -0700 (PDT)
Received: from [192.168.1.211] ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id
 9-20020a2e0809000000b002557cc64de7sm1668179lji.71.2022.06.15.05.04.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 15 Jun 2022 05:04:17 -0700 (PDT)
Message-ID: <da71cb6c-7512-d187-6ec0-d2d1a4eeaeba@linaro.org>
Date: Wed, 15 Jun 2022 15:04:16 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.0
Content-Language: en-GB
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg
 <sam@ravnborg.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>
References: <20220501151220.3999164-1-dmitry.baryshkov@linaro.org>
 <20220501151220.3999164-2-dmitry.baryshkov@linaro.org>
In-Reply-To: <20220501151220.3999164-2-dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 1/3] drm/mipi-dsi: pass DSC data through the
 struct mipi_dsi_device
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
Cc: Vinod Koul <vkoul@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 01/05/2022 18:12, Dmitry Baryshkov wrote:
> The commit 0f40ba48de3b ("drm/msm/dsi: Pass DSC params to drm_panel")
> added a pointer to the DSC data to the struct drm_panel. However DSC
> support is not limited to the DSI panels. MIPI DSI bridges can also
> consume DSC command streams. Thus add struct drm_dsc_config pointer to
> the struct mipi_dsi_device.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Gracious ping for the review from the drm core

> ---
>   include/drm/drm_mipi_dsi.h | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/include/drm/drm_mipi_dsi.h b/include/drm/drm_mipi_dsi.h
> index 147e51b6d241..8b1c9be9b2a7 100644
> --- a/include/drm/drm_mipi_dsi.h
> +++ b/include/drm/drm_mipi_dsi.h
> @@ -177,6 +177,7 @@ struct mipi_dsi_device_info {
>    * @lp_rate: maximum lane frequency for low power mode in hertz, this should
>    * be set to the real limits of the hardware, zero is only accepted for
>    * legacy drivers
> + * @dsc: panel/bridge DSC pps payload to be sent
>    */
>   struct mipi_dsi_device {
>   	struct mipi_dsi_host *host;
> @@ -189,6 +190,7 @@ struct mipi_dsi_device {
>   	unsigned long mode_flags;
>   	unsigned long hs_rate;
>   	unsigned long lp_rate;
> +	struct drm_dsc_config *dsc;
>   };
>   
>   #define MIPI_DSI_MODULE_PREFIX "mipi-dsi:"


-- 
With best wishes
Dmitry
