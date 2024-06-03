Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 67C858D8B62
	for <lists+freedreno@lfdr.de>; Mon,  3 Jun 2024 23:17:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72A7310E062;
	Mon,  3 Jun 2024 21:17:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="gMDhLULY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-f179.google.com (mail-yb1-f179.google.com
 [209.85.219.179])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 07CD710E3E1
 for <freedreno@lists.freedesktop.org>; Mon,  3 Jun 2024 21:17:01 +0000 (UTC)
Received: by mail-yb1-f179.google.com with SMTP id
 3f1490d57ef6-df481bf6680so4716322276.3
 for <freedreno@lists.freedesktop.org>; Mon, 03 Jun 2024 14:17:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1717449421; x=1718054221; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lpiBi+mPysSFN55XB2hY9eYMbPugbtviT0QRoPm7Lho=;
 b=gMDhLULY5BRbsbfF3GF9ASCIOtU0beSVJJgq8uWD3YVUTMhRZos/VXgcgbzxDqRbm8
 MiAtlOyN4Kw3kha0qakjeFcwfkxl0hTyQgJJOtuBeAkj8+gCzYMQUqZUbVtKJnNPIY0C
 ZEfN4uDhrrfpa4kWuTYVAJGrR2h6tRyJFc5GW7DA0rQhlT5jNIimhR4cxqGAMP81O9BB
 vhI4qH9CrmRGIeinmsrVHpcxKM9D1oa9Y2Fnmvd377tfRPguJ6/UstCS/qwVYtZk9/JA
 5zgPxlh+zutESZ3Ct1RUc61ZMSbNpBIfujAweQMt0IHx6HlEBnWkxO3MPC533B94s2MJ
 fd8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1717449421; x=1718054221;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lpiBi+mPysSFN55XB2hY9eYMbPugbtviT0QRoPm7Lho=;
 b=PFPxl5i5fo+2VMQXZfCvbGIpPxo+Mew4ijefpdeZkw0s9RkUqc48o2iy48mDsbwIK+
 RRHEzMYhr8u3FRIZ0oZsSn8Wi/OJXT2Vyf0dPi1tGpLZ2D0vG54HQuGxkVLjg0N2qvPg
 +VEiMlITEDtHsXfT9DksqTVR8vcmiDGwR3aoYpUsnhJH4CNJaXxQ4UVJ19cN8fKa+F2t
 eA6HL1vslU+aQO+CMjIXH/nfMp5D4CGv64biaV48XOtt3px/54S21dkCDGJXneCIVnek
 3p8PdMyC5vHfALFG2rDqelXwFitlW2Mv+sszz8fMbH+QGddYu+LsdFOtEHOQxG2gME1V
 86Jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaPrPuo/I5XiA0UGorSqVPAPnOVe8WdDb/7pG5XTs+/+QxLxmXfZvpxSdOslCnP5lIWgJpLJrnuo2FFJl0mibL1HYdSpRE6oiDl9G71goQ
X-Gm-Message-State: AOJu0Yw63mkte6YnuvIgSuw90aQrRp6mt725yEFosD5P3eS5BY3a1z9F
 PvFAPV39/3d1gB/qSobzM3MF5ZVaDRAj1VT6wVSI/l++3nLZKH9ad32LBorSltwmmGvbFMlQ2FF
 whHxZPPwLFKp3PtXKzjGpTgU6inn3OaqoJszuCw==
X-Google-Smtp-Source: AGHT+IHXBjCG+hUE2uaiUa+TcyWv3gn4Tkioc8ie/Opt614FYx8Vk2I7G56tZfNuyxfaaO9hBJ98lE/p0E1CJ6Hfad4=
X-Received: by 2002:a25:a1e1:0:b0:dcf:411f:e78 with SMTP id
 3f1490d57ef6-dfa73c21968mr9024488276.25.1717449420670; Mon, 03 Jun 2024
 14:17:00 -0700 (PDT)
MIME-Version: 1.0
References: <20240603-dpu-mode-config-width-v2-0-16af520575a6@linaro.org>
 <20240603-dpu-mode-config-width-v2-7-16af520575a6@linaro.org>
 <64c6e6a5-7ab2-cdf7-131a-7a1f79c48e0c@quicinc.com>
In-Reply-To: <64c6e6a5-7ab2-cdf7-131a-7a1f79c48e0c@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Jun 2024 00:16:49 +0300
Message-ID: <CAA8EJpp8WbXYTvtL0Xwxrn_eXsPfGTGz9bigtwHFjXunnM_cHg@mail.gmail.com>
Subject: Re: [PATCH v2 7/9] drm/msm/dpu: check for overflow in
 _dpu_crtc_setup_lm_bounds()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Abel Vesa <abel.vesa@linaro.org>, 
 Johan Hovold <johan+linaro@kernel.org>, linux-arm-msm@vger.kernel.org, 
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

On Mon, 3 Jun 2024 at 23:57, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 6/2/2024 2:39 PM, Dmitry Baryshkov wrote:
> > Check in _dpu_crtc_setup_lm_bounds() that CRTC width is not overflowing
> > LM requirements.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 15 ++++++++++++---
> >   1 file changed, 12 insertions(+), 3 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > index e3b1e5f55a92..c5e874a3656a 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > @@ -711,12 +711,13 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc)
> >       _dpu_crtc_complete_flip(crtc);
> >   }
> >
> > -static void _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
> > +static int _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
> >               struct drm_crtc_state *state)
>
> Perhaps now we need to rename this to _dpu_crtc_setup_and_check_lm_bounds()?

Ack, I'll rename it.

>
> Also, prior to this change, we never had a bounds check for each LM
> which we should have had . Does this qualify for a Fixes tag?

Probably no. We currently have a limit in the drm_mode_config, which
ensures that the CRTC isn't too wide.

>
> With those two questions addressed,
>
> Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>
> >   {
> >       struct dpu_crtc_state *cstate = to_dpu_crtc_state(state);
> >       struct drm_display_mode *adj_mode = &state->adjusted_mode;
> >       u32 crtc_split_width = adj_mode->hdisplay / cstate->num_mixers;
> > +     struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
> >       int i;
> >
> >       for (i = 0; i < cstate->num_mixers; i++) {
> > @@ -727,7 +728,12 @@ static void _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
> >               r->y2 = adj_mode->vdisplay;
> >
> >               trace_dpu_crtc_setup_lm_bounds(DRMID(crtc), i, r);
> > +
> > +             if (drm_rect_width(r) > dpu_kms->catalog->caps->max_mixer_width)
> > +                     return -E2BIG;
> >       }
>
> > +
> > +     return 0;
> >   }
> >
> >   static void _dpu_crtc_get_pcc_coeff(struct drm_crtc_state *state,
> > @@ -1195,8 +1201,11 @@ static int dpu_crtc_atomic_check(struct drm_crtc *crtc,
> >       if (crtc_state->active_changed)
> >               crtc_state->mode_changed = true;
> >
> > -     if (cstate->num_mixers)
> > -             _dpu_crtc_setup_lm_bounds(crtc, crtc_state);
> > +     if (cstate->num_mixers) {
> > +             rc = _dpu_crtc_setup_lm_bounds(crtc, crtc_state);
> > +             if (rc)
> > +                     return rc;
> > +     }
> >
> >       /* FIXME: move this to dpu_plane_atomic_check? */
> >       drm_atomic_crtc_state_for_each_plane_state(plane, pstate, crtc_state) {
> >



-- 
With best wishes
Dmitry
