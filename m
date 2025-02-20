Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 61C53A3D699
	for <lists+freedreno@lfdr.de>; Thu, 20 Feb 2025 11:27:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3A3A510E921;
	Thu, 20 Feb 2025 10:27:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="mfcInIDY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f172.google.com (mail-lj1-f172.google.com
 [209.85.208.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A29C110E918
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 10:27:17 +0000 (UTC)
Received: by mail-lj1-f172.google.com with SMTP id
 38308e7fff4ca-30a2d4b61e4so5598391fa.1
 for <freedreno@lists.freedesktop.org>; Thu, 20 Feb 2025 02:27:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740047236; x=1740652036; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=OdxLgmcTwfGNH3RIQhD6UV3lMFu/ahlDY5rbF2YgQg0=;
 b=mfcInIDYnoSKzB/8hn33tpiiGr2UbIZoCEeT9jxKlQX6aqiyi7EQ/hgWoZ4tOyTafR
 bcUwXq+yYqCreAW8AUgqL7w1EC1ZGSbRq7aY6W39Ghf0V6qSIpSl0MIWk4Clo3sGZtMF
 kDlHNQ/ktO0KOXDIoFUze7GnVjJg+3z9Ll56rDSUBMBjyUkcmyp89skGN/3UswVGHlmc
 CEs3laK9BrHCe4FBkxKi/ykCJ4FoDbp3l5rhkEIj2uVdzk9UwjCGmyx47sUIhdNKvf7k
 P+FdQKYf78GmBIFTGSwAvEirLJnRfjz19KkI+Qbho5K/HzSouEHFGND6FIhr/DuTHypy
 /Gmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740047236; x=1740652036;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OdxLgmcTwfGNH3RIQhD6UV3lMFu/ahlDY5rbF2YgQg0=;
 b=xQ/lFNWX005mYo2lIokiAPlU13Rhq+gzoGI6tY2graNT3QteEDlM4IMn4WX3rE/Z5A
 4W4EnE7RMWS2hOLa789akT74tdE9HHGVQSXxNUId0Vut+CEQP3oDKboUKXxHTV0bbLcu
 MTzCHxrCUoXWbCfDAyEIYmiTCZ3+AYLzfxfz2DBjgYkT3bd2aqRYwj3pt5emkL7c6nmq
 uI+5cefNu1a6rC7LAauw3OfVRo1oxnkPRC6VwovMxvk7+iM5noyqiKQPKHO3tYWWvNLV
 Paar6YPfXCOuKYXUDsQ8VKCazFwuVU4hiB+Ofz08jsol4LcTsnhTCSuyxNVWnT3miNjk
 pGsw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoHw1+PlRwF+hbXW1EA923nOIFy/7X176MV/gUGc/g/a4keKxYA4nA8X2Pi4IoFLR4Q+XxqfhFW3s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy0Jvbm/tv1H1XNZjjVfKLwptCvVz62xuS2lchGfVSSz+xaZmNK
 p3xz6kDlQtubZmzDamFNQI4tTS6Zb90HI1MyQKxrA7RS7RE544JcY9LpNAo3LB0=
X-Gm-Gg: ASbGncuqusweg+kXBiGSGA/2xTosQhUJJbv2FTpmq+ATe+KrHXcHbi5JXiPJRLER9vu
 LvrRSMvIRxiO4OgfqhROkq0+WgHU9JYXur//kEHWGqRcfRzgfCkVaSD5NqK9YO4K/ZZRTYX7C1R
 KMKRCZUlrvhthezAKSc+akcP1uPjObYjI8skAi5jG/XSIHnNPX4enbzIBHwALb4si6qRIC4/zlj
 v2jcfl2ZMl//TsMBJ/sbCt64FZ9eRkjNpOKz/Mxd2Ddylh7fw/8934ojXtNd1PRueoqa0UHCzHV
 DHbqifDAt9A7giFkNZC5xyLgxP9z+f5VREqaUboj2X25U3l7kzENF1/mgn9Cy2HoYAzf8/Q=
X-Google-Smtp-Source: AGHT+IFxXTsuWO3zBx6wjf9aaYQ+YsWg92pnfU23W3wK7Kk8yl9H1m+r4C8uwTVQv/ExC2Dtx7Bzxg==
X-Received: by 2002:a05:6512:308e:b0:545:c7d:1796 with SMTP id
 2adb3069b0e04-5462ef2015dmr3322754e87.43.1740047235908; 
 Thu, 20 Feb 2025 02:27:15 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5462f2a2811sm477328e87.191.2025.02.20.02.27.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 20 Feb 2025 02:27:14 -0800 (PST)
Date: Thu, 20 Feb 2025 12:27:12 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jonathan Marek <jonathan@marek.ca>
Subject: Re: [PATCH v2 1/5] drm/msm/dsi: add support VBIF_CTRL_PRIORITY to
 v2.8.0 controller
Message-ID: <tu6aaz6whzkqz4at26o2h6pvcua53squfpgfmiw3i4qshojoij@2erqc3zmxmos>
References: <20250220-dual-dsi-v2-0-6c0038d5a2ef@linaro.org>
 <20250220-dual-dsi-v2-1-6c0038d5a2ef@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220-dual-dsi-v2-1-6c0038d5a2ef@linaro.org>
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

On Thu, Feb 20, 2025 at 06:07:52PM +0800, Jun Nie wrote:
> This change originates from the Qualcomm Android Linux driver. It is
> essential to support a dual-DSI configuration with two panels in
> some circumstances per testing. As the name suggests, this modification
> may enhance the bandwidth robustness of a bus.

Please start by describing the problem and the result of the changes.
Otherwise it reads as it "may enhance or may worsen" the robustness.

> 
> Co-developed-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 42e100a8adca09d7b55afce0e2553e76d898744f..f59c4cd6bc8cdb31c1302f8e3ff395486c0b4898 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -2238,13 +2238,23 @@ int msm_dsi_host_cmd_rx(struct mipi_dsi_host *host,
>  	return ret;
>  }
>  
> +#define DSI_VBIF_CTRL			(0x01CC - 4)
> +#define DSI_VBIF_CTRL_PRIORITY		0x07
> +
>  void msm_dsi_host_cmd_xfer_commit(struct mipi_dsi_host *host, u32 dma_base,
>  				  u32 len)
>  {
>  	struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
> +	const struct msm_dsi_cfg_handler *cfg_hnd = msm_host->cfg_hnd;
> +	u32 reg;
>  
>  	dsi_write(msm_host, REG_DSI_DMA_BASE, dma_base);
>  	dsi_write(msm_host, REG_DSI_DMA_LEN, len);
> +	if (cfg_hnd->minor >= MSM_DSI_6G_VER_MINOR_V2_8_0) {
> +		reg = dsi_read(msm_host, DSI_VBIF_CTRL);
> +		reg |= (DSI_VBIF_CTRL_PRIORITY & 0x7);
> +		dsi_write(msm_host, DSI_VBIF_CTRL, reg);
> +	}
>  	dsi_write(msm_host, REG_DSI_TRIG_DMA, 1);
>  
>  	/* Make sure trigger happens */
> 
> -- 
> 2.34.1
> 

-- 
With best wishes
Dmitry
