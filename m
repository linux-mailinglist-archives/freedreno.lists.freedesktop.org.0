Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D231940CE1D
	for <lists+freedreno@lfdr.de>; Wed, 15 Sep 2021 22:38:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 55BD96EA2A;
	Wed, 15 Sep 2021 20:38:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x835.google.com (mail-qt1-x835.google.com
 [IPv6:2607:f8b0:4864:20::835])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 576416EA2B
 for <freedreno@lists.freedesktop.org>; Wed, 15 Sep 2021 20:38:40 +0000 (UTC)
Received: by mail-qt1-x835.google.com with SMTP id d11so3618360qtw.3
 for <freedreno@lists.freedesktop.org>; Wed, 15 Sep 2021 13:38:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xeRLmgfKFXSNrBEqFH+XDGPxoP99dQXEItJsdczm5RY=;
 b=VZQiBzTZEdVgVXSsmOIfrfUILdxqFnEFuvX8dafusu4T89rZdldoiwI0yE0ymDMx72
 mlDmWhVQWQ7EDJvU1YeRm8R5MhdoYgARcWfuy76wTva9al70sBQjb8+AmUopyyjPd9LD
 9TNUXEgALKQIQaioRf8mz5+WD1/9M1bR9T6dbFFYgwQJAbqiwXngONr4t6u9iVaXQOTq
 +ae7TP4gVSYUogAH81KBZidLBq4ieZ8ctMEPdpleT15b3q+XAF5mt3ly+H/UFztvlC6k
 0NFYSi/JL1TvfoqYgJBjgPCsob1KFkj4wz0RE2NWWbDUjaIO7LdOWNDRBvELGSv3BXpN
 RgCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=xeRLmgfKFXSNrBEqFH+XDGPxoP99dQXEItJsdczm5RY=;
 b=QO34VLU4FodmR/kAcza1uU7AfsbNC6Cf9yWd4HSOgtbDoUkW6rkni0BgErXF+2Ffcu
 AmUPl8jKJqoCeiyiYI6IM0IgEJeST92IAFECB03RAtlGlrfcPIccBuU7RTjxz9yHj053
 nBq9U8AxLc5uJNzURSctjHxLrd1otarvRYTeQvIPwb/M28BsAusFMENfa0mMzR0J4OtG
 LrZY0Nxfu7ZGfIZe8ew5/DXv9SEqZTbjpMe6K2OLiv6aL6pc6TTh62uqM+xlrnVc+ih9
 paCDGLy6EKIONP8HmwY6smE2c4BhY3J3/qa46iy4Ao+ryR0b0urM+jXtUcXrJEK6/O7N
 bORQ==
X-Gm-Message-State: AOAM533+/xq2oZKUXITLqoTSph3ieigZ55NOKyVmVxkA7I7NV6RDqXA1
 akqWIPWqK3xl2qAPn+8SxXf+EQ==
X-Google-Smtp-Source: ABdhPJyhYBe2sSzQKivDQaRBW5ncUqjFOL3+neOAsrVNmtqJMfZPWYpJtAb2qTIDvtX/TtzUhYf/og==
X-Received: by 2002:ac8:c82:: with SMTP id n2mr1782692qti.207.1631738319454;
 Wed, 15 Sep 2021 13:38:39 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id h9sm833644qkl.4.2021.09.15.13.38.38
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 15 Sep 2021 13:38:38 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Cc: swboyd@chromium.org,
	Sean Paul <seanpaul@chromium.org>
Date: Wed, 15 Sep 2021 16:38:19 -0400
Message-Id: <20210915203834.1439-1-sean@poorly.run>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 00/13] drm/hdcp: Pull HDCP
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Hello again,
This is the second version of the HDCP helper patchset. See version 1
here: https://patchwork.freedesktop.org/series/94623/

In this second version, I've fixed up the oopsies exposed by 0-day and
yamllint and incorporated early review feedback from the dt/dts reviews.

Please take a look,

Sean

Sean Paul (13):
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
  drm/msm: Implement HDCP 1.x using the new drm HDCP helpers

 .../bindings/display/msm/dp-controller.yaml   |    7 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |    4 +-
 drivers/gpu/drm/drm_hdcp.c                    | 1197 ++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_atomic.c   |    7 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |   29 +-
 .../drm/i915/display/intel_display_debugfs.c  |   11 +-
 .../drm/i915/display/intel_display_types.h    |   58 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c  |  345 ++---
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
 drivers/gpu/drm/msm/dp/dp_parser.c            |   22 +-
 drivers/gpu/drm/msm/dp/dp_parser.h            |    4 +
 drivers/gpu/drm/msm/dp/dp_reg.h               |   44 +-
 drivers/gpu/drm/msm/msm_atomic.c              |   15 +
 include/drm/drm_hdcp.h                        |  194 +++
 30 files changed, 2561 insertions(+), 1389 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.h

-- 
Sean Paul, Software Engineer, Google / Chromium OS

