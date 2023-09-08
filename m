Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B38207980C4
	for <lists+freedreno@lfdr.de>; Fri,  8 Sep 2023 05:05:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A1B9B10E852;
	Fri,  8 Sep 2023 03:05:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5486010E760
 for <freedreno@lists.freedesktop.org>; Fri,  8 Sep 2023 03:05:24 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b974031aeaso28585271fa.0
 for <freedreno@lists.freedesktop.org>; Thu, 07 Sep 2023 20:05:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694142322; x=1694747122; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=5o+SPaUCffB9wFtrSLZVybbJbjD0ZXPNdB88Cfri9WY=;
 b=OLw28sQiz7c383yZr+nf+SwzfE5qNU95vg4Lkj754qbvFP9Tg+YKZiXlD24MPoXPmD
 REYLeP/lr5CbBp/QWm9NjM0M+COr2z4wMxFXeZFaDv984BYPZ35bOUC0tT+BcVk6HXTK
 jPcCh2n6Hnv26/RRBKqh/dEelk/Xht09Z87N2+fcb1VIskwFC+w2WM0ZgRuZJTTOlXfs
 mLu2F3GfcSCvuLBNrQ9d0ikzQfVUR4mpGhbKqhwSrwz9+naXFFoWiixRkILpuc5OAahN
 GGWpJ6QfxP7a9sNAoQUFxnDcH3AmDzqb75WTFMwLGTetI3euAubJkCol5NJ5rI8EbKLn
 X2WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694142322; x=1694747122;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=5o+SPaUCffB9wFtrSLZVybbJbjD0ZXPNdB88Cfri9WY=;
 b=vkkzld+NDctsua3NtUSuDErsT3e9sDRzv4rq1KNbhLi2NcYCHgvcAI0Fp2og04jwQN
 4QMoLLIfY+3LPKYTt+1NCMK3+XhY8CKjqDsDMCuFF6t5ZYtYeTxgb/HGDYJjYS5JLIvX
 HdTdhn6Y+DizYZ2omwez0zo0ThfDuBQuaHb3sIcx3D+kyaFqJ1Wzvt4xEv5SW2Md6oyP
 sA6OipFeKuAV4l9teeP4UzlyVhhF8INSl5lvKE8NcR3BpeGJv/8wlvg1Vx6hJ1PsDzvl
 LH47Hc7nuIur8Yovv5wCSMow0QwGPNcHVjInIMpPnsFBjQq4iv3s58GwevbtG99ztUfq
 ybGg==
X-Gm-Message-State: AOJu0YxGECW/Y/cC3FdkRfJ0HydTlB6Z1rH0csmX2s4ITjmIB9CvTpnM
 WRASg4Uk5gh5xXR4WNKN5RF5yg==
X-Google-Smtp-Source: AGHT+IHGkh/WaT5fi2tv+g9ZoxjNNOQzvf8MVWos7gGhrta4aPejRWa4/qo9xN2YnHu/3XzvVEVFDg==
X-Received: by 2002:a2e:9012:0:b0:2bc:db5a:9540 with SMTP id
 h18-20020a2e9012000000b002bcdb5a9540mr646083ljg.42.1694142322434; 
 Thu, 07 Sep 2023 20:05:22 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z10-20020a2e8e8a000000b002b93d66b82asm128332ljk.112.2023.09.07.20.05.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Sep 2023 20:05:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Date: Fri,  8 Sep 2023 06:05:16 +0300
Message-Id: <20230908030521.236309-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/5] drm/msm: cleanup private obj handling
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
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

While debugging one of the features in DRM/MSM I noticed that MSM
subdrivers still wrap private object access with manual modeset locking.
Since commit b962a12050a3 ("drm/atomic: integrate modeset lock with
private objects") this is no longer required, as the DRM framework
handles private objects internally. Drop these custom locks, while also
cleaning up the surrounding code.

Dmitry Baryshkov (5):
  drm/atomic: add private obj state to state dump
  drm/msm/dpu: finalise global state object
  drm/msm/dpu: drop global_state_lock
  drm/msm/mdp5: migrate SMP dumping to using atomic_print_state
  drm/msm/mdp5: drop global_state_lock

 drivers/gpu/drm/drm_atomic.c             |  9 ++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 14 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h  |  1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c |  2 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 54 +++++-------------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.h |  1 -
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c | 12 +-----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h |  4 +-
 8 files changed, 31 insertions(+), 66 deletions(-)

-- 
2.39.2

