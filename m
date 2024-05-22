Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4C5FD8CC792
	for <lists+freedreno@lfdr.de>; Wed, 22 May 2024 22:01:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A629210EF1D;
	Wed, 22 May 2024 20:01:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iIOnIwc9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5883A10F189
 for <freedreno@lists.freedesktop.org>; Wed, 22 May 2024 20:01:36 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-61804067da0so12829097b3.0
 for <freedreno@lists.freedesktop.org>; Wed, 22 May 2024 13:01:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716408095; x=1717012895; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=DRPkMdMiFXiHSXSHC1KGtPEPqoByQrBvux7SR1+/mUI=;
 b=iIOnIwc9AV0jO99m/jof8iLpHF4U75WyhjSjht30EPBcUNHwO3SRLaiLhtS+buW84q
 fKHrRFpGHIShKoYfntwF0oDlKKef1yZ1XpmnrYoQyKMaLzMMckTrpUrFDCO87FKuWNr2
 BjTYKN/li1OTRJ2s4OIPv+fuNuubezgHutJV2Kr7L9AA6rdYOamOZW/xXWMOBVkf2p/6
 JlxPR/xuEdVzi1SbafOxe1MwYTjFDpgTEustYwJPYYEjhsc39g0OlCkDQBkVeEq4LxLM
 smhki5CSb+5mglT2/JlS0KtjtuwuS0dEpcNvqDGzpf8sN4p3AJaUBGVHIdQma+KPozFH
 ATXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716408095; x=1717012895;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=DRPkMdMiFXiHSXSHC1KGtPEPqoByQrBvux7SR1+/mUI=;
 b=jvM5ZJKGb+Bc7pgnuXWIqLD+gWm91tRtxEnMge+IuPQK3ySlUSn8wAnMGFkWw/fw6O
 qK+FlVsqr5Ea3Qm4fxFaASLpsJcVfDDgAz9tsYsUMNNEzbCJFJKR56Z0pTUzQLdV1kbR
 U8jo92RRC7Fd2KZu7TV3sOAZYveaaUaMHsBusRqM2+ow/wiRJKDGJN07s531E1GHK236
 aHb+fFdvh++kvdLFgSkgj3rDXXtYE23MFeyTvWq9shnxRu7MSpIYE5d/J6DOLu+9lgfa
 skSme9TesAumlexkglHWmjRyCXc9Odp8+u5gnklwKdU2qro/dQdB1R6UItqRsODxkKNb
 1kPQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV5nbYEx7yZVbUWeW1NbQY2KpfnoqWdcayZo1Vxyo70OI1WKaTdCrtL+DS3FstvxQxXwvyhKmIVzI3r5fg9/V9Oyoaexx08IQlf590ixP3E
X-Gm-Message-State: AOJu0YwhFC4E57hDz+Ce3LZYaEjv0AAviKE5ZjW8iOCi9PefJX9Ptt9g
 +MH3iq1cO85hgt58DNn33jeU1p3ZJ0szSLm31pUWHqZf8u+h5uQRbzxnsJd4dzv4i8JczAzfWbL
 ykspET71Y2osQuyFI/cKFv+A4T2+wO8YbtM/SQQ==
X-Google-Smtp-Source: AGHT+IGp6pTwvIYDaSqRLy9eyI5ICKE1WVJu990cWnLKFAuKaL+Hi52m5qOuALyhACM95iFGWGyXVZCh3VhYsES77d0=
X-Received: by 2002:a25:2c9:0:b0:dcf:bc57:cd61 with SMTP id
 3f1490d57ef6-df4e0df17bfmr3143774276.50.1716408095274; Wed, 22 May 2024
 13:01:35 -0700 (PDT)
MIME-Version: 1.0
References: <20240520-dpu-handle-te-signal-v1-0-f273b42a089c@linaro.org>
 <20240520-dpu-handle-te-signal-v1-2-f273b42a089c@linaro.org>
 <a349dda7-8af5-0996-0057-9da30f39dfb1@quicinc.com>
In-Reply-To: <a349dda7-8af5-0996-0057-9da30f39dfb1@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 23:01:24 +0300
Message-ID: <CAA8EJpo7MdFqFUS0jcs3v4bSOoi6WWnbjahqn4r045CX8CTcOg@mail.gmail.com>
Subject: Re: [PATCH 2/7] drm/msm/dpu: convert vsync source defines to the enum
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>,
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org
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

On Wed, 22 May 2024 at 21:41, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 5/20/2024 5:12 AM, Dmitry Baryshkov wrote:
> > Add enum dpu_vsync_source instead of a series of defines. Use this enum
> > to pass vsync information.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  2 +-
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 26 ++++++++++++++------------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h  |  2 +-
> >   5 files changed, 18 insertions(+), 16 deletions(-)
> >

> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > index 66759623fc42..a2eff36a2224 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > @@ -54,18 +54,20 @@
> >   #define DPU_BLEND_BG_INV_MOD_ALPHA  (1 << 12)
> >   #define DPU_BLEND_BG_TRANSP_EN              (1 << 13)
> >
> > -#define DPU_VSYNC0_SOURCE_GPIO               0
> > -#define DPU_VSYNC1_SOURCE_GPIO               1
> > -#define DPU_VSYNC2_SOURCE_GPIO               2
> > -#define DPU_VSYNC_SOURCE_INTF_0              3
> > -#define DPU_VSYNC_SOURCE_INTF_1              4
> > -#define DPU_VSYNC_SOURCE_INTF_2              5
> > -#define DPU_VSYNC_SOURCE_INTF_3              6
> > -#define DPU_VSYNC_SOURCE_WD_TIMER_4  11
> > -#define DPU_VSYNC_SOURCE_WD_TIMER_3  12
> > -#define DPU_VSYNC_SOURCE_WD_TIMER_2  13
> > -#define DPU_VSYNC_SOURCE_WD_TIMER_1  14
> > -#define DPU_VSYNC_SOURCE_WD_TIMER_0  15
> > +enum dpu_vsync_source {
> > +     DPU_VSYNC_SOURCE_GPIO_0,
> > +     DPU_VSYNC_SOURCE_GPIO_1,
> > +     DPU_VSYNC_SOURCE_GPIO_2,
> > +     DPU_VSYNC_SOURCE_INTF_0 = 3,
>
> Do we need this assignment to 3?

It is redundant, but it points out that if at some point another GPIO
is added, it should go to the end (or to some other place, having the
proper value).

>
> Rest LGTM,
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>

-- 
With best wishes
Dmitry
