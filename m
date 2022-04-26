Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8FCB050EE17
	for <lists+freedreno@lfdr.de>; Tue, 26 Apr 2022 03:33:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3922B10F01A;
	Tue, 26 Apr 2022 01:33:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 39B8E10F01A
 for <freedreno@lists.freedesktop.org>; Tue, 26 Apr 2022 01:33:10 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id q14so20023154ljc.12
 for <freedreno@lists.freedesktop.org>; Mon, 25 Apr 2022 18:33:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=emP8+R538WvL1wuXgx0L4uWxHnnwA12+iVHtL5H27k4=;
 b=q4zAlbYpNPJS1sKjj8JkJ5+R/TKzcrw83UHN/N/XqNqPllkI0+joSo9+Xur0BvlZHj
 YcGt3PM1zODmwDMdqSetQkT/DZHxGf1JmOJSKgUcHt6a/8wk8KVk21XtYsjmE95+vf1U
 xykVZXnUeEuo4Iw7kIB5e92DQcYDAn+zWqGzM9Apuorp7FHm69E7Knu627vZhQRgBWa4
 wICCsEmJjLdbFAPblR1KK2NgenAnDRBxBAg2fa8+ThWiIg+cnZ7BzZLifV9wKAwZ6jI2
 HtZfsTor4lK23Pvp/yb+6+nwmeKp0307HghzbyCP4PEsbzsYhDxz8cGbaQeLeU3W6fs0
 K5Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=emP8+R538WvL1wuXgx0L4uWxHnnwA12+iVHtL5H27k4=;
 b=0hhBX1Vhv33Zepv6a3YBH6XFseS7ZAx+QL6bMiphe1YoOYbUCBvazHGbfFtgjcJBQC
 5JCGvXNtJgaxR1EmDhNA9bg/g1MqyPRNXncuX1gvqo2edDwCSmeaMI/cdpPHbugy6Swz
 YlCRXgf+5+gqgqIgr/Qt+7lu4YQ20VZcfDeEvi4J4hVFncSgHQ+lvp9u7qz0qbR1AnI/
 a+2rA5QmRQXHe97yQ0Qqb4ZauSed7jIhMOLv8hrZR1fCXjh5p9gp/PU7aPGRtZOWc+9e
 fhlwIfMIwX9k9xwkbfUc3HiggL7RXArL+b4VnN0+xM+ZkB1rNULZiG5wQkzZmRKf1WFy
 cGuA==
X-Gm-Message-State: AOAM530E1A/l77XGOmijtGTEU8eChp3vsZHyrXTcAbdETZO2ScOzH2dx
 KVxytMzeHP7rWMAuQkY2n9aW6A==
X-Google-Smtp-Source: ABdhPJxYACL031VdKnGYTh0aM3bFDRNZlcf3rNCEu42VGajhYmTAb/TRVeyN4tP7O4b47c2kWhkc9A==
X-Received: by 2002:a2e:9817:0:b0:24f:ad4:e912 with SMTP id
 a23-20020a2e9817000000b0024f0ad4e912mr7196797ljj.178.1650936788433; 
 Mon, 25 Apr 2022 18:33:08 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 t17-20020a2e4611000000b0024f0900dda2sm903990lja.49.2022.04.25.18.33.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 25 Apr 2022 18:33:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Date: Tue, 26 Apr 2022 04:33:07 +0300
Message-Id: <20220426013307.2880243-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PULL] drm/msm display pull request
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
Cc: freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Rob,

This is a pull request over the patches accumulated, reviewed and tested for
the 5.19 merge window. This pull request contains following changes:

 - DPU: DSC (Display Stream Compression) support
 - DPU: inline rotation support on SC7280
 - DPU: update DP timings to follow vendor recommendations
 - DP, DPU: add support for wide bus (on newer chipsets)
 - DP: eDP support
 - Merge DPU1 and MDP5 MDSS driver, make dpu/mdp device the master
   component
 - MDSS: optionally reset the IP block at the bootup to drop
   bootloader state
 - Properly register and unregister internal bridges in the DRM framework
 - Complete DPU IRQ cleanup
 - DP: conversion to use drm_bridge and drm_bridge_connector
 - Misc small fixes

This request still comes as a merge of several local branches. If you wish, I
can rebase them into a single stream of patches.

There are several other series which are very close to the merge (e.g. the
writeback support), so if the time permits I might send another pull request
later.

The following changes since commit 78f815c1cf8fc5f05dc5cec29eb1895cb53470e9:

  drm/msm: return the average load over the polling period (2022-04-21 15:05:23 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/lumag/msm.git msm-next-lumag

for you to fetch changes up to 7e7657dc3f145df9990494f17aebcbea163f4a84:

  Merge branches 'msm-next-lumag-core', 'msm-next-lumag-dpu', 'msm-next-lumag-dp', 'msm-next-lumag-dsi', 'msm-next-lumag-hdmi', 'msm-next-lumag-mdp5' and 'msm-next-lumag-mdp4' into msm-next-lumag (2022-04-26 04:08:20 +0300)

----------------------------------------------------------------
Abhinav Kumar (1):
      drm/msm: remove unused hotplug and edid macros from msm_drv.h

Bjorn Andersson (2):
      dt-bindings: display: msm: Add optional resets
      drm/msm/dpu: Issue MDSS reset during initialization

Chia-I Wu (1):
      drm/msm: add trace_dma_fence_emit to msm_gpu_submit

Dmitry Baryshkov (30):
      drm/msm: unify MDSS drivers
      drm/msm: remove extra indirection for msm_mdss
      drm/msm: split the main platform driver
      drm/msm: stop using device's match data pointer
      drm/msm: allow compile time selection of driver components
      drm/msm: make mdp5/dpu devices master components
      drm/msm: properly add and remove internal bridges
      drm/msm/dpu: remove manual destruction of DRM objects
      drm/msm: loop over encoders using drm_for_each_encoder()
      drm/msm: don't store created planes, connectors and encoders
      drm/msm: remove unused plane_property field from msm_drm_private
      drm/msm/dpu: don't use merge_3d if DSC merge topology is used
      drm/msm/dp: replace dp_connector with drm_bridge_connector
      drm/msm/dp: remove extra wrappers and public functions
      drm/msm/dp: drop dp_mode argument from dp_panel_get_modes()
      drm/msm/dp: simplify dp_connector_get_modes()
      drm/msm/dp: remove max_pclk_khz field from dp_panel/dp_display
      drm/msm/dpu: remove extra wrappers around dpu_core_irq
      drm/msm/dpu: remove always-true argument of dpu_core_irq_read()
      drm/msm/dpu: allow just single IRQ callback
      drm/msm/dpu: get rid of dpu_encoder_helper_(un)register_irq
      drm/msm/dpu: remove struct dpu_encoder_irq
      drm/msm/dpu: pass irq to dpu_encoder_helper_wait_for_irq()
      drm/msm/dpu: document INTF_EDP/INTF_DP difference
      drm/msm/dpu: drop INTF_TYPE_MAX symbol
      drm/msm/dpu: drop obsolete INTF_EDP comment
      drm/msm/dpu: drop INTF_EDP from interface type conditions
      drm/msm/dsi: fix error checks and return values for DSI xmit functions
      drm/msm: select DRM_DP_AUX_BUS for the AUX bus support
      Merge branches 'msm-next-lumag-core', 'msm-next-lumag-dpu', 'msm-next-lumag-dp', 'msm-next-lumag-dsi', 'msm-next-lumag-hdmi', 'msm-next-lumag-mdp5' and 'msm-next-lumag-mdp4' into msm-next-lumag

Guo Zhengkui (1):
      drm/msm: fix returnvar.cocci warning

Haowen Bai (1):
      drm/msm/mdp5: Eliminate useless code

Kuogee Hsieh (7):
      drm/msm/dpu: adjust display_v_end for eDP and DP
      drm/msm/dpu: replace BIT(x) with correspond marco define string
      drm/msm/dpu: revise timing engine programming to support widebus feature
      drm/msm/dp: enable widebus feature for display port
      drm/msm/dp: replace DRM_DEBUG_DP marco with drm_dbg_dp
      drm/msm/dp: stop event kernel thread when DP unbind
      drm/msm/dp: tear down main link at unplug handle immediately

Lv Ruyi (4):
      drm: msm: fix error check return value of irq_of_parse_and_map()
      drm/msm/dp: fix error check return value of irq_of_parse_and_map()
      drm/msm/hdmi: fix error check return value of irq_of_parse_and_map()
      drm/msm/dpu: fix error check return value of irq_of_parse_and_map()

Marijn Suijten (1):
      drm/msm/dpu: Bind pingpong block to intf on active ctls in cmd encoder

Sankeerth Billakanti (4):
      drm/msm/dp: Add eDP support via aux_bus
      drm/msm/dp: Support only IRQ_HPD and REPLUG interrupts for eDP
      drm/msm/dp: wait for hpd high before aux transaction
      drm/msm/dp: Support the eDP modes given by panel

Tom Rix (1):
      drm/msm: change msm_sched_ops from global to static

Vinod Koul (13):
      drm/msm/dsi: add support for dsc data
      drm/msm/dsi: Pass DSC params to drm_panel
      drm/msm/disp/dpu1: Add support for DSC
      drm/msm/disp/dpu1: Add support for DSC in pingpong block
      drm/msm/disp/dpu1: Add DSC for SDM845 to hw_catalog
      drm/msm/disp/dpu1: Add DSC support in hw_ctl
      drm/msm/disp/dpu1: Add support for DSC in encoder
      drm/msm: Add missing num_dspp field documentation
      drm/msm/disp/dpu1: Add support for DSC in topology
      drm/msm/disp/dpu1: Add DSC support in RM
      drm/msm/dsi: add mode valid callback for dsi_mgr
      drm/msm: Update generated headers
      drm/msm/dsi: Add support for DSC configuration

Vinod Polimera (3):
      drm/msm/disp/dpu1: add inline function to validate format support
      drm/msm/disp/dpu1: add inline rotation support for sc7280
      drm/msm/disp/dpu1: set vbif hw config to NULL to avoid use after memory free during pm runtime resume

Yang Yingliang (1):
      drm/msm/hdmi: check return value after calling platform_get_resource_byname()

 .../bindings/display/msm/dpu-qcm2290.yaml          |   4 +
 .../bindings/display/msm/dpu-sc7180.yaml           |   4 +
 .../bindings/display/msm/dpu-sc7280.yaml           |   4 +
 .../bindings/display/msm/dpu-sdm845.yaml           |   4 +
 drivers/gpu/drm/msm/Kconfig                        |  51 ++-
 drivers/gpu/drm/msm/Makefile                       |  26 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h       |  32 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 282 +++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  10 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  55 +--
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   | 112 +++---
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  79 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        |  22 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  63 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  29 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         | 215 +++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |  80 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  | 157 +++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  62 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |  22 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |  32 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |  14 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 168 +++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  13 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c           | 260 -------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 139 +++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  56 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |   1 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |  67 ++--
 drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c   |   3 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  64 ++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c   |   3 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |  80 ++--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c          | 252 ------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |   2 -
 drivers/gpu/drm/msm/dp/dp_audio.c                  |  50 ++-
 drivers/gpu/drm/msm/dp/dp_aux.c                    |  21 +-
 drivers/gpu/drm/msm/dp/dp_aux.h                    |   3 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c                |  98 +++--
 drivers/gpu/drm/msm/dp/dp_catalog.h                |   3 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 150 ++++---
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   2 +
 drivers/gpu/drm/msm/dp/dp_debug.c                  |   2 -
 drivers/gpu/drm/msm/dp/dp_display.c                | 429 +++++++++++++--------
 drivers/gpu/drm/msm/dp/dp_display.h                |   7 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                    | 215 +++--------
 drivers/gpu/drm/msm/dp/dp_drm.h                    |  22 +-
 drivers/gpu/drm/msm/dp/dp_link.c                   | 103 +++--
 drivers/gpu/drm/msm/dp/dp_panel.c                  |  49 ++-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |   3 +-
 drivers/gpu/drm/msm/dp/dp_parser.c                 |  25 +-
 drivers/gpu/drm/msm/dp/dp_parser.h                 |  14 +-
 drivers/gpu/drm/msm/dp/dp_power.c                  |  25 +-
 drivers/gpu/drm/msm/dsi/dsi.c                      |   6 +-
 drivers/gpu/drm/msm/dsi/dsi.h                      |   3 +
 drivers/gpu/drm/msm/dsi/dsi.xml.h                  |  80 ++++
 drivers/gpu/drm/msm/dsi/dsi_host.c                 | 297 +++++++++++++-
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |  15 +
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |  11 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |   3 +
 drivers/gpu/drm/msm/msm_drv.c                      | 264 +++----------
 drivers/gpu/drm/msm/msm_drv.h                      | 139 ++++---
 drivers/gpu/drm/msm/msm_gpu.c                      |   2 +
 drivers/gpu/drm/msm/msm_kms.h                      |  21 -
 drivers/gpu/drm/msm/msm_mdss.c                     | 416 ++++++++++++++++++++
 drivers/gpu/drm/msm/msm_ringbuffer.c               |   2 +-
 include/drm/drm_panel.h                            |   7 +
 72 files changed, 3004 insertions(+), 1979 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
 delete mode 100644 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
 create mode 100644 drivers/gpu/drm/msm/msm_mdss.c
