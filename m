Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E06E964267
	for <lists+freedreno@lfdr.de>; Thu, 29 Aug 2024 12:57:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2334810E5AE;
	Thu, 29 Aug 2024 10:57:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="HxGzr2fn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f172.google.com (mail-yw1-f172.google.com
 [209.85.128.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CDF0310E3B5
 for <freedreno@lists.freedesktop.org>; Thu, 29 Aug 2024 10:57:31 +0000 (UTC)
Received: by mail-yw1-f172.google.com with SMTP id
 00721157ae682-6b2e6e7ad28so13148077b3.0
 for <freedreno@lists.freedesktop.org>; Thu, 29 Aug 2024 03:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1724929051; x=1725533851; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=kwqJQQb59xRLhCYwW6OAOAk3j2QVQ8lc2useMLEqB8g=;
 b=HxGzr2fnDi3INAN2XWQ6VORZHmiUKdgPS0mVHoOIeY1v2KcntTk8J6GpasQ2771p35
 yySuq2DsvtmUF4LEwwoVkHMw2Hf8ot06d0yuUxjmRLXw7CY6u/ylBePB7eRGX8sBvHsf
 FkYIMdmRwsAq13cVxMfNYBRVq9nfLE7W9CZ2EmuaDuUsmaZyn0KMeIbghyG33QQB+EeM
 QG6CNDzcITwQgUK3eZJLWa0pFVPZiYEBPG3IAauaS98fGyeWsTdLF8VFpNcdRmc/Bqx1
 28mL/d7g8j6kuzJ9BtOwxmqc2aRp5R5s9e0maDUkFCpSJ5qtWEM4gP00HHr+VR0NxS9j
 ATCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1724929051; x=1725533851;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kwqJQQb59xRLhCYwW6OAOAk3j2QVQ8lc2useMLEqB8g=;
 b=fgHmsJzts+CUFRJxlonPN/fZGBITedFgx/GmCfdCzAT2jRts8C3Roc00cW7HtyHNDU
 MvB9AjpfhJCAD6BiYJ9NOHaUgrH0wEHc/sZZ9DKTeTZz2bJAlHQmK92Tsf9IQekiFAGm
 H1X4oPcav38NtJ3bhlh+71z9K8eGE16SjlAsHcaScSHCLCFv1yYDgP0PLYJiiMF3qPtA
 KJyIJx6BjBp5NgtU08fdF1cyxfb6IzS9mtzoYPBSXuSBiGzhiAdYL8aA2tFdv+KIHNdI
 H96DZIbcxMJeN3OtwJrncEiJyz1LI+tddC7W2889ieGpWjfs1HKU8Y8+qx4QQ0hc/vW0
 LVJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU4lATXSilhO4Ux8cqp13jHsonj36mavSl/sWtNT7aCBZIyI1E185CiCoxlirpKH6BcC0wnwibatkU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynrGfwoY+l6t0prSyZ34aXQAD+IqpA+/Rb2eFTU5Dd527U8y2J
 UglXEOWjavChga+Tog9jgrK2rV7C6/eDqF6gi7hnFLSf/5vTWBNZ7GaCJQ0Ju3l2trCKpGe3Gi/
 6RpdZ4N1IX1bihitW7mfguVVsXRhldecaJ6r2Opt2DhSaCP+Z
X-Google-Smtp-Source: AGHT+IFLwdc6wf30eDIUoq0QNI20U0jfGDr6mbQqABDDdx1FbiHjr/4K7A/bY8G0k8agAF4tWqiTjrO7GH+UZ34kNKQ=
X-Received: by 2002:a05:690c:5:b0:63b:ba95:c8b3 with SMTP id
 00721157ae682-6d2ed874487mr6947017b3.6.1724929050662; Thu, 29 Aug 2024
 03:57:30 -0700 (PDT)
MIME-Version: 1.0
References: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-0-bdb05b4b5a2e@linaro.org>
 <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-3-bdb05b4b5a2e@linaro.org>
In-Reply-To: <20240829-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-8-v1-3-bdb05b4b5a2e@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 29 Aug 2024 13:57:19 +0300
Message-ID: <CAA8EJpqCL1xFVB8_2j2QwPsF-vHBcFBt3yx=acpWgmo4_Oudug@mail.gmail.com>
Subject: Re: [PATCH 03/21] drm/msm/dsi: pass the right width to dsc
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
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

On Thu, 29 Aug 2024 at 13:19, Jun Nie <jun.nie@linaro.org> wrote:
>
> Data width for dsc engine is aligned with pipe, not with whole screen
> width. Because the width may be halved in DSI bonded case.

Can't really parse this.

>
> The dsc width is not related to the timing with back front porch in
> later stage, so update dsc timing earlier.
>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 13 ++++++-------
>  1 file changed, 6 insertions(+), 7 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 7a4d9c071be5a..5abade8f26b88 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -953,7 +953,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>                         return;
>                 }
>
> -               dsc->pic_width = mode->hdisplay;
> +               dsc->pic_width = hdisplay;
>                 dsc->pic_height = mode->vdisplay;
>                 DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);

Two separate commits

>
> @@ -964,6 +964,11 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>                 if (ret)
>                         return;
>
> +               if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO)
> +                       dsi_update_dsc_timing(msm_host, false, hdisplay);
> +               else
> +                       dsi_update_dsc_timing(msm_host, true, hdisplay);
> +
>                 /*
>                  * DPU sends 3 bytes per pclk cycle to DSI. If widebus is
>                  * enabled, bus width is extended to 6 bytes.
> @@ -990,9 +995,6 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>         }
>
>         if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) {
> -               if (msm_host->dsc)
> -                       dsi_update_dsc_timing(msm_host, false, mode->hdisplay);
> -
>                 dsi_write(msm_host, REG_DSI_ACTIVE_H,
>                         DSI_ACTIVE_H_START(ha_start) |
>                         DSI_ACTIVE_H_END(ha_end));
> @@ -1011,9 +1013,6 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>                         DSI_ACTIVE_VSYNC_VPOS_START(vs_start) |
>                         DSI_ACTIVE_VSYNC_VPOS_END(vs_end));
>         } else {                /* command mode */
> -               if (msm_host->dsc)
> -                       dsi_update_dsc_timing(msm_host, true, mode->hdisplay);
> -
>                 /* image data and 1 byte write_memory_start cmd */
>                 if (!msm_host->dsc)
>                         wc = hdisplay * mipi_dsi_pixel_format_to_bpp(msm_host->format) / 8 + 1;
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
