Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9BD4F9F3E0E
	for <lists+freedreno@lfdr.de>; Tue, 17 Dec 2024 00:13:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA4FF10E7E3;
	Mon, 16 Dec 2024 23:12:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="S+Nqoc+5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2D9310E163
 for <freedreno@lists.freedesktop.org>; Mon, 16 Dec 2024 23:12:57 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-53e389d8dc7so4670201e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 16 Dec 2024 15:12:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734390776; x=1734995576; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=P0P4AswTsYx2b/iGrf+A9EVoTJbyL0X0MceH/L1Aum8=;
 b=S+Nqoc+57IhcvAL0+qjBW4Asl5gD7iKboa9QD07w+yhCy1VaF+ObY4GQr8RdhwJuP6
 I3BlgE6a0GUIQjB4fiqtTv6KtqXcCjqMS7cizHVas3AqTyagekM4WaoFlv5Updz8EU+i
 abjGYOkrVfQvWPXJSb8DrICASWjYkBvkneZFvpYWoHASDzgiB+hVciuoFmqYqHgIFoqx
 q1o72TtPG8TDJ0IaZziepP5TcDXc7MpQrBD8LrjVf53FpXsgIYzy/1Fo/vrO26DBT4+b
 ncNZlzzw8Jvj3D4OVknUpjZmUqNuQteD/S2cDmdWV41Zsj42wNm/tdmmViVNqxS7HmeA
 BynQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734390776; x=1734995576;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P0P4AswTsYx2b/iGrf+A9EVoTJbyL0X0MceH/L1Aum8=;
 b=wnV+Wln+i+4RenOsEPcGLI408Wm0z48tfoGwSB/9uFGEaPmnxN2UQRWEPm88x6nfwM
 zSfiNdPKEB87YA65mzLHYMojQ2PPMggif4bhiIOLSlLesHnNHK9sjknKm620zDzUZQIh
 meuiOpwDurHy01lcISA72LJliWwoBBksb3YQQihCfL/Butvgb/wxo17/SGc3Gn5n+NCG
 nOV7bTKxGrgI/Gqm9E804Pch01DgI7huhwLFvk3B9wunSRbjw+IEEp1lL4QJqi4GNnx8
 wqMAR6kYkyLo3jfnmqBoYPLzcfUHuJG+fIJVSIShj2PPxvqOGcBcfAtQKOBgpTdHtJ5W
 AKmQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQ/OSWelbioVgCUhSXD6x0p77qzPvU7gbhPpkUO1f70EdmznK9COzPVxIhQOT+wdkquLy4lKrP4W0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YytKsmuDuuA6QG2TZWoYphpQyZD0zil0OGb7rdvo8j3yTt5Rv3C
 v2q0591jbs+Yeu162a8pizuhh04rA8cB2xnvyZvkk08s4sjcWaVDj9pDLnYvZzE=
X-Gm-Gg: ASbGncuiK3CbJdTzVltX39o/BH+Y83BQHeCR5VU/X4Lvzi5X7JymqzaFMsTyTkrGndT
 LEyWJA0ttEQyyiimiuZvgajuoCkGwISE0tkrtUJZhI/f2+MX9FWa4u6TrdCBugEamOZAF2+lWwj
 +HY/GkvEpRVkMbQNbZ6MV207DOfM00MHq+0854KfHPstCORR+9as2ebk1uYo8xFUfVqtKQqJSj7
 T++9wfvWXpxf9X1IX2RsjmQGUb7kBMBtTABZ23DAMAHN7XqaFJrQ9mXhfSmdtrCY5YxWxeAy6r5
 DXB1G8EWSriMGjqH6R6WwPh217CHICMgDnyq
X-Google-Smtp-Source: AGHT+IGxkH9SkFiq3CGiGZxHiWcc8rXr1a5UVkJ34/pYTrDfP9KJgxRgVb0I9tDzZSzuforz9ETJ4A==
X-Received: by 2002:a05:6512:3d1f:b0:53e:3a94:c2bc with SMTP id
 2adb3069b0e04-54131051798mr366127e87.18.1734390776090; 
 Mon, 16 Dec 2024 15:12:56 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54120bffd6csm983605e87.132.2024.12.16.15.12.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 15:12:54 -0800 (PST)
Date: Tue, 17 Dec 2024 01:12:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] drm/msm/dpu: Filter modes based on adjusted mode clock
Message-ID: <dybjy4t2wj6wyrlttes3ekppi27vlejbwg7yvfmnfw3call2jk@wfj6nzibgnpd>
References: <20241212-filter-mode-clock-v1-1-f4441988d6aa@quicinc.com>
 <onavg2s7uamgwh34ozhbt56c74ktj5chp3jnn4bw5m22y5sdjr@fktyn5yt4gmw>
 <1f71a352-ab8a-47fb-a4ed-ae0a4767aec6@quicinc.com>
 <CAA8EJprwE-zV1cX4OUJJfJ1en1+riHZVCQNGNYHxnPe_S=2cwA@mail.gmail.com>
 <ab9a5f29-39d3-46bd-bcdf-15466a6a30b4@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ab9a5f29-39d3-46bd-bcdf-15466a6a30b4@quicinc.com>
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

On Mon, Dec 16, 2024 at 11:16:11AM -0800, Abhinav Kumar wrote:
> 
> 
> On 12/13/2024 12:38 PM, Dmitry Baryshkov wrote:
> > On Fri, 13 Dec 2024 at 21:15, Abhinav Kumar <quic_abhinavk@quicinc.com> wrote:
> > > 
> > > 
> > > 
> > > On 12/12/2024 5:05 PM, Dmitry Baryshkov wrote:
> > > > On Thu, Dec 12, 2024 at 11:11:54AM -0800, Jessica Zhang wrote:
> > > > > Filter out modes that have a clock rate greater than the max core clock
> > > > > rate when adjusted for the perf clock factor
> > > > > 
> > > > > This is especially important for chipsets such as QCS615 that have lower
> > > > > limits for the MDP max core clock.
> > > > > 
> > > > > Since the core CRTC clock is at least the mode clock (adjusted for the
> > > > > perf clock factor) [1], the modes supported by the driver should be less
> > > > > than the max core clock rate.
> > > > > 
> > > > > [1] https://elixir.bootlin.com/linux/v6.12.4/source/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c#L83
> > > > > 
> > > > > Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
> > > > > ---
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 29 +++++++++++++++++++--------
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |  3 +++
> > > > >    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 12 +++++++++++
> > > > >    3 files changed, 36 insertions(+), 8 deletions(-)
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > > > > index 6f0a37f954fe8797a4e3a34e7876a93d5e477642..0afd7c81981c722a1a9176062250c418255fe6d0 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
> > > > > @@ -31,6 +31,26 @@ enum dpu_perf_mode {
> > > > >       DPU_PERF_MODE_MAX
> > > > >    };
> > > > > 
> > > > > +/**
> > > > > + * dpu_core_perf_adjusted_crtc_clk - Adjust given crtc clock rate according to
> > > > 
> > > > Nit: CRTC (here and further)
> > > > 
> > > > > + *   the perf clock factor.
> > > > > + * @crtc_clk_rate - Unadjusted crtc clock rate
> > > > > + * @perf_cfg: performance configuration
> > > > > + */
> > > > > +u64 dpu_core_perf_adjusted_crtc_clk(u64 crtc_clk_rate,
> > > > > +                                const struct dpu_perf_cfg *perf_cfg)
> > > > 
> > > > It's not just the CRTC clocks
> > > > 
> > > 
> > > Do you mean we should use adjusted mode clock here?
> > 
> > This also applies, etc. But my point was that you can not name it just
> > "adjusted CRTC clock" if you also add the plane clocks handling.
> > 
> 
> _dpu_plane_calc_clk() already handles the plane_clk calculation so we dont
> need to add it here.
> 
> adjusted_mode_clk sounds fine to me in that case.
> 
> > > 
> > > > > +{
> > > > > +    u32 clk_factor;
> > > > > +
> > > > > +    clk_factor = perf_cfg->clk_inefficiency_factor;
> > > > > +    if (clk_factor) {
> > > > > +            crtc_clk_rate *= clk_factor;
> > > > > +            do_div(crtc_clk_rate, 100);
> > > > > +    }
> > > > > +
> > > > > +    return crtc_clk_rate;
> > > > > +}
> > > > > +
> > > > >    /**
> > > > >     * _dpu_core_perf_calc_bw() - to calculate BW per crtc
> > > > >     * @perf_cfg: performance configuration
> > > > > @@ -76,7 +96,6 @@ static u64 _dpu_core_perf_calc_clk(const struct dpu_perf_cfg *perf_cfg,
> > > > >       struct dpu_plane_state *pstate;
> > > > >       struct drm_display_mode *mode;
> > > > >       u64 crtc_clk;
> > > > 
> > > > While you are at it, could you please also add a patch, replacing height
> > > > * vidth * vrefresh with mode->clock * 1000? The former one has limited
> > > > precision.
> > > > 
> > > > > -    u32 clk_factor;
> > > > > 
> > > > >       mode = &state->adjusted_mode;
> > > > > 
> > > > > @@ -90,13 +109,7 @@ static u64 _dpu_core_perf_calc_clk(const struct dpu_perf_cfg *perf_cfg,
> > > > >               crtc_clk = max(pstate->plane_clk, crtc_clk);
> > > > >       }
> > > > 
> > > > This function calculates crtc_clk as max(plane_clk, crtc_clk). Shouldn't
> > > > we also reject the atomic_state if for any of the planes the corrected
> > > > clock is lower than max_core_clk_rate
> > > > 
> > > 
> > > You mean higher than max_core_clk_rate? If so, yes we can fix that up.
> > 
> > Yes
> > 
> 
> I cross-checked the src code, we do already have the protection for
> plane_clk going beyond max_core_clk
> 
>         /* max clk check */
>         if (_dpu_plane_calc_clk(mode, pipe_cfg) >
> kms->perf.max_core_clk_rate) {
>                 DPU_DEBUG_PLANE(pdpu, "plane exceeds max mdp core clk
> limits\n");
>                 return -E2BIG;
>         }
> 
> So this should be sufficient for the case you are referring to.

But the quoted piece of code doesn't take the 'inefficiency' into account.

But it is probably a separate issue to be fixed. For this patch:


Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>


> 
> > > 
> > > > > 
> > > > > -    clk_factor = perf_cfg->clk_inefficiency_factor;
> > > > > -    if (clk_factor) {
> > > > > -            crtc_clk *= clk_factor;
> > > > > -            do_div(crtc_clk, 100);
> > > > > -    }
> > > > > -
> > > > > -    return crtc_clk;
> > > > > +    return dpu_core_perf_adjusted_crtc_clk(crtc_clk, perf_cfg);
> > > > >    }
> > > > > 
> > > > >    static struct dpu_kms *_dpu_crtc_get_kms(struct drm_crtc *crtc)
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > > > > index 451bf8021114d9d4a2dfdbb81ed4150fc559c681..c3bcd567cdfb66647c83682d1feedd69e33f0680 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
> > > > > @@ -54,6 +54,9 @@ struct dpu_core_perf {
> > > > >       u64 fix_core_ab_vote;
> > > > >    };
> > > > > 
> > > > > +u64 dpu_core_perf_adjusted_crtc_clk(u64 clk_rate,
> > > > > +                                const struct dpu_perf_cfg *perf_cfg);
> > > > > +
> > > > >    int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
> > > > >               struct drm_crtc_state *state);
> > > > > 
> > > > > diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > index ad3462476a143ec01a3b8817a2c85b0f50435a9e..cd7b84ab57a7526948c2beb7c5cefdddcbe4f6d9 100644
> > > > > --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > > > > @@ -1257,6 +1257,7 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
> > > > >                                               const struct drm_display_mode *mode)
> > > > >    {
> > > > >       struct dpu_kms *dpu_kms = _dpu_crtc_get_kms(crtc);
> > > > > +    u64 adjusted_mode_clk;
> > > > > 
> > > > >       /* if there is no 3d_mux block we cannot merge LMs so we cannot
> > > > >        * split the large layer into 2 LMs, filter out such modes
> > > > > @@ -1264,6 +1265,17 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
> > > > >       if (!dpu_kms->catalog->caps->has_3d_merge &&
> > > > >           mode->hdisplay > dpu_kms->catalog->caps->max_mixer_width)
> > > > >               return MODE_BAD_HVALUE;
> > > > > +
> > > > > +    adjusted_mode_clk = dpu_core_perf_adjusted_crtc_clk(mode->clock,
> > > > > +                                                        dpu_kms->perf.perf_cfg);
> > > > > +
> > > > > +    /*
> > > > > +     * The given mode, adjusted for the perf clock factor, should not exceed
> > > > > +     * the max core clock rate
> > > > > +     */
> > > > > +    if (adjusted_mode_clk > dpu_kms->perf.max_core_clk_rate / 1000)
> > > > > +            return MODE_CLOCK_HIGH;
> > > > > +
> > > > >       /*
> > > > >        * max crtc width is equal to the max mixer width * 2 and max height is 4K
> > > > >        */
> > > > > 
> > > > > ---
> > > > > base-commit: 423c1c96d6b2d3bb35072e33a5fdd8db6d2c0a74
> > > > > change-id: 20241212-filter-mode-clock-8cb2e769f05b
> > > > > 
> > > > > Best regards,
> > > > > --
> > > > > Jessica Zhang <quic_jesszhan@quicinc.com>
> > > > > 
> > > > 
> > 
> > 
> > 

-- 
With best wishes
Dmitry
