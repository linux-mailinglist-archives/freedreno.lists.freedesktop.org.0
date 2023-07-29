Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8ABCC768287
	for <lists+freedreno@lfdr.de>; Sun, 30 Jul 2023 00:27:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47BBE10E22B;
	Sat, 29 Jul 2023 22:27:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1A2A10E22B
 for <freedreno@lists.freedesktop.org>; Sat, 29 Jul 2023 22:27:11 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id
 38308e7fff4ca-2b703a0453fso49341091fa.3
 for <freedreno@lists.freedesktop.org>; Sat, 29 Jul 2023 15:27:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690669630; x=1691274430;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rNoZuymdCuWuQOzvg2geoq93wz1KGTWmNJX9XCZ2yck=;
 b=lj5PXQIUAswu4y/jWY0PV5PLmU1/qYV22iAnAR6j9lksBLF5fCet/yeJIlSUEWXf3W
 Hg0sWLHZGJp+YH6sDqNBtUs5zKqyCZyZEMm0DNPxad4SEzKDxOgrOE8xuR2tGDylLRlm
 pUU3TwFaf8+em+RyAa5rikrdL8IGJasSoBjYPoJN5dwkhlx5MMyBkglSk5o23qXV6I77
 xaRGnWGOn7Yy6YbCp2/t1IpduT9zFfTHYWQgK6A0d05fblg74/xSTlgN/gbAcMmYQzlt
 kcpYss6ErCpPKUTZIAWefueQYQMdFNNz2HV8QtUZy/a4fIDDtj0SJOJgoVHOk0xtMQCz
 2Igw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690669630; x=1691274430;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rNoZuymdCuWuQOzvg2geoq93wz1KGTWmNJX9XCZ2yck=;
 b=BtEKAT9JDlg7OrLz4hftDCWFlNyNWRkyqCzTCOBZp9e5pMF58IZHN4Q2XiZmGzTrWH
 PRTa7Yt8TPsU1/QLGAyiAqcFAEiex5GRxDfVTSa72dC7+NGYJtgkXik8gTNbMEIQj/C9
 YHtVt3czWuMyuAAPeeZlZviBK1ZCx47A4ZaG2EyEk2UtYFKxFEoJudb3aLyzOuMPThZH
 e2d0RiVK9SEjyY2OE/ZIhpsesW/cUJmbj9TN5wd6PX/itcbrDcmPexLZt3PJuc+BfdQm
 3/ZNse/gWiT3kzr0BVrEUO20bRzSHZbl+nqCkZj5d/XbLsk/vtasz1luhaPqPJ0sw5aG
 7OGA==
X-Gm-Message-State: ABy/qLZiISDRRtQgZ+NS7gv9mo9L3YVqVmCi5vvcIowVRvGzsbaRj35z
 XM8JFVR89Y7c6aPK9p1lKXt95Q==
X-Google-Smtp-Source: APBJJlHoPWiJ+zL67E7qu/qFZrerKYtASEN7Qg9ykdKw197ATwwwuY9455BZXoAVxupVAByNlRMi0Q==
X-Received: by 2002:a05:651c:120a:b0:2b7:33b9:8809 with SMTP id
 i10-20020a05651c120a00b002b733b98809mr4333017lja.16.1690669629823; 
 Sat, 29 Jul 2023 15:27:09 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 y9-20020a2e9789000000b002b9ae051ea1sm1734737lji.113.2023.07.29.15.27.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 15:27:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun, 30 Jul 2023 01:27:01 +0300
Message-Id: <20230729222708.329265-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 0/7] drm/msm/dpu: change interrupts code to
 make 0 be the no IRQ
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

Having an explicit init of interrupt fields to -1 for not existing IRQs
makes it easier to forget and/or miss such initialisation, resulting in
a wrong interrupt definition.

Instead shift all IRQ indices to turn '0' to be the non-existing IRQ.

Dependencies: [1]

[1] https://patchwork.freedesktop.org/series/118088/

Changes since v3:
 - Added a fix for writeback code
 - Fixed articles in commit message (Marijn)
 - Dropped dpu_hw_intr argument of dpu_core_irq_is_valid() (Marijn)
 - Reworked REG_IRQ_BIT / REG_IRQ_MASK / REG_IRQ_IDX (Marijn)
 - Fixed irq format strings (Marijn)
 - Also updated all trace points to use reg/bit pairs instead of raw
   index

Changes since v2:
 - Added the dpu_core_irq_is_valid() helper
 - Replaced irq_idx with reg/big pairs in kernel output
 - Readded -1 when accessing the IRQ structure.

Changes since v1:
 - Rebased on top of msm-next-lumag and updated IRQ rework series.

Dmitry Baryshkov (7):
  drm/msm/dpu: remove irq_idx argument from IRQ callbacks
  drm/msm/dpu: extract dpu_core_irq_is_valid() helper
  drm/msm/dpu: add helper to get IRQ-related data
  drm/msm/dpu: make the irq table size static
  drm/msm/dpu: stop using raw IRQ indices in the kernel output
  drm/msm/dpu: stop using raw IRQ indices in the kernel traces
  drm/msm/dpu: shift IRQ indices by 1

 .../msm/disp/dpu1/catalog/dpu_3_0_msm8998.h   |   4 -
 .../msm/disp/dpu1/catalog/dpu_4_0_sdm845.h    |   4 -
 .../msm/disp/dpu1/catalog/dpu_5_0_sm8150.h    |   8 -
 .../msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h   |  10 --
 .../msm/disp/dpu1/catalog/dpu_5_4_sm6125.h    |   3 -
 .../msm/disp/dpu1/catalog/dpu_6_0_sm8250.h    |   8 -
 .../msm/disp/dpu1/catalog/dpu_6_2_sc7180.h    |   3 -
 .../msm/disp/dpu1/catalog/dpu_6_3_sm6115.h    |   1 -
 .../msm/disp/dpu1/catalog/dpu_6_4_sm6350.h    |   3 -
 .../msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h   |   1 -
 .../msm/disp/dpu1/catalog/dpu_6_9_sm6375.h    |   1 -
 .../msm/disp/dpu1/catalog/dpu_7_0_sm8350.h    |   8 -
 .../msm/disp/dpu1/catalog/dpu_7_2_sc7280.h    |   6 -
 .../msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h  |  13 --
 .../msm/disp/dpu1/catalog/dpu_8_1_sm8450.h    |  12 --
 .../msm/disp/dpu1/catalog/dpu_9_0_sm8550.h    |  12 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h  |   8 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |  41 +++--
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |   6 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |   8 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |   4 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  16 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  14 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 160 +++++++++++-------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  20 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |  72 ++++----
 26 files changed, 193 insertions(+), 253 deletions(-)

-- 
2.39.2

