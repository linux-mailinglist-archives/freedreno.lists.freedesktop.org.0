Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 93138A083BC
	for <lists+freedreno@lfdr.de>; Fri, 10 Jan 2025 00:58:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F37210E388;
	Thu,  9 Jan 2025 23:58:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nMO7rvg1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com
 [209.85.208.173])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D81410E388
 for <freedreno@lists.freedesktop.org>; Thu,  9 Jan 2025 23:58:43 +0000 (UTC)
Received: by mail-lj1-f173.google.com with SMTP id
 38308e7fff4ca-30034ad2ca3so10620621fa.1
 for <freedreno@lists.freedesktop.org>; Thu, 09 Jan 2025 15:58:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1736467062; x=1737071862; darn=lists.freedesktop.org;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=79FHqofEtRr0hlMpVLWdJtC6zUk7BGgo+xqNv88BarQ=;
 b=nMO7rvg1RwSXdtlNVmfRa5EjQKiLyomAWtCACONMboW0bCQ6gzbPxvoNv2w1UibC/I
 kqN23MSmJHVkj81jzoK/B7r6bAgwPyzKYJGijMJ+LyvD/rCShf8V4LIBLZ48+SXk371w
 iTavLibb8s7Jq+UTIlG7w9MO6P/gAe7AbC4wGIevtbQQZJSfRtB9G/JC2OMlZNeXmQuM
 i1m2PyDI2Nkwx/UVfF7Ak14B1nofxZK8VFbRsXoAPj6f2WnuE8CPAKV6CuK6tpyO4tNN
 yuwoRGDGFMdDRurqmtNaki7ovzo1qq2rH/P39ZFzCS5kGspzuDd6dvMV/7hJmqq97wz3
 VP9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1736467062; x=1737071862;
 h=in-reply-to:content-disposition:mime-version:references:message-id
 :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=79FHqofEtRr0hlMpVLWdJtC6zUk7BGgo+xqNv88BarQ=;
 b=Y3WPz4wQNbbCUUSOMT2Ic7sIho4+/9O/vzzF9NWSZKQkp+PeH6O98ie4IboC6RpH+D
 S0DyRpmpFPsRsuJj7ocLXJJOJ2s9bi3VPNT1knhQ/oVoQto7LBFMIULPftIdLHicrp5i
 e9xRiWkA7yyLVr3L3QKk7EscPimmhToTb6H8feVUozicNPYsGE4YbP16+HnFozCwYoOi
 5rJWbh6Y2Pj7I+Mp6YnKjyEa0wzWSs2P83oqI5V4e9vMSrVPE3ekVeo+bnT19Xc7BB6u
 O3eGP2TDi698+6I18aeGPl34UEr8bLspjAVFxMV7Z9EYwm0e4wBUB5SddRrnlkVjvV+b
 NV7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUrlfBPAvptxUSgyURCfAo895ofp9QHOTQ5qTYpdvR8EixmpatgCNYMrnI7hV6LyXY4uRK6sRROHIQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOmoktB1RH7pisNSAIfN//DbNRC8+2ZpMyviUvcjhLvewZRMbq
 ifpafvEovnJXTGDNhLx2uysI6YvJgav8fl2wJsmYmNkfsz83aYXm2uEb2GmhdlQ=
X-Gm-Gg: ASbGncttQbnPc98ZPMA46artQFp/uJyZnLTEby85V3mUUB0fmUOTt3MKJi+rEduKiKo
 j0SlCjH3cUJRStBQ/o/HTGlkpL4i1xGzBgAi0Mb/TDeUbvF5HTYzoARTChi3gl16mM0vauRv1Iz
 hjzDNsvwT6/cCmzllqpxihZD14OnmcIFbehyTDM7RcJn/Ji0UeDZ1SU/U+eYxBSaLjocjDgcj7s
 Z/ntZANbYofDj33+JRo2iGWWaigvZOxhJNnumXKIY0D9HbVJL5C1Dw+MNIHXasR1fTtRRMNt49S
 68PVMXlUTqHF1f3q3JCen4HGLNYbUWQpZJVh
X-Google-Smtp-Source: AGHT+IHKbDVXIxAZdZxXANVu9gYbEJQ+jYurQOYZiJih1oOmheQ8+kN5cRpFn4H5d2vGBTXPfoMOKQ==
X-Received: by 2002:a05:651c:546:b0:2ff:d044:61fc with SMTP id
 38308e7fff4ca-305f45f37d2mr25960581fa.33.1736467061939; 
 Thu, 09 Jan 2025 15:57:41 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (2001-14ba-a0c3-3a00--b8c.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::b8c])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-305ff1c7b99sm3363311fa.84.2025.01.09.15.57.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jan 2025 15:57:40 -0800 (PST)
Date: Fri, 10 Jan 2025 01:57:38 +0200
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Thomas Zimmermann <tzimmermann@suse.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>,
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Archit Taneja <architt@codeaurora.org>, Rajesh Yadav <ryadav@codeaurora.org>, 
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH 0/6] drm: enforce rules for
 drm_atomic_helper_check_modeset()
Message-ID: <t7ga7l7hi5y634hc6sklp6mzae3jfqs66nkalviojrzrgez3kf@b4h4ue6fdj7j>
References: <20241222-drm-dirty-modeset-v1-0-0e76a53eceb9@linaro.org>
 <e1a1fc68-cb8d-4fb0-879f-a84e679f6b2b@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1a1fc68-cb8d-4fb0-879f-a84e679f6b2b@suse.de>
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

On Thu, Jan 09, 2025 at 02:53:16PM +0100, Thomas Zimmermann wrote:
> Hi
> 
> 
> Am 22.12.24 um 06:00 schrieb Dmitry Baryshkov:
> > As pointed out by Simona, the drm_atomic_helper_check_modeset() and
> > drm_atomic_helper_check() require the former function is rerun if the
> > driver's callbacks modify crtc_state->mode_changed. MSM is one of the
> > drivers which failed to follow this requirement.
> 
> I'm concerned about the implications of this series. How does a driver
> upgrade from simple pageflip to full modeset if necessary? The solution in
> msm appears to be to run the related test before drm_atomic_helper_check().
> (Right?)
> 
> My corner case is in mgag200, which has to reprogram the PLL if the color
> mode changes. So it sets mode_changed to true in the primary plane's
> atomic_check. [1] This works in practice because the plane checks run before
> the CRTC checks. So the CRTC code will do the correct thing. Reprogramming
> the PLL means to disable the display at some point. So it comes down to a
> full modeset.
> 
> You mention that drm_atomic_helper_check() needs to rerun if mode_changed
> flips. Would it be possible to implement this instead within the helper?

I think this should be a driver's decision. For MSM it was easier to
move the mode_changed changes and to isolate that before calling into
the drm_atomic_helper_check_modeset() code. Other drivers might prefer
to rerun the helper.

> 
> Best regards
> Thomas
> 
> [1] https://elixir.bootlin.com/linux/v6.12/source/drivers/gpu/drm/mgag200/mgag200_mode.c#L493
> 
> > 
> > As suggested by Simona, implement generic code to verify that the
> > drivers abide to those requirement and rework MSM driver to follow that
> > restrictions.
> > 
> > There are no dependencies between core and MSM parts, so they can go
> > separately via corresponding trees.
> > 
> > Reported-by: Simona Vetter <simona.vetter@ffwll.ch>
> > Link: https://lore.kernel.org/dri-devel/ZtW_S0j5AEr4g0QW@phenom.ffwll.local/
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Dmitry Baryshkov (6):
> >        drm/atomic-helper: document drm_atomic_helper_check() restrictions
> >        drm/atomic: prepare to check that drivers follow restrictions for needs_modeset
> >        drm/msm/dpu: don't use active in atomic_check()
> >        drm/msm/dpu: move needs_cdm setting to dpu_encoder_get_topology()
> >        drm/msm/dpu: simplify dpu_encoder_get_topology() interface
> >        drm/msm/dpu: don't set crtc_state->mode_changed from atomic_check()
> > 
> >   drivers/gpu/drm/drm_atomic.c                |  3 +
> >   drivers/gpu/drm/drm_atomic_helper.c         | 86 ++++++++++++++++++++++++++---
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    |  4 --
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 82 +++++++++++++++++----------
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 ++
> >   drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 +++++++++
> >   drivers/gpu/drm/msm/msm_atomic.c            | 13 ++++-
> >   drivers/gpu/drm/msm/msm_kms.h               |  7 +++
> >   include/drm/drm_atomic.h                    | 10 ++++
> >   9 files changed, 192 insertions(+), 43 deletions(-)
> > ---
> > base-commit: b72747fdde637ebf52e181671bf6f41cd773b3e1
> > change-id: 20241222-drm-dirty-modeset-88079bd27ae6
> > 
> > Best regards,
> 
> -- 
> --
> Thomas Zimmermann
> Graphics Driver Developer
> SUSE Software Solutions Germany GmbH
> Frankenstrasse 146, 90461 Nuernberg, Germany
> GF: Ivo Totev, Andrew Myers, Andrew McDonald, Boudien Moerman
> HRB 36809 (AG Nuernberg)
> 

-- 
With best wishes
Dmitry
