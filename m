Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B24FA7477CA
	for <lists+freedreno@lfdr.de>; Tue,  4 Jul 2023 19:30:46 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 65E9D10E16B;
	Tue,  4 Jul 2023 17:30:45 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb31.google.com (mail-yb1-xb31.google.com
 [IPv6:2607:f8b0:4864:20::b31])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6529010E16B
 for <freedreno@lists.freedesktop.org>; Tue,  4 Jul 2023 17:30:44 +0000 (UTC)
Received: by mail-yb1-xb31.google.com with SMTP id
 3f1490d57ef6-c01e1c0402cso5404549276.0
 for <freedreno@lists.freedesktop.org>; Tue, 04 Jul 2023 10:30:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688491843; x=1691083843;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:from:to:cc:subject:date:message-id:reply-to;
 bh=lZZYhAMS4P0JlyUoFI/yQ9M0e2zsSOScmdbRcE5pQn0=;
 b=UM9IFKuWSrCweUYM6HcG8i1kc21W08w08Un0FeZKltLdhGE5tddMqCMS0pj3QByN5B
 df/UvjOowmu9NUv7djy8CQVrlZLzd76LgEgJL362lrQKa2z0wAAF9HPIWBEhEe5sMVDc
 saIQRfPg/FIwSHJ0jmqopC0sQ5AM8lMyyJOe2rWz4kQAsF6owJqaPxtDyJaqsEZFFDnd
 7wFNCUVpwICvhKWJ5QJEzE4v0Y+EZRiobt54BSN6kr81pI/JtQ9uzxwEkbhuz0bG1YtK
 3/M5yDLO90U/nuNJYDq16idE6vUbbxhyHObzHc9mwZ6eGXZVbnS9ZlxtISxR/csninvw
 bL6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688491843; x=1691083843;
 h=cc:to:subject:message-id:date:from:in-reply-to:references
 :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=lZZYhAMS4P0JlyUoFI/yQ9M0e2zsSOScmdbRcE5pQn0=;
 b=CnjX5dFyMk0RtCsT4ER9XWWIuGV17rg4HvpD32DgPuqy8tbor5h+IfXYTFlcBcSrhM
 ncu4D59neqCEY6W81c+46gvsk3VzHsMkw8E66Zr7+lR+2xx4bShFTdBZ0DjFQlEdPJ+P
 E/x9F3Yge8QMz5xny47Pp18ZuE3euZQRVzRcHlZNE0g3dvUsch6Ns7LZPZCx/RsveMzj
 ypIEg5lAwepcgRwZVF6uTVh7EUMzjLxbwU3x7dWZy0ntRLH7M0Rv0cp685Dnkqf1sLpc
 DhSMr6eU6kRvftGWOAIx3VIgbC4G8Rcuy9s8hBBo4m7m/yWuMmKJKK3TbBHjXLy9DOa+
 zl9g==
X-Gm-Message-State: ABy/qLaIgHeNlaqW5FOQUKcxbOnAUWcj/AOCLeykGDddH6DHqQZJVt+1
 6YCAq/QnzQUT2eMSjGJ/hx5rQw2xSiFZLX76YTaM6A==
X-Google-Smtp-Source: APBJJlHigHEYKofayb+OxZT57NxYXwngeV93etDN5bhfqo65aLEQgDJMs3OzGpe0jMPLa/Fx9K3i5sg9dz3n6CXd93s=
X-Received: by 2002:a25:c550:0:b0:c5e:5573:bda with SMTP id
 v77-20020a25c550000000b00c5e55730bdamr1496102ybe.11.1688491843141; Tue, 04
 Jul 2023 10:30:43 -0700 (PDT)
MIME-Version: 1.0
References: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
 <20230704150354.159882-6-dmitry.baryshkov@linaro.org>
 <3e31a735-a4d1-c8d4-6a83-53e2687c2f18@quicinc.com>
In-Reply-To: <3e31a735-a4d1-c8d4-6a83-53e2687c2f18@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue, 4 Jul 2023 20:30:32 +0300
Message-ID: <CAA8EJpos_gPPzyTGc56yQM6h0K8XBJKB2STq6eMZCkRpN4uxbw@mail.gmail.com>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Subject: Re: [Freedreno] [PATCH v2 05/14] drm/msm/dpu: handle perf mode in
 _dpu_core_perf_crtc_update_bus()
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 4 Jul 2023 at 18:55, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
>
>
>
> On 7/4/2023 8:03 AM, Dmitry Baryshkov wrote:
> > Move perf mode handling for the bandwidth to
> > _dpu_core_perf_crtc_update_bus() rather than overriding per-CRTC data
> > and then aggregating known values.
> >
> > Note, this changes the fix_core_ab_vote. Previously it would be
> > multiplied per the CRTC number, now it will be used directly for
> > interconnect voting.
> >
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>
> Break this out into a separate series. This rework doesnt need to be
> part of this cleanup series.

Sure, why not.

>
> > ---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 37 +++++++++----------
> >   1 file changed, 18 insertions(+), 19 deletions(-)
> >
> > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > index 348550ac7e51..42c03a5f1f3e 100644
> > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > @@ -116,21 +116,9 @@ static void _dpu_core_perf_calc_crtc(struct dpu_kms *kms,
> >               return;
> >       }
> >
> > -     memset(perf, 0, sizeof(struct dpu_core_perf_params));
> > -
> > -     if (kms->perf.perf_tune.mode == DPU_PERF_MODE_MINIMUM) {
> > -             perf->bw_ctl = 0;
> > -             perf->max_per_pipe_ib = 0;
> > -             perf->core_clk_rate = 0;
> > -     } else if (kms->perf.perf_tune.mode == DPU_PERF_MODE_FIXED) {
> > -             perf->bw_ctl = kms->perf.fix_core_ab_vote;
> > -             perf->max_per_pipe_ib = kms->perf.fix_core_ib_vote;
> > -             perf->core_clk_rate = kms->perf.fix_core_clk_rate;
> > -     } else {
> > -             perf->bw_ctl = _dpu_core_perf_calc_bw(kms, crtc);
> > -             perf->max_per_pipe_ib = kms->catalog->perf->min_dram_ib;
> > -             perf->core_clk_rate = _dpu_core_perf_calc_clk(kms, crtc, state);
> > -     }
> > +     perf->bw_ctl = _dpu_core_perf_calc_bw(kms, crtc);
> > +     perf->max_per_pipe_ib = kms->catalog->perf->min_dram_ib;
> > +     perf->core_clk_rate = _dpu_core_perf_calc_clk(kms, crtc, state);
> >
> >       DRM_DEBUG_ATOMIC(
> >               "crtc=%d clk_rate=%llu core_ib=%llu core_ab=%llu\n",
> > @@ -236,17 +224,28 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
> >       struct dpu_core_perf_params perf = { 0 };
> >       int i, ret = 0;
> >       u32 avg_bw;
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



-- 
With best wishes
Dmitry
