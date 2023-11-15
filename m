Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 81F1F7EBE0D
	for <lists+freedreno@lfdr.de>; Wed, 15 Nov 2023 08:27:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 721E410E4F9;
	Wed, 15 Nov 2023 07:27:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com
 [IPv6:2607:f8b0:4864:20::b2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0114410E4F9
 for <freedreno@lists.freedesktop.org>; Wed, 15 Nov 2023 07:27:03 +0000 (UTC)
Received: by mail-yb1-xb2c.google.com with SMTP id
 3f1490d57ef6-da41e70e334so6626163276.3
 for <freedreno@lists.freedesktop.org>; Tue, 14 Nov 2023 23:27:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700033223; x=1700638023; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=LI+hHZDGsrVLiENiIy3H+HbnGc5/Pj6x1urZCnZBE0A=;
 b=IOE0eA3xTC8sdtt1MsPwgTAPktXrBwsgIC3K/EFKLyXTCtlLnmozNHmzrfDqPkUKmX
 TQtYhm62h9g1dV6dEhHpHuLIlgR+G6ZwW10qe5LmR6G+sCiCgst7MvxFB6mkDI4Gd26u
 gWOAfOsJe9c98E0V5hcelBnctbuI/MD8FTvT1ZjaRUBukpy95tpYEq+z3FiysOn2A3G6
 Skm31n8qqYxUNksShA+3FM9ovTnNXJtn8VYT7pI0K4su1p2im10BFw2IKgjavEP7dIEt
 DDOEK7vojvohZEYe2MUYXR8sUltPL4zij42pkEFh882gV6IQ9T9C9cJVSIZEDwfEQUgy
 /48g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700033223; x=1700638023;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LI+hHZDGsrVLiENiIy3H+HbnGc5/Pj6x1urZCnZBE0A=;
 b=PsxDNCaTutNr22IEgwejY5ylvYG6FAulRFH7Px9gpLZL9JEj2y0mo3FWB4Oz9fwLVd
 9zpl091PyL6OR/dkZQ3OLtkcciHUGEpvgdtec4mLDyoZ1C4ELEgkEJb+OgiqNQXH/J8u
 T5YEXsq+YWAGiwlx4qxBwnBuSreP/srdFlK85u9aUbcdXO1uSBFk2GQAzM0MnvuLaVIr
 EZODhWZWi25H3Vq0T040BhZu+ef3CaFE7T7X3J+cbGz+y5nZHYCFl0MRYEmmakKsJ+pb
 Vvny2uC3fX7kxgjWAURxclJKkDh8L2gRf2OluHo6+JvW3N8v+2LJePIRur2obWKqg2N/
 OO/g==
X-Gm-Message-State: AOJu0YzwjekfIRXuRPdSmW2lIwKUwKftw9jV1j/bj/5sfmRi9EoTWoOy
 MxpcT/E5mR1DGQbCqzKDjYgcFp6x8FrxiSkztBNfWPPQmtJqjJuM
X-Google-Smtp-Source: AGHT+IFg14cjgoXzSIT4pD+JIPGzFocy5oWeTNMHBVe/p8YI7kp1xT3oW6AV6W2ZE8rVTAhJZNFOUYyiR/qUPm+7sR0=
X-Received: by 2002:a25:25d6:0:b0:da0:6876:a8eb with SMTP id
 l205-20020a2525d6000000b00da06876a8ebmr11431431ybl.46.1700033223136; Tue, 14
 Nov 2023 23:27:03 -0800 (PST)
MIME-Version: 1.0
References: <20231114225857.19702-1-jonathan@marek.ca>
 <20231114225857.19702-3-jonathan@marek.ca>
In-Reply-To: <20231114225857.19702-3-jonathan@marek.ca>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 15 Nov 2023 09:26:52 +0200
Message-ID: <CAA8EJpq-bdb_ue1LAXjM+TH97os4eeHyUeNy+51wh44M_J2TKQ@mail.gmail.com>
To: Jonathan Marek <jonathan@marek.ca>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 2/6] drm/msm/dsi: set video mode widebus
 enable bit when widebus is enabled
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
 open list <linux-kernel@vger.kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Wed, 15 Nov 2023 at 01:00, Jonathan Marek <jonathan@marek.ca> wrote:
>
> The value returned by msm_dsi_wide_bus_enabled() doesn't match what the
> driver is doing in video mode. Fix that by actually enabling widebus for
> video mode.
>
> Fixes: efcbd6f9cdeb ("drm/msm/dsi: Enable widebus for DSI")
> Signed-off-by: Jonathan Marek <jonathan@marek.ca>
> ---
>  drivers/gpu/drm/msm/dsi/dsi.xml.h  | 1 +
>  drivers/gpu/drm/msm/dsi/dsi_host.c | 2 ++
>  2 files changed, 3 insertions(+)
>
> diff --git a/drivers/gpu/drm/msm/dsi/dsi.xml.h b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> index 2a7d980e12c3..f0b3cdc020a1 100644
> --- a/drivers/gpu/drm/msm/dsi/dsi.xml.h
> +++ b/drivers/gpu/drm/msm/dsi/dsi.xml.h
> @@ -231,6 +231,7 @@ static inline uint32_t DSI_VID_CFG0_TRAFFIC_MODE(enum dsi_traffic_mode val)
>  #define DSI_VID_CFG0_HSA_POWER_STOP                            0x00010000
>  #define DSI_VID_CFG0_HBP_POWER_STOP                            0x00100000
>  #define DSI_VID_CFG0_HFP_POWER_STOP                            0x01000000
> +#define DSI_VID_CFG0_DATABUS_WIDEN                             0x02000000

BTW, could you please push this register to mesa?

>  #define DSI_VID_CFG0_PULSE_MODE_HSA_HE                         0x10000000
>
>  #define REG_DSI_VID_CFG1                                       0x0000001c

-- 
With best wishes
Dmitry
