Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1982A445E33
	for <lists+freedreno@lfdr.de>; Fri,  5 Nov 2021 04:04:42 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A79D6E4DD;
	Fri,  5 Nov 2021 03:04:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-xf2b.google.com (mail-qv1-xf2b.google.com
 [IPv6:2607:f8b0:4864:20::f2b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D01956E4D7
 for <freedreno@lists.freedesktop.org>; Fri,  5 Nov 2021 03:04:36 +0000 (UTC)
Received: by mail-qv1-xf2b.google.com with SMTP id bu11so6652979qvb.0
 for <freedreno@lists.freedesktop.org>; Thu, 04 Nov 2021 20:04:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uAU6dnnEYD9i5S7gP/jLUoVaoIHqY4uwtn3zb5N7wrY=;
 b=I1z5iypCF7aJY/+07bJmHEIQYJ2afl5l/Pgr51Ndmbq2KiywF0/Zgxg4m2Lf+9GR7e
 JvHhaRCyfT2PrPB1r/W05MUI7RAs6kw7+FHsnc5L87j2unop7gqwW19y4QmBVdXTptYd
 mk+M87DZ9h1Vj5jTddKiQ+LNBI8JbTMvR0OIBz95nPKpAKzvHTRIcVde3tP60qVA15ca
 T29CEC9sWGaC51HkYnC3MFmCC/oYMxsQ/EFlE5GRzyhPtM/mnWxM538wgSubvpqUUJLR
 grSR+i6k487DbfQk1eVtBJPDHxHHUn9iIPHXbO9UWUlQ/GAzDpk1Ll/+JfPYhRbvpdiz
 JCtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=uAU6dnnEYD9i5S7gP/jLUoVaoIHqY4uwtn3zb5N7wrY=;
 b=JZpcUeunLjzFQ2v/KKG5i9nJwkprmZC4WyOCsOWvWBIncJuCVxxYNNtpDMHCCjHy4C
 UgVVgSm5ND5tJwjac7pzCFBcuY9vYw0hzopt/CSVGA4VTueoEuJI6mbgciba2gXmfgSz
 dG6J61BDMURnhEhXmQmV9mSNPZqFGOuFy9ll4+UwbZhISrcoFFvuFU9A6nrKU129MXGc
 jvvs+sL7HXkKCc8mQ4YyrT2LmQfo1fs5kB6EFYN4jHEK8oC3f9jovWwcqtru4rjeJHbS
 WfBRHwWDnTm110nzSGEL6YWC2h/1GKBnrOGupen3Nzw6rHR9922zOENBFTfJvCVFsjvK
 vPDg==
X-Gm-Message-State: AOAM5314dvFUd1p7EN53NOrm4NBnXzUmbKWI5SA6bam+rAPsOvjl61zW
 WH+GEfjosJVAWKgq4cFqbeMPig==
X-Google-Smtp-Source: ABdhPJxhU8Uiixiiz5ovWl8R3t2XSQDyZmRO1/dg4+89s7y0G/5FQ13ZItb6GMsmRNFjCAi5AZSEQg==
X-Received: by 2002:a05:6214:20e3:: with SMTP id
 3mr2464753qvk.47.1636081475815; 
 Thu, 04 Nov 2021 20:04:35 -0700 (PDT)
Received: from localhost ([167.100.64.199])
 by smtp.gmail.com with ESMTPSA id d23sm2309986qkj.96.2021.11.04.20.04.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Nov 2021 20:04:35 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Date: Thu,  4 Nov 2021 23:04:17 -0400
Message-Id: <20211105030434.2828845-1-sean@poorly.run>
X-Mailer: git-send-email 2.33.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 00/14] drm/hdcp: Pull HDCP
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
Cc: jani.nikula@intel.com, swboyd@chromium.org,
 Sean Paul <seanpaul@chromium.org>, abhinavk@codeaurora.org,
 bjorn.andersson@linaro.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Sean Paul <seanpaul@chromium.org>

Just me with another revision of HDCP support for msm.

This v4 patch series is mostly a retread of v3 with the following
changes:
- rebased on Bjorn's displayport-controller register refactor
- another change to the dt bindings to remove the compatible string added in v3
- updated review tags

I'm missing reviews on the core, i915 patches, and the final patch. It would be
fantastic to get some feedback on these before the set once again drifts too far
from -tip and I need a painful rebase :-)

Thank you to the reviewers for their feedback thus far!

Please take a look,

Sean

Link: https://patchwork.freedesktop.org/series/94623/ #v1
Link: https://patchwork.freedesktop.org/series/94713/ #v2
Link: https://patchwork.freedesktop.org/series/94712/ #v3

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
  arm64: dts: qcom: sc7180: Add support for HDCP in dp-controller
  drm/msm: Implement HDCP 1.x using the new drm HDCP helpers

 .../bindings/display/msm/dp-controller.yaml   |    8 +-
 arch/arm64/boot/dts/qcom/sc7180.dtsi          |    8 +-
 drivers/gpu/drm/drm_hdcp.c                    | 1197 ++++++++++++++++-
 drivers/gpu/drm/i915/display/intel_atomic.c   |    7 +-
 drivers/gpu/drm/i915/display/intel_ddi.c      |   29 +-
 .../drm/i915/display/intel_display_debugfs.c  |   11 +-
 .../drm/i915/display/intel_display_types.h    |   58 +-
 drivers/gpu/drm/i915/display/intel_dp_hdcp.c  |  345 ++---
 drivers/gpu/drm/i915/display/intel_dp_mst.c   |   17 +-
 drivers/gpu/drm/i915/display/intel_hdcp.c     | 1011 +++-----------
 drivers/gpu/drm/i915/display/intel_hdcp.h     |   36 +-
 drivers/gpu/drm/i915/display/intel_hdmi.c     |  256 ++--
 drivers/gpu/drm/msm/Makefile                  |    1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   30 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |    2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |    4 -
 drivers/gpu/drm/msm/dp/dp_debug.c             |   46 +-
 drivers/gpu/drm/msm/dp/dp_debug.h             |    6 +-
 drivers/gpu/drm/msm/dp/dp_display.c           |   48 +-
 drivers/gpu/drm/msm/dp/dp_display.h           |    5 +
 drivers/gpu/drm/msm/dp/dp_drm.c               |   68 +-
 drivers/gpu/drm/msm/dp/dp_drm.h               |    5 +
 drivers/gpu/drm/msm/dp/dp_hdcp.c              |  462 +++++++
 drivers/gpu/drm/msm/dp/dp_hdcp.h              |   27 +
 drivers/gpu/drm/msm/dp/dp_parser.c            |   20 +-
 drivers/gpu/drm/msm/dp/dp_parser.h            |    4 +
 drivers/gpu/drm/msm/dp/dp_reg.h               |   32 +-
 drivers/gpu/drm/msm/msm_atomic.c              |   15 +
 include/drm/drm_hdcp.h                        |  194 +++
 30 files changed, 2592 insertions(+), 1377 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.c
 create mode 100644 drivers/gpu/drm/msm/dp/dp_hdcp.h

-- 
Sean Paul, Software Engineer, Google / Chromium OS

