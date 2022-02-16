Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7E44B94AE
	for <lists+freedreno@lfdr.de>; Thu, 17 Feb 2022 00:46:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 203C110E643;
	Wed, 16 Feb 2022 23:46:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x332.google.com (mail-ot1-x332.google.com
 [IPv6:2607:f8b0:4864:20::332])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EC4310E628
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 23:46:45 +0000 (UTC)
Received: by mail-ot1-x332.google.com with SMTP id
 v6-20020a05683024a600b005ac1754342fso2560400ots.5
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 15:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=mime-version:in-reply-to:references:from:user-agent:date:message-id
 :subject:to:cc;
 bh=Kwpt2sUL3NJ3srh/WboVkkXpszIC4Q/LDD+d6HlrRIY=;
 b=AUTTrQBHC7mixxUEkiAyUTrlGDju362Lne/nNGvQKLuIbcK//xaWuktOnM1G7jEe0r
 fZflm5jVwEUnMm07DDH+FGTzbyAGA3lnCdUkx3Bve7SskIoGdOV5qqbZAjFrm0xrJWZG
 ScOC3Qo1++xQahNQgIO3enbM/sharIUzhMepw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:mime-version:in-reply-to:references:from
 :user-agent:date:message-id:subject:to:cc;
 bh=Kwpt2sUL3NJ3srh/WboVkkXpszIC4Q/LDD+d6HlrRIY=;
 b=Rt4FjgAK6DOafgblNsvIe8Hj+khUI2ppiYFPkTsSL0LWcCdaefRlbesxmfNqSjC4V6
 pd7DQWThbcpR4vMLXhhjk1XnNrVMVRLzGeUF5F7yyXOaZ+XhVg82b7ZN8nNBit/xy17m
 Wl2So/qdVOTAGnh0YMPl3lvsHvDWCEyQKOd/UivOz+yPnN/6JXtmdOPdsBqSNU9yI+2p
 tvd4brbiljalpONqpnvVXYJAJp1NaRGa0TPjNz50TNEp8Ul3r/RH1QLRYFPBHWtPpWMh
 vHn5OVFO5QPmvcVaF6iWFfy4ESox08Ka356ET9qIeiiXQuZRgSAm6gUCHP0E8xnB+P3z
 W/KA==
X-Gm-Message-State: AOAM533AIDt9DE2w8XSqTFp2y2Etulk9blN2lmZDOBBdU1ylCUrcESxK
 LbwEsCXfeaQEfCF4w3adp+qIIMlevxifBZlZbPk5wA==
X-Google-Smtp-Source: ABdhPJzvDBotbDuvYSRUTv7F8cbOMwR37rDKbNepWqplPiPt+4QJBmOCl44hw7yykOd5pe0TK555IzBledo4gwXDL1M=
X-Received: by 2002:a9d:7687:0:b0:59e:da8c:5d32 with SMTP id
 j7-20020a9d7687000000b0059eda8c5d32mr114110otl.77.1645055204515; Wed, 16 Feb
 2022 15:46:44 -0800 (PST)
Received: from 753933720722 named unknown by gmailapi.google.com with
 HTTPREST; Wed, 16 Feb 2022 15:46:44 -0800
MIME-Version: 1.0
In-Reply-To: <1643828199-8564-4-git-send-email-quic_khsieh@quicinc.com>
References: <1643828199-8564-1-git-send-email-quic_khsieh@quicinc.com>
 <1643828199-8564-4-git-send-email-quic_khsieh@quicinc.com>
From: Stephen Boyd <swboyd@chromium.org>
User-Agent: alot/0.10
Date: Wed, 16 Feb 2022 15:46:44 -0800
Message-ID: <CAE-0n534MH7ih4nKbjY5EewcZ0J73Zp_A=Q-CJ0M_z3nWoVaVQ@mail.gmail.com>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>, agross@kernel.org, airlied@linux.ie,
 bjorn.andersson@linaro.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org, 
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, sean@poorly.run, 
 vkoul@kernel.org
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v3 3/3] drm/msm/dp: replace DRM_DEBUG_DP
 marco with drm_dbg_dp
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
Cc: quic_sbillaka@quicinc.com, linux-arm-msm@vger.kernel.org,
 quic_abhinavk@quicinc.com, linux-kernel@vger.kernel.org,
 quic_aravindh@quicinc.com, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting Kuogee Hsieh (2022-02-02 10:56:39)

Please add some commit text

> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
> ---
>  drivers/gpu/drm/msm/dp/dp_audio.c   |  49 +++++++++++------
>  drivers/gpu/drm/msm/dp/dp_catalog.c |  34 +++++++-----
>  drivers/gpu/drm/msm/dp/dp_ctrl.c    | 106 +++++++++++++++++++-----------------
>  drivers/gpu/drm/msm/dp/dp_display.c |  68 +++++++++++++----------
>  drivers/gpu/drm/msm/dp/dp_drm.c     |   4 +-
>  drivers/gpu/drm/msm/dp/dp_link.c    |  99 +++++++++++++++++++--------------
>  drivers/gpu/drm/msm/dp/dp_panel.c   |  43 +++++++++------
>  drivers/gpu/drm/msm/dp/dp_parser.c  |   2 +-
>  drivers/gpu/drm/msm/dp/dp_power.c   |  20 ++++---
>  9 files changed, 246 insertions(+), 179 deletions(-)
>
> diff --git a/drivers/gpu/drm/msm/dp/dp_audio.c b/drivers/gpu/drm/msm/dp/dp_audio.c
> index d7e4a39..4fbbe0a 100644
> --- a/drivers/gpu/drm/msm/dp/dp_audio.c
> +++ b/drivers/gpu/drm/msm/dp/dp_audio.c
> @@ -136,7 +136,8 @@ static void dp_audio_stream_sdp(struct dp_audio_private *audio)
>         parity_byte = dp_audio_calculate_parity(new_value);
>         value |= ((new_value << HEADER_BYTE_1_BIT)
>                         | (parity_byte << PARITY_BYTE_1_BIT));
> -       DRM_DEBUG_DP("Header Byte 1: value = 0x%x, parity_byte = 0x%x\n",
> +       drm_dbg_dp((struct drm_device *)NULL,

Why can't we pass the platform device pointer? Surely the cast is not
necessary and in fact harmful.
