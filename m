Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 758D09F1856
	for <lists+freedreno@lfdr.de>; Fri, 13 Dec 2024 23:14:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D4710E277;
	Fri, 13 Dec 2024 22:14:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="MLznq2oo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72D4610E277
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 22:14:38 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-30227c56b11so20666291fa.3
 for <freedreno@lists.freedesktop.org>; Fri, 13 Dec 2024 14:14:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734128076; x=1734732876; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=piO3iEUonvXG/YpP5cYnqXXHXA3RyScwDLylgHSdgeM=;
 b=MLznq2oo99W1gy5dQI6nCl88YGxSqqymi9YL3WC4nUpowWUxnz6Lw+4c2z3Zkw4MTR
 aLuTS6ucVFn0qHH0Pl1plCdISa7XuWiF1mRNfs/qXk4Dr3pAkOEWPYy7378d66eD4H5t
 9bdO0YZ/MSqCNhLjBoq/K0EBCzQf1uas8+2HhCtG0NewTmW3UkdqwdeuFW/cKdEBgb5D
 rXdl/tbVa68gtR9px+tmwqyv48fMNyLpcj96W2iyPyBbfJu5+pnFOLmiSiR7DPRimgfZ
 SLJJxZRbSZ9J1HuhIEyU/BG7yVvq4hUFs2FP3q2mSjuAr0nl5/p5awY7cPqY9rTB1Ewb
 eQtA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734128076; x=1734732876;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=piO3iEUonvXG/YpP5cYnqXXHXA3RyScwDLylgHSdgeM=;
 b=PAdhbB17EkpB8WbZ471FxPUPK4uZimAfubbBd6yHjVcG6V9C4TtYvjA7PxCAkILrEs
 a0zHboMsEQVlJU/wX7JnrdsWU2xFB+4BtGjC7Lad5Yx1FYYR0y26bnlZ+N28A6iSxXiw
 gug9bzrDb2dldfbhHEVqG4xQ7Us/FMcys6DbJWVunhu/U6ibXNYPakkH61tcx4KIe791
 cGex5cK8unuEmqqKcV9Xbra2XZO4yYCtuOis1VR68lk6GKLI4acbnN7CwNpxVSOGSeq1
 nFuJq77hEGrtX9fkMUVMwzdL59xmgSb2CC7Oqyw1MHERFaRIAkcAGdVlPd1bRW7V6iTV
 OdAQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUh1JtW6w21PKMOhCX23rMVRGp0W2Ad6rwmCUa7VKFSsX4fHnJBvxcbKblPCHTq3uZV+eQUkXsnC+E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwX60fIKGBzpNp+2SWDrO4MH1/7JOLlrhnkY1FbyJVBXf/66GX5
 nFSZrCfNGvUfxxpUaGGCUh6DnU5u0oOY1e+JwI6hy5fT8PSXh0sHXA6Lka7A1e5B+O8DtG/5gRT
 38SLJ9g==
X-Gm-Gg: ASbGncurrtn6T3in+Ue+fKTt7e00jKyf5P364GgRcXGxR6qmb9uSsRkAES28E4WROc2
 0O3knBkWZVcPBAMYqq593Pbqd+KFID/1uclCi4QxyFOEPsD62NmI2/1LM0KQ52moziYjCuaJg86
 Af/uKUd+wdh+VSd0icVHxjLomsZUgkh83fo4rRr0M9kDu5LNNvTvS63nJHDdt9cNznSAW/tuzrD
 YidlgGJm2/nR6JqPkkvcTznYDynjGHM227QiiSdMIhBAcYlkFGs1v1f5iNWyJWz
X-Google-Smtp-Source: AGHT+IGbQqQ7Qu8wQL0kA96Y19GVt8yuyIETIpiRDuqRBPKtq0Iu6InmLiOUw9B5NZ9yHih+nFaIkg==
X-Received: by 2002:a05:651c:54f:b0:300:3bcd:8d05 with SMTP id
 38308e7fff4ca-3025443fe17mr12038911fa.15.1734128076440; 
 Fri, 13 Dec 2024 14:14:36 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-303441e0f43sm413451fa.125.2024.12.13.14.14.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Dec 2024 14:14:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: [PATCH 00/35] drm/msm/dpu: rework HW block feature handling
Date: Sat, 14 Dec 2024 00:14:16 +0200
Message-Id: <20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALixXGcC/x3MOwqAMBBF0a3I1A6YRPxtRSzEPHUaDRMVQdy7w
 fIU9z4UoYJIXfaQ4pIo+5Zg8oymddwWsPhksoUtjTWOfTjZ6x54xnicish1VTg/OcA0LaUuKGa
 5/2c/vO8HvttxPGMAAAA=
X-Change-ID: 20241213-dpu-drop-features-7603dc3ee189
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5889;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=AGT0VwRtMSmQJOGxsFl1LCGIke4RBrOxt2Uij10pqgU=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ3rMxsOXTfVnHvEOViw5rhYkmXLKpKmjzXtdQezx2jJ3y
 5SCq8adjMYsDIxcDLJiiiw+BS1TYzYlh33YMbUeZhArE8gUBi5OAZhI7SMOhplWHlseaZ38crrJ
 tP7onjQv+RlWLyPsQ92nzL3tvm/F7saIjT3zmuZ/vGp2+MWGrZrSHw7tyl3yeYHlIW3/jOSGAw9
 v2StxhoiY7OV2PDg9y/DTpK8SHawJfutS/WLLUs7oKrs+ZPk0VVF+Q4Gi+2nZekMVo4kf9O72+k
 i/kdw4+fbZZgv9i8YmAdefP7L+/abSYdaHJ87n+6rF7nHfsJ5oxjCVc21IiMikEvkb6X5bJhb5b
 +Be1Zk3I15mJ6czNwujTqG1asDt9gUSRWGFps94RCsF3VwOSWZMjnqufMUtbW9o9pEY4y2VevrX
 Xt25W6IUfePk19zwp1aSfgYuPexf7fyreeNvTNh06ZkGAA==
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Some time ago we started the process of converting HW blocks to use
revision-based checks instead of having feature bits (which are easy to
miss or to set incorrectly). Then the process of such a conversion was
postponed. (Mostly) finish the conversion. The only blocks which still
have feature bits are SSPP, WB and VBIF. In the rare cases where
behaviour actually differs from platform to platform (or from block to
block) use unsigned long bitfields, they have simpler syntax to be
checked and don't involve test_bit() invocation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
Dmitry Baryshkov (35):
      drm/msm/dpu: skip watchdog timer programming through TOP on >= SM8450
      drm/msm/dpu: enable DPU_WB_INPUT_CTRL for DPU 5.x
      drm/msm/dpu: stop passing mdss_ver to setup_timing_gen()
      drm/msm/dpu: drop INTF_SC7280_MASK
      drm/msm/dpu: inline _setup_ctl_ops()
      drm/msm/dpu: inline _setup_dsc_ops()
      drm/msm/dpu: inline _setup_dspp_ops()
      drm/msm/dpu: inline _setup_mixer_ops()
      drm/msm/dpu: remove DSPP_SC7180_MASK
      drm/msm/dpu: get rid of DPU_CTL_HAS_LAYER_EXT4
      drm/msm/dpu: get rid of DPU_CTL_ACTIVE_CFG
      drm/msm/dpu: get rid of DPU_CTL_FETCH_ACTIVE
      drm/msm/dpu: get rid of DPU_CTL_DSPP_SUB_BLOCK_FLUSH
      drm/msm/dpu: get rid of DPU_CTL_VM_CFG
      drm/msm/dpu: get rid of DPU_DATA_HCTL_EN
      drm/msm/dpu: get rid of DPU_INTF_STATUS_SUPPORTED
      drm/msm/dpu: get rid of DPU_INTF_INPUT_CTRL
      drm/msm/dpu: get rid of DPU_PINGPONG_DSC
      drm/msm/dpu: get rid of DPU_PINGPONG_DITHER
      drm/msm/dpu: get rid of DPU_MDP_VSYNC_SEL
      drm/msm/dpu: get rid of DPU_MDP_PERIPH_0_REMOVED
      drm/msm/dpu: get rid of DPU_MDP_AUDIO_SELECT
      drm/msm/dpu: get rid of DPU_MIXER_COMBINED_ALPHA
      drm/msm/dpu: get rid of DPU_DIM_LAYER
      drm/msm/dpu: get rid of DPU_DSC_HW_REV_1_2
      drm/msm/dpu: get rid of DPU_DSC_OUTPUT_CTRL
      drm/msm/dpu: get rid of DPU_WB_INPUT_CTRL
      drm/msm/dpu: get rid of DPU_SSPP_QOS_8LVL
      drm/msm/dpu: drop unused MDP TOP features
      drm/msm/dpu: drop ununused PINGPONG features
      drm/msm/dpu: drop ununused MIXER features
      drm/msm/dpu: get rid of DPU_MIXER_SOURCESPLIT
      drm/msm/dpu: get rid of DPU_DSC_NATIVE_42x_EN
      drm/msm/dpu: get rid of DPU_CTL_SPLIT_DISPLAY
      drm/msm/dpu: move features out of the DPU_HW_BLK_INFO

 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  53 +++-----
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |   4 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |   3 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |   4 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |  15 +--
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  19 +--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |  19 +--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |  12 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  21 +---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h |   1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  41 ++-----
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  43 ++-----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |  31 ++---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |  14 ---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  42 ++-----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  14 +--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |   5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |  16 +--
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |   5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |   6 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  44 ++-----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  22 +---
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  50 ++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  47 ++------
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |  53 ++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  47 ++------
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |  52 ++------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   2 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   3 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  51 +-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     | 134 ++-------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         | 106 ++++++++--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |  21 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c     |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  14 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |  28 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c     |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |  11 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |  17 ++-
 50 files changed, 295 insertions(+), 836 deletions(-)
---
base-commit: 789384eb1437aed94155dc0eac8a8a6ba1baf578
change-id: 20241213-dpu-drop-features-7603dc3ee189

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

