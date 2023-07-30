Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A72A87682CE
	for <lists+freedreno@lfdr.de>; Sun, 30 Jul 2023 02:35:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 676F810E12F;
	Sun, 30 Jul 2023 00:35:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12DE510E12F
 for <freedreno@lists.freedesktop.org>; Sun, 30 Jul 2023 00:35:22 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b9b6e943ebso52853151fa.1
 for <freedreno@lists.freedesktop.org>; Sat, 29 Jul 2023 17:35:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690677320; x=1691282120;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=LAbWbSfrjAJXL01M6Z3Udbs8b9DnT7yJqHEur/XSDic=;
 b=DSr/Om6fzFiz9i6efc8fkAF+21qOKuIW0ddAujS3XSdmW0VxPUI4mYmT6h/1oIst2u
 bzrknbPqmaN2XCYFve+iHcXFBY37x7FZN4GQ1pBTlf4BHFbebmeyc5u9lrb/6UAmEg9q
 4r1aoKB/jYpT6zUXxHtTy6Ft5f4QEXxmFuqQghBqs+8Eq/a95iStQ6d22o8Q1D+IQApp
 NSYgjCi57nvYsqrVeI+wfPOlPznJkz2TWWf3D/mxzpS/RRtduL9eqe13glfjkDdKtKQy
 bjxqpan0dmgNeeSNnIJQ31v4u/OdmjMrCsun2kuEjwvc+luIUU4ALEkGyUwBuoVvtCmu
 KOxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690677320; x=1691282120;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=LAbWbSfrjAJXL01M6Z3Udbs8b9DnT7yJqHEur/XSDic=;
 b=eGGOPeDUneY6j3S7cq5nXz/8LKQ3XhBUswLULHg0q/1PIaN+8SmzBY9567CUh0Dyrl
 Iry/mbY5mPUAYxfmELDT24lNPWiYaPQ/XcJO2MXd1bapj0okdvefpHyf+ivpNKXIUcsX
 O8FqA6OHA1RLKLVFbcE/jAULGNCMZ275x7iEo/FrlnOR8ye04XbUAFWTjCajAVwxp+ft
 bNWTl8INrANXTslv/qFGwDU0dTuKTS6f1P6rABHKJ9XQN1Seb1lqBSpWzdUSMeWKkCrd
 rMfWAS06uOwW5PpUrxIVUQzpWBzbal0YM1K0Qh5AEcessuH0lWHEn/KKsT+vjFB6M3d0
 zXxQ==
X-Gm-Message-State: ABy/qLZQfLFJ6pR1r/k6jzckDTMMFMN3nrhOZnT4YMIt5BWfClIKa9/E
 E+ieowNBPfapjl68Mpk8S3vwfg==
X-Google-Smtp-Source: APBJJlH+z2podrmuC7Iatzg4fJ0yg2/rK9ZTkFuqESYst25YRswpz9UFoGjWeEu2xrp3QWFvdW6t/g==
X-Received: by 2002:a2e:8755:0:b0:2b6:f85a:20af with SMTP id
 q21-20020a2e8755000000b002b6f85a20afmr2181867ljj.4.1690677319718; 
 Sat, 29 Jul 2023 17:35:19 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a2e8016000000b002b6ffa50896sm1780482ljg.128.2023.07.29.17.35.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 17:35:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun, 30 Jul 2023 03:35:10 +0300
Message-Id: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 0/8] drm/msm/dpu: drop DPU_INTF_TE and
 DPU_PINGPONG_TE
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

Drop two feature flags, DPU_INTF_TE and DPU_PINGPONG_TE, in favour of
performing the MDSS revision checks instead.

Changes since v1:
- Added missing patch
- Reworked commit messages (following suggestions by Marijn)
- Changed code to check for major & INTF type rather than checking for
  intr presence in catalog. Added WARN_ON()s instead. (Marijn)
- Added severall comments & TODO item.

Dependencies: [1], [2]

[1] https://patchwork.freedesktop.org/series/118088/
[2] https://patchwork.freedesktop.org/series/118836/

*** BLURB HERE ***

Dmitry Baryshkov (8):
  drm/msm/dpu: inline _setup_pingpong_ops()
  drm/msm/dpu: enable PINGPONG TE operations only when supported by HW
  drm/msm/dpu: drop the DPU_PINGPONG_TE flag
  drm/msm/dpu: inline _setup_intf_ops()
  drm/msm/dpu: enable INTF TE operations only when supported by HW
  drm/msm/dpu: drop DPU_INTF_TE feature flag
  drm/msm/dpu: drop useless check from
    dpu_encoder_phys_cmd_te_rd_ptr_irq()
  drm/msm/dpu: move INTF tearing checks to dpu_encoder_phys_cmd_init

 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 54 ++++++++++---------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  3 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  6 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   | 51 +++++++++---------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 41 +++++++-------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.h   |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |  2 +-
 7 files changed, 77 insertions(+), 83 deletions(-)

-- 
2.39.2

