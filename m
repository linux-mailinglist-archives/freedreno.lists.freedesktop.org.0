Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D7A6C5017A6
	for <lists+freedreno@lfdr.de>; Thu, 14 Apr 2022 18:00:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 711E410E28F;
	Thu, 14 Apr 2022 16:00:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BF7A10E146
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 16:00:38 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id hu11so4297157qvb.7
 for <freedreno@lists.freedesktop.org>; Thu, 14 Apr 2022 09:00:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to;
 bh=7eaHHFtd1RPN3Z/Kt74RCD3nqCFekvmQchrcxgikn2Q=;
 b=ViceBsfKRlCjYXE8w9M0Ly2mtX6a29V/pF9e7tjaGE0IFIltNoR7/E364digeB3lp1
 dFhSKP98+dhtuaxj+4vdtm2BKc4EuTBjlrD7iZgXhDw4UUb+JQGBFJmcqkeji1498qIv
 e7ZhAHzJsww2qCxsXc8pgWppqGRZY0YBO2Y0aReUwAraUGwwx6M+W5OwW8tKv4V2X/Lj
 y5cVDi+//QmwsYvsue903WZALHaIMHEhCEjrJdzD60HOXersoQND8fIa4ETuVOFECVzt
 ojGW+W+0lcPKTxp7MjJED6ParcgwThJT0FYbkCamzFFlfkYg7yLJk3vR0tLxMvBh8+SH
 IQvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to;
 bh=7eaHHFtd1RPN3Z/Kt74RCD3nqCFekvmQchrcxgikn2Q=;
 b=E/5i1Axtb+AoIu6GAUPZF3HiLmYejQA3/scfwk2rADWJKT33xyXFzcWn1+tztH3dhB
 WA0tjkh9lnrrQiGVhKno52mN9x6X7feOSzqNieIv2Ux2k+HtSD7M0wD1nfl7Y3iJ2o1q
 DMPMetGZB1mDV2R6ZqsOU0o9ILOFJLk8GGlCucTOxGeI8shIACcPx9Bo/QPN+q0GkPCn
 ecjXQPDRMwo9xVavyldWNhe2inl0vNzLBrsq27p1TP25Pz2JVMjY2q94WvOUtC6N4flK
 9JULGXIR0VymWUxXEZ6dgqBC1fkgjwlssL2xxXGwPVujXtMfoxD7iLPyyHGPENTBGxFv
 /JIw==
X-Gm-Message-State: AOAM533us6lkzPlE6m6dDO2BUo28pzdsYp5bl4SmR22vhA0GVfRKCJ+e
 QkVyh9tBrzzE2RDg9TwEIIjBsA==
X-Google-Smtp-Source: ABdhPJw1Vk+DzcHcH9DvZ8s4hHv441rcD9Ubypkzl7T8m363ZCNSw8uiOgCDZgXK1dX+g72QZWadEA==
X-Received: by 2002:a0c:8151:0:b0:42c:2329:91a0 with SMTP id
 75-20020a0c8151000000b0042c232991a0mr3974014qvc.107.1649952037207; 
 Thu, 14 Apr 2022 09:00:37 -0700 (PDT)
Received: from localhost (115.25.199.35.bc.googleusercontent.com.
 [35.199.25.115]) by smtp.gmail.com with ESMTPSA id
 o20-20020a05620a229400b0069c70250fe5sm1114845qkh.55.2022.04.14.09.00.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 14 Apr 2022 09:00:36 -0700 (PDT)
Date: Thu, 14 Apr 2022 16:00:35 +0000
From: Sean Paul <sean@poorly.run>
To: Rodrigo Vivi <rodrigo.vivi@intel.com>
Message-ID: <YlhFIycEACT4GbKt@art_vandelay>
References: <20220411204741.1074308-1-sean@poorly.run>
 <YlWBjy5lxtuGZ4vm@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YlWBjy5lxtuGZ4vm@intel.com>
Subject: Re: [Freedreno] [PATCH v5 00/10] drm/hdcp: Pull HDCP
 auth/exchange/check into helpers
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
Cc: jani.nikula@intel.com, Sean Paul <sean@poorly.run>,
 intel-gfx@lists.freedesktop.org, dri-devel@lists.freedesktop.org,
 bjorn.andersson@linaro.org, Sean Paul <seanpaul@chromium.org>,
 abhinavk@codeaurora.org, markyacoub@chromium.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, Apr 12, 2022 at 09:41:35AM -0400, Rodrigo Vivi wrote:
> On Mon, Apr 11, 2022 at 08:47:29PM +0000, Sean Paul wrote:
> > From: Sean Paul <seanpaul@chromium.org>
> > 
> > Rebased set from November. Fixed a nit from Stephen in the msm patch and
> > moved hdcp registers into the trogdor dtsi file to avoid differences
> > with sc7180-based windows devices. The set is 4 patches lighter since
> > some of the changes were accepted into msm.
> > 
> > I'm still waiting for Intel review of the first 7 patches. Rodrigo/Jani,
> > would you please provide your input so we can move forward with this
> > set?
> 
> I'm a bit concerned with patches 4 and 7. It is hard to map the removals
> and additions and there are some changes that looks like changing behaviors,
> but end up not being clear in the big patch. Also with big patch it is prune
> to the rebasing and backport conflicts.

I had the same concerns when I was writing this. I originally had it split up,
but it seemed really cluttered with 2 sets of helpers (intel-internal + drm)
that worked slightly differently.

I'll try again now that some time has passed, perhaps a fresh look will help.

Sean

> 
> Would be possible to split some work in moving individual functions from i915
> to drm little by little with smaller patches?
> 
> But thank you for this great work. It is also good to align our drm drivers.
> 
> Thanks,
> Rodrigo.
> 
> > 
> > Thanks,
> > 
> > Sean
> > 
> > Link: https://patchwork.freedesktop.org/series/94623/ #v1
> > Link: https://patchwork.freedesktop.org/series/94713/ #v2
> > Link: https://patchwork.freedesktop.org/series/94712/ #v3
> > Link: https://patchwork.freedesktop.org/series/94712/ #v4
> > 
> > Sean Paul (10):
> >   drm/hdcp: Add drm_hdcp_atomic_check()
> >   drm/hdcp: Avoid changing crtc state in hdcp atomic check
> >   drm/hdcp: Update property value on content type and user changes
> >   drm/hdcp: Expand HDCP helper library for enable/disable/check
> >   drm/i915/hdcp: Consolidate HDCP setup/state cache
> >   drm/i915/hdcp: Retain hdcp_capable return codes
> >   drm/i915/hdcp: Use HDCP helpers for i915
> >   dt-bindings: msm/dp: Add bindings for HDCP registers
> >   arm64: dts: qcom: sc7180: Add support for HDCP in dp-controller
> >   drm/msm: Implement HDCP 1.x using the new drm HDCP helpers
> > 
> >  .../bindings/display/msm/dp-controller.yaml   |    7 +-
> >  arch/arm64/boot/dts/qcom/sc7180-trogdor.dtsi  |    8 +
> >  arch/arm64/boot/dts/qcom/sc7180.dtsi          |    6 +-
> >  drivers/gpu/drm/drm_hdcp.c                    | 1197 ++++++++++++++++-
> >  drivers/gpu/drm/i915/display/intel_atomic.c   |    7 +-
> >  drivers/gpu/drm/i915/display/intel_ddi.c      |   29 +-
> >  .../drm/i915/display/intel_display_debugfs.c  |   11 +-
> >  .../drm/i915/display/intel_display_types.h    |   58 +-
> >  drivers/gpu/drm/i915/display/intel_dp_hdcp.c  |  345 ++---
> >  drivers/gpu/drm/i915/display/intel_dp_mst.c   |   17 +-
> >  drivers/gpu/drm/i915/display/intel_hdcp.c     | 1011 +++-----------
> >  drivers/gpu/drm/i915/display/intel_hdcp.h     |   36 +-
> >  drivers/gpu/drm/i915/display/intel_hdmi.c     |  256 ++--
> >  drivers/gpu/drm/msm/Makefile                  |    1 +
> >  drivers/gpu/drm/msm/dp/dp_debug.c             |   46 +-
> >  drivers/gpu/drm/msm/dp/dp_debug.h             |    6 +-
> >  drivers/gpu/drm/msm/dp/dp_display.c           |   46 +-
> >  drivers/gpu/drm/msm/dp/dp_display.h           |    5 +
> >  drivers/gpu/drm/msm/dp/dp_drm.c               |   68 +-
> >  drivers/gpu/drm/msm/dp/dp_drm.h               |    5 +
> >  drivers/gpu/drm/msm/dp/dp_hdcp.c              |  453 +++++++
> >  drivers/gpu/drm/msm/dp/dp_hdcp.h              |   27 +
> >  drivers/gpu/drm/msm/dp/dp_parser.c            |   20 +-
> >  drivers/gpu/drm/msm/dp/dp_parser.h            |    4 +
> >  drivers/gpu/drm/msm/dp/dp_reg.h               |   32 +-
> >  drivers/gpu/drm/msm/msm_atomic.c              |   15 +
> >  include/drm/drm_hdcp.h                        |  194 +++
> >  27 files changed, 2582 insertions(+), 1328 deletions(-)
> >  create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.c
> >  create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.h
> > 
> > -- 
> > Sean Paul, Software Engineer, Google / Chromium OS
> > 

-- 
Sean Paul, Software Engineer, Google / Chromium OS
