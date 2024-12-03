Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DEB579E1F4B
	for <lists+freedreno@lfdr.de>; Tue,  3 Dec 2024 15:34:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B636310EA34;
	Tue,  3 Dec 2024 14:34:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="doVKs0Eb";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BB0810EA33
 for <freedreno@lists.freedesktop.org>; Tue,  3 Dec 2024 14:34:13 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-53dd9e853ccso5942414e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 03 Dec 2024 06:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733236452; x=1733841252; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OTwLeT3aQeMpcOp4Q1BFPHKxDtrlDP9yLmVoPEGdsN0=;
 b=doVKs0EbzVXWLtioSQDUsRkJOucZykQscfQf3GJKFRybz2SLZ4TEDRGluWcJyHLVIA
 uAJqLgI94884sD+XiPl2qwVtA9dI8Q08HusLhqgItwAft5hHQ5X1tJ5cpt+ojr2GfT2D
 QVwRE6s50KWLQMiv4Clx1u5M8XYOrRcg1Pd+u1SDh+zH97b74ybL+0/kvimeHEGsng+b
 1fEfsj3j6jL5u8tp5DX0aGP+N98wnebHgffzb1t8/6DB4yv1Mb8Sr8Mpk15qceCGmMED
 c4lqNdpRTfVzFKwNhg3wl/NbFIJy4Hi+bD9FtIpr1jSX9ejNUP880cW7I3BIAszHtn70
 XkOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733236452; x=1733841252;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OTwLeT3aQeMpcOp4Q1BFPHKxDtrlDP9yLmVoPEGdsN0=;
 b=aFqSGdIENCDQxTVy5RKxvOWvgoA1RHcjKf/KcMPQOorLSGpuH2g/CfcM4jAsXeO5Rb
 NaDfPPGXG05yIpj/A1CxUsYLBUsRniXkKNWuemioGJDTcrHD0UpxzF9jhozPYbJ3AJUQ
 RON7Dwt8MrifgXGm867vvEKM3GntKOCd6H7YJrfPtrgi/bBY+/tJzZ0gH5zb8Z7DW9oW
 0x5gs4eyXzXigvTIaS950Lv0K2RZ9v3+qW3L0DrXaOmUFMqdnhI4PlgExD6+ZTiH9i/s
 YTEDli+Q95kNl8eeAEn7ZfhrM79/UaYS+KAdWWMbwtmt6yoxodD8u2hXWpjJb1xQ1SKb
 d/NA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWTfHQ14DYrAQzd3/dd+dL0zeurUg0HBJyn2FltNSVqaVDuNxzFDfxZ+j1UvLTtp6ONDVK0HF1XkVM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBPtOuLXwnHkiH6KtDZb17M1aXHjYA4gSNvvJ5jYBjsVLTbCaN
 NXZKGE4mXtabttKN7a2AMYRmNwneQhlFSQafFvoSLCYzZNkhScnbmpS6j24tAtE=
X-Gm-Gg: ASbGnct6K6QvjR9uSZyyu2B292wmKMqUoH3rPuhBDE3TpdQNA6BHo+e5Dj2IaciyEvV
 rH5Biur09aF6Ahm4PUbOCJk2YnjFpr7OYNaF/5PrVjtUXaEteLo78Fjt82OXLUqybkLKUJY51eC
 XrD7cTW9j12xIunwHUU/4TbaAOVrVIrVX6lp0tZZ048wy5S0BRJite21QLfkwJ5Ol/iW/UmDOx0
 CS20JnwvO3nD++GxXDAVzIe+/adtiFrB70uhYfrekx3Q2Tk5xQTSZVBHV7Er5dPOnXZXZdNIgWe
 mlCdQdyioc5TNMa7r1qnCIgyyzuRIg==
X-Google-Smtp-Source: AGHT+IEy1sx0BWSMOp5Z7xI7HaeVkaEKc3qbAGcaYeHf/G5vYZpDUtVEJUQzItIhVGsMUW1ZYWXRpw==
X-Received: by 2002:a05:6512:b8e:b0:53d:ed62:e653 with SMTP id
 2adb3069b0e04-53e129fdbebmr1839987e87.15.1733236451759; 
 Tue, 03 Dec 2024 06:34:11 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df646f097sm1840541e87.161.2024.12.03.06.34.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Dec 2024 06:34:10 -0800 (PST)
Date: Tue, 3 Dec 2024 16:34:08 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: Re: [PATCH 1/3] drm/msm/dp: account for widebus in
 msm_dp_catalog_panel_tpg_enable()
Message-ID: <hwomnwmuak3optjooe6g5szqi77nc7znsfjrxqbxx72nqe3e7k@om2e65vaurov>
References: <20241202-tpg-v1-0-0fd6b518b914@quicinc.com>
 <20241202-tpg-v1-1-0fd6b518b914@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241202-tpg-v1-1-0fd6b518b914@quicinc.com>
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

On Mon, Dec 02, 2024 at 12:41:58PM -0800, Abhinav Kumar wrote:
> Adjust the h_active calculation to account for widebus in tpg.
> 
> Fixes: 757a2f36ab09 ("drm/msm/dp: enable widebus feature for display port")
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_catalog.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
> index b4c8856fb25d..05c8e1996f60 100644
> --- a/drivers/gpu/drm/msm/dp/dp_catalog.c
> +++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
> @@ -1011,9 +1011,21 @@ void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
>  	u32 v_sync_width;
>  	u32 hsync_ctl;
>  	u32 display_hctl;
> +	u32 h_sync_width;
> +	u32 h_front_porch;
> +	u32 h_back_porch;
> +	u32 h_active;
> +
> +	h_active = drm_mode->hdisplay;
> +	h_back_porch = drm_mode->htotal - drm_mode->hsync_end;
> +	h_sync_width = drm_mode->htotal - (drm_mode->hsync_start + h_back_porch);

It's at least drm_mode->hsync_end - drm_mode->hsync_start

> +	h_front_porch = drm_mode->hsync_start - drm_mode->hdisplay;
> +
> +	if (msm_dp_catalog->wide_bus_en)
> +		h_active /= 2;
>  
>  	/* TPG config parameters*/
> -	hsync_period = drm_mode->htotal;
> +	hsync_period = h_sync_width + h_back_porch + h_active + h_front_porch;

Is it equivalent to:

hsync_period = drm_mode->htotal;
if (msm_dp_catalog->wide_bus_en)
    hsync_period -= drm_mode->hdisplay / 2;

I think it's simpler to handle.

>  	vsync_period = drm_mode->vtotal;
>  
>  	display_v_start = ((drm_mode->vtotal - drm_mode->vsync_start) *
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
