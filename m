Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB944A07576
	for <lists+freedreno@lfdr.de>; Thu,  9 Jan 2025 13:15:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB02110ED93;
	Thu,  9 Jan 2025 12:15:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NnIxdpZ+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f53.google.com (mail-lf1-f53.google.com
 [209.85.167.53])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8BB5A10ED93
 for <freedreno@lists.freedesktop.org>; Thu,  9 Jan 2025 12:15:56 +0000 (UTC)
Received: by mail-lf1-f53.google.com with SMTP id
 2adb3069b0e04-53e28cf55cdso640306e87.3
 for <freedreno@lists.freedesktop.org>; Thu, 09 Jan 2025 04:15:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736424895; x=1737029695; darn=lists.freedesktop.org;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date:from:to
 :cc:subject:date:message-id:reply-to;
 bh=7Y3HY3/3raPKrBdMfi/LEIgt0D1405I14g2HDD+nyIE=;
 b=NnIxdpZ+SUwegvc4Tl8L4QcP6qYkk31PRXgm8Wi0tTEHqWtDxWfWoxC/M39YY0c37o
 QTk5bDolr3Aayaql0s7ccLjVwhhHWHCCmpy4iz0Qi7YZWLXwqqGxcVuA7yQMy0Azfr+z
 lsPoTBSh1u3LaZkTco0uKUiR+jgrK3KF18zxSY99JgsWQi+C18h0SAhKCJQPZrBQFUCL
 GlUIVL6s+Hsigj3TvMeHkwBILOVULOrdUy40qoO1yk8NALLG54lwttL1Uglu3ZjwQtgI
 82iEMmaE67XYB87QzqQbIhgMOI5pjk3ofPmH/30e79hTcKrTtlQ+IwBle0b3OC1eqVGF
 wJFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736424895; x=1737029695;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7Y3HY3/3raPKrBdMfi/LEIgt0D1405I14g2HDD+nyIE=;
 b=f3XRaHRLpv7Yq7dGGj9t20Cdf813GVD5uEMin48nyfja0i5XGHWsZoKd8w1KYnyXxt
 9aqIzMNOzniWFzvA8ZcU40v9WPEBiqLVN2c+5yS70weVoPnIBjyl/+qkDHK/J8/Fqrj6
 OQs49GD+PiTJu96ngZ5OslZ1YC6O+l8aiwZuuUmt0JRMNwKVpxBLZfhrTZ/Rf5j89Iut
 51SGaIVFhjqJyIOyyXObF6Yky0VyzeHLAqUJA1W7CX5rcw1FKqoG4jy7e5h3MWmjGKex
 UOz8mhEBwJqRRiiy9VHByT7Bf4I+/Vb4lgcHH9qgO83nXYx581jT+gum58XRACxbIYd+
 Dosw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXpdwb3tCOfknvxhwF05hKQSTjqRcq6giftCjcf+8ffZSUH1/xY03wyqrbVUPJV64mIMXF7sh3CFco=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwD6RQe6XO2PPeHq3OqHD7Dn2fI4o9uQg3O4hwVQ0HCMgeE5r1V
 WglaBsyoByiZqQrpWSCBcPoF9XFflP6F8LVGjpfz78FeuYBGpC3iC+fU0BmqvTI=
X-Gm-Gg: ASbGncsZYCisXDxqF3AFGJUneEDXRutM3URYJgPtfP8+BdENymxfuSvxNGctgts7p3t
 CgpQyYSyAMT7yoEtphZmGlYZoaQyzRY3jaWt76cE21bZvrghOVdQmICcySbLoypoHlV0eyQZnjG
 1wC3CF7NQChwRszUX0SpGDDTK7RQaiQ4CI0SBEGWwJ0LLTheFdaqlLAdGhZPHDrAL2Xx8ff/kbV
 mGOrYg+hwbamlZ/LQCUiuqZnwZbTtmKSeWRNLBO/AGFiyQ7dBYrsEUYguDY7oNpC6Tqt2IZX+iv
 UKvc/UD/vkCOU1+ODH/+u/QZMHr+0Ak57jc4
X-Google-Smtp-Source: AGHT+IG5w+mHeSxL6HLuB+vsJtc5xv9b0UjlOGR0qPmcZlQhgaehIdffVretPgnpXUgovXqCroBRTw==
X-Received: by 2002:a05:6512:104c:b0:53e:383c:dfa9 with SMTP id
 2adb3069b0e04-542845d32f9mr2107453e87.30.1736424894890; 
 Thu, 09 Jan 2025 04:14:54 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5428be49a12sm180006e87.17.2025.01.09.04.14.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 04:14:53 -0800 (PST)
Date: Thu, 9 Jan 2025 14:14:52 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Jun Nie <jun.nie@linaro.org>
Cc: Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 04/15] drm/msm/dpu: decide right side per last bit
Message-ID: <4uzsmtbeoilcodnlbnbst2t2gfbhaucpzne2bzwavdeawmqs4q@u33sixkksfls>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
 <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-4-92c7c0a228e3@linaro.org>
 <yqbze4h6obiwulmvh64r62slaiih75hzescf5tjwqgtmhqy3wi@y4uedbo5jrzu>
 <95b83e6f-e455-4df0-b121-a1d900de0a56@quicinc.com>
 <CABymUCOGzvR0utNUR3-6bFDi3c3yRTUu=CcTo2-eTKBvpoU-PA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CABymUCOGzvR0utNUR3-6bFDi3c3yRTUu=CcTo2-eTKBvpoU-PA@mail.gmail.com>
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

On Thu, Jan 09, 2025 at 12:35:48PM +0800, Jun Nie wrote:
> Jessica Zhang <quic_jesszhan@quicinc.com> 于2025年1月9日周四 07:41写道：
> >
> >
> >
> > On 12/19/2024 2:09 PM, Dmitry Baryshkov wrote:
> > > On Thu, Dec 19, 2024 at 03:49:22PM +0800, Jun Nie wrote:
> > >> decide right side of a pair per last bit, in case of multiple
> > >> mixer pairs.
> > >
> > > Proper English sentences, please. Also describe why, not what.
> >
> > Hi Jun,
> >
> > Can we also add a note in the commit message on why the last bit check
> > works?
> 
> Sure. How about this?
> 
>     Currently we only support one pair of mixer, so counter's
>     non-zero value is enough to mark the right one. There will
>     be case with multiple mixer pairs, so let's use the last bit to
>     mark the right mixer in a mixer pair. If the last bit is set, it
>     marks the right mixer in the pair, it's left mixer otherwise.

You are not marking the right mixer, so it is not suitable.

> 
> >
> > Thanks,
> >
> > Jessica Zhang
> >
> > >
> > >>
> > >> Signed-off-by: Jun Nie <jun.nie@linaro.org>
> > >> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > >> ---
> > >>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 5 ++---
> > >>   1 file changed, 2 insertions(+), 3 deletions(-)
> > >>
> > >> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > >> index 7191b1a6d41b3..41c9d3e3e3c7c 100644
> > >> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > >> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
> > >> @@ -369,11 +369,10 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
> > >>   static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
> > >>   {
> > >>      struct dpu_crtc_state *crtc_state;
> > >> -    int lm_idx, lm_horiz_position;
> > >> +    int lm_idx;
> > >>
> > >>      crtc_state = to_dpu_crtc_state(crtc->state);
> > >>
> > >> -    lm_horiz_position = 0;
> > >>      for (lm_idx = 0; lm_idx < crtc_state->num_mixers; lm_idx++) {
> > >>              const struct drm_rect *lm_roi = &crtc_state->lm_bounds[lm_idx];
> > >>              struct dpu_hw_mixer *hw_lm = crtc_state->mixers[lm_idx].hw_lm;
> > >> @@ -384,7 +383,7 @@ static void _dpu_crtc_program_lm_output_roi(struct drm_crtc *crtc)
> > >>
> > >>              cfg.out_width = drm_rect_width(lm_roi);
> > >>              cfg.out_height = drm_rect_height(lm_roi);
> > >> -            cfg.right_mixer = lm_horiz_position++;
> > >> +            cfg.right_mixer = lm_idx & 0x1;
> > >>              cfg.flags = 0;
> > >>              hw_lm->ops.setup_mixer_out(hw_lm, &cfg);
> > >>      }
> > >>
> > >> --
> > >> 2.34.1
> > >>
> > >
> > > --
> > > With best wishes
> > > Dmitry
> >

-- 
With best wishes
Dmitry
