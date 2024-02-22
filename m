Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8D90860545
	for <lists+freedreno@lfdr.de>; Thu, 22 Feb 2024 22:57:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED7B810EA9F;
	Thu, 22 Feb 2024 21:57:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="R/czuWDR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com
 [209.85.219.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C462410EA9F
 for <freedreno@lists.freedesktop.org>; Thu, 22 Feb 2024 21:57:50 +0000 (UTC)
Received: by mail-yb1-f174.google.com with SMTP id
 3f1490d57ef6-dc6cbe1ac75so250472276.1
 for <freedreno@lists.freedesktop.org>; Thu, 22 Feb 2024 13:57:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708639069; x=1709243869; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=4XHmaR9j8yfoG0uE39iuFTe1DexLU+BkdLhrhgZ69f8=;
 b=R/czuWDRdBPX5fXqrEbM6mGGu1FCK3ccHLYgLdRSIHol9vySHQG5L61jP5aPC2CxUL
 Lo3AbcgfR1vrMTRc90Ysj2G+92/NAUquL9Yc9m8FCEUuIBY9y+8awd8ieCz05BMoxrTN
 kvQbmexCleTBMZDtPStbBL9t1N9HqhkLkSq3WpQzcgF6SleQ2AwsNcZ3y36DJHO+U/4r
 qeKJBtzV4H9JRHmwi4VQoWW7AZAr4hKxAowI2EVl/lu3qTVCqinzNG6j+4LzhFbwNuEs
 pG1JtJ/uBUf8Tqyqx+hOR3zV9Ygj4zD/mQQTnRwyrZcMy/yYjaOkeoSkIEXLkhSxwHW3
 QHww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708639069; x=1709243869;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=4XHmaR9j8yfoG0uE39iuFTe1DexLU+BkdLhrhgZ69f8=;
 b=Cuk8gXbz1Og/9idNzAP2mQQ2S3hs8nzVJ98G+k1L3qpjpSm6gr/m2y/BlmgcVzZyEe
 eh9JGSBjWmbjWJ6jeLT+QzVprP8c0tMAwUJU6URF0vDHz9XXyAxjgzyflvL54ZsVIreM
 BYb8fp67v/+Ehx9Ftya0yaB1kEjzj1OvJCVRrc1Djqau9fC+Bby225bne7BUOwmj5JlP
 5n0XHIoxQ2hMNY7p8vuDy7IPkhx+bAClFCYK26dN9thqOQ/fqGRJGuv8XV3rP+Ox3xMM
 ty0vI3Dm9mZs0WcTvJK1Gbu/DOFJCMajMP4CHbZCPY4ujuWUxCvEFC4DZ8zN7z4X4Ukg
 tfXg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVGmDTo+tydCaS7Oo6Axdv0u1P6TIfBcp9VKLE61QMeEU9wX3NkJ3D1N78hpofIK6CX7pLNxEaDioqC7kJMUvxSDgUKFqnTpsVo5vzmj8Uy
X-Gm-Message-State: AOJu0YzslBfG/Wo/oOVJ2f1SqFIe5wT8VT0vHjL3pikTeM7rxQnN6DR6
 8Tz71wqXIkybO+OfDC/8UOAp5OWBk4zEJy/i02NS48gT8cUgqCu8XybzJTHrsXQZ4z3CytGkAKp
 7oRwIvLIGny8o2foEvHbW/xlATyXjkVWbaxfAvQ==
X-Google-Smtp-Source: AGHT+IEooe9B8N6cL2q2BcKTYJut84BKs61FZ74FRMTKD+cxJmhoC80CFQcsBQiqtKzpqIhdxxvGsZVHWhiuA15XmGA=
X-Received: by 2002:a25:a243:0:b0:dcf:2908:485c with SMTP id
 b61-20020a25a243000000b00dcf2908485cmr2027103ybi.3.1708639069649; Thu, 22 Feb
 2024 13:57:49 -0800 (PST)
MIME-Version: 1.0
References: <20240222-fd-rm-state-v5-1-4a6c81e87f63@linaro.org>
 <318495d1-3366-1ca8-72a2-8927cb1b4835@quicinc.com>
In-Reply-To: <318495d1-3366-1ca8-72a2-8927cb1b4835@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 22 Feb 2024 23:57:38 +0200
Message-ID: <CAA8EJppf+Vt4tGP9YFMmhh4wdm+U=_Fq5D8J1YpZjzEBS=Td3Q@mail.gmail.com>
Subject: Re: [PATCH v5] drm/msm/dpu: add current resource allocation to dumped
 state
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
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

On Thu, 22 Feb 2024 at 23:53, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 2/22/2024 1:47 PM, Dmitry Baryshkov wrote:
> > Provide atomic_print_state callback to the DPU's private object. This
> > way the debugfs/dri/0/state will also include RM's internal state.
> >
> > Example output (RB5 board, HDMI and writeback encoder enabled)
> >
> > resource mapping:
> >       pingpong=31 36 # # # # - - - - -
> >       mixer=31 36 # # # # -
> >       ctl=# # 31 36 # #
> >       dspp=# # # #
> >       dsc=# # # # - -
> >       cdm=#
> >
>
> Thanks, this LGTM now, one nit below.
>
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Changes in v5:
> > - Extracted the common helper for printing RM state
> > - Changed the code to print '#' for unused/unmapped blocks (Abhinav)
> > - Link to v4: https://lore.kernel.org/r/20240219-fd-rm-state-v4-1-b47f14ef27c2@linaro.org
> >
> > Changes in v4:
> > - Split the patch from the virual wide planes series
> > - Reworked the output format
> > - Added the CDM block into the dump
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 12 +++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h |  2 ++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c  | 56 +++++++++++++++++++++++++++++++++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h  |  8 +++++
> >   4 files changed, 78 insertions(+)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > index 723cc1d82143..9f3697e1eacb 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
> > @@ -353,9 +353,18 @@ static void dpu_kms_global_destroy_state(struct drm_private_obj *obj,
> >       kfree(dpu_state);
> >   }
> >
> > +static void dpu_kms_global_print_state(struct drm_printer *p,
> > +                                    const struct drm_private_state *state)
> > +{
> > +     const struct dpu_global_state *global_state = to_dpu_global_state(state);
> > +
> > +     dpu_rm_print_state(p, global_state);
> > +}
> > +
> >   static const struct drm_private_state_funcs dpu_kms_global_state_funcs = {
> >       .atomic_duplicate_state = dpu_kms_global_duplicate_state,
> >       .atomic_destroy_state = dpu_kms_global_destroy_state,
> > +     .atomic_print_state = dpu_kms_global_print_state,
> >   };
> >
> >   static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
> > @@ -371,6 +380,9 @@ static int dpu_kms_global_obj_init(struct dpu_kms *dpu_kms)
> >       drm_atomic_private_obj_init(dpu_kms->dev, &dpu_kms->global_state,
> >                                   &state->base,
> >                                   &dpu_kms_global_state_funcs);
> > +
> > +     state->rm = &dpu_kms->rm;
> > +
> >       return 0;
> >   }
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > index d1207f4ec3ae..2512c9bd08df 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h
> > @@ -131,6 +131,8 @@ struct vsync_info {
> >   struct dpu_global_state {
> >       struct drm_private_state base;
> >
> > +     struct dpu_rm *rm;
> > +
> >       uint32_t pingpong_to_enc_id[PINGPONG_MAX - PINGPONG_0];
> >       uint32_t mixer_to_enc_id[LM_MAX - LM_0];
> >       uint32_t ctl_to_enc_id[CTL_MAX - CTL_0];
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > index 724537ab776d..1a56ddca536d 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
> > @@ -634,3 +634,59 @@ int dpu_rm_get_assigned_resources(struct dpu_rm *rm,
> >
> >       return num_blks;
> >   }
> > +
> > +static void dpu_rm_print_state_helper(struct drm_printer *p,
> > +                                         struct dpu_hw_blk *blk,
> > +                                         uint32_t mapping)
>
> Not sure if its the mail client, but is this aligned with the opening brace?

No, it is shifted to the right. Will fix while applying.

>
> Please double check once. Rest LGTM.
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>



-- 
With best wishes
Dmitry
