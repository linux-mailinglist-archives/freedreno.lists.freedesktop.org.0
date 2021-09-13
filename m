Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84B0D409B59
	for <lists+freedreno@lfdr.de>; Mon, 13 Sep 2021 19:57:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B718D6ECCF;
	Mon, 13 Sep 2021 17:57:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x831.google.com (mail-qt1-x831.google.com
 [IPv6:2607:f8b0:4864:20::831])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ECFD36ECCE
 for <freedreno@lists.freedesktop.org>; Mon, 13 Sep 2021 17:57:49 +0000 (UTC)
Received: by mail-qt1-x831.google.com with SMTP id t35so8878464qtc.6
 for <freedreno@lists.freedesktop.org>; Mon, 13 Sep 2021 10:57:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l+Z/gkmVCvsztDvwQKTtg9653j9bA3DsjkVqL1DsfRE=;
 b=ZTjRV66shwmj2cONWMz6N7yJ8CIb1rpv2xIwGXJTegcXg6y9l5BxWFca8wfHUbkUbr
 Yh7isYBmCzbTR0kQMLIX/LgKfFRiw9Fj/jGky4Tq3goU/wDelLMX9djzJboCSd1w9fC+
 21h/+ZhuS+zLXWNXBfC0OWs4y7mQJaQfHiNy5WYWuHLgOyBX8znaC3wVh9/uVxsUbVaK
 OVa/COnz9sMI4bSxrlaPiJn3xtwInduha2gQOMoEOWZ5EOHzgFCdOhdJEkQebi/OLOV8
 PCqxP7xRsYks3hJbnqu3mGWQsR1MPdOS5HSCcLeFUwCsFLhCOk32YzIpzEw7OXC0x/k1
 lbMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=l+Z/gkmVCvsztDvwQKTtg9653j9bA3DsjkVqL1DsfRE=;
 b=y8ex2RO+gzglT2YVdAJvg1GrWWwd2sss8zqZpXX60leFICbuX22SU1fcppNn6KSOvS
 ut6uQ4iYgBYh/LwPL+YG/Y9pLRaYv6nWBf8vMu8NG9C4ve0OA+IflojpIKS5RorKoQmX
 JxUL/NQ47XuH8kTKInlm492975VdziFjAIz498F0VevTFnRZQgJ29AszbkzXSjx6IDXc
 AKC6j6UgidXDUm7P/v7mBIyMLA+nVfa+6w86HpPg3h4sUrqmR9rxgZ/FX75Hq53HL0n0
 q+hRPfv84XhigpeYT395jrQwQD3qY81wZhN9mCqMLYq4nVD4upmnRatjzpPvkH/7cYaH
 85Gw==
X-Gm-Message-State: AOAM531UWxS64Aw8zEb5dC8FoObCJERjVGyyqWX93F2xbeqPrqDZqF5m
 S75iK5y/UvxmbtRm4ShMUmyUNug9/QuL7w==
X-Google-Smtp-Source: ABdhPJw8UyOvmhVyjPN/ZpDg5fwq/8CfA8xWtWK68mOOymsPtJuvjxAn4Tjy3QOlkHd3+SUvFRWKTQ==
X-Received: by 2002:ac8:5f09:: with SMTP id x9mr753242qta.103.1631555868924;
 Mon, 13 Sep 2021 10:57:48 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id s10sm5630845qko.134.2021.09.13.10.57.48
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 13 Sep 2021 10:57:48 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: Sean Paul <seanpaul@chromium.org>
Date: Mon, 13 Sep 2021 13:57:31 -0400
Message-Id: <20210913175747.47456-1-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 00/14] drm/hdcp: Pull HDCP auth/exchange/check
 into
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

From: Sean Paul <seanpaul@chromium.org>

Hello,
This patchset pulls the HDCP protocol auth/exchange/check logic out from
i915 into a HDCP helper library which drivers can use to implement the
proper protocol and UAPI interactions for achieving HDCP.

Originally this was all stuffed into i915 since it was the only driver
supporting HDCP. Over the last while I've been working on HDCP support
in the msm driver and have identified the parts which can/should be
shared between drivers and the parts which are hw-specific.

We can generalize all of the sink interactions in the helper as well as
state handling and link checks. This tends to be the trickiest part of
adding HDCP support, since the property state and locking is a bit of a
nightmare. The driver need only implement the more mechanical display
controller register accesses.

The first third of the pachset is establishing the helpers, the next
third is converting the i915 driver to use the helpers, and the last
third is the msm driver implementation.

I've left out HDCP 2.x support, since we still only have i915 as the
reference implementation and I'm not super comfortable speculating on
which parts are platform independent.

Please take a look,

Sean

Sean Paul (14):
  drm/hdcp: Add drm_hdcp_atomic_check()
  drm/hdcp: Avoid changing crtc state in hdcp atomic check
  drm/hdcp: Update property value on content type and user changes
  drm/hdcp: Expand HDCP helper library for enable/disable/check
  drm/i915/hdcp: Consolidate HDCP setup/state cache
  drm/i915/hdcp: Retain hdcp_capable return codes
  drm/i915/hdcp: Use HDCP helpers for i915
  drm/msm/dpu_kms: Re-order dpu includes
  drm/msm/dpu: Remove useless checks in dpu_encoder
  drm/msm/dpu: Remove encoder->enable() hack
  drm/msm/dp: Re-order dp_audio_put in deinit_sub_modules
  dt-bindings: msm/dp: Add bindings for HDCP registers
  drm/msm: Add hdcp register ranges to sc7180 device tree
  drm/msm: Implement HDCP 1.x using the new drm HDCP helpers

 .../bindings/display/msm/dp-controller.yaml   |   11 +-
 drivers/gpu/drm/drm_hdcp.c                    | 1198 ++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_atomic.c   |    7 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |   29 +-
 .../drm/i915/display/intel_display_debugfs.c  |   11 +-
 .../drm/i915/display/intel_display_types.h    |   58 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c  |  341 ++---
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   17 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     | 1011 +++-----------
 drivers/gpu/drm/i915/display/intel_hdcp.h     |   35 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  256 ++--
 drivers/gpu/drm/msm/Makefile                  |    1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   30 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |    2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |    4 -
 drivers/gpu/drm/msm/dp/dp_debug.c             |   49 +-
 drivers/gpu/drm/msm/dp/dp_debug.h             |    6 +-
 drivers/gpu/drm/msm/dp/dp_display.c           |   47 +-
 drivers/gpu/drm/msm/dp/dp_display.h           |    5 +
 drivers/gpu/drm/msm/dp/dp_drm.c               |   68 +-
 drivers/gpu/drm/msm/dp/dp_drm.h               |    5 +
 drivers/gpu/drm/msm/dp/dp_hdcp.c              |  433 ++++++
 drivers/gpu/drm/msm/dp/dp_hdcp.h              |   27 +
 drivers/gpu/drm/msm/dp/dp_parser.c            |   30 +-
 drivers/gpu/drm/msm/dp/dp_parser.h            |    4 +
 drivers/gpu/drm/msm/dp/dp_reg.h               |   44 +-
 drivers/gpu/drm/msm/msm_atomic.c              |   15 +
 include/drm/drm_hdcp.h                        |  194 +++
 29 files changed, 2570 insertions(+), 1385 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.h

-- 
Sean Paul, Software Engineer, Google / Chromium OS

