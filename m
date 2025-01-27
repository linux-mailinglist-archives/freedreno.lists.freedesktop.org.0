Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 92003A1DD64
	for <lists+freedreno@lfdr.de>; Mon, 27 Jan 2025 21:33:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6850910E0E9;
	Mon, 27 Jan 2025 20:33:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="b3BaBMVx";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com
 [209.85.221.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A167810E5B4
 for <freedreno@lists.freedesktop.org>; Mon, 27 Jan 2025 20:33:35 +0000 (UTC)
Received: by mail-wr1-f52.google.com with SMTP id
 ffacd0b85a97d-385e3621518so2560250f8f.1
 for <freedreno@lists.freedesktop.org>; Mon, 27 Jan 2025 12:33:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1738010014; x=1738614814; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=LHlAU+aKr/dxx0IxJmV16kOpPtw83xm16nrP0qwigsg=;
 b=b3BaBMVxCIN4fxlVgexsN8fxg1tMW8aYULo+pPJwwXqsbeNE2Aj2fZdi8yDr3E8s67
 ldN9y2oUUP7Sq5JeEly7vLNS7u0sWyNsNQKEqHO8tia1PjX8IQm0jFDN3j+gtvAbm2lz
 QTlXdIAPhuPDPHwRZRqf3CT//gKiJ9Sc5+JVw=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1738010014; x=1738614814;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LHlAU+aKr/dxx0IxJmV16kOpPtw83xm16nrP0qwigsg=;
 b=g19LMsOejMawmWT6d5ML5wXFotO0m6DErG6KC/K0vd+R0la6CqWzbAJODzIYYQNqH7
 1gRLiEM1Yu7ccBtz5UCVse5lDeT5hAFFmNWVZm9+S2y7xoYufTMK8vhRpt3KSX23eow3
 EZc88y1HvvrA2KOlErL64z84XAGj/U5MTGma/QnVs4RE2bC+7fun9MhdlRwxE3J0dKk0
 JtYf0rwjo21RqC9cfhPW5tddyHjdw+5HraMFRFpd7VUFwOOe1m1KrVVJCKnx+NssXHHV
 G/I32T3CBiLdVzidEqJ9UUzebwl8sp/l5j2j+O1dmIm93HUEIE45+b52Vf3wcga8cGYH
 lTdA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeOQ6d2YcVRX5s8N0CtMlAIn94VpQb0ZnqI0ReGjy7Bgy9++tkzcxWNnZM+pnczKVmfPCuOEpXkig=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzQ9k0x1mTLh22vtaNM0GTJeTAny0MNp5Qtrxo3aL01jwr2BTSZ
 QIrcR5Vxh6WhR1OKN11pjD2q8ZoF9rf430Dj0CSSecSMQjqif16gbvtx0c/1Wn4=
X-Gm-Gg: ASbGncsz+nHNLFhXDE3E3t9znyHn6fipz/+z9WV8Dz7hXncyZf2J3stgTknia7MUA3Y
 8ZDLk+K96JS+fVCV1JEk+4bDa/9OewZ1/OiMahTQjVcTYCGNv5jTgjQQwmJk6Q3FJQ6eLt2aSpi
 D1g5sCxqrMpiguUu5m44u6IJlYVF0WuqAqf+9iyJybrWOleDmtXX//GLzVW+DlA0UZmJgYodwaK
 BuFMjDDFe2IO1xxsRARDKR2tJ5l+s17+srEjGk7GUtEE+L9uVh5d9H3nIQSQghT8ElZf0F012HE
 NLJsi6YxxAAGkUav
X-Google-Smtp-Source: AGHT+IH0vfwaZ5FtpfbmyV/3c/RdLiJKI4pdEYXimFT0rr8h9vEqhth5+Wx3dHaOGw+H0BRuLECquw==
X-Received: by 2002:a05:6000:2a9:b0:38a:86fe:52b5 with SMTP id
 ffacd0b85a97d-38bf566274amr42820224f8f.14.1738010013410; 
 Mon, 27 Jan 2025 12:33:33 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 ffacd0b85a97d-38c2a189283sm12234191f8f.59.2025.01.27.12.33.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jan 2025 12:33:32 -0800 (PST)
Date: Mon, 27 Jan 2025 21:33:30 +0100
From: Simona Vetter <simona.vetter@ffwll.ch>
To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?= <ville.syrjala@linux.intel.com>
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>, Jocelyn Falempe <jfalempe@redhat.com>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Kalyan Thota <quic_kalyant@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Subject: Re: [PATCH 0/6] drm: introduce atomic_needs_modeset() callbacks
Message-ID: <Z5ftmvOSYyMZAPBL@phenom.ffwll.local>
Mail-Followup-To: Ville =?iso-8859-1?Q?Syrj=E4l=E4?=
 <ville.syrjala@linux.intel.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Airlie <airlied@redhat.com>,
 Jocelyn Falempe <jfalempe@redhat.com>,
 Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Kalyan Thota <quic_kalyant@quicinc.com>,
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
References: <20250124-atomic-needs-modeset-v1-0-b0c05c9eda0f@linaro.org>
 <Z5ODTg9iTjNKggzN@intel.com> <Z5OOo9yR7PVXXIj4@phenom.ffwll.local>
 <Z5ORyQ_49ZNmAxtq@intel.com> <Z5OzwxBUjEDr00w6@phenom.ffwll.local>
 <Z5O8XwIWnvBObyd6@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5O8XwIWnvBObyd6@intel.com>
X-Operating-System: Linux phenom 6.12.11-amd64 
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

On Fri, Jan 24, 2025 at 06:14:23PM +0200, Ville Syrjälä wrote:
> On Fri, Jan 24, 2025 at 04:37:39PM +0100, Simona Vetter wrote:
> > On Fri, Jan 24, 2025 at 03:12:41PM +0200, Ville Syrjälä wrote:
> > > On Fri, Jan 24, 2025 at 01:59:15PM +0100, Simona Vetter wrote:
> > > > On Fri, Jan 24, 2025 at 02:10:54PM +0200, Ville Syrjälä wrote:
> > > > > On Fri, Jan 24, 2025 at 01:14:18PM +0200, Dmitry Baryshkov wrote:
> > > > > > There are several drivers which attempt to upgrading the commit to the
> > > > > > full mode set from their per-object atomic_check() callbacks without
> > > > > > calling the drm_atomic_helper_check_modeset() or
> > > > > > drm_atomic_helper_check() again (as requested by those functions).
> > > > > 
> > > > > I don't really understand why any of that is supposedly necessary.
> > > > > drm_atomic_helper_check_modeset() is really all about the
> > > > > connector routing stuff, so if none of that is changing then there
> > > > > is no point in calling it again. Eg. in i915 we call it just at
> > > > > the start, and later on we flag internal modesets all over the
> > > > > place, but none of those need drm_atomic_helper_check_modeset()
> > > > > because nothing routing related will have changed.
> > > > 
> > > > i915 doesn't need this because as you say, it doesn't rely on the atomic
> > > > helper modeset tracking much at all, but it's all internal. This is for
> > > > drivers which rely more or less entirely on
> > > > drm_atomic_crtc_needs_modeset().
> > > > 
> > > > Also note that it's not just about connector routing, but about adding all
> > > > the necessary additional states with
> > > > drm_atomic_add_affected_connectors/planes and re-running all the various
> > > > state computation hooks for those. Again i915 hand-rolls that all.
> > > 
> > > IIRC it only runs the connectors' atomic_check(),
> > > nothing else really. But maybe that's changed since I last
> > > looked at it.
> > 
> > It calls into connector/bridge/crtc callbacks related to modesets and mode
> > validation.
> 
> The pre-atomic mode_fixup stuff? Are people still using that in
> atomic drivers? Hmm, it does look like someone added some real
> atomic_check() calls in there, which is a slightly surprising
> place to find them.

Well for modesets you do need hooks to compute the state, and that means a
modern one that passes the actual atomic state stuff as parameters.

> > The thing is a few hundred lines in total if you include all the split out
> > subfunctions. Like the kerneldoc pretty clearly spells out that it does a
> > lot more than what you've listed here. Just i915 doesn't used most of
> > that.
> 
> In my book a function should do one thing. And if you do have some
> kind of massive dispatcher function then it should be very abstract
> and just call some smaller functions to do each step.
> tldr; I don't like any function that doesn't fit on my screen.
> 
> Anyways, my main worry is that someone adds some new logic/checks
> somewhere that assumes that you can't flag modesets later without
> calling the helper. Which is clearly not correct. Eg. most of the
> modesets we do are just done to get the hardware turned off while
> we reprogram some global resource that doesn't know how to
> synchronize with active pipes, not because anything changed that
> would need further checks/recomputation/etc.

That is a bit a risk, but I think thus far all that function has done is
figure out the routing and call _lots_ of callbacks on all the various
objects to figure out modesets. And with connectors, bridges and crtcs
(it's kidna convenient for many drivers to split the plane flip from the
modeset related crtc state computations) there's just a lot of these.

Beyond the routing (which could be split out I guess) I think we've
succeeded at keeping random funny things out of these functions, because
they are documented to be idempotent (if all your callbacks are ofc).
-Sima

> > > Anyways it feels like we're throwing everything and the
> > > kitchen sink into a single function here. Maybe it should be
> > > split into two or more functions with clear responsibilities?
> > 
> > I'm not sure you can split it up much, because modesetting is complicated.
> > Like even if you'd want to split out just the routing update logic that's
> > a pretty big mess with a bunch of callbacks so that we can pick the right
> > encoders to add the right bridges. And then have a 2nd function that does
> > the actual state computation/validation.
> > 
> > Not sure that's worth it, since only benefit would be for drivers like
> > i915 that almost entirely hand-roll their own atomic check flow and really
> > only need the connector routing bits. I guess if you're bored you could
> > give it a stab.
> 
> Yeah, I guess I could try to carve it up a bit when I get bored
> with other stuff.
> 
> > -Sima
> > 
> > > 
> > > > 
> > > > So yeah i915 doesn't need this.
> > > > -Sima
> > > > 
> > > > > 
> > > > > > 
> > > > > > As discussed on IRC, add separate atomic_needs_modeset() callbacks,
> > > > > > whose only purpose is to allow the plane, connector, encoder or CRTC to
> > > > > > specify that for whatever reasons corresponding CRTC should undergo a
> > > > > > full modeset. The helpers will call these callbacks in a proper place,
> > > > > > adding affected objects and calling required functions as required.
> > > > > > 
> > > > > > The MSM patches depend on the msm-next tree and the series at [1]. The
> > > > > > plan is to land core changes through drm-misc, then merge drm-misc-next
> > > > > > into msm-next and merge remaining msm-specific patches through the
> > > > > > msm-next tree.
> > > > > > 
> > > > > > [1] https://lore.kernel.org/dri-devel/20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org/
> > > > > > 
> > > > > > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > > ---
> > > > > > Dmitry Baryshkov (6):
> > > > > >       drm/atomic-helper: add atomic_needs_modeset callbacks
> > > > > >       drm/mgag200: move format check to drm_plane_helper.atomic_needs_modeset
> > > > > >       drm/msm/dpu: stop upgrading commits by enabling allow_modeset
> > > > > >       drm/msm/dpu: move CTM check to drm_crtc_helper.atomic_needs_modeset
> > > > > >       drm/msm/dpu: use atomic_needs_modeset for CDM check
> > > > > >       drm/msm: drop msm_atomic_check wrapper
> > > > > > 
> > > > > >  drivers/gpu/drm/drm_atomic_helper.c         | 59 ++++++++++++++++++
> > > > > >  drivers/gpu/drm/mgag200/mgag200_drv.h       |  2 +
> > > > > >  drivers/gpu/drm/mgag200/mgag200_mode.c      | 27 ++++++---
> > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 15 +++++
> > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 44 +++++++++-----
> > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 --
> > > > > >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 --------
> > > > > >  drivers/gpu/drm/msm/msm_atomic.c            | 29 ---------
> > > > > >  drivers/gpu/drm/msm/msm_drv.h               |  1 -
> > > > > >  drivers/gpu/drm/msm/msm_kms.c               |  2 +-
> > > > > >  drivers/gpu/drm/msm/msm_kms.h               |  7 ---
> > > > > >  include/drm/drm_modeset_helper_vtables.h    | 92 +++++++++++++++++++++++++++++
> > > > > >  12 files changed, 219 insertions(+), 89 deletions(-)
> > > > > > ---
> > > > > > base-commit: 0936f0e54426177b0f0263ddf806ed5e13487db6
> > > > > > change-id: 20250123-atomic-needs-modeset-8f6a8243a3f7
> > > > > > prerequisite-change-id: 20241222-drm-dirty-modeset-88079bd27ae6:v2
> > > > > > prerequisite-patch-id: 0c61aabfcd13651203f476985380cbf4d3c299e6
> > > > > > prerequisite-patch-id: c6026f08011c288fd301676e9fa6f46d0cc1dab7
> > > > > > prerequisite-patch-id: b0cb06d5c88791d6e4755d879ced0d5050aa3cbf
> > > > > > prerequisite-patch-id: fd72ddde9dba0df053113bc505c213961a9760da
> > > > > > 
> > > > > > Best regards,
> > > > > > -- 
> > > > > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > > > > 
> > > > > -- 
> > > > > Ville Syrjälä
> > > > > Intel
> > > > 
> > > > -- 
> > > > Simona Vetter
> > > > Software Engineer, Intel Corporation
> > > > http://blog.ffwll.ch
> > > 
> > > -- 
> > > Ville Syrjälä
> > > Intel
> > 
> > -- 
> > Simona Vetter
> > Software Engineer, Intel Corporation
> > http://blog.ffwll.ch
> 
> -- 
> Ville Syrjälä
> Intel

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
