Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C63FAA1B671
	for <lists+freedreno@lfdr.de>; Fri, 24 Jan 2025 13:59:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A5CC010E971;
	Fri, 24 Jan 2025 12:59:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (1024-bit key; secure) header.d=ffwll.ch header.i=@ffwll.ch header.b="O0kMTPIY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com
 [209.85.128.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4431D10E971
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jan 2025 12:59:19 +0000 (UTC)
Received: by mail-wm1-f50.google.com with SMTP id
 5b1f17b1804b1-43618283dedso21214865e9.3
 for <freedreno@lists.freedesktop.org>; Fri, 24 Jan 2025 04:59:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google; t=1737723558; x=1738328358; darn=lists.freedesktop.org; 
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:from:to:cc:subject:date:message-id:reply-to;
 bh=33cVwK3grJ8YXxRdY81yOM9y1PRayVf2o7ymGHTooTE=;
 b=O0kMTPIYozoKQO9PbLxFs+axC6XTzedX/x0ifKun9QK/c5+d6Ph5UMw0vSuFmN5dQS
 X5lpLeYqJYg5hS7fti5JEvnV1mlzAOHezRvk5l7QeGavDThNIx02q/XwcerckW7XHEFG
 ayY07bcOKLR8VmL3PVnigRY/hkEWa/w6k9mUU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737723558; x=1738328358;
 h=in-reply-to:content-transfer-encoding:content-disposition
 :mime-version:references:mail-followup-to:message-id:subject:cc:to
 :from:date:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=33cVwK3grJ8YXxRdY81yOM9y1PRayVf2o7ymGHTooTE=;
 b=fmJMaCH1ynF+l1dJFeXNS5EjRq6WJXXRUtlU63++ylv37pnz7orpOG70Cr71Xoa6NV
 JKg7vCUa6AHvUBb5Yfg+tI0j/BGezlcyntkpqTAU2178ZaOHd5VlevMs7/0orxbT5pLa
 ZACMviiydwtIuQN2QFb/GBpYp1K5ZmUL6yfbfFk1Bfr/M20+k8m4iYQE2+AMpNgoBg0Y
 tNylPthV6izOD9gsnVcae17KgWcUCTzvDtsVyg7D20aO4JFMa16EILPMbPW4CVoBuIJ2
 NG7N6TM63nlLH0EUyYcVhdWq2rYiqMG7v/MrJBa02fJdRIxQaIDala5ogydog7gXWJtx
 kCzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVO9Y5tldSCbMlX6qq88psCYaXJDAKene5bvuFdXh8p8HTiBw6GwJFixcz/SBEH5Nq64P/yY8Z6uhg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzgHLqSOjr0ZGqnYI6myZ+MCKrmcDJ422OEEIw8qaOCGMX3fZc
 krv2llqea/ByHPyOoVLAm8sJJSs08V6xDrLaQm/Tk9rVtWW/HFmntcsaqqFuiXg=
X-Gm-Gg: ASbGncuGabHnwWFFFTmjB2vB23OkFWXY+59wL4r7214W75DlG8wVhMD2cJez1APowDf
 BAo9uuTtl9Vfbs5EOAkxyG39lFDL7oHrmYVWq4XUM02qd2sh7ftzvkFn9NKCn2rHtHJ1H/brG3s
 Du+K4QJ0GA3hnPhVv/bP1RQ8dUCfs2Wvd6ZNzrgyt31cERnYBmWjheQU7OTmhaQzOXrpdPZXdDS
 WZSo4zI8uMJi4qrJrQYowduGDyCxsUga54d3J0PLD4SIaG7DIMHC9aWKEeJagtAdvPx8Dt/oEVS
 5MXafCnDyzx051aG
X-Google-Smtp-Source: AGHT+IFNTwDQcfMPSuAVJYiFiIPNjkS5uD2SP5FpWnu3IjjtuQyF+nl7zo/OPmtqDX93CmpiCmn2bA==
X-Received: by 2002:a05:600c:3b0a:b0:434:9c60:95a3 with SMTP id
 5b1f17b1804b1-438913ca93cmr305517245e9.11.1737723557582; 
 Fri, 24 Jan 2025 04:59:17 -0800 (PST)
Received: from phenom.ffwll.local ([2a02:168:57f4:0:5485:d4b2:c087:b497])
 by smtp.gmail.com with ESMTPSA id
 5b1f17b1804b1-438bd4857cesm25611865e9.13.2025.01.24.04.59.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Jan 2025 04:59:17 -0800 (PST)
Date: Fri, 24 Jan 2025 13:59:15 +0100
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
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Simona Vetter <simona.vetter@ffwll.ch>
Subject: Re: [PATCH 0/6] drm: introduce atomic_needs_modeset() callbacks
Message-ID: <Z5OOo9yR7PVXXIj4@phenom.ffwll.local>
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
 <Z5ODTg9iTjNKggzN@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <Z5ODTg9iTjNKggzN@intel.com>
X-Operating-System: Linux phenom 6.12.3-amd64 
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

On Fri, Jan 24, 2025 at 02:10:54PM +0200, Ville Syrjälä wrote:
> On Fri, Jan 24, 2025 at 01:14:18PM +0200, Dmitry Baryshkov wrote:
> > There are several drivers which attempt to upgrading the commit to the
> > full mode set from their per-object atomic_check() callbacks without
> > calling the drm_atomic_helper_check_modeset() or
> > drm_atomic_helper_check() again (as requested by those functions).
> 
> I don't really understand why any of that is supposedly necessary.
> drm_atomic_helper_check_modeset() is really all about the
> connector routing stuff, so if none of that is changing then there
> is no point in calling it again. Eg. in i915 we call it just at
> the start, and later on we flag internal modesets all over the
> place, but none of those need drm_atomic_helper_check_modeset()
> because nothing routing related will have changed.

i915 doesn't need this because as you say, it doesn't rely on the atomic
helper modeset tracking much at all, but it's all internal. This is for
drivers which rely more or less entirely on
drm_atomic_crtc_needs_modeset().

Also note that it's not just about connector routing, but about adding all
the necessary additional states with
drm_atomic_add_affected_connectors/planes and re-running all the various
state computation hooks for those. Again i915 hand-rolls that all.

So yeah i915 doesn't need this.
-Sima

> 
> > 
> > As discussed on IRC, add separate atomic_needs_modeset() callbacks,
> > whose only purpose is to allow the plane, connector, encoder or CRTC to
> > specify that for whatever reasons corresponding CRTC should undergo a
> > full modeset. The helpers will call these callbacks in a proper place,
> > adding affected objects and calling required functions as required.
> > 
> > The MSM patches depend on the msm-next tree and the series at [1]. The
> > plan is to land core changes through drm-misc, then merge drm-misc-next
> > into msm-next and merge remaining msm-specific patches through the
> > msm-next tree.
> > 
> > [1] https://lore.kernel.org/dri-devel/20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org/
> > 
> > Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> > ---
> > Dmitry Baryshkov (6):
> >       drm/atomic-helper: add atomic_needs_modeset callbacks
> >       drm/mgag200: move format check to drm_plane_helper.atomic_needs_modeset
> >       drm/msm/dpu: stop upgrading commits by enabling allow_modeset
> >       drm/msm/dpu: move CTM check to drm_crtc_helper.atomic_needs_modeset
> >       drm/msm/dpu: use atomic_needs_modeset for CDM check
> >       drm/msm: drop msm_atomic_check wrapper
> > 
> >  drivers/gpu/drm/drm_atomic_helper.c         | 59 ++++++++++++++++++
> >  drivers/gpu/drm/mgag200/mgag200_drv.h       |  2 +
> >  drivers/gpu/drm/mgag200/mgag200_mode.c      | 27 ++++++---
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c    | 15 +++++
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 44 +++++++++-----
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h |  4 --
> >  drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 26 --------
> >  drivers/gpu/drm/msm/msm_atomic.c            | 29 ---------
> >  drivers/gpu/drm/msm/msm_drv.h               |  1 -
> >  drivers/gpu/drm/msm/msm_kms.c               |  2 +-
> >  drivers/gpu/drm/msm/msm_kms.h               |  7 ---
> >  include/drm/drm_modeset_helper_vtables.h    | 92 +++++++++++++++++++++++++++++
> >  12 files changed, 219 insertions(+), 89 deletions(-)
> > ---
> > base-commit: 0936f0e54426177b0f0263ddf806ed5e13487db6
> > change-id: 20250123-atomic-needs-modeset-8f6a8243a3f7
> > prerequisite-change-id: 20241222-drm-dirty-modeset-88079bd27ae6:v2
> > prerequisite-patch-id: 0c61aabfcd13651203f476985380cbf4d3c299e6
> > prerequisite-patch-id: c6026f08011c288fd301676e9fa6f46d0cc1dab7
> > prerequisite-patch-id: b0cb06d5c88791d6e4755d879ced0d5050aa3cbf
> > prerequisite-patch-id: fd72ddde9dba0df053113bc505c213961a9760da
> > 
> > Best regards,
> > -- 
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> -- 
> Ville Syrjälä
> Intel

-- 
Simona Vetter
Software Engineer, Intel Corporation
http://blog.ffwll.ch
