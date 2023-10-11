Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C03687C5F42
	for <lists+freedreno@lfdr.de>; Wed, 11 Oct 2023 23:47:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AD0A10E1F3;
	Wed, 11 Oct 2023 21:47:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 660CF10E1F3
 for <freedreno@lists.freedesktop.org>; Wed, 11 Oct 2023 21:47:08 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-5033918c09eso437641e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 11 Oct 2023 14:47:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697060826; x=1697665626; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1jda2D1FroH1trufxsMIX87ohZOTaWYuCvDgRQ06mQE=;
 b=fOgFmXUTSu7qVtGMcJPfdn1Ggj6o/tAojEWx4v7EhIzcOaLQnAAwHLuz7NX1wKdCdw
 /QFJYEQu3cXzC9jPT2C+hZE+uX7rkqsESlwYm0PvbkVb63pLk1TByoZwoSr6eOOPLcXL
 j7h4JYNHCxjOv3LFmNZgJV/uD3fwV5X+tQ9/TnF6xVVfrQZD0aH7vKaAK8rzxEZ4kBG7
 /VL/TcOKSy4vRqjLFRMShEL9VayGVp2Zaq4QBs++RE4zxHOWAq4C2Ff9tavPwy7m1r+/
 J43MxatOBMFkOxWHhV5YvN+hB090svUMfa/1hU4IBvLF0DBShVMvdw0SCofA0wfutLVH
 h9gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697060826; x=1697665626;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1jda2D1FroH1trufxsMIX87ohZOTaWYuCvDgRQ06mQE=;
 b=Gt4J0bgS47Tf8knRvNUX6U+6e/PfGrKZkVGKQ1kM24OluHmJ4bA0FBt8pAZVZZKrbA
 7hEpYDNDcvjlYmR1+wkaODp75B259vMCkrcwJRrRSpDf3rU5mytz8RG0OdX6dW0yR6d8
 Ecr2Yavr/KqIg/FNdTvsjRWOhUG/SZ0FwGsRJiL1AVT2h3KgfuIvcF4LsbIwqYM/qwje
 xd7ckvpHDFV9ZqLxSo5IgngiQGStAzb7QLtCai/xKnLO/K0KHStCiBrjj6/Sbtg+4knL
 E9/MEcBJ+yo6qoLIgrGDZ0Isn9edXz6OxRiI3gDEy5U4Ty65eoy89wCABLc5jeehOv4u
 rOfA==
X-Gm-Message-State: AOJu0YyehYzuD73fJ124sKTlSi8CIp8wYa/negPHKlZFxk5UKmgbPxc1
 +tOS0kGxwxfan7N4sUFTSuEI7w==
X-Google-Smtp-Source: AGHT+IGoo9DRhumkDzWgM8EBl7tb7r7m6oANYB86B4Ru1+K3Ll/N23FGwa0RmGn40xMWCHI1xB4rUg==
X-Received: by 2002:ac2:550f:0:b0:500:a5af:86a4 with SMTP id
 j15-20020ac2550f000000b00500a5af86a4mr18430162lfk.43.1697060826330; 
 Wed, 11 Oct 2023 14:47:06 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o15-20020a056512050f00b004fbab80ecefsm2452485lfb.145.2023.10.11.14.47.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Oct 2023 14:47:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 12 Oct 2023 00:47:02 +0300
Message-Id: <20231011214705.375738-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/3] drm/msm: use correct lifetime devices for
 devm_drm_bridge_add
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

While reworking the drm/msm driver to use devm_drm_bridge_add() I didn't
notice that the drm_bridge instances are allocated with the drm_device
used as a lifetime parameter instead of corresponding platform_device.
This mostly works fine, in rare cases of device reprobing resulting in
the oops such as the following:

Call trace:
 of_drm_find_bridge+0x54/0xa4
 drm_of_find_panel_or_bridge+0xb8/0xdc
 devm_drm_of_get_bridge+0x3c/0x8c
 msm_dsi_manager_ext_bridge_init+0x4c/0x19c
 msm_dsi_modeset_init+0x70/0x118
 _dpu_kms_drm_obj_init+0xec/0x6f0
 dpu_kms_hw_init+0x310/0x458
 msm_drm_kms_init+0x84/0x328
 msm_drm_bind+0x230/0x43c
 try_to_bring_up_aggregate_device+0x164/0x1d0
 __component_add+0xa8/0x170
 component_add+0x14/0x20
 dsi_dev_attach+0x20/0x2c
 dsi_host_attach+0x9c/0x144
 devm_mipi_dsi_attach+0x34/0xb4
 lt9611uxc_attach_dsi.isra.0+0x84/0xfc
 lt9611uxc_probe+0x5ac/0x66c
 i2c_device_probe+0x148/0x290
 really_probe+0x148/0x2ac
 __driver_probe_device+0x78/0x12c
 driver_probe_device+0x3c/0x160
 __device_attach_driver+0xb8/0x138
 bus_for_each_drv+0x80/0xdc
 __device_attach+0x9c/0x188
 device_initial_probe+0x14/0x20
 bus_probe_device+0xac/0xb0
 deferred_probe_work_func+0x8c/0xc8
 process_one_work+0x1ec/0x51c
 worker_thread+0x1ec/0x3e4
 kthread+0x120/0x124
 ret_from_fork+0x10/0x20

Dmitry Baryshkov (3):
  drm/msm/dsi: use correct lifetime device for devm_drm_bridge_add
  drm/msm/hdmi: use correct lifetime device for devm_drm_bridge_add
  drm/msm/dp: use correct lifetime device for devm_drm_bridge_add

 drivers/gpu/drm/msm/dp/dp_drm.c        | 2 +-
 drivers/gpu/drm/msm/dsi/dsi_manager.c  | 2 +-
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

-- 
2.39.2

