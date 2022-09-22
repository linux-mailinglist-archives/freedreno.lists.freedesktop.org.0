Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B25E65E610E
	for <lists+freedreno@lfdr.de>; Thu, 22 Sep 2022 13:30:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A8610EAC9;
	Thu, 22 Sep 2022 11:30:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB50C10EAC9
 for <freedreno@lists.freedesktop.org>; Thu, 22 Sep 2022 11:30:22 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id s6so14148025lfo.7
 for <freedreno@lists.freedesktop.org>; Thu, 22 Sep 2022 04:30:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date;
 bh=LkD3jQHv+BqRf+/+wzrmLIW7XBT4WmGJ2Xf+6E77lbU=;
 b=EmtmBvgk03neDgJ3f0flqzedS12sROzDs2hrEQcsMUfzzTzJpsPSysdCvsqAToun04
 nmpeO7tHEXZ8mjegUQUYcGnvhNFXsMIxGGz8GwpTOOtpPhZf+AY/8xnBksAnXc3D4tya
 QN3ErhT9ooWRb7jDXBETIlpF5qYURJ8P517kXZ+3Wr36kLAJMMmuOjotIt6TBaZWIoQ1
 pEcAjNGvygroxJL6Vx5gbG82nYZNzh2MIxdOZ/vCwnAmegjfx8NXQmLxe1AXK5dd1zDS
 Mq507ehG+YD9PqiBjcnH6UdrOYkn2jU43/aGdnAcGykWx3+Rm0fUMih8giZK+bDL+11D
 s33g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date;
 bh=LkD3jQHv+BqRf+/+wzrmLIW7XBT4WmGJ2Xf+6E77lbU=;
 b=K/6g6GVu2xmg5I9KqqU9ZBVxeWNPjvilNaV13JP05/eE+Eija+0YNlnEu/Bm+6XE0Q
 uRCjppYaNfmqRbFYUOb0QT9MgnBLSj8Ol8QmdYXOH/eOPs+XGbdHVC9veLt5q01xSpe9
 yRawzTbXBJ+IPkHjE3+YHDKZaRWgGWtChQjwZk2EhnVF/fACV0Oy4R+Ref0Fuzen9YFr
 VGcTN94+rhaTd314Y5B6WQoEl+K8hxAYKHWUrFxg8A17bZH+vcBeDe/miQdQo9l9MzYO
 xaDqryAoFZLpvTw7qTMeFlOWytRP+UD3rsbiN/m3+9hzshVKPDH9Mr+5SCPvSdxrE57A
 s8Zg==
X-Gm-Message-State: ACrzQf3puTJQ4obQg9pXT7OMCruVRMRDZQUJqRoEKuSI2BkBNNUKJElv
 bEoJSVxKXPE4ojye1PGjjTv0Vg==
X-Google-Smtp-Source: AMsMyM5jLmRmuevxV1Zx6hXKJA7EoRFNvQ6KFDnrrY5fz9Q6cTAco/grcQKWL13VONg0Qb8Md9dvWQ==
X-Received: by 2002:a05:6512:118b:b0:492:e3c4:a164 with SMTP id
 g11-20020a056512118b00b00492e3c4a164mr1125188lfr.598.1663846218309; 
 Thu, 22 Sep 2022 04:30:18 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 c4-20020ac25304000000b004996fbfd75esm898527lfh.71.2022.09.22.04.30.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 04:30:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 22 Sep 2022 14:30:11 +0300
Message-Id: <20220922113016.355188-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/5] drm/msm: add support for SM8450
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This adds support for the MDSS/DPU/DSI on the Qualcomm SM8450 platform.

Dmitry Baryshkov (5):
  drm/msm/dsi: add support for DSI-PHY on SM8350 and SM8450
  drm/msm/dsi: add support for DSI 2.6.0
  drm/msm/dpu: add support for MDP_TOP blackhole
  drm/msm/dpu: add support for SM8450
  drm/msm: mdss add support for SM8450

 drivers/gpu/drm/msm/Kconfig                   |   6 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 224 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_mdss.h   |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  12 +-
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             |   2 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   4 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     | 132 ++++++++++-
 drivers/gpu/drm/msm/msm_mdss.c                |   8 +
 11 files changed, 381 insertions(+), 15 deletions(-)

-- 
2.35.1

