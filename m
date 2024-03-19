Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0270E88062D
	for <lists+freedreno@lfdr.de>; Tue, 19 Mar 2024 21:44:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 979D510E779;
	Tue, 19 Mar 2024 20:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wE5q9IA2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com
 [209.85.128.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88AF710E779
 for <freedreno@lists.freedesktop.org>; Tue, 19 Mar 2024 20:43:57 +0000 (UTC)
Received: by mail-yw1-f174.google.com with SMTP id
 00721157ae682-60a434ea806so65444367b3.3
 for <freedreno@lists.freedesktop.org>; Tue, 19 Mar 2024 13:43:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710881036; x=1711485836; darn=lists.freedesktop.org;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=OeXdd6BoIpGck+XAlpFKofkTnIc6zBqulWBdd+v07Ic=;
 b=wE5q9IA2LauU7FVY8OCm7l9kGKSpxcyxCjsNTsFveUeMlMJxEa2QJZhc3vo6x1RrDz
 Tj9mSYZrqIw/S7NDqSdzrLFHXCbLFqa4tGkvxORXKzuRWEoF4IsQG10wfR8b68nDCftx
 +lp8EUSIe2b26fOwgtpBU7T2ZY4uFdUZ43QwzhDtzCVPnVwj4bxkC15mfTR8hKU/RSFa
 u2Zv222mgQLFwIF0Tw90x9zaFA+DimnlQ4cWN1T0AybL6HtCRm43USWlfzsXAcgqldEn
 mjarZIwh9J0TFE/x1WXIfyrRD3t/j/uu3JhzpSbb5tW47E8x+PcX93HJBiXRT5I3nj7G
 FPuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710881036; x=1711485836;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=OeXdd6BoIpGck+XAlpFKofkTnIc6zBqulWBdd+v07Ic=;
 b=CInxXfm3rNygygPrr9wBm/bTrA8lObg9M0XvlPCQH55o67t0MQtUchA3xwgTkyxOqQ
 /smp99Wkg6wXEaE5VyOR2/TpgMW+URxzHjFfqyuHqnn64SfRpMgRSt1KlcJvChxZhjlj
 0409F39Uv/UrbDi14Lfw2PSEMVvlwLDeijtlR8WGGHTcVaXFSEfa3NhU8feAim0SVmAE
 DNFwXhHcvSQNEfA+V7PMQOtkNQTl0BWUW8olYJxtSj1XzyTTbflGuCE8OTwyFoiNORxe
 iqfCpJ+GvRAwJNrEklbx0enCsFdDrgGNM8jDcLqvbnCcp52uEFai7SLDCGxlMcbJPHcU
 +2TA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVi+/jjFMTZyBM7R8vpDmNpgllnnArQ3xYEPRSp8p+NkjNJ/Hy3Ik5abQDtndFm9YJUt+fScr4YG4y5MufyjOyP4qB119T8XOxnxiFxmGQb
X-Gm-Message-State: AOJu0YytXPeU8wqNygOuOTb4gDrQbG7AxV3icFSMGpfHNgSpT8dpq5d5
 qqVqrBiwffF+HtLWXZCoGtJRSHl6vIN1FBuAOpua4J3mQsAcSfnE8/GhY+hOZzCC9fErLKV25ZS
 BbO4cn0kr0sj4EJ8xck0wJ68JKLUqQi0gLlhq6g==
X-Google-Smtp-Source: AGHT+IEGB9smWzSs4kyVjf1ngJ0sHXwF85dqOAOilm7NUBGQFDjvo6qUc1UKfbV7DzP5s2uNDsumhOKr73aIWIBS4y8=
X-Received: by 2002:a5b:c08:0:b0:dcb:e82c:f7f with SMTP id
 f8-20020a5b0c08000000b00dcbe82c0f7fmr13872142ybq.12.1710881036276; 
 Tue, 19 Mar 2024 13:43:56 -0700 (PDT)
MIME-Version: 1.0
References: <20240314-dpu-perf-rework-v3-0-79fa4e065574@linaro.org>
 <20240314-dpu-perf-rework-v3-3-79fa4e065574@linaro.org>
 <ebf0ca9b-6e9d-4387-8628-a6ccaca11215@quicinc.com>
In-Reply-To: <ebf0ca9b-6e9d-4387-8628-a6ccaca11215@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 19 Mar 2024 22:43:44 +0200
Message-ID: <CAA8EJprhgPheFq-xhAh54NkTTh5_BJk=bL1f94=hvsio6VUSQQ@mail.gmail.com>
Subject: Re: [PATCH v3 3/5] drm/msm/dpu: handle perf mode in
 _dpu_core_perf_crtc_update_bus()
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, 
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

On Tue, 19 Mar 2024 at 22:34, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 3/13/2024 6:10 PM, Dmitry Baryshkov wrote:
> > Move perf mode handling for the bandwidth to
> > _dpu_core_perf_crtc_update_bus() rather than overriding per-CRTC data
> > and then aggregating known values.
> >
> > Note, this changes the fix_core_ab_vote. Previously it would be
> > multiplied per the CRTC number, now it will be used directly for
> > interconnect voting.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 39 +++++++++++++--------------
> >   1 file changed, 19 insertions(+), 20 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > index 87b892069526..ff2942a6a678 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > @@ -118,21 +118,9 @@ static void _dpu_core_perf_calc_crtc(const struct dpu_core_perf *core_perf,
> >               return;
> >       }
> >
> > -     memset(perf, 0, sizeof(struct dpu_core_perf_params));
> > -
> > -     if (core_perf->perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> > -             perf->bw_ctl = 0;
> > -             perf->max_per_pipe_ib = 0;
> > -             perf->core_clk_rate = 0;
> > -     } else if (core_perf->perf_tune.mode == DPU_PERF_MODE_FIXED) {
> > -             perf->bw_ctl = core_perf->fix_core_ab_vote;
> > -             perf->max_per_pipe_ib = core_perf->fix_core_ib_vote;
> > -             perf->core_clk_rate = core_perf->fix_core_clk_rate;
> > -     } else {
> > -             perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> > -             perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
> > -             perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
> > -     }
> > +     perf->bw_ctl = _dpu_core_perf_calc_bw(perf_cfg, crtc);
> > +     perf->max_per_pipe_ib = perf_cfg->min_dram_ib;
> > +     perf->core_clk_rate = _dpu_core_perf_calc_clk(perf_cfg, crtc, state);
> >
> >       DRM_DEBUG_ATOMIC(
> >               "crtc=%d clk_rate=%llu core_ib=%llu core_ab=%llu\n",
> > @@ -233,18 +221,29 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
> >   {
> >       struct dpu_core_perf_params perf = { 0 };
> >       int i, ret = 0;
> > -     u64 avg_bw;
> > +     u32 avg_bw;
> > +     u32 peak_bw;
> >
> >       if (!kms->num_paths)
> >               return 0;
> >
> > -     dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
> > +     if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> > +             avg_bw = 0;
> > +             peak_bw = 0;
> > +     } else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
> > +             avg_bw = kms->perf.fix_core_ab_vote;
> > +             peak_bw = kms->perf.fix_core_ib_vote;
> > +     } else {
> > +             dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
>
> Where is this function dpu_core_perf_aggregate() defined? I dont see it
> in msm-next

In the previous patch.

>
> > +
> > +             avg_bw = div_u64(perf.bw_ctl, 1000); /*Bps_to_icc*/
> > +             peak_bw = perf.max_per_pipe_ib;
> > +     }
> >
> > -     avg_bw = perf.bw_ctl;
> > -     do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
> > +     avg_bw /= kms->num_paths;
> >
> >       for (i = 0; i < kms->num_paths; i++)
> > -             icc_set_bw(kms->path[i], avg_bw, perf.max_per_pipe_ib);
> > +             icc_set_bw(kms->path[i], avg_bw, peak_bw);
> >
> >       return ret;
> >   }
> >



-- 
With best wishes
Dmitry
