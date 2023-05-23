Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D72470DC16
	for <lists+freedreno@lfdr.de>; Tue, 23 May 2023 14:15:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AABF410E430;
	Tue, 23 May 2023 12:15:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC1F10E42A
 for <freedreno@lists.freedesktop.org>; Tue, 23 May 2023 12:15:01 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f3b337e842so4389885e87.3
 for <freedreno@lists.freedesktop.org>; Tue, 23 May 2023 05:15:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684844096; x=1687436096;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pTCAzPM+XQkFg/kFCaBKSjHD1xHDAZL557+xzbBW8Pg=;
 b=O8aNdpq+aoUCR9LbZKAbhLlmkuzkiVY85MB2hAG8Scazsh0ub2rc7iFpIS4M6eiUXN
 g3jEZFhvA9ItaV3f2qU8Nr3Tmjbkej0i4P9JBguM8W5xUsZ5cFJoiRRipHZj/Y6Ss+p6
 aipwqZW8JRryms+XDdyHx+n7OyPqun8D0WmZ+T/1g4pQTcRoPvMEoBT1nTa5yXYR/64m
 V/ZCuIkWjF/p8q/A4WQ4xK9/FK21kcu0Rhf3NLzwm1AwR0ZqtwqYJhd8+ALqp8PY2vEU
 UClCH9e0m0xRZ8XTD9Z1ZsHGO2gu5apuZVMqtQSABO5JG3azZYxjZBe8aSka9U5CHFAE
 bJmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684844096; x=1687436096;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pTCAzPM+XQkFg/kFCaBKSjHD1xHDAZL557+xzbBW8Pg=;
 b=CS88eb+HLEdaFwI1ZPder2JmmjenDc0j3RQ04nqOnCyBMMhuLfnlSWGMUi3dADbbnL
 3I4vL2Juerat5N5HLtw63xvuZq3ukeG8XinNg6qHGfivjD0neBTuQ68/h3u23hB7+PDk
 xFf0WnMpZ3pbC8SSWi1n/UPl4wDm5G1RZv5xkXQJAuj8UZDW2YMXn5rb4HG770yia/Cv
 1NS1dPSb9WrnRQhU/7GK2c9TJUA8bbqKbc5pKis/Zy1uL3+RMjl7pxXH9CWYbFXPf+cC
 LNMRz1NmbogApVbP4q1UVElLXK69GTsAXSStoth7RnMC0RIyjlegSF75k3+7f57u6PK1
 y6pg==
X-Gm-Message-State: AC+VfDzvPAigCGs9iMOV0XL2tw59vj1c3LnqTFAm0Yg5ARqs48OjZ8jg
 dFCZ9QhCUAQJzWqH3m78KbVJVA==
X-Google-Smtp-Source: ACHHUZ6wZYLIhMnucl76GusJYLoBy4vUy3JkQdEWTKTTJuSuVlVOIIMGz3REICRMgRokSSTOA4O5tg==
X-Received: by 2002:ac2:46ef:0:b0:4f3:a556:61b6 with SMTP id
 q15-20020ac246ef000000b004f3a55661b6mr4318822lfo.3.1684844096123; 
 Tue, 23 May 2023 05:14:56 -0700 (PDT)
Received: from eriador.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 c26-20020ac2531a000000b004f160559d4asm1319616lfh.183.2023.05.23.05.14.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 05:14:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Date: Tue, 23 May 2023 15:14:39 +0300
Message-Id: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 00/15] drm/msm/hdmi & phy: use generic PHY
 framework
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
Cc: freedreno@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-phy@lists.infradead.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The MSM HDMI PHYs have been using the ad-hoc approach / API instead of
using the generic API framework. Move all the PHYs to
drivers/phy/qualcomm and rework them to use generic PHY framework. This
way all the QMP-related code is kept close. Also in future this will
allow us to use a common set of functions to setup msm8974 HDMI PHY,
28nm DSI PHY and apq8964 SATA PHY (which all use UNI PLL internally).

This also causes some design changes. Currently on msm8996 the HDMI PLL
implements clock's set_rate(), while other HDMI PHY drivers used the
ad-hoc PHY API for setting the PLL rate (this includes in-tree msm8960
driver and posted, but not merged, msm8974 driver). This might result in
the PLL being set to one rate, while the rest of the PHY being tuned to
work at another rate. Adopt the latter idea and always use
phy_configure() to tune the PHY and set the PLL rate.

Dmitry Baryshkov (14):
  phy: qualcomm: add QMP HDMI PHY driver
  phy: qualcomm: add MSM8960 HDMI PHY driver
  phy: qualcomm: add MSM8x60 HDMI PHY driver
  phy: qcom: apq8064-sata: extract UNI PLL register defines
  phy: qcom-uniphy: add more registers from display PHYs
  phy: qualcomm: add MSM8974 HDMI PHY driver
  drm/msm/hdmi: move the alt_iface clock to the hpd list
  drm/msm/hdmi: simplify extp clock handling
  drm/msm/hdmi: correct indentation of HDMI bridge functions
  drm/msm/hdmi: switch to atomic_pre_enable/post_disable
  drm/msm/hdmi: set infoframes on all pre_enable calls
  drm/msm/hdmi: pair msm_hdmi_phy_powerup with msm_hdmi_phy_powerdown
  drm/msm/hdmi: switch to generic PHY subsystem
  drm/msm/hdmi: drop old HDMI PHY code

Sandor Yu (1):
  phy: Add HDMI configuration options

 drivers/gpu/drm/msm/Makefile                  |   6 -
 drivers/gpu/drm/msm/hdmi/hdmi.c               |  86 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h               |  79 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c        | 108 ++-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c           | 217 -----
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c      |  51 --
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c      | 765 ------------------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c      | 141 ----
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c      |  44 -
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c      | 458 -----------
 drivers/phy/qualcomm/Kconfig                  |  40 +
 drivers/phy/qualcomm/Makefile                 |   8 +
 drivers/phy/qualcomm/phy-qcom-apq8064-sata.c  |  23 +-
 drivers/phy/qualcomm/phy-qcom-hdmi-msm8960.c  | 744 +++++++++++++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-msm8974.c  | 531 ++++++++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-msm8x60.c  | 353 ++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-base.c | 184 +++++
 .../phy/qualcomm/phy-qcom-qmp-hdmi-msm8996.c  | 441 ++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi.h      |  75 ++
 drivers/phy/qualcomm/phy-qcom-uniphy.h        |  65 ++
 include/linux/phy/phy-hdmi.h                  |  33 +
 include/linux/phy/phy.h                       |   7 +-
 22 files changed, 2562 insertions(+), 1897 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy.c
 delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c
 delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c
 delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c
 delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c
 delete mode 100644 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-hdmi-msm8960.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-hdmi-msm8974.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-hdmi-msm8x60.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-base.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8996.c
 create mode 100644 drivers/phy/qualcomm/phy-qcom-qmp-hdmi.h
 create mode 100644 drivers/phy/qualcomm/phy-qcom-uniphy.h
 create mode 100644 include/linux/phy/phy-hdmi.h

-- 
2.39.2

