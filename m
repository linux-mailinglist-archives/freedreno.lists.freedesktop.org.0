Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D0F1C907B5A
	for <lists+freedreno@lfdr.de>; Thu, 13 Jun 2024 20:31:34 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7226F10EB5D;
	Thu, 13 Jun 2024 18:31:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="xsHnNlvW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f180.google.com (mail-yw1-f180.google.com
 [209.85.128.180])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F5A10EB5E
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jun 2024 18:31:32 +0000 (UTC)
Received: by mail-yw1-f180.google.com with SMTP id
 00721157ae682-62f86abc8abso14937657b3.0
 for <freedreno@lists.freedesktop.org>; Thu, 13 Jun 2024 11:31:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1718303491; x=1718908291; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=JXQvrLMUU/ZNamWgnYQjVMOCkiOypt0RodDQ76i6a1I=;
 b=xsHnNlvWZ+piJxnvAY3voryCs4AN3todrt0NhNQBSf9uepXQX/9gIkHkz1JsYJfatN
 IVI1nR87ln8WyzKZjCd0Xvgyzu3z+7fgLiAU/F8iIwElAMN+PrlgtqEbzCiWEHMEqWx5
 2/8KIn03gH41W1O2hXOCGtmRcErILIiBypb1Eyz8Nacw0qryB08UipSxeTEOs6GYHZ5i
 I4fQgoxY9CHYutkNekYyq2GNsM0nZwJPC4p3B0TMLes7FHf+ZJR4jRX99MVTWKrfdWGz
 ct/2Hks4uMLOGJe+GNlT8bXXPwaEqFLjzL0cX0k9PiTB4gpQW3/fCnIvWtja5Wy0NmWA
 mVmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1718303491; x=1718908291;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JXQvrLMUU/ZNamWgnYQjVMOCkiOypt0RodDQ76i6a1I=;
 b=eT1EQYWwQQjj/BXfh3CA5RwTE7mnUYtss5oe26Do4HSx0kd7krDU1sDGRIqGscaoyl
 Q9S0WWQTLmwuMXeA6qPmpiygV1UIyVWGrBIYbxevyUje8QIBfObCwXxVrok42XiVhZT+
 xqBpvJoApDNI5B8eF3ctDbUEdUSfT6ikWM1XVeishNnbtaMX3UF5ziJDWy0roEYDUh6I
 F64OjXfXHMArbZYWl2DaDujjYs0EwTT+Ti7YStEemic+lrGBwuXijVXeXx0OA3TD8idG
 efuNwLZLMxyJr4dk8sjdfrNAPsB5XIZpDr90fvpBJtpiRa6UwkS1PPQIaYE6rgFf7KgE
 C+tw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXFJWDuweUWE+T2N219iIUDQ4zvStYJq59rDb5bvxkPe8STkp/2Qv4Yms3cAK+JHhwejqoLF/+1iegbwPjRsTkI4Zecxn0to2TygDPGYQg7
X-Gm-Message-State: AOJu0YxTXT2dbAFQo0B0drSP2RJLJfgX+UGlTe88q2tmn46VFoRkYs+H
 Hi+TaUZclc4Gofwz6dZ2HBnI0f1i341wMsd6mDWNqa3qI4HkkWnXwqEbalu245xkQ3NOt1+sqQ8
 ryPmVo79AG5mF0ubQFSVzbNwpgiBcg/1Gg9A9Gg==
X-Google-Smtp-Source: AGHT+IGb8ds/chiqYcRHUQd63D995+EL6FV0xR8Fey/wJufK/UDYuEQFsfDNaMSulhpxOJVOwD9VdNJPzFLEFqHCWh8=
X-Received: by 2002:a0d:f983:0:b0:620:4018:7c67 with SMTP id
 00721157ae682-6322305171emr2754787b3.27.1718303491189; Thu, 13 Jun 2024
 11:31:31 -0700 (PDT)
MIME-Version: 1.0
References: <20240613-dpu-handle-te-signal-v2-0-67a0116b5366@linaro.org>
 <20240613-dpu-handle-te-signal-v2-2-67a0116b5366@linaro.org>
 <l3esy4ciy4envu35edg35sip5od6ltxpazpddo2w6vwmqomjky@azgqxi4la3hy>
In-Reply-To: <l3esy4ciy4envu35edg35sip5od6ltxpazpddo2w6vwmqomjky@azgqxi4la3hy>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 13 Jun 2024 21:31:20 +0300
Message-ID: <CAA8EJpqpBkJZmyhQA6b3Fg1cmY35yptt385weQQvDsq9rGazrA@mail.gmail.com>
Subject: Re: [PATCH v2 2/8] drm/msm/dpu: convert vsync source defines to the
 enum
To: Marijn Suijten <marijn.suijten@somainline.org>
Cc: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>, 
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

On Thu, 13 Jun 2024 at 21:17, Marijn Suijten
<marijn.suijten@somainline.org> wrote:
>
> On 2024-06-13 20:05:05, Dmitry Baryshkov wrote:
> > Add enum dpu_vsync_source instead of a series of defines. Use this enum
> > to pass vsync information.
> >
> > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  2 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c |  2 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  2 +-
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h | 26 ++++++++++++++------------
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h  |  2 +-
> >  5 files changed, 18 insertions(+), 16 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > index 119f3ea50a7c..4988a1029431 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
> > @@ -747,7 +747,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
> >               if (disp_info->is_te_using_watchdog_timer)
> >                       vsync_cfg.vsync_source = DPU_VSYNC_SOURCE_WD_TIMER_0;
> >               else
> > -                     vsync_cfg.vsync_source = DPU_VSYNC0_SOURCE_GPIO;
> > +                     vsync_cfg.vsync_source = DPU_VSYNC_SOURCE_GPIO_0;
> >
> >               hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > index 225c1c7768ff..96f6160cf607 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
> > @@ -462,7 +462,7 @@ static int dpu_hw_intf_get_vsync_info(struct dpu_hw_intf *intf,
> >  }
> >
> >  static void dpu_hw_intf_vsync_sel(struct dpu_hw_intf *intf,
> > -             u32 vsync_source)
> > +                               enum dpu_vsync_source vsync_source)
> >  {
> >       struct dpu_hw_blk_reg_map *c;
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> > index f9015c67a574..ac244f0b33fb 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
> > @@ -107,7 +107,7 @@ struct dpu_hw_intf_ops {
> >
> >       int (*connect_external_te)(struct dpu_hw_intf *intf, bool enable_external_te);
> >
> > -     void (*vsync_sel)(struct dpu_hw_intf *intf, u32 vsync_source);
> > +     void (*vsync_sel)(struct dpu_hw_intf *intf, enum dpu_vsync_source vsync_source);
> >
> >       /**
> >        * Disable autorefresh if enabled
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > index 66759623fc42..a2eff36a2224 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h
> > @@ -54,18 +54,20 @@
> >  #define DPU_BLEND_BG_INV_MOD_ALPHA   (1 << 12)
> >  #define DPU_BLEND_BG_TRANSP_EN               (1 << 13)
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
>
> While at it, rename this to _P / _S / _E to match the other patches/code?

I thought about it, but Abhinav pointed out that DPU docs use this
kind of naming.

>
> - Marijn
>
> > +     DPU_VSYNC_SOURCE_INTF_0 = 3,
> > +     DPU_VSYNC_SOURCE_INTF_1,
> > +     DPU_VSYNC_SOURCE_INTF_2,
> > +     DPU_VSYNC_SOURCE_INTF_3,
> > +     DPU_VSYNC_SOURCE_WD_TIMER_4 = 11,
> > +     DPU_VSYNC_SOURCE_WD_TIMER_3,
> > +     DPU_VSYNC_SOURCE_WD_TIMER_2,
> > +     DPU_VSYNC_SOURCE_WD_TIMER_1,
> > +     DPU_VSYNC_SOURCE_WD_TIMER_0,
> > +};
> >
> >  enum dpu_hw_blk_type {
> >       DPU_HW_BLK_TOP = 0,
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> > index 6f3dc98087df..5c9a7ede991e 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.h
> > @@ -64,7 +64,7 @@ struct dpu_vsync_source_cfg {
> >       u32 pp_count;
> >       u32 frame_rate;
> >       u32 ppnumber[PINGPONG_MAX];
> > -     u32 vsync_source;
> > +     enum dpu_vsync_source vsync_source;
> >  };
> >
> >  /**
> >
> > --
> > 2.39.2
> >



-- 
With best wishes
Dmitry
