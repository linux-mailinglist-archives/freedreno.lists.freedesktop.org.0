Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CDB1B33F318
	for <lists+freedreno@lfdr.de>; Wed, 17 Mar 2021 15:40:45 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F6616E5BB;
	Wed, 17 Mar 2021 14:40:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D659E6E598
 for <freedreno@lists.freedesktop.org>; Wed, 17 Mar 2021 14:40:42 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id k9so3296362lfo.12
 for <freedreno@lists.freedesktop.org>; Wed, 17 Mar 2021 07:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JKPjAX5kcSp/PCy1m1ongUU8iosLiNtW2m8y1nr1HjY=;
 b=HDz6UD+JKFVMWMXjc2rHLqCEhe6lghlysanYMLR2WK+F/CeP2kN/PQXTryPPjrWjpV
 12ibD21EamiYBNn9qbJPNob/fU8EnSx+e+9VM0oQmU7n3hR88dRz7zl4LGd4Q9NIIQHP
 nq7B/9gC6C3GNu/SV4rtmr0H1CBofjj/Cw6hfwCgVdvjJyJQ86qxOoQPod4pkBdP3/PU
 HZsm/YYNsmZrIz9cWDZXbn4rqnu/qL6MOIe8xBb5qrCH21qErJYl8tZA91TnfLBWHmBo
 mwR+VJQ3zjoJHDMA26jAnIEhgBaJ/vqdXicfbSF1ggONrjFe7kjf9nELX6fdCBEfKAgl
 XRCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=JKPjAX5kcSp/PCy1m1ongUU8iosLiNtW2m8y1nr1HjY=;
 b=hjzmcdUcjpre8DJ0pdXsbgRyCpLPGYub3jB8FSpSIZd52JSQG5gCk3dbL9UkSTyEQr
 a5s1L1tBOFehgMsqDwiafLmi9+XakFcY6xqJi1ptejjPRp/RxnxePl4iUuOmDWkNn+t6
 9BSv5N1d6J7HO48qwv+0HqX57oQDirddE1kx5QDGct6Sc/axS3MXIsCCVfALyQOzU2G2
 xA5VlSOKH7Eo8qY7e/27X1F8M7nVPgwHG7c1m75YTGq22uEsZoTnwC0DYm/2a2+nY17D
 oDtV6x7cm2hq/88KOnwPP5BsMVHYY5J2S+H2s5U1lDSm3MhBhBEkNTjyl7yGoa5rjiEy
 rBrA==
X-Gm-Message-State: AOAM533lYUO8bqB3IDUiSISXktlIkWq34wJiPlUvoiQwmRZONgmy5dNR
 zFWoCJWxIqHsB2kQUgIpKwNpHQ==
X-Google-Smtp-Source: ABdhPJx5eBjv3aHadap0zcYS42kdonqDsuJkuCQka6tsYfhKTJnI1zz3fP3vySQ5lWveaPw7t8uw2g==
X-Received: by 2002:a05:6512:ac7:: with SMTP id
 n7mr2539554lfu.567.1615992041295; 
 Wed, 17 Mar 2021 07:40:41 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id q8sm1484309lfc.223.2021.03.17.07.40.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Mar 2021 07:40:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>,
 Michael Turquette <mturquette@baylibre.com>
Date: Wed, 17 Mar 2021 17:40:13 +0300
Message-Id: <20210317144039.556409-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v1 00/26] drm/msm/dsi: refactor MSM DSI PHY/PLL
 drivers
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Restructure MSM DSI PHY drivers. What started as an attempt to grok the
overcomplicated PHY drivers, has lead up to the idea of merging PHY and
PLL code, reducing abstractions, code duplication, dropping dead code,
etc.

The patches were mainly tested on RB5 (sm8250, 7nm) and DB410c (apq8016,
28nm-lp) and lightly tested on RB3 (sdm845, 10nm).

Changes since RFC:
 - Reorder patches to move global clock patches in the beginning and
   dtsi patches where they are required.

 - remove msm_dsi_phy_set_src_pll() and guess src_pll_id using PHY usecase.


The following changes since commit a38fd8748464831584a19438cbb3082b5a2dab15:

  Linux 5.12-rc2 (2021-03-05 17:33:41 -0800)

are available in the Git repository at:

  ssh://git@git.linaro.org/people/dmitry.baryshkov/kernel.git dsi-phy-1

for you to fetch changes up to 79c4c69b676636dac5eab48f33adefbe11246f26:

  drm/msm/dsi: stop passing src_pll_id to the phy_enable call (2021-03-17 17:34:33 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (26):
      clk: mux: provide devm_clk_hw_register_mux()
      clk: divider: add devm_clk_hw_register_divider
      drm/msm/dsi: fuse dsi_pll_* code into dsi_phy_* code
      drm/msm/dsi: drop multiple pll enable_seq support
      drm/msm/dsi: move all PLL callbacks into PHY config struct
      drm/msm/dsi: move min/max PLL rate to phy config
      drm/msm/dsi: remove msm_dsi_pll_set_usecase
      drm/msm/dsi: stop setting clock parents manually
      arm64: dts: qcom: sm8250: assign DSI clock source parents
      arm64: dts: qcom: sdm845: assign DSI clock source parents
      drm/msm/dsi: push provided clocks handling into a generic code
      drm/msm/dsi: use devm_clk_*register to registe DSI PHY clocks
      drm/msm/dsi: use devm_of_clk_add_hw_provider
      drm/msm/dsi: replace PHY's init callback with configurable data
      drm/msm/dsi: make save/restore_state phy-level functions
      drm/msm/dsi: limit vco_delay to 28nm PHY
      drm/msi/dsi: inline msm_dsi_pll_helper_clk_prepare/unprepare
      drm/msm/dsi: make save_state/restore_state callbacks accept msm_dsi_phy
      drm/msm/dsi: drop msm_dsi_pll abstracton
      drm/msm/dsi: drop PLL accessor functions
      drm/msm/dsi: move ioremaps to dsi_phy_driver_probe
      drm/msm/dsi: remove duplicate fields from dsi_pll_Nnm instances
      drm/msm/dsi: remove temp data from global pll structure
      drm/msm/dsi: drop global msm_dsi_phy_type enumaration
      drm/msm/dsi: inline msm_dsi_phy_set_src_pll
      drm/msm/dsi: stop passing src_pll_id to the phy_enable call

 arch/arm64/boot/dts/qcom/sdm845.dtsi            |    6 +
 arch/arm64/boot/dts/qcom/sm8250.dtsi            |    6 +
 drivers/clk/clk-mux.c                           |   35 +
 drivers/gpu/drm/msm/Kconfig                     |    8 -
 drivers/gpu/drm/msm/Makefile                    |    9 -
 drivers/gpu/drm/msm/dsi/dsi.h                   |   58 +-
 drivers/gpu/drm/msm/dsi/dsi_host.c              |   51 --
 drivers/gpu/drm/msm/dsi/dsi_manager.c           |   29 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c           |  150 ++--
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           |   41 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      |  745 ++++++++++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      |  939 ++++++++++++++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c      |   16 +-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      |  677 +++++++++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c |  479 +++++++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       |  773 +++++++++++++++-
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.c           |  184 ----
 drivers/gpu/drm/msm/dsi/pll/dsi_pll.h           |  130 ---
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c      |  881 ------------------
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_14nm.c      | 1096 -----------------------
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c      |  643 -------------
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm_8960.c |  526 -----------
 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c       |  912 -------------------
 include/linux/clk-provider.h                    |   30 +
 24 files changed, 3713 insertions(+), 4711 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll.c
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll.h
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_10nm.c
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_14nm.c
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm.c
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_28nm_8960.c
 delete mode 100644 drivers/gpu/drm/msm/dsi/pll/dsi_pll_7nm.c


_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
