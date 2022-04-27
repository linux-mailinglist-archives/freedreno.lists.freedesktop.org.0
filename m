Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 61A0451152C
	for <lists+freedreno@lfdr.de>; Wed, 27 Apr 2022 12:51:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D24010F160;
	Wed, 27 Apr 2022 10:51:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C94D910F167
 for <freedreno@lists.freedesktop.org>; Wed, 27 Apr 2022 10:50:58 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id x17so2393711lfa.10
 for <freedreno@lists.freedesktop.org>; Wed, 27 Apr 2022 03:50:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s2R1ZBFLcViNxT9GBsRQQmdNmOkTfzCY5fgFHxSunJ4=;
 b=eO3Nanp4fJ9r3kU/Qdsc+lyLHD3KT/qXdDl8WBg5UcaQegia6AdY29Mk0L0iYrDvyD
 CruTcearXpRERNoyZb+DfOthwXbVMVQmzzN5F9wy3900CR55Yw6KZ25Ai4g/nUvKnN+P
 z3fXjUtoFvfQZsO2GCaVIdn5cvfd/l1F+/9MPYkT/AXr0wXbNefop6t7yiO7uwYFieeK
 Tf/3PuzBrrqkGnpeP+0l6EzWjQYZ68Jk13LtvxTbXomKW1/bESZfvD3BMMZppTC8kMQh
 Y7nIj0YfqL9EpafoeOO7f1jpylqlP3UJhlNInroy+26qQ3TYvcvEDaoSehfxfsxsT3dD
 3fcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=s2R1ZBFLcViNxT9GBsRQQmdNmOkTfzCY5fgFHxSunJ4=;
 b=g7kMKLuwE2Zq1AnIi6m/ohdensanFzUJPHS1jEJmHBk4GgGhIQmcDJ7pr4WcuJK2ku
 vk8oUkBxF+2eJvqblmeJeb3esdh0pVImTVn8OZlzZ6IICkomL2DvfkgFxGoSEIoaCHr9
 6fT7V5oocWL8OhbkkadVZxLYeNPjKiDUNRSB2gta2B05Osc89+2UdKftqPl15sj7AAlI
 fwepCOXAqBca4K8wEYQSiBzxpCULikxRuhEVnXUqN4QgptucmQWdF+T2V2wsRv/KxaGu
 6CqGpK75hnZyOkI36EW5ocl8epaWyqGqdctqCF4/MX3ol2Kh0vJNYXN5drQpvweOYfam
 eE5g==
X-Gm-Message-State: AOAM532tZoKotlVY7Yh7N+iRoe9ZDT1dDIpoeU8b9klOMM/9FLlDu//v
 NNM/9b8In86IL7M3DUhqLqeCsA==
X-Google-Smtp-Source: ABdhPJx2uLgzOZFNFkpOqASmjZno81Z2cd3IrZ9iKs3rGLzrtvF7zFpSWMOOxNMQRnB6u20m6SeYqg==
X-Received: by 2002:a05:6512:2282:b0:472:24e4:5449 with SMTP id
 f2-20020a056512228200b0047224e45449mr3277165lfu.101.1651056657082; 
 Wed, 27 Apr 2022 03:50:57 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 n30-20020a19ef1e000000b00471fe7ebe25sm1368449lfh.12.2022.04.27.03.50.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 27 Apr 2022 03:50:56 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Date: Wed, 27 Apr 2022 13:50:55 +0300
Message-Id: <20220427105055.3141470-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PULL v2] drm/msm display pull request for 5.19
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
Cc: freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Rob,

This is a reiteration of previous pull request over the patches accumulated,
reviewed and tested for the 5.19 merge window. This pull request contains
following changes:

 - DPU: DSC (Display Stream Compression) support
 - DPU: inline rotation support on SC7280
 - DPU: writeback support
 - DPU: update DP timings to follow vendor recommendations
 - DP, DPU: add support for wide bus (on newer chipsets)
 - DP: eDP support
 - DP: PHY compliance test fix
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

Changes since v1:
 - Per mutual agreement dropped Chia-I's patch for trace_dma_fence_emit (this
   prompted sending v2 of the pull request)
 - Added Writeback and DP PHY compliance patches

The following changes since commit 78f815c1cf8fc5f05dc5cec29eb1895cb53470e9:

  drm/msm: return the average load over the polling period (2022-04-21 15:05:23 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/lumag/msm.git msm-next-lumag

for you to fetch changes up to d2dc68276133362f021bc8d429433b5818826c81:

  Merge branches 'msm-next-lumag-core', 'msm-next-lumag-dpu', 'msm-next-lumag-dp', 'msm-next-lumag-dsi', 'msm-next-lumag-hdmi', 'msm-next-lumag-mdp5' and 'msm-next-lumag-mdp4' into msm-next-lumag (2022-04-27 13:44:44 +0300)

----------------------------------------------------------------
Abhinav Kumar (20):
      drm/msm: remove unused hotplug and edid macros from msm_drv.h
      drm: allow passing possible_crtcs to drm_writeback_connector_init()
      drm: introduce drm_writeback_connector_init_with_encoder() API
      drm/msm/dpu: add writeback blocks to the sm8250 DPU catalog
      drm/msm/dpu: add reset_intf_cfg operation for dpu_hw_ctl
      drm/msm/dpu: rename dpu_hw_pipe_cdp_cfg to dpu_hw_cdp_cfg
      drm/msm/dpu: add dpu_hw_wb abstraction for writeback blocks
      drm/msm/dpu: add writeback blocks to DPU RM
      drm/msm/dpu: add changes to support writeback in hw_ctl
      drm/msm/dpu: add an API to reset the encoder related hw blocks
      drm/msm/dpu: make changes to dpu_encoder to support virtual encoder
      drm/msm/dpu: add encoder operations to prepare/cleanup wb job
      drm/msm/dpu: move _dpu_plane_get_qos_lut to dpu_hw_util file
      drm/msm/dpu: introduce the dpu_encoder_phys_* for writeback
      drm/msm/dpu: add the writeback connector layer
      drm/msm/dpu: initialize dpu encoder and connector for writeback
      drm/msm/dpu: gracefully handle null fb commits for writeback
      drm/msm/dpu: add writeback blocks to the display snapshot
      drm/msm/dpu: add wb_idx to existing DRM prints in dpu_encoder
      drm/msm/dpu: add wb_idx to DRM traces in dpu_encoder

Bjorn Andersson (2):
      dt-bindings: display: msm: Add optional resets
      drm/msm/dpu: Issue MDSS reset during initialization

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

Kuogee Hsieh (9):
      drm/msm/dpu: adjust display_v_end for eDP and DP
      drm/msm/dpu: replace BIT(x) with correspond marco define string
      drm/msm/dpu: revise timing engine programming to support widebus feature
      drm/msm/dp: enable widebus feature for display port
      drm/msm/dp: replace DRM_DEBUG_DP marco with drm_dbg_dp
      drm/msm/dp: stop event kernel thread when DP unbind
      drm/msm/dp: tear down main link at unplug handle immediately
      drm/msm/dp: reset DP controller before transmit phy test pattern
      drm/msm/dp: do not stop transmitting phy test pattern during DP phy compliance test

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
 .../drm/arm/display/komeda/komeda_wb_connector.c   |   4 +-
 drivers/gpu/drm/arm/malidp_mw.c                    |   4 +-
 drivers/gpu/drm/drm_writeback.c                    |  73 +-
 drivers/gpu/drm/msm/Kconfig                        |  51 +-
 drivers/gpu/drm/msm/Makefile                       |  29 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h       |  32 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |   9 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 592 ++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  32 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  97 ++-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   | 112 +--
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  79 +--
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    | 763 +++++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_formats.h        |  22 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 135 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  95 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |  93 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |  23 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         | 215 ++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |  80 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  | 157 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  62 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h        |  22 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |  32 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h    |  14 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |  18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c        |  25 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h        |  19 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          | 279 ++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h          | 115 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            | 234 ++++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  13 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c           | 260 -------
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          | 170 +++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.h          |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  78 +++
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |  13 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |  93 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |  76 ++
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h      |  31 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_dsi_encoder.c   |   3 +
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  64 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cmd_encoder.c   |   3 +
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c           |  80 +--
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c          | 252 -------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_plane.c         |   2 -
 drivers/gpu/drm/msm/dp/dp_audio.c                  |  50 +-
 drivers/gpu/drm/msm/dp/dp_aux.c                    |  21 +-
 drivers/gpu/drm/msm/dp/dp_aux.h                    |   3 +-
 drivers/gpu/drm/msm/dp/dp_catalog.c                |  98 ++-
 drivers/gpu/drm/msm/dp/dp_catalog.h                |   3 +
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 166 +++--
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |   2 +
 drivers/gpu/drm/msm/dp/dp_debug.c                  |   2 -
 drivers/gpu/drm/msm/dp/dp_display.c                | 429 +++++++-----
 drivers/gpu/drm/msm/dp/dp_display.h                |   7 +-
 drivers/gpu/drm/msm/dp/dp_drm.c                    | 215 ++----
 drivers/gpu/drm/msm/dp/dp_drm.h                    |  22 +-
 drivers/gpu/drm/msm/dp/dp_link.c                   | 103 +--
 drivers/gpu/drm/msm/dp/dp_panel.c                  |  49 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |   3 +-
 drivers/gpu/drm/msm/dp/dp_parser.c                 |  25 +-
 drivers/gpu/drm/msm/dp/dp_parser.h                 |  14 +-
 drivers/gpu/drm/msm/dp/dp_power.c                  |  25 +-
 drivers/gpu/drm/msm/dsi/dsi.c                      |   6 +-
 drivers/gpu/drm/msm/dsi/dsi.h                      |   3 +
 drivers/gpu/drm/msm/dsi/dsi.xml.h                  |  80 +++
 drivers/gpu/drm/msm/dsi/dsi_host.c                 | 297 +++++++-
 drivers/gpu/drm/msm/dsi/dsi_manager.c              |  15 +
 drivers/gpu/drm/msm/hdmi/hdmi.c                    |  11 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |   3 +
 drivers/gpu/drm/msm/msm_drv.c                      | 264 ++-----
 drivers/gpu/drm/msm/msm_drv.h                      | 139 ++--
 drivers/gpu/drm/msm/msm_kms.h                      |  21 -
 drivers/gpu/drm/msm/msm_mdss.c                     | 416 +++++++++++
 drivers/gpu/drm/msm/msm_ringbuffer.c               |   2 +-
 drivers/gpu/drm/rcar-du/rcar_du_writeback.c        |   4 +-
 drivers/gpu/drm/vc4/vc4_txp.c                      |   3 +-
 drivers/gpu/drm/vkms/vkms_writeback.c              |   4 +-
 include/drm/drm_panel.h                            |   7 +
 include/drm/drm_writeback.h                        |  11 +-
 88 files changed, 5100 insertions(+), 2112 deletions(-)
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.h
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.h
 delete mode 100644 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
 create mode 100644 drivers/gpu/drm/msm/msm_mdss.c
