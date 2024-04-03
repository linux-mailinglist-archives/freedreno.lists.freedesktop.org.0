Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B77E896D29
	for <lists+freedreno@lfdr.de>; Wed,  3 Apr 2024 12:51:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0CF751125B7;
	Wed,  3 Apr 2024 10:51:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="F283ax1A";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f178.google.com (mail-yb1-f178.google.com
 [209.85.219.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 95DE51125B7
 for <freedreno@lists.freedesktop.org>; Wed,  3 Apr 2024 10:51:16 +0000 (UTC)
Received: by mail-yb1-f178.google.com with SMTP id
 3f1490d57ef6-dd10ebcd702so5953997276.2
 for <freedreno@lists.freedesktop.org>; Wed, 03 Apr 2024 03:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1712141475; x=1712746275; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=9wQYgll8+YgZcGCKnnvI2FxMVky7cnKkeUfk2C0HI4g=;
 b=F283ax1AYF63N5X0JCg69yS1rmPo49Kq46/l+CPhtgT2uJcWgx8/zJ+S+DIjFKWz9Y
 6P0uvv6x7H12Mh3W0sZCCIoTkChhrtOR0RZkMR23xBBziDdaVn+aqriyD5st4YAzQ4Qd
 UX79r6CKMmNz1hrpb+eDNY9XAwmliBhs01M/1Y3svsS0qcPc0zJPZAuGSeqHSj4LC2vE
 wrLismwvh8rv52dR5rm4YInezsAlUJpalUrsND9vjdbaNh7a7cGdsoFnfoHPSUFzwf8x
 wENRPlSBr6yDOnr57S8b6FUA2ChnHgtdDlGnKgytrSvldT7DFH8VCsAn4NCrM2hcGXzZ
 e2EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1712141475; x=1712746275;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9wQYgll8+YgZcGCKnnvI2FxMVky7cnKkeUfk2C0HI4g=;
 b=u4zyukj3t3wjCk5xHfo2tU8U/xI0gpMoZ35Q5tGboHjm8K1l5xd0pbBBFBuaHSZ58m
 HERl+b2bT1lJQf+1uB28ztretAqYI2xsUG3p6uYbk32UIKuAh3VJRdht4yA4ihGslnS9
 7hZQEOe7S7TrFyvPho45fGke3tFvT7vXDiSwxYvuqtye92A0YdQXz8/RWOhoGXwNYBhk
 kKHWIGgVTRc/kP6MEYvdZnpjRWwNyBTpZL2hqlHKXgN857GeVunjX5bHpEkp2qteXvfw
 X4nS/hVYuLy7568qAfEbIpVR5fkoXkwUU9AOKXAZweb4+SfAk7vWFEGaDsehGje44wGQ
 Ziaw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXtX7Oh2Unvo4wLqNxJi0mwF6kQ9fKtSHH9MdoxIibxlHW6rd8uA8vIjk46xtFnx2+tgexWe7DFntxXhfCgQeEmPTHNLCjP6g/iTw4ZiKP8
X-Gm-Message-State: AOJu0YySQ/1GF3YYkbLb5SNbRoCi2iefVCvSS5YLsJsIMBYud0/E1LCJ
 ZCyXynj3m888QFkLR2CTITCxHDwwalFh6rT6C7MqK6jZV1E4ag4vooGihfZQgVgXf87REj3w0kz
 /Ado92KXpGc1j7aLyTnr7qFzfpZLyFcd88+g/xA==
X-Google-Smtp-Source: AGHT+IFViT90qoDfNv/+HMMVSkIOCuMMMRX1j2q+fmbWxlh4TJnkk6Ect2I8Rn3bLy8gy7ZkC9SPpdBwFMOLjbGbeMI=
X-Received: by 2002:a25:c141:0:b0:dc7:5c37:5420 with SMTP id
 r62-20020a25c141000000b00dc75c375420mr13394794ybf.60.1712141475267; Wed, 03
 Apr 2024 03:51:15 -0700 (PDT)
MIME-Version: 1.0
References: <20240403-msm-drm-dsc-dsi-video-upstream-v1-0-db5036443545@linaro.org>
 <20240403-msm-drm-dsc-dsi-video-upstream-v1-6-db5036443545@linaro.org>
In-Reply-To: <20240403-msm-drm-dsc-dsi-video-upstream-v1-6-db5036443545@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 3 Apr 2024 13:51:04 +0300
Message-ID: <CAA8EJprvAiOYnzJNduhr9MZe6asfE5ygtupTNbp4dcXD-U8jsA@mail.gmail.com>
Subject: Re: [PATCH v3 6/6] drm/msm/dsi: support DSC configurations with
 slice_per_pkt > 1
To: Jun Nie <jun.nie@linaro.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, Vinod Koul <vkoul@kernel.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jonathan Marek <jonathan@marek.ca>
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

On Wed, 3 Apr 2024 at 12:11, Jun Nie <jun.nie@linaro.org> wrote:
>
> From: Jonathan Marek <jonathan@marek.ca>
>
> Support slice_per_pkt in msm driver.
>
> Note that the removed "pkt_per_line = slice_per_intf * slice_per_pkt"
> comment is incorrect.
>
> Also trim the code to simplify the dsc reference.
>
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> ---
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 35 ++++++++++++++---------------------
>  1 file changed, 14 insertions(+), 21 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
> index b0507a42ee6a..0c6f40dbd25c 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi_host.c
> +++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
> @@ -866,17 +866,10 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>         slice_per_intf = msm_dsc_get_slices_per_intf(dsc, hdisplay);
>
>         total_bytes_per_intf = dsc->slice_chunk_size * slice_per_intf;
> -       bytes_per_pkt = dsc->slice_chunk_size; /* * slice_per_pkt; */
> -
> +       bytes_per_pkt = dsc->slice_chunk_size * dsc->slice_per_pkt;

Please don't mix cleanup and functional changes.

>         eol_byte_num = total_bytes_per_intf % 3;
>
> -       /*
> -        * Typically, pkt_per_line = slice_per_intf * slice_per_pkt.
> -        *
> -        * Since the current driver only supports slice_per_pkt = 1,
> -        * pkt_per_line will be equal to slice per intf for now.
> -        */
> -       pkt_per_line = slice_per_intf;
> +       pkt_per_line = slice_per_intf / dsc->slice_per_pkt;
>
>         if (is_cmd_mode) /* packet data type */
>                 reg = DSI_COMMAND_COMPRESSION_MODE_CTRL_STREAM0_DATATYPE(MIPI_DSI_DCS_LONG_WRITE);
> @@ -916,6 +909,7 @@ static void dsi_update_dsc_timing(struct msm_dsi_host *msm_host, bool is_cmd_mod
>  static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>  {
>         struct drm_display_mode *mode = msm_host->mode;
> +       struct drm_dsc_config *dsc = msm_host->dsc;

And here too. Please pull msm_host->dsc change to a separate patch.

>         u32 hs_start = 0, vs_start = 0; /* take sync start as 0 */
>         u32 h_total = mode->htotal;
>         u32 v_total = mode->vtotal;
> @@ -947,8 +941,7 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>                 hdisplay /= 2;
>         }
>
> -       if (msm_host->dsc) {
> -               struct drm_dsc_config *dsc = msm_host->dsc;
> +       if (dsc) {
>                 u32 bytes_per_pclk;
>
>                 /* update dsc params with timing params */
> @@ -988,14 +981,14 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>                 else
>                         bytes_per_pclk = 3;
>
> -               hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(msm_host->dsc), bytes_per_pclk);
> +               hdisplay = DIV_ROUND_UP(msm_dsc_get_bytes_per_line(dsc), bytes_per_pclk);
>
>                 h_total += hdisplay;
>                 ha_end = ha_start + hdisplay;
>         }
>
>         if (msm_host->mode_flags & MIPI_DSI_MODE_VIDEO) {
> -               if (msm_host->dsc)
> +               if (dsc)
>                         dsi_update_dsc_timing(msm_host, false, mode->hdisplay);
>
>                 dsi_write(msm_host, REG_DSI_ACTIVE_H,
> @@ -1016,21 +1009,17 @@ static void dsi_timing_setup(struct msm_dsi_host *msm_host, bool is_bonded_dsi)
>                         DSI_ACTIVE_VSYNC_VPOS_START(vs_start) |
>                         DSI_ACTIVE_VSYNC_VPOS_END(vs_end));
>         } else {                /* command mode */
> -               if (msm_host->dsc)
> +               if (dsc)
>                         dsi_update_dsc_timing(msm_host, true, mode->hdisplay);
>
>                 /* image data and 1 byte write_memory_start cmd */
> -               if (!msm_host->dsc)
> +               if (!dsc)
>                         wc = hdisplay * mipi_dsi_pixel_format_to_bpp(msm_host->format) / 8 + 1;
>                 else
>                         /*
>                          * When DSC is enabled, WC = slice_chunk_size * slice_per_pkt + 1.
> -                        * Currently, the driver only supports default value of slice_per_pkt = 1
> -                        *
> -                        * TODO: Expand mipi_dsi_device struct to hold slice_per_pkt info
> -                        *       and adjust DSC math to account for slice_per_pkt.
>                          */
> -                       wc = msm_host->dsc->slice_chunk_size + 1;
> +                       wc = dsc->slice_chunk_size * dsc->slice_per_pkt + 1;
>
>                 dsi_write(msm_host, REG_DSI_CMD_MDP_STREAM0_CTRL,
>                         DSI_CMD_MDP_STREAM0_CTRL_WORD_COUNT(wc) |
> @@ -1657,8 +1646,12 @@ static int dsi_host_attach(struct mipi_dsi_host *host,
>         msm_host->lanes = dsi->lanes;
>         msm_host->format = dsi->format;
>         msm_host->mode_flags = dsi->mode_flags;
> -       if (dsi->dsc)
> +       if (dsi->dsc) {
>                 msm_host->dsc = dsi->dsc;
> +               /* for backwards compatibility, assume 1 if not set */
> +               if (!dsi->dsc->slice_per_pkt)
> +                       dsi->dsc->slice_per_pkt = 1;
> +       }
>
>         /* Some gpios defined in panel DT need to be controlled by host */
>         ret = dsi_host_init_panel_gpios(msm_host, &dsi->dev);
>
> --
> 2.34.1
>


-- 
With best wishes
Dmitry
