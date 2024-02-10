Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08D04850407
	for <lists+freedreno@lfdr.de>; Sat, 10 Feb 2024 11:50:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B442311271E;
	Sat, 10 Feb 2024 10:50:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="r262qd7H";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f169.google.com (mail-yb1-f169.google.com
 [209.85.219.169])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 23C341124BB
 for <freedreno@lists.freedesktop.org>; Sat, 10 Feb 2024 10:50:47 +0000 (UTC)
Received: by mail-yb1-f169.google.com with SMTP id
 3f1490d57ef6-dc746ddc43bso1856506276.3
 for <freedreno@lists.freedesktop.org>; Sat, 10 Feb 2024 02:50:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1707562247; x=1708167047; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=rZ4dvPokh+SvN2BddTUync+wbjk9ePK7aDvjAgf5s8k=;
 b=r262qd7HHKdMnKftQd4DjXK70SfiSX9aIhMRhXeyvVaQlhBuE4zjxVov0UEWqw+POd
 OGaJ+h4x0EUQEaffQDuBrpuerDEUcBvc3hskNhI/4ytLdssps5qcZ5JUzX44LIelEqwm
 qgIsG4xsfVWs/fJpbfliXCsfZAD1bKUqrpR2NLxtl1mU72CY+hjThQsOLxnC96SFtdKy
 2/HVaDBijsDR7TXGPIjgFxGn53AHDPUCDnT9/L8jh1cR6LwPKGa6tivkZMNp6Qgb8ijx
 f7JOOOp50J0X+MzVKOL5UYvLPbRWQKjleqOlaOSX00bIbfWgqqDbJU7nULL5dOMO5KUa
 Y5SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1707562247; x=1708167047;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rZ4dvPokh+SvN2BddTUync+wbjk9ePK7aDvjAgf5s8k=;
 b=ZwahXuAJUbEax0igmCyqX91XbZFUfxsAMUmWC+kn3d3Jx1K3+OHCpAT5nKWi/L0+Om
 GALsNPXRwzkE0/lswKFHkp89aWSKp4gW9pEOOFYF7SXkB5ylZNnKUaiAr90bWiQH3gNo
 GorgIF9GigUZYxaGeQsM+ytanXJeriTmEAMG3Fc7X1rRTsk6TcM/RAsVAmKasJI8fPKY
 Rtbe9lUG4M7j3d95sXtNFaoutnaLs20eLJCf5+Gsc/WtabdHc0RsjsOr4bOWTJj1KNyj
 Cws9fwKmQSRl7t7/vYiKbGRCixHikBQyN2TAqQrzbCSqM0dtfEVVk1mMqj8RbiOxRhot
 mpPg==
X-Gm-Message-State: AOJu0Yx0a37tm3MFXgpSmv3wa7uzk37RreC4L6zgz85W85dH6yUc8jNT
 DN7HsX6z/hVnwRLcoPvnwQ5X6xKO5lsjEyoTjwJPo++7xWdW2eYNl1ATempjFjiQELckZRqev11
 iEDUCksaepxUKQNtgLrFSzQROYKuqBdXEx+xOAg==
X-Google-Smtp-Source: AGHT+IHaFEz6gvn0y3KbuSz5ABIu3diqyRfTilMW9TNMEtNKJG3CNgSz1iv2t3Uk0pFFmhIR7PIzkfXoh1usMpcXhRw=
X-Received: by 2002:a25:818e:0:b0:dc2:1bc4:e06b with SMTP id
 p14-20020a25818e000000b00dc21bc4e06bmr1431004ybk.51.1707562246844; Sat, 10
 Feb 2024 02:50:46 -0800 (PST)
MIME-Version: 1.0
References: <20240210015223.24670-1-quic_parellan@quicinc.com>
 <20240210015223.24670-18-quic_parellan@quicinc.com>
In-Reply-To: <20240210015223.24670-18-quic_parellan@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sat, 10 Feb 2024 12:50:35 +0200
Message-ID: <CAA8EJprVnNmmpcOpHYOhZvLOGdny2ohqscWyUM8JwT8AGh2tCA@mail.gmail.com>
Subject: Re: [PATCH v2 17/19] drm/msm/dpu: modify timing engine programming
 for YUV420 over DP
To: Paloma Arellano <quic_parellan@quicinc.com>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, seanpaul@chromium.org, 
 swboyd@chromium.org, quic_abhinavk@quicinc.com, quic_jesszhan@quicinc.com, 
 quic_khsieh@quicinc.com, marijn.suijten@somainline.org, 
 neil.armstrong@linaro.org
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

On Sat, 10 Feb 2024 at 03:52, Paloma Arellano <quic_parellan@quicinc.com> wrote:
>
> Adjust the encoder timing engine setup programming in the case of video
> mode for YUV420 over DP to accommodate CDM.
>
> Changes in v2:
>         - Move timing engine programming to this patch
>
> Signed-off-by: Paloma Arellano <quic_parellan@quicinc.com>
> ---
>  .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c | 16 ++++++++++++----
>  1 file changed, 12 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> index 3f102b2813ca8..fb46d907312a7 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c
> @@ -235,8 +235,9 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
>  {
>         struct drm_display_mode mode;
>         struct dpu_hw_intf_timing_params timing_params = { 0 };
> +       struct dpu_hw_cdm *hw_cdm;
>         const struct dpu_format *fmt = NULL;
> -       u32 fmt_fourcc = DRM_FORMAT_RGB888;
> +       u32 fmt_fourcc;
>         unsigned long lock_flags;
>         struct dpu_hw_intf_cfg intf_cfg = { 0 };
>
> @@ -255,17 +256,21 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
>         DPU_DEBUG_VIDENC(phys_enc, "enabling mode:\n");
>         drm_mode_debug_printmodeline(&mode);
>
> -       if (phys_enc->split_role != ENC_ROLE_SOLO) {
> +       fmt_fourcc = dpu_encoder_get_drm_fmt(phys_enc);
> +
> +       if (phys_enc->split_role != ENC_ROLE_SOLO || fmt_fourcc == DRM_FORMAT_YUV420) {
>                 mode.hdisplay >>= 1;
>                 mode.htotal >>= 1;
>                 mode.hsync_start >>= 1;
>                 mode.hsync_end >>= 1;
> +               mode.hskew >>= 1;

hskew change seems to warrant a separate patch with Fixes for
25fdd5933e4c ("drm/msm: Add SDM845 DPU support")

>
>                 DPU_DEBUG_VIDENC(phys_enc,
> -                       "split_role %d, halve horizontal %d %d %d %d\n",
> +                       "split_role %d, halve horizontal %d %d %d %d %d\n",
>                         phys_enc->split_role,
>                         mode.hdisplay, mode.htotal,
> -                       mode.hsync_start, mode.hsync_end);
> +                       mode.hsync_start, mode.hsync_end,
> +                       mode.hskew);
>         }
>
>         drm_mode_to_intf_timing_params(phys_enc, &mode, &timing_params);
> @@ -273,6 +278,9 @@ static void dpu_encoder_phys_vid_setup_timing_engine(
>         fmt = dpu_get_dpu_format(fmt_fourcc);
>         DPU_DEBUG_VIDENC(phys_enc, "fmt_fourcc 0x%X\n", fmt_fourcc);
>
> +       hw_cdm = phys_enc->hw_cdm;
> +       if (hw_cdm)
> +               intf_cfg.cdm = hw_cdm->idx;

No need for a separate local variable.

>         intf_cfg.intf = phys_enc->hw_intf->idx;
>         intf_cfg.intf_mode_sel = DPU_CTL_MODE_SEL_VID;
>         intf_cfg.stream_sel = 0; /* Don't care value for video mode */
> --
> 2.39.2
>


-- 
With best wishes
Dmitry
