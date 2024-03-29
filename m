Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7BCAC891329
	for <lists+freedreno@lfdr.de>; Fri, 29 Mar 2024 06:24:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9BBE610ECE0;
	Fri, 29 Mar 2024 05:24:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="YkmkFvBa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54FC310ECE0
 for <freedreno@lists.freedesktop.org>; Fri, 29 Mar 2024 05:24:20 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-dd045349d42so1611996276.2
 for <freedreno@lists.freedesktop.org>; Thu, 28 Mar 2024 22:24:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1711689799; x=1712294599; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=y1cnsQ+TYX5gevtZTdSvBbUB7ZdNL1NVBjO5UpPgLkY=;
 b=YkmkFvBa6Pqof4UOGvMZ61/4SxIwXZh1TXzwFmKonlXsaUriFxU7aazzChsf3NLa7M
 iiLLiUCiSZw/sIAXUyWTPqYELUVgUsu6xts8gsPdaGYr4aIMnCevIrQDyUyHVve3Gc+Z
 PCwpwwlNcN3zPidIhdWgSni2La7TJnN8spp7bmykVsuZydsYE5d4VY0Yc1Af25WPAF3D
 VCrPJG66OCDX8TOgQE4jNzjQqLzDeV7pQFNlin2laKLQ8DOq+usxbDbaoFtvcSTrfOKz
 1Io+rwiXEGBe91vgFZm9UhwFvzyXO1VCQ1ceYAwoUqOjLqvytnYBTSD7yT94tr/NXnYp
 7QLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711689799; x=1712294599;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=y1cnsQ+TYX5gevtZTdSvBbUB7ZdNL1NVBjO5UpPgLkY=;
 b=u/GkZqWa9vJFkjMDiJByH/z6jvF0RINDXj7MQ8trIePOsijgxnfNLu8lzO2+oWgOAf
 nFwRb/r4t2MEoSBoM2hPEY/RNMdl6gcRK9OrABY5RaSGa0Sj13unhTLX2XK5R2c0M6hC
 ngzcUXxjgFyhd1upSSwkKdiLMiEzsANzBgHmPBIj2/Gl44Z98GCXDCwrckAiBcEKd2nA
 6JTvvp6JT7fvoGmUgMXC7hCudSjqqV35nLtvz+Y228DVcb5WWBUEL0y0Euo2WguDKpVz
 h3TdXoOe1h8VXSPcXMidzCghGfhw115xNHmMzp3Su7yq9own7SFRKYD1YHXgeG0g/Sqw
 YmMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXz4NbwxWwcqa8MQNjNxhFDfg+MFqVOnpZTpPD8cRHr+IOxtph0KYpOuMGNDQ6OXbEbDMyv62PENNO2kXRnOTsXALa6nwTcnSsI4KqPqGrl
X-Gm-Message-State: AOJu0YzfKNUsvaQrkGERxFNmiCZunrnVjwpIK5ujSkI4pAaWb+u7Hhw1
 1YbPQIXEnvtUYO5dHok2CNn9f26WXb5Wmc+wMfTLyZVQ5j8VeNi5mcsf0uhxY47aZdAbac/Pbv8
 wCa04NFroY1zfBuIcHZ2Qw34XYAog9QRwV11QmQ==
X-Google-Smtp-Source: AGHT+IHnJYTaJIdFKWO6mQBmk67+u6vknOcIRVk7XoYypNIe5sbgqFqIgY39n1Yb+IQT5e5iuAOhWt+sHM/xZb5wm1g=
X-Received: by 2002:a25:8110:0:b0:dd0:76e:d630 with SMTP id
 o16-20020a258110000000b00dd0076ed630mr1272196ybk.53.1711689798692; Thu, 28
 Mar 2024 22:23:18 -0700 (PDT)
MIME-Version: 1.0
References: <20240328-dp-connector-type-cleanup-v1-1-9bf84c5a6082@quicinc.com>
In-Reply-To: <20240328-dp-connector-type-cleanup-v1-1-9bf84c5a6082@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 29 Mar 2024 07:23:07 +0200
Message-ID: <CAA8EJpoNBA7L3FMqf+4korbbYfrptHq3Fke86DpfNcbpiBaqzQ@mail.gmail.com>
Subject: Re: [PATCH] drm/msm/dp: Remove now unused connector_type from desc
To: Bjorn Andersson <quic_bjorande@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Abel Vesa <abel.vesa@linaro.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
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

On Fri, 29 Mar 2024 at 06:02, Bjorn Andersson <quic_bjorande@quicinc.com> wrote:
>
> Now that the connector_type is dynamically determined, the
> connector_type of the struct msm_dp_desc is unused. Clean it up.
>
> Signed-off-by: Bjorn Andersson <quic_bjorande@quicinc.com>
> ---
> This cleans up after, and hence depends on,
> https://lore.kernel.org/all/20240324-x1e80100-display-refactor-connector-v4-1-e0ebaea66a78@linaro.org/
> ---
>  drivers/gpu/drm/msm/dp/dp_display.c | 41 ++++++++++++++++++-------------------
>  1 file changed, 20 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
> index 521cba76d2a0..a18fb8b32c16 100644
> --- a/drivers/gpu/drm/msm/dp/dp_display.c
> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
> @@ -119,55 +119,54 @@ struct dp_display_private {
>  struct msm_dp_desc {
>         phys_addr_t io_start;
>         unsigned int id;
> -       unsigned int connector_type;
>         bool wide_bus_supported;
>  };
>
>  static const struct msm_dp_desc sc7180_dp_descs[] = {
> -       { .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> +       { .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0 },
>         {}
>  };
>
>  static const struct msm_dp_desc sc7280_dp_descs[] = {
> -       { .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -       { .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_supported = true },
> +       { .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> +       { .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
>         {}
>  };
>
>  static const struct msm_dp_desc sc8180x_dp_descs[] = {
> -       { .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> -       { .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> -       { .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_eDP },
> +       { .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0 },
> +       { .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1 },
> +       { .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2 },
>         {}
>  };
>
>  static const struct msm_dp_desc sc8280xp_dp_descs[] = {
> -       { .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -       { .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -       { .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -       { .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -       { .io_start = 0x22090000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -       { .io_start = 0x22098000, .id = MSM_DP_CONTROLLER_1, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -       { .io_start = 0x2209a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> -       { .io_start = 0x220a0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_DisplayPort, .wide_bus_supported = true },
> +       { .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> +       { .io_start = 0x0ae98000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> +       { .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
> +       { .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
> +       { .io_start = 0x22090000, .id = MSM_DP_CONTROLLER_0, .wide_bus_supported = true },
> +       { .io_start = 0x22098000, .id = MSM_DP_CONTROLLER_1, .wide_bus_supported = true },
> +       { .io_start = 0x2209a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
> +       { .io_start = 0x220a0000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
>         {}
>  };
>
>  static const struct msm_dp_desc sc8280xp_edp_descs[] = {

This can now be merged with sc8280xp_dp_descs

> -       { .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_supported = true },
> -       { .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_supported = true },
> -       { .io_start = 0x2209a000, .id = MSM_DP_CONTROLLER_2, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_supported = true },
> -       { .io_start = 0x220a0000, .id = MSM_DP_CONTROLLER_3, .connector_type = DRM_MODE_CONNECTOR_eDP, .wide_bus_supported = true },
> +       { .io_start = 0x0ae9a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
> +       { .io_start = 0x0aea0000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
> +       { .io_start = 0x2209a000, .id = MSM_DP_CONTROLLER_2, .wide_bus_supported = true },
> +       { .io_start = 0x220a0000, .id = MSM_DP_CONTROLLER_3, .wide_bus_supported = true },
>         {}
>  };
>
>  static const struct msm_dp_desc sm8350_dp_descs[] = {

same as sc7180_dp

> -       { .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> +       { .io_start = 0x0ae90000, .id = MSM_DP_CONTROLLER_0 },
>         {}
>  };
>
>  static const struct msm_dp_desc sm8650_dp_descs[] = {
> -       { .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0, .connector_type = DRM_MODE_CONNECTOR_DisplayPort },
> +       { .io_start = 0x0af54000, .id = MSM_DP_CONTROLLER_0 },
>         {}
>  };
>


-- 
With best wishes
Dmitry
