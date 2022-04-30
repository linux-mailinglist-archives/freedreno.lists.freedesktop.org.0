Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9A34A51609D
	for <lists+freedreno@lfdr.de>; Sat, 30 Apr 2022 23:18:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F14010EC9C;
	Sat, 30 Apr 2022 21:18:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D72110EC9C
 for <freedreno@lists.freedesktop.org>; Sat, 30 Apr 2022 21:18:21 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id bu29so19610471lfb.0
 for <freedreno@lists.freedesktop.org>; Sat, 30 Apr 2022 14:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1GLgMb5pUgkQDenkii55GFpNQ6moOJV41KFvWc1jGrg=;
 b=n5PPdfbh7IRWQjfA8DdR5nmISNaK5tpw8z2woZYOueJqkigSMCeK2a0HCxXlwpBFD3
 lC8OJHOF8ODj6qxnhEwm6mTvD0/0h18NPmR4IwXF3e9rXYKGZ+WuasqD2aY5vTmcZDOt
 G+mQZ6tjGkJR/YeVtQV/rKvYqWrZzaK6rj2UI1ns0l3sGAQkHrL1sanQXMQnN8dZDx/J
 b2HL9xvroYutv1/PAQ66e/uiMmMTWeqT2uecRI0c6c0DT+4tjA4oySV6Ca+l23wq+0DH
 DxMwbboS+MDdFOEwSvtNyLLosjEAmB5v2BCHMYlld0vX7zwsMLYYOtN0bJ3T1wIX3xoX
 Vz+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1GLgMb5pUgkQDenkii55GFpNQ6moOJV41KFvWc1jGrg=;
 b=bQUBHIzcgQxweBgX6tr4DfGevSelbwK61o0DfZLcF6td0rYfKq68JMGpiBfe06bBls
 b5BYGm3HnYBZhG8Hs06tJK7u3U0wZ0Bg6uIhStzwMYPkKiFUpfspzkorFDOeX+0aW94f
 DOp9RY+MjS/OACBvOl6Jb/ZaPC6AP+X9Z5iS6Dh0RE/aP3tFkr6WybAXkbLKKEYrTtFR
 /LUG7vNQgslrVS0BvjXvzADLXTDVR8zqvl8tE+msxnVlxWGVNpLeFEXyvjzfbysQ2Wzo
 I0zcjxuc4/pF5AGcTfFvvMUTB9Ig7L16pR2HOHyO8j4aJ4x7tBF4pdRZQ5YyK1mFuYDw
 7qYg==
X-Gm-Message-State: AOAM530JUMRRMUNHQ6BTUguypqZcLleAmGOA0gggQ3d9n0O3I89TNTWx
 L1lcts/DMm0/85RyOhnfcCw+Uw==
X-Google-Smtp-Source: ABdhPJxUj5NwK/7Ws3rPgvtK+QIzAlwWQL/4JbnMjguVjQKcOuOR9wgFXv8Xe7gsq7ihIIsfoukTjA==
X-Received: by 2002:a05:6512:228e:b0:472:4162:d9e7 with SMTP id
 f14-20020a056512228e00b004724162d9e7mr4038297lfu.513.1651353499862; 
 Sat, 30 Apr 2022 14:18:19 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 c19-20020ac244b3000000b0047255d211b5sm275926lfm.228.2022.04.30.14.18.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 30 Apr 2022 14:18:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sun,  1 May 2022 00:18:18 +0300
Message-Id: <20220430211818.3845259-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PULL] drm/msm: several fixes for the 5.19 branch
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi Rob,

Please pull the following few patches into the msm-next(-staging).

They are mostly minor fixes for the issues reported by robot, a patch to
silence CRC warnings during modeswitch, a change to use initializers in the IRQ
regisers array and a change to MAINTAINERS file.

The following changes since commit d2dc68276133362f021bc8d429433b5818826c81:

  Merge branches 'msm-next-lumag-core', 'msm-next-lumag-dpu', 'msm-next-lumag-dp', 'msm-next-lumag-dsi', 'msm-next-lumag-hdmi', 'msm-next-lumag-mdp5' and 'msm-next-lumag-mdp4' into msm-next-lumag (2022-04-27 13:44:44 +0300)

are available in the Git repository at:

  https://gitlab.freedesktop.org/lumag/msm.git msm-next-lumag

for you to fetch changes up to d37d150e8b9773e2c83944ca276fd06b6d1d36d4:

  MAINTAINERS: Add Dmitry as MSM DRM driver co-maintainer (2022-05-01 00:09:53 +0300)

----------------------------------------------------------------
Abhinav Kumar (1):
      drm/msm/dpu: remove unused refcount for encoder_phys_wb

Dmitry Baryshkov (4):
      drm/msm/dsi: use RMW cycles in dsi_update_dsc_timing
      drm/msm: add missing include to msm_drv.c
      drm/msm: drop old eDP block support (again)
      MAINTAINERS: Add Dmitry as MSM DRM driver co-maintainer

Jessica Zhang (1):
      drm/msm/dpu: Clean up CRC debug logs

Marijn Suijten (1):
      drm/msm/dpu: Use indexed array initializer to prevent mismatches

Vinod Polimera (1):
      drm/msm/disp/dpu1: set mdp clk to the maximum frequency in opp table during probe

 MAINTAINERS                                        |    5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           |    3 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   15 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  |   34 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |    2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |    8 +
 drivers/gpu/drm/msm/dsi/dsi_host.c                 |    5 +-
 drivers/gpu/drm/msm/edp/edp.h                      |   77 --
 drivers/gpu/drm/msm/edp/edp_ctrl.c                 | 1373 --------------------
 drivers/gpu/drm/msm/msm_drv.c                      |    1 +
 10 files changed, 39 insertions(+), 1484 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/edp/edp.h
 delete mode 100644 drivers/gpu/drm/msm/edp/edp_ctrl.c
