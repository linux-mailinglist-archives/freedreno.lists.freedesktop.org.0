Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 698A387021D
	for <lists+freedreno@lfdr.de>; Mon,  4 Mar 2024 14:07:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A2E8112120;
	Mon,  4 Mar 2024 13:06:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="oOK5ET4O";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f181.google.com (mail-yb1-f181.google.com
 [209.85.219.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADC54112120
 for <freedreno@lists.freedesktop.org>; Mon,  4 Mar 2024 13:06:56 +0000 (UTC)
Received: by mail-yb1-f181.google.com with SMTP id
 3f1490d57ef6-dcbd1d4904dso5089100276.3
 for <freedreno@lists.freedesktop.org>; Mon, 04 Mar 2024 05:06:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1709557615; x=1710162415; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=ZF5EHPeguAlmw8pt+rnW85Aj9ppqfHEoGqFfoa9ov8U=;
 b=oOK5ET4OfD3fx8p1xfhzWKX1T8FNAMB/HTlSgIZ8D5LlTqi9CY+Nwxa3chvkhffLPB
 ykCMLt5t73xBZSK5zAO8XYzslKlaWx+53WRzr25/ydH9h2WWAuDXnRdNgfMGTzmmBz2Q
 VuVxeME1UwlLbeLSL8Qy6Inj+k5kFzhiywB1vDR2gruNK/AOcUJVHIso1HMeHuDonPAR
 SbMno218hc1s6S8KeqF+0ps/Rz4fXPE1vSqZYFncGe0/OUgT6+oAgok4wyiLlP87gbLA
 qDq5LCqZ/uPRu2n3vdjrXmES1ieGjYmTI6EemjjwD3LwbNy2vHigpK7f2Qj8em2OePMM
 QENg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1709557615; x=1710162415;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZF5EHPeguAlmw8pt+rnW85Aj9ppqfHEoGqFfoa9ov8U=;
 b=KrKAZV201CiMPGfP/qWhCenDWarkVq1jSWApt2oQYoL9yslknsctmYsmKTW9y0O4hy
 SWI34VM4yXHLL92zP5Up1W5gd/IsrIj/iZMIGpxLaGBv8m8soCr8RRfXfb75QTH2acVn
 AHLbh7hiI9XTdK1LJ6CTHAWNSnXhrdwEdq0fOW1T36mf2a6pbwZ7b0y2XeWojOYkT0VW
 9JWtBeVEjSpTndNwjQPyJTz44rTxmwYi7uBhhOqXzAHdjWGHu1LZjEozOXSFYC7EvuPu
 myor5V0n6t7w/Hp4Eck0aVls/pecStRHixgINo7rvCWs8pgUmil9cg4b3Ll8rF/LFBOT
 Wo3w==
X-Gm-Message-State: AOJu0YwoTEY08CdnwRBQgM7oHWzOw6d+UXo0+wkj438B2xnC7y7Klv/f
 8itSO0NFQf7a+UitJWmHVPspGwP4ArK4lqxgQ2ZzcN8IRsCbBR0zubsx4vPosLIAPmjAbC6J8cx
 feNFYZW5GtDx2cgtETFzac10jzkQ78tilV2lwqw==
X-Google-Smtp-Source: AGHT+IHDoyrZSgo3d0pdsvjs58WMMhEuCQvAoO7S/07i8igiKmULNd3ZGDbVm0+XF7UvoNRUriBuP/dHX1xzq05mxT0=
X-Received: by 2002:a5b:b05:0:b0:dcd:13ba:cdd6 with SMTP id
 z5-20020a5b0b05000000b00dcd13bacdd6mr6132325ybp.47.1709557615168; Mon, 04 Mar
 2024 05:06:55 -0800 (PST)
MIME-Version: 1.0
References: <20240228194730.619204-1-quic_abhinavk@quicinc.com>
In-Reply-To: <20240228194730.619204-1-quic_abhinavk@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 4 Mar 2024 15:06:43 +0200
Message-ID: <CAA8EJppf0ebg+qnw7Z4P_6W4pgf0E4+KLGLEhU138f4k8+QxOw@mail.gmail.com>
Subject: Re: [PATCH 1/2] drm/msm/dpu: drop unused dpu_kms from interface
 initialization
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 dri-devel@lists.freedesktop.org, 
 quic_parellan@quicinc.com, quic_jesszhan@quicinc.com, 
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org
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

On Wed, 28 Feb 2024 at 21:47, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
> dpu_kms seems unused while initializing DSI, HDMI and DP through
> their respective _dpu_kms_initialize_* functions.
>
> Hence lets drop the parameter altogether.
>
> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> ---
>  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 15 ++++++---------
>  1 file changed, 6 insertions(+), 9 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> index 2af62d8fa9a7..ab924ac78c9b 100644
> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> @@ -494,8 +494,7 @@ static void dpu_kms_wait_flush(struct msm_kms *kms, unsigned crtc_mask)
>  }
>
>  static int _dpu_kms_initialize_dsi(struct drm_device *dev,
> -                                   struct msm_drm_private *priv,
> -                                   struct dpu_kms *dpu_kms)
> +                                  struct msm_drm_private *priv)
>  {
>         struct drm_encoder *encoder = NULL;
>         struct msm_display_info info;
> @@ -558,8 +557,7 @@ static int _dpu_kms_initialize_dsi(struct drm_device *dev,
>  }
>
>  static int _dpu_kms_initialize_displayport(struct drm_device *dev,
> -                                           struct msm_drm_private *priv,
> -                                           struct dpu_kms *dpu_kms)
> +                                          struct msm_drm_private *priv)

This breaks now on top of YUV patchset:

drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c: In function
'_dpu_kms_initialize_displayport':
drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c:583:35: error: 'dpu_kms'
undeclared (first use in this function)
583 | yuv_supported = !!dpu_kms->catalog->cdm;

As this requires adding of the yuv_supported argument, let's consider
moving it backwards: for  _dpu_kms_initialize_writeback() we can get
format_list and n_formats from the dpu_kms.


>  {
>         struct drm_encoder *encoder = NULL;
>         struct msm_display_info info;
> @@ -592,8 +590,7 @@ static int _dpu_kms_initialize_displayport(struct drm_device *dev,
>  }
>
>  static int _dpu_kms_initialize_hdmi(struct drm_device *dev,
> -                                   struct msm_drm_private *priv,
> -                                   struct dpu_kms *dpu_kms)
> +                                   struct msm_drm_private *priv)
>  {
>         struct drm_encoder *encoder = NULL;
>         struct msm_display_info info;
> @@ -671,19 +668,19 @@ static int _dpu_kms_setup_displays(struct drm_device *dev,
>         int rc = 0;
>         int i;
>
> -       rc = _dpu_kms_initialize_dsi(dev, priv, dpu_kms);
> +       rc = _dpu_kms_initialize_dsi(dev, priv);
>         if (rc) {
>                 DPU_ERROR("initialize_dsi failed, rc = %d\n", rc);
>                 return rc;
>         }
>
> -       rc = _dpu_kms_initialize_displayport(dev, priv, dpu_kms);
> +       rc = _dpu_kms_initialize_displayport(dev, priv);
>         if (rc) {
>                 DPU_ERROR("initialize_DP failed, rc = %d\n", rc);
>                 return rc;
>         }
>
> -       rc = _dpu_kms_initialize_hdmi(dev, priv, dpu_kms);
> +       rc = _dpu_kms_initialize_hdmi(dev, priv);
>         if (rc) {
>                 DPU_ERROR("initialize HDMI failed, rc = %d\n", rc);
>                 return rc;
> --
> 2.34.1
>


--
With best wishes
Dmitry
