Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D92B43818F1
	for <lists+freedreno@lfdr.de>; Sat, 15 May 2021 15:12:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8393B6E2B4;
	Sat, 15 May 2021 13:12:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6D69C6E122
 for <freedreno@lists.freedesktop.org>; Sat, 15 May 2021 13:12:21 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id x19so2277459lfa.2
 for <freedreno@lists.freedesktop.org>; Sat, 15 May 2021 06:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LWOuVSzGe1Bg26jle07IUN3g0HLvecdChr8/TDnFdlY=;
 b=H+z4a92eObirfZs9Rrw4YwnS68iESpzRiCtDReEgj1k7MxdyuNxCg2L2I0HOkmVJfJ
 hAvQHYeffSZ+QeAMyUcCde46l1oT8Vge748UzkOMxCV7reajxzwm+8ecdcjlBSCqzId+
 vIuoMZp8mBLx1Secl7w5ZjTFl/wRaZAeLi4LR0PvdwrVK7bGEJ3BGTgVRPwMPKt3XpLt
 m7fWPhYd4gdkHpkZdqsU05bijiI+a634UQYzfanMNYwyukZcNTzgsyG/Q7OJ4zpYxouS
 cb4E3xm1uzWZ+0OCLEyHD3hDtfQlF234YUsk039FBr3muK4nA7hthxz1558RK4QzzjZX
 ltyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=LWOuVSzGe1Bg26jle07IUN3g0HLvecdChr8/TDnFdlY=;
 b=IXuARd16xMjJOeHm1Vpaam6b5sHdnsnqHkFggII8YGkuUiBhv548oXhmWRIsKgqIkv
 Z/W6KuYVYYtbXrpbxK97HNe7Q06lp4flI1W5YS2SYZPqS60IJQGCQPkwYk+DbM5WEUI9
 vLWTJ+Ux9jXUkY0cRoXoGTFJrYfNJ5ei9peTUu0fIrickL2yiRiZbRIEKPXbSdnC1iWc
 nRbmY91alAFmDXEzm7U7A3FI7EQnFeC55ZfB3BUP5+QjBVmV43YNx5rQKgMuWIf9toOO
 vxIdx6IOP24Hz+9NQsLAlQo7hSGQygYbk0eSL+G36kbFoylSS78xwJo6ksMyPwVOyKeR
 LwIQ==
X-Gm-Message-State: AOAM530fNmSYHxw2u9zCbPd1zt0XrzOJNlbekMsfgC0KyO9w4CBAif2a
 hHU/L7QNjz9vy4o6rkq4obPQsA==
X-Google-Smtp-Source: ABdhPJzpEBkC8T2rG2IN+cGuL5eFjjjPvMZaBnK9PyXO0mKEL9k2xFIFASUS1gWT6foDgeQa79Uzsg==
X-Received: by 2002:a05:6512:3d8c:: with SMTP id
 k12mr24904422lfv.272.1621084339621; 
 Sat, 15 May 2021 06:12:19 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id m4sm2061865ljp.9.2021.05.15.06.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 15 May 2021 06:12:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Sat, 15 May 2021 16:12:09 +0300
Message-Id: <20210515131217.1540412-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 0/8] dsi: rework clock parents and timing
 handling
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This patch series brings back several patches targeting assigning dispcc
clock parents, that were removed from the massive dsi rework patchset
earlier.

Few notes:
 - assign-clock-parents is a mandatory proprety according to the current
   dsi.txt description.
 - There is little point in duplicating this functionality with the ad-hoc
   implementation in the dsi code.

On top of that come few minor cleanups for the DSI PHY drivers.

I'd kindly ask to bring all dts changes also through the drm tree, so
that there won't be any breakage of the functionality.


The following changes since commit f2f46b878777e0d3f885c7ddad48f477b4dea247:

  drm/msm/dp: initialize audio_comp when audio starts (2021-05-06 16:26:57 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git dsi-phy-update

for you to fetch changes up to f1fd3b113cbb98febad682fc11ea1c6e717434c2:

  drm/msm/dsi: remove msm_dsi_dphy_timing from msm_dsi_phy (2021-05-14 22:55:11 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (8):
      arm64: dts: qcom: sc7180: assign DSI clock source parents
      arm64: dts: qcom: sdm845: assign DSI clock source parents
      arm64: dts: qcom: sdm845-mtp: assign DSI clock source parents
      arm64: dts: qcom: sm8250: assign DSI clock source parents
      drm/msm/dsi: stop setting clock parents manually
      drm/msm/dsi: phy: use of_device_get_match_data
      drm/msm/dsi: drop msm_dsi_phy_get_shared_timings
      drm/msm/dsi: remove msm_dsi_dphy_timing from msm_dsi_phy

 arch/arm64/boot/dts/qcom/sc7180.dtsi            |  3 ++
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts         |  3 ++
 arch/arm64/boot/dts/qcom/sdm845.dtsi            |  6 +++
 arch/arm64/boot/dts/qcom/sm8250.dtsi            |  6 +++
 drivers/gpu/drm/msm/dsi/dsi.h                   |  7 +---
 drivers/gpu/drm/msm/dsi/dsi_host.c              | 51 -------------------------
 drivers/gpu/drm/msm/dsi/dsi_manager.c           |  8 +---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c           | 46 ++++++++++------------
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h           | 10 ++++-
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_10nm.c      | 11 ++----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_14nm.c      | 11 ++----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_20nm.c      | 10 +----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm.c      | 12 ++----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_28nm_8960.c | 10 +----
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c       | 13 ++-----
 15 files changed, 67 insertions(+), 140 deletions(-)


_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
