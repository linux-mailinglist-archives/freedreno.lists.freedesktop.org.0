Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B800C55C0B6
	for <lists+freedreno@lfdr.de>; Tue, 28 Jun 2022 13:32:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D3D912AE68;
	Tue, 28 Jun 2022 11:32:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88F1412AE68
 for <freedreno@lists.freedesktop.org>; Tue, 28 Jun 2022 11:32:12 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id z13so21648992lfj.13
 for <freedreno@lists.freedesktop.org>; Tue, 28 Jun 2022 04:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qzSekTuTD+qOR3ezFYOntTnOcS3OC4HcThAX+daW6Js=;
 b=MTpfVvK7VysjuXuufqmIq492vvWUbEURe961sWXuS+pfCQV0kv8tZkeGqj2r45//6R
 kCyXLpoK591DEI3G4W3AcnqQgoJaV4B5TmHlsL4g/r8hq5jxle8P9dyXv+Lz6XFjLbvg
 yO7QcQCZVGNVL1hc9Q3DFLaR/JJo20Zi4gnkEkNLrCB9XOqOI8EQvh/fCzcgm5zD72rO
 2F00pgJaeR7xUYtuLyNlw7skWP5RQoDeL4NYCAsZgLRiDijBTHrv7RTcgZ61ZOOANnMY
 v4ybBiBySWYetB8Qb4vYhzE62AMcZhhjogfM/qp1NFBsezC7C6rDRNI/LxAoproE0LU5
 2b5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=qzSekTuTD+qOR3ezFYOntTnOcS3OC4HcThAX+daW6Js=;
 b=4uiF0J46QqaI8icoqCeO/Kt5nfm6wclj1uVIf7/jMIHYC1VO2LwBFBhD8uNbjpOHgB
 OHHInYGlgEk1X6Cq6U+w2ueh9lBY+5WldLCrJM9/2Nu5FClfHiO6LaKLn9WFbx6vq9B2
 F548/OxDac6H0ZiGKNWWF6D5lO1ShfIkG7r6qNbYOpgSh1jvD1EpdREsi/jRvwu1dbRr
 NIbFa+/gxAXekVJFxpqOepD17Kuh8fwTqF9+xEDuKxB8cduqxWDJHtqjGSkpujIhJ62/
 /eN1BdcpKkVILZxw/0/xJZTYf4zzN1B8s/6tcRFlHW46srUAH9DB4+asKfmIXeT0UvOc
 2Jpg==
X-Gm-Message-State: AJIora8sc6X56vLR1lO4Z+sT9NPJHk/G+dInicT/MyVasPQ+DmIGMXWe
 6DyFLESmQvOsrfeulEo8sPGLSw==
X-Google-Smtp-Source: AGRyM1sEB0uAINJX65puguj69V+XRidYjM1KG2Gl5g8XuZ0VDmxe+efSRRDvyP/ZBRmVN/F/FfkWLw==
X-Received: by 2002:a05:6512:3d0a:b0:47f:73c2:bf7e with SMTP id
 d10-20020a0565123d0a00b0047f73c2bf7emr11727939lfv.192.1656415930679; 
 Tue, 28 Jun 2022 04:32:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 n24-20020a05651203f800b004795311530asm2179288lfq.209.2022.06.28.04.32.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 28 Jun 2022 04:32:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 28 Jun 2022 14:32:09 +0300
Message-Id: <20220628113209.750388-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PULL] drm/msm: display changes for 5.20
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
Cc: linux-arm-msm@vger.kernel.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 freedreno@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Rob,

Please pull the following changes into the msm-next branch. This cycle is more
or less calm with mostly small changes and fixes here and there.

As agreed, this pull request is based on 5.20-rc2.

The summary of patches in the pull request:

Core:
- client utilization via fdinfo support
- fix fence rollover issue

DPU:
- constification of HW catalog
- support for using encoder as CRC source
- WB support on sc7180
- WB resolution fixes

DP:
- dropped custom bulk clock implementation
- made dp_bridge_mode_valid() return MODE_CLOCK_HIGH where applicable
- fix link retraining on resolution change

MDP5:
- MSM8953 perf data

HDMI:
- YAML'ification of schema
- dropped obsolete GPIO support
- misc cleanups


The following changes since commit b13baccc3850ca8b8cccbf8ed9912dbaa0fdf7f3:

  Linux 5.19-rc2 (2022-06-12 16:11:37 -0700)

are available in the Git repository at:

  https://gitlab.freedesktop.org/lumag/msm.git msm-next-lumag

for you to fetch changes up to a1cc2c812d8431b204d820294a11a9ef921fb18d:

  Merge branches 'msm-next-lumag-core', 'msm-next-lumag-dpu', 'msm-next-lumag-dp', 'msm-next-lumag-dsi', 'msm-next-lumag-hdmi', 'msm-next-lumag-mdp5' and 'msm-next-lumag-mdp4' into msm-next-lumag (2022-06-28 14:28:27 +0300)

----------------------------------------------------------------
Abhinav Kumar (4):
      drm/msm/dpu: add writeback support for sc7180
      drm/msm/dpu: move intf and wb assignment to dpu_encoder_setup_display()
      drm/msm/dpu: fix maxlinewidth for writeback block
      drm/msm/dpu: remove hard-coded linewidth limit for writeback

Dmitry Baryshkov (31):
      drm/msm/hdmi: fill the pwr_regs bulk regulators
      dt-bindings: display/msm: hdmi: split and convert to yaml
      dt-bindings: display/msm: hdmi: mark old GPIO properties as deprecated
      dt-bindings: display/msm: hdmi: mark hdmi-mux-supply as deprecated
      drm/msm/dpu: use feature bit for LM combined alpha check
      drm/msm/dpu: move VBIF_XINL_QOS_LVL_REMAP size to hw_catalog
      drm/msm/dpu: remove hwversion field from data structures
      drm/msm/dpu: change catalog->perf to be a const pointer
      drm/msm/dpu: change catalog->dma_cfg to be a const pointer
      drm/msm/dpu: constify struct dpu_mdss_cfg
      drm/msm/dpu: make dpu hardware catalog static const
      drm/msm/dpu: dont_use IS_ERR_OR_NULL for encoder phys backends
      drm/msm/dpu: drop enum msm_display_caps
      drm/msm/dp: "inline" dp_ctrl_set_clock_rate("ctrl_link")
      drm/msm/dp: set stream_pixel rate directly
      drm/msm/dp: inline dp_power_clk_set_rate()
      drm/msm/dp: rewrite dss_module_power to use bulk clock functions
      drm/msm/dp: make dp_bridge_mode_valid() more precise
      drm/msm/mdp4: move iommu_domain_alloc() call close to its usage
      drm/msm/mdp4: get rid of struct mdp4_platform_config
      drm/msm/hdmi: drop the hdmi-mux support
      drm/msm/hdmi: drop unused GPIO support
      drm/msm/hdmi: enable core-vcc/core-vdda-supply for 8996 platform
      drm/msm/hdmi: drop empty 'none' regulator lists
      drm/msm/hdmi: drop hpd_regs usage on 8x74/8084
      drm/msm/hdmi: merge platform config for 8974/8084/8994/8996
      drm/msm/hdmi: reuse MSM8960's config for MSM8660
      drm/msm/hdmi-phy: populate 8x60 HDMI PHY requirements
      drm/msm/hdmi: drop empty bridge callbacks
      drm/msm/hdmi: support attaching the "next" bridge
      Merge branches 'msm-next-lumag-core', 'msm-next-lumag-dpu', 'msm-next-lumag-dp', 'msm-next-lumag-dsi', 'msm-next-lumag-hdmi', 'msm-next-lumag-mdp5' and 'msm-next-lumag-mdp4' into msm-next-lumag

Douglas Anderson (1):
      dt-bindings: msm/dp: List supplies in the bindings

Jessica Zhang (4):
      drm/msm/dpu: Move LM CRC code into separate method
      drm/msm/dpu: Move MISR methods to dpu_hw_util
      drm/msm/dpu: Add MISR register support for interface
      drm/msm/dpu: Add interface support for CRC debugfs

Kuogee Hsieh (2):
      dt-bindings: msm: update maintainers list with proper id
      drm/msm/dp: reset drm_dev to NULL at dp_display_unbind()

Rob Clark (4):
      drm/msm: Make msm_gem_free_object() static
      drm: Add DRM_GEM_FOPS
      drm/msm: Expose client engine utilization via fdinfo
      drm/msm: Fix fence rollover issue

Stephen Boyd (1):
      drm/msm/dpu: Increment vsync_cnt before waking up userspace

Vladimir Lypak (2):
      drm/msm/dsi: Use single function for reset
      drm/msm/mdp5: Add perf data for MDP v1.16

Wan Jiabing (1):
      drm/msm: Use div64_ul instead of do_div

 .../bindings/display/msm/dp-controller.yaml        |   8 +-
 .../devicetree/bindings/display/msm/hdmi.txt       |  99 ----
 .../devicetree/bindings/display/msm/hdmi.yaml      | 232 ++++++++++
 .../bindings/phy/qcom,hdmi-phy-other.yaml          | 104 +++++
 .../devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml |  85 ++++
 Documentation/gpu/drm-usage-stats.rst              |  21 +
 drivers/gpu/drm/msm/Makefile                       |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c      |  24 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h      |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 111 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.h           |   5 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 150 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.h        |  26 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |  18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     | 510 +++++++++------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |  49 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c     |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c        |  49 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h        |  18 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c        |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c          |  20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h             |   2 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c           |  29 +-
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.h           |   6 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c           |   5 +
 drivers/gpu/drm/msm/dp/dp_clk_util.c               | 120 -----
 drivers/gpu/drm/msm/dp/dp_clk_util.h               |  38 --
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |  13 +-
 drivers/gpu/drm/msm/dp/dp_display.c                |   4 +-
 drivers/gpu/drm/msm/dp/dp_parser.c                 |  43 +-
 drivers/gpu/drm/msm/dp/dp_parser.h                 |   6 +-
 drivers/gpu/drm/msm/dp/dp_power.c                  | 104 +----
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |  48 +-
 drivers/gpu/drm/msm/hdmi/hdmi.c                    | 126 ++---
 drivers/gpu/drm/msm/hdmi/hdmi.h                    |  15 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c             |  10 -
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c                |  62 +--
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c           |  12 +
 drivers/gpu/drm/msm/msm_drv.c                      |  19 +-
 drivers/gpu/drm/msm/msm_drv.h                      |  10 -
 drivers/gpu/drm/msm/msm_fence.c                    |  13 +-
 drivers/gpu/drm/msm/msm_gem.c                      |   2 +-
 drivers/gpu/drm/msm/msm_gem.h                      |   1 -
 drivers/gpu/drm/msm/msm_gpu.c                      |  21 +-
 drivers/gpu/drm/msm/msm_gpu.h                      |  19 +
 drivers/gpu/drm/msm/msm_gpu_devfreq.c              |   2 +-
 include/drm/drm_gem.h                              |  26 +-
 64 files changed, 1276 insertions(+), 1111 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/display/msm/hdmi.txt
 create mode 100644 Documentation/devicetree/bindings/display/msm/hdmi.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
 create mode 100644 Documentation/devicetree/bindings/phy/qcom,hdmi-phy-qmp.yaml
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_clk_util.c
 delete mode 100644 drivers/gpu/drm/msm/dp/dp_clk_util.h
