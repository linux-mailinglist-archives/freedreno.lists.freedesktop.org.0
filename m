Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E015A4CF65
	for <lists+freedreno@lfdr.de>; Tue,  4 Mar 2025 00:43:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1A7B610E2EB;
	Mon,  3 Mar 2025 23:43:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="IeM+S0Mn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f48.google.com (mail-lf1-f48.google.com
 [209.85.167.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C1C2110E3FF
 for <freedreno@lists.freedesktop.org>; Mon,  3 Mar 2025 23:43:14 +0000 (UTC)
Received: by mail-lf1-f48.google.com with SMTP id
 2adb3069b0e04-54973b49353so740492e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 03 Mar 2025 15:43:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741045393; x=1741650193; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=Yfy39VluGQcEyItLjFB3XiPgmFo3CCnquxjFCjbOFIA=;
 b=IeM+S0MndYEuwsEHPQ6ANjmyr/+kTUV1fo5c+fU6wvcKC48GLBaB2evHgPpJWAbEh9
 syX7pf+ij4jucfmcg2mkCPnHS9I7ZiQGzAEl+I7qSNcWcf9WevLjrLqE7HJdWgnRIwmX
 l8psA/P5I6Qt1kqAaIwiMotlnRCU/Zt953GtwRpzFdzJ3I+Wa38BvVqLDF5UCHkqlgUh
 zTDC7sNuna5BV2h6pNXbja/sF5FmaOgp77t83aVh04U1dakuAx13F/Iemp1BU0N7TyiS
 /j656iE88xEEaMDw2Gqsj5ngft7QOWpp8WKyzqT6qnwH3AnF/JzZPPHTzq+ilPT3wWil
 1ivg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741045393; x=1741650193;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Yfy39VluGQcEyItLjFB3XiPgmFo3CCnquxjFCjbOFIA=;
 b=iOYHIWffuh/VY8q6rlnZL5nlmiPdyQu1IsvDLHX5PVv5xQHvz1Tnzlx6c8OWcHbrlf
 G+0SDvMb1mPKd5HvrvrFh2+y7OfXwkdaEU3Z6/9DvCW9G4u46Xf5vrtOCmoTT4QeduAx
 pR0JmmkYExpUAO5XNZPZyKabt4ICsD9R5M7eeFH2l7Q0+EeRE2RM12KAGpffQ+7yQEva
 FoZQOcn/y+vDlxnYgbZfSgt56PLv0n1K8UONQgdlvPUA+4nwO6fKCbrN0O5uBK4oj6K2
 b6Rh2x6bTvRvy5+gT0dOAlBhxDImd3n1CcQ8JzSN9Mp+HHu1JCJ9aPNIp03I0cHn4yJL
 PHbA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVjlmBrSKYo0RJmv/C7qeOWESCfCFvnzqmIeARuhX+46XRuIL2nHC/IPynPu7EBSsXSZGOLHOC+eYU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyf07Ppt6SfcCP1EL2E0ueIA+MoFhXn5sWXgFm1pVaDElKRmpFC
 gGBmA1X2nTf/Wn4+NgCS8Fi87WlPBz44Z2ZNY4Z3E+NlPi8hFKOrcOJMGSxQyTA=
X-Gm-Gg: ASbGncu59YWjheQi9f3nPpHoQuxlqm3J40ArttsIPXTLh4zrM0jOG5IijWwcXP3QfDD
 PERS+sTTzs/upn30OYh3vrggxu3IwYRW132opkklgJalstYmi7EfFOEeQuKlVFw513PVFKL7MjI
 TWgwDQG/KRGE+qA2BaacuySI1K4oKZCXALBYNiFPBeW+R7Y6wDApCT5FgtrP/dRBo6TropV5Z3p
 u7eh1dTv8h4/AvXeTNzI3mcjfja3uRUJtDL7ZWR6Jh6hpde1NTwKqIMFWVUhxAEaOJKVi/fqxjN
 P9lPHam35SksCSRAEOw9v5bf1C+mc8ocSODqsDogQCjvLa0inoPahnsMGSpO5/q6aQIb8x/0ZD3
 L5my/zneBfQeN+sFpFBbEyB4/
X-Google-Smtp-Source: AGHT+IHS43FrPoYrbI5lM/r4eVcPkidPny7B+4+NzFlSF1VJA+JMi5IVAexs7xXUBzw/FSOsOiL98Q==
X-Received: by 2002:a05:6512:1085:b0:545:1d96:d702 with SMTP id
 2adb3069b0e04-5494c38c05dmr6560457e87.48.1741045393007; 
 Mon, 03 Mar 2025 15:43:13 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5495f4c36d1sm667879e87.52.2025.03.03.15.43.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 15:43:12 -0800 (PST)
Date: Tue, 4 Mar 2025 01:43:09 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, quic_abhinavk@quicinc.com, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Simona Vetter <simona@ffwll.ch>, Simona Vetter <simona.vetter@ffwll.ch>, 
 quic_ebharadw@quicinc.com, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, 
 Ville =?utf-8?B?U3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Subject: Re: [PATCH v6 03/14] drm/msm/dpu: switch RM to use crtc_id rather
 than enc_id for allocation
Message-ID: <da6e2hygdv6ewdr5hqeks2ocsxwvfvozby4b53unk5ckyqvu7t@wh3y4jnucapl>
References: <20250214-concurrent-wb-v6-0-a44c293cf422@quicinc.com>
 <20250214-concurrent-wb-v6-3-a44c293cf422@quicinc.com>
 <se4b4kzp3vej4b6albecdc2t65ueiuba4kidutwvrv2rcfyjwr@e62fn225jwcr>
 <8c727bd6-94f1-4ee3-9bf3-793899038895@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c727bd6-94f1-4ee3-9bf3-793899038895@quicinc.com>
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

On Mon, Mar 03, 2025 at 10:45:19AM -0800, Jessica Zhang wrote:
> 
> 
> On 2/27/2025 7:07 AM, Dmitry Baryshkov wrote:
> > On Fri, Feb 14, 2025 at 04:14:26PM -0800, Jessica Zhang wrote:
> > > From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > 
> > > Up to now the driver has been using encoder to allocate hardware
> > > resources. Switch it to use CRTC id in preparation for the next step.
> > > 
> > > Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
> > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > ---
> > > Changes in v6:
> > > - Drop duplicate cstate initialization code and unnecessary memset
> > > Changes in v5:
> > > - Reordered to prevent breaking CI and upon partial application
> > > 
> > > Changes in v4 (due to rebase):
> > > - moved *_get_assigned_resources() changes for DSPP and LM from
> > >    encoder *_virt_atomic_mode_set() to *_assign_crtc_resources()
> > > ---
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  18 +--
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  10 +-
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h     |  12 +-
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c      | 189 ++++++++++++++--------------
> > >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h      |   7 +-
> > >   5 files changed, 110 insertions(+), 126 deletions(-)
> > 
> > This commit breaks several tests in CI:
> > - sc7180-trogdor-kingoftown:
> >    - kms_cursor_crc@cursor-dpms
> >    - kms_pipe_crc_basic@disable-crc-after-crtc
> > - sc7180-trogdor-lazor-limozeen
> >    - kms_cursor_crc@cursor-dpms
> >    - kms_pipe_crc_basic@disable-crc-after-crtc
> 
> Hey Dmitry,
> 
> Thanks for catching this. Looks like this was exposed due to a recent IGT
> uprev that included  dc2d7fb4f978 ("lib/igt_kms: move setting
> DRM_CLIENT_CAP_WRITEBACK_CONNECTORS to kms_writeback").
> 
> The issue itself is that when DPMS is toggled, it is possible for RM to
> reserve new HW resources but skip the atomic_enable() due to the checks here
> [1]. This means that the change in HW block reservation won't be propagated
> to encoder if DPMS is set to off.

Could you possibly clarify this. What is the state change that causes
the issue (describe CRTC / connectors / encoders and active / enabled
state). Why does the issue manifest only after switching to the CRTC id
for resource allocation (the tests run successfully before this patch,
i.e. with the resource allocation being moved to CRTC, but using the
encoder ID for allocation).

Note, the CRTC won't re-allocate resources if
drm_atomic_crtc_needs_modeset() is not true. So I'm not sure how can we
end up in a situation when the resources are reallocated _and_ we need
to raise the mode_changed flag.

> I've posted a fix for this here [2].
> 
> Thanks,
> 
> Jessica Zhang
> 
> [1] https://elixir.bootlin.com/linux/v6.14-rc4/source/drivers/gpu/drm/drm_atomic_helper.c#L1502
> [2] https://patchwork.freedesktop.org/series/145735/
> 
> > 
> > Corresponding pipeline is available at [1]
> > 
> > As I had to rebase your changes on top of msm-next, corresponding tree
> > is available at [2]. It might be possible that the regression is
> > introduced by my rebase.
> > 
> > [1] https://gitlab.freedesktop.org/drm/msm/-/pipelines/1374165
> > 
> > [2] https://gitlab.freedesktop.org/lumag/msm/-/commits/msm-next-lumag-cwb
> > 
> > -- 
> > With best wishes
> > Dmitry
> 

-- 
With best wishes
Dmitry
