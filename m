Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 589A66B9973
	for <lists+freedreno@lfdr.de>; Tue, 14 Mar 2023 16:35:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E0E0710E849;
	Tue, 14 Mar 2023 15:35:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0229D10E83F
 for <freedreno@lists.freedesktop.org>; Tue, 14 Mar 2023 15:35:47 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id g18so16471574ljl.3
 for <freedreno@lists.freedesktop.org>; Tue, 14 Mar 2023 08:35:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678808146;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=dDdFsS1jiDMqM3DzNBOspA41ZkDPAbEzOGcQYfHY7bY=;
 b=UtaPZF1lqlcFBdhV8b8AXRNfZFHfPBKxqloVJuduvYtUY7nLbJamqg09AhDYS4lh3V
 jIoGfXV7ZWPVO9hPX5eaLPuYcVCO/XP8Ab17S6pxtFzdxCFtOVHrUL+ogjgfYfI9f4MQ
 MEVDIYNPR/zDiQ2UeVotkOc+DSClf0NdxSyGW8Bfuxu4WaLQ7HD9nmvCxa8/ZCr+ALkh
 H7kYZfnK6iWi1/2xOKEc676giCpJiAexDGQabznx2GanxviwhePseX8A+4ROyE3VHYYH
 jS/vcruFAdMUSelz+TfxEYv/3iwbXPD67rTO+FfydiGMLQK5zvC+CXMUuuaX4Q9vlDDM
 //rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678808146;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=dDdFsS1jiDMqM3DzNBOspA41ZkDPAbEzOGcQYfHY7bY=;
 b=Rt/4Q485AFh7tnzm1FQxHU15NpEC/dfmdrebHSHDbhboKlCq3CCxvyaKOPdIroCg1B
 sYi/TaAlFho84WDiP3JBRpACJdDqFzzKmrIfLft21T3hDVSiWdF0KPVEhUO86SbHV2Ex
 weLeXl1bdibxMFP7XNRZ+1fSzdhifSxGRIDkwEkjSLIIFIagvWmUSMPQc8QFRNUb02XD
 4Vzk9DCY+hl0wDygjUGOn6mRmcg/0I/H5eJPtc0epd1WA88zbSkwXLcoBWfWZIGIywDn
 PC8288+PHRSBd/PcaPk9eLg5lo0x1AGnqoNY5Ac5ti7QiRO+4e8GFQrRfRTHLpUZ9hH1
 T3VA==
X-Gm-Message-State: AO0yUKVwutpZCdrZwZwJWW+AvSzNWy0CGCYfrTv5k8M7ajmpHngc2b3t
 GBQ1nd2ISgh/tse4DmmvsStm/w==
X-Google-Smtp-Source: AK7set8rirzvbek2Df3pFfcMGfbgU0WgIHZmrN78ZucZoeJsBu7L6cnTeQ/8pGn8GMD/HExW7Z9g6A==
X-Received: by 2002:a2e:909a:0:b0:295:a829:1c57 with SMTP id
 l26-20020a2e909a000000b00295a8291c57mr12088304ljg.20.1678808146201; 
 Tue, 14 Mar 2023 08:35:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z8-20020a2eb528000000b0029573844d03sm470854ljm.109.2023.03.14.08.35.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 08:35:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 14 Mar 2023 18:35:13 +0300
Message-Id: <20230314153545.3442879-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 00/32] drm/msm/dpu: wide planes support
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This patchset brings in multirect usage to support using two SSPP
rectangles for a single plane. Full virtual planes support is omitted
from this pull request, it will come later.

Abhinav, note, I removed your Tested-by tag for now, pending additional
verification from your side.

Changes since v5:
- Rephrased wide planes commit message
- Fixed line width check for UBWC formats (Abhinav)
- Also drop struct dpu_multirect_plane_states, unused now

Changes since v4:
- Incorporate two fixes and two cleanup patches from Abhinav

Changes since v3:

- moved if (!pipe->sspp) checks back to the calling site, the caller
  should know if there is a backing SSPP or not.
- Restored state_idx argument of trace_dpu_crtc_setup_mixer trace point
- Removed .smart_dma_rev from dpu_caps
- Added cleaning of multirect to _dpu_plane_atomic_disable()
- Per Abhinavs request split the SmartDMA enablement patch into the
  "verified by me" and "the rest of the platforms" patches, which is not
  supposed to be merged in. Users of other platforms are supposed to
  verify multirect support on their platforms and then send patches
  enabling SmartDMA for their SoC.
- Expanded several commit messages

Changes since v2:

- Renamed dpu_hw_pipe_cfg to dpu_hw_sspp_cfg
- Added a patch to clean up src add / layout for the solid fill planes
- Fixed several comments and commit messages which caused confusion
- Added documentation for new dpu_plane_state members
- Slightly reworked dpu_plane_atomic_check() to make it more logical and obvious.

Changes since v1 (which was ages ago):
- Rebased on top of 6.2-rc1
- Dropped the controversial _dpu_crtc_blend_setup() split patch
- Renamed dpu_hw_pipe to dpu_hw_sspp
- Other misc changes

Abhinav Kumar (2):
  drm/msm/dpu: log the multirect_index in _dpu_crtc_blend_setup_pipe
  drm/msm/dpu: remove unused dpu_plane_validate_multirect_v2 function

Dmitry Baryshkov (30):
  drm/msm/dpu: rename struct dpu_hw_pipe(_cfg) to dpu_hw_sspp(_cfg)
  drm/msm/dpu: move SSPP allocation to the RM
  drm/msm/dpu: move SSPP debugfs creation to dpu_kms.c
  drm/msm/dpu: drop EAGAIN check from dpu_format_populate_layout
  drm/msm/dpu: move pipe_hw to dpu_plane_state
  drm/msm/dpu: drop dpu_plane_pipe function
  drm/msm/dpu: introduce struct dpu_sw_pipe
  drm/msm/dpu: use dpu_sw_pipe for dpu_hw_sspp callbacks
  drm/msm/dpu: pass dpu_format to _dpu_hw_sspp_setup_scaler3()
  drm/msm/dpu: clean up SRC addresses when setting up SSPP for solid
    fill
  drm/msm/dpu: move stride programming to
    dpu_hw_sspp_setup_sourceaddress
  drm/msm/dpu: remove dpu_hw_fmt_layout from struct dpu_hw_sspp_cfg
  drm/msm/dpu: rename dpu_hw_sspp_cfg to dpu_sw_pipe_cfg
  drm/msm/dpu: drop src_split and multirect check from
    dpu_crtc_atomic_check
  drm/msm/dpu: don't use unsupported blend stages
  drm/msm/dpu: move the rest of plane checks to dpu_plane_atomic_check()
  drm/msm/dpu: drop redundant plane dst check from
    dpu_crtc_atomic_check()
  drm/msm/dpu: rewrite plane's QoS-related functions to take dpu_sw_pipe
    and dpu_format
  drm/msm/dpu: make _dpu_plane_calc_clk accept mode directly
  drm/msm/dpu: add dpu_hw_sspp_cfg to dpu_plane_state
  drm/msm/dpu: simplify dpu_plane_validate_src()
  drm/msm/dpu: rework dpu_plane_sspp_atomic_update()
  drm/msm/dpu: rework dpu_plane_atomic_check()
  drm/msm/dpu: rework plane CSC setting
  drm/msm/dpu: rework static color fill code
  drm/msm/dpu: split pipe handling from _dpu_crtc_blend_setup_mixer
  drm/msm/dpu: add support for wide planes
  drm/msm/dpu: populate SmartDMA features in hw catalog
  drm/msm/dpu: enable SmartDMA for the rest of the platforms
  drm/msm/dpu: drop smart_dma_rev from dpu_caps

 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c      | 290 ++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.c   |  10 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  20 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 169 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   | 111 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  18 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     | 850 +++++++++---------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h     |  40 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  22 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |  12 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |  19 +-
 12 files changed, 709 insertions(+), 854 deletions(-)

-- 
2.30.2

