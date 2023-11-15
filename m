Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5124E7EBE43
	for <lists+freedreno@lfdr.de>; Wed, 15 Nov 2023 08:55:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0451D10E4FE;
	Wed, 15 Nov 2023 07:55:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-x1133.google.com (mail-yw1-x1133.google.com
 [IPv6:2607:f8b0:4864:20::1133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 75C4610E4FD
 for <freedreno@lists.freedesktop.org>; Wed, 15 Nov 2023 07:55:12 +0000 (UTC)
Received: by mail-yw1-x1133.google.com with SMTP id
 00721157ae682-59b5484fbe6so74415427b3.1
 for <freedreno@lists.freedesktop.org>; Tue, 14 Nov 2023 23:55:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700034911; x=1700639711; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=15PRWbRTiCU1VNIlXZWdSysxSpbXy5GgKNCUAYG7W5w=;
 b=SI5dZpw5ENpO0p4M2+crUxhl0c9uR/K/ycNyYZO9y5ccDSiLg1s5qmb+tz+B7eMVTk
 w7LfnymsKUsKLku5Msb2cQZkA88c+gCczmDV347B2CQbqOtLT52iKlEgqlJ+ReuCL3ub
 zmdmM/NBOQjWZOViySf6VC+f6U4LyvPA635VEZabqA2pn4qjpKuoOUl2L7HVJlRLKKJM
 is9QOxuP1C2ZRrhaNvcZdHIOGjwnIsLRZLN3SHBsU8MOg1sBu1IPT1SMMmpQVOqCcjXv
 xneJZx2e9joMJjalUPRWd1unDjYi8NFIBx5Z/eV5NB5HKk50cVh7qrE9NbModZ7WccmJ
 KyJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700034911; x=1700639711;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=15PRWbRTiCU1VNIlXZWdSysxSpbXy5GgKNCUAYG7W5w=;
 b=wNpJOM51yU26765Jq+32vhp/G5k4tH+rzrPXzHg/VBcadEhzuQVrwqvEI9CWId4KTu
 5N8l3XiRMZvi62Zzh0na9H9T+Vf4rSNVYFAVuxEJlIE4jJys+5w6vT0P19uqBtbojhbZ
 xeJ2T/pMeUOFQqOMzVmE7Wt7YAtlCpLWufPhjzW2QDLIuP2Hzr2O8v9aq9ssAaPz7gqC
 H4jT3sXhzTMS0tYhS/XkKjCNQ94Xc+5lMkBFwxpO91y8j9qMDRGg0S7IyMEiw7vjXM7H
 lYaygXYnFsAR+S2wQZGTb7Q9ny1QvisUfw3vizsCETZVyJIiaaf8jhnOb2dhGzbFyDQJ
 +chw==
X-Gm-Message-State: AOJu0YxiHLwdp6v+idgrtjVRejJoQ2z/7EY8e2Oj3qtvXFXEpaxsxp+K
 eEcn5mgIlTRPoUcwJwXp9UgIGjdOoIc2d8xc0k6bTw==
X-Google-Smtp-Source: AGHT+IGF0QFxsq04qkcDH1xFplg+U57Jq/Gcno4gH3SYxLIhnKNkUwuqZj7ahhye+SflHFUwIXeq6RwbBxjolai3xoI=
X-Received: by 2002:a81:4f12:0:b0:59a:f131:50fa with SMTP id
 d18-20020a814f12000000b0059af13150famr13475836ywb.47.1700034911416; Tue, 14
 Nov 2023 23:55:11 -0800 (PST)
MIME-Version: 1.0
References: <20231114225857.19702-1-jonathan@marek.ca>
 <20231114225857.19702-7-jonathan@marek.ca>
In-Reply-To: <20231114225857.19702-7-jonathan@marek.ca>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 15 Nov 2023 09:55:00 +0200
Message-ID: <CAA8EJpr8DhKncsGV3hdtJk9DoTTyhi2x6+o55jTcVUFadfcMbg@mail.gmail.com>
To: Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 6/6] drm/msm/dsi: fix DSC for the bonded
 DSI case
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
Cc: freedreno@lists.freedesktop.org,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Jiasheng Jiang <jiasheng@iscas.ac.cn>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Doug Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>,
 open list <linux-kernel@vger.kernel.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 15 Nov 2023 at 01:00, Jonathan Marek <jonathan@marek.ca> wrote:
>
> For the bonded DSI case, DSC pic_width and timing calculations should use
> the width of a single panel instead of the total combined width.
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>

Fixes tag?

I'll wait for the Tested-by by Marijn, otherwise LGTM.

> ---
>  drivers/gpu/drm/msm/dsi/dsi.h         |  3 ++-
>  drivers/gpu/drm/msm/dsi/dsi_host.c    | 20 +++++++++++---------
>  drivers/gpu/drm/msm/dsi/dsi_manager.c |  2 +-
>  3 files changed, 14 insertions(+), 11 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.h b/drivers/gpu/drm/msm/dsi/dsi.h
> index 28379b1af63f..3a641e69447c 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.h
> @@ -93,7 +93,8 @@ int msm_dsi_host_power_off(struct mipi_dsi_host *host);
>  int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
>                                   const struct drm_display_mode *mode);
>  enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
> -                                           const struct drm_display_mode *mode);
> +                                           const struct drm_display_mode *mode,
> +                                           bool is_bonded_dsi);
>  unsigned long msm_dsi_host_get_mode_flags(struct mipi_dsi_host *host);
>  int msm_dsi_host_register(struct mipi_dsi_host *host);
>  void msm_dsi_host_unregister(struct mipi_dsi_host *host);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index 892a463a7e03..cf06736e5a60 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -940,8 +940,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>                                mode->hdisplay, mode->vdisplay);
>                         return;
>                 }
> -

Nit: keep it please.

> -               dsc->pic_width = mode->hdisplay;
> +               dsc->pic_width = hdisplay;
>                 dsc->pic_height = mode->vdisplay;
>                 DBG("Mode %dx%d\n", dsc->pic_width, dsc->pic_height);
>
> @@ -952,6 +951,11 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>                 if (ret)
>                         return;
>
> +               if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO)
> +                       dsi_update_dsc_timing(msm_host, false, hdisplay);
> +               else
> +                       dsi_update_dsc_timing(msm_host, true, hdisplay);
> +
>                 /* Divide the display by 3 but keep back/font porch and
>                  * pulse width same
>                  */
> @@ -968,9 +972,6 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>         }
>
>         if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) {
> -               if (msm_host->dsc)
> -                       dsi_update_dsc_timing(msm_host, false, mode->hdisplay);
> -
>                 dsi_write(msm_host, REG_DSI_ACTIVE_H,
>                         DSI_ACTIVE_H_START(ha_start) |
>                         DSI_ACTIVE_H_END(ha_end));
> @@ -989,9 +990,6 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>                         DSI_ACTIVE_VSYNC_VPOS_START(vs_start) |
>                         DSI_ACTIVE_VSYNC_VPOS_END(vs_end));
>         } else {                /* command mode */
> -               if (msm_host->dsc)
> -                       dsi_update_dsc_timing(msm_host, true, mode->hdisplay);
> -
>                 /* image data and 1 byte write_memory_start cmd */
>                 if (!msm_host->dsc)
>                         wc = hdisplay * dsi_get_bpp(msm_host->format) / 8 + 1;
> @@ -2479,7 +2477,8 @@ int msm_dsi_host_set_display_mode(struct mipi_dsi_host *host,
>  }
>
>  enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
> -                                           const struct drm_display_mode *mode)
> +                                           const struct drm_display_mode *mode,
> +                                           bool is_bonded_dsi)
>  {
>         struct msm_dsi_host *msm_host = to_msm_dsi_host(host);
>         struct drm_dsc_config *dsc = msm_host->dsc;
> @@ -2489,6 +2488,9 @@ enum drm_mode_status msm_dsi_host_check_dsc(struct mipi_dsi_host *host,
>         if (!msm_host->dsc)
>                 return MODE_OK;
>
> +       if (is_bonded_dsi)
> +               pic_width = mode->hdisplay / 2;
> +
>         if (pic_width % dsc->slice_width) {
>                 pr_err("DSI: pic_width %d has to be multiple of slice %d\n",
>                        pic_width, dsc->slice_width);
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> index 896f369fdd53..2ca1a7ca3659 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
> @@ -455,7 +455,7 @@ static enum drm_mode_status dsi_mgr_bridge_mode_valid(struct drm_bridge *bridge,
>                         return MODE_ERROR;
>         }
>
> -       return msm_dsi_host_check_dsc(host, mode);
> +       return msm_dsi_host_check_dsc(host, mode, IS_BONDED_DSI());
>  }
>
>  static const struct drm_bridge_funcs dsi_mgr_bridge_funcs = {
> --
> 2.26.1
>


-- 
With best wishes
Dmitry
