Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6D62D485D5C
	for <lists+freedreno@lfdr.de>; Thu,  6 Jan 2022 01:43:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DE7110E573;
	Thu,  6 Jan 2022 00:43:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2D44010E570
 for <freedreno@lists.freedesktop.org>; Thu,  6 Jan 2022 00:43:04 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id p7so1570635ljj.1
 for <freedreno@lists.freedesktop.org>; Wed, 05 Jan 2022 16:43:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XUkEK75e2F3w5u/llnR8n2HAgvHZx74pWDuCDC8nOSM=;
 b=DK4Xf6mITXkcOevJ4wZ51waw2rIr7t8adiZGB11WgPNMb43rmftVNODC0ZnNHtnFJa
 E03mOGa5vxMhterhVQcMMG3tyvp/wBKjJTFPG16d28no6B8QhOv5+/5FNy+u6qQGeZZY
 TvE60iWfQXN4nYECUxJdfFs2/O6sb7wC1ibBCSCMuuL2ofyJ2ysQWsLP/uBxk1S5A+fp
 ZSnzzTA/iYdGMTXaBzqNm9epOh7zcxcTSXIPBkMeZeeR37xsSx/t7bFLFQdCnGO93o7D
 ZnZ9UB3g93B0qeaYxulmTwBE7x5b7pdZfplGVSBPjhYrhDfiNjjv7rj8wAE4v4C+Wikn
 qR5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=XUkEK75e2F3w5u/llnR8n2HAgvHZx74pWDuCDC8nOSM=;
 b=E6tCUpcf9dxuVWV1OCUL93ADI1TTmbgutmAxQGQkdGBsHWcUaH/uZZaSi+kYB5rKOp
 PYghCcKztueGFFfX3Qj2g1qLpTJNBTHNE79D2Ajl02MJGQSsssSZoHuwwdPohqj1uJHL
 Ed9NVfPJa4iyGOPXRWeXQCcqs5nV4gkWoln5F97pZZA90NfWDIm/4M1udTVgZ5QZO9Oe
 LVJFZFL8HeFCiLJZLSz2T06yNDG+OZB29/gzapT9SFctG25bdzOMpkcenCBPd0uBxlev
 m/d7zk3YeOFCIZC1xs3c65jICb7sH6hHgBR/KDM2GCuru+VAgwfo1f5gm1J2LGCU1YJ/
 9Qhg==
X-Gm-Message-State: AOAM5339rjPpX4CLcfci+/bmnpWY5OfKShbi/mcAUf9hwNu0QecaM2q1
 31WjWP17SH5ZcF3JuT0qyYPceA==
X-Google-Smtp-Source: ABdhPJxOTBEliR4cyqqJRtekI49AUXMGi66dhMUQeLqjnoFKWAFQEfnR2O1wFXMHOxlZU5biDnaFlw==
X-Received: by 2002:a05:651c:1a0d:: with SMTP id
 by13mr38658971ljb.107.1641429782465; 
 Wed, 05 Jan 2022 16:43:02 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id i5sm39131lfr.264.2022.01.05.16.43.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 05 Jan 2022 16:43:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@quicinc.com>
Date: Thu,  6 Jan 2022 03:42:53 +0300
Message-Id: <20220106004257.451572-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 0/4] drm/msm: rework MDSS drivers
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

These patches coninue work started by AngeloGioacchino Del Regno in the
previous cycle by further decoupling and dissecting MDSS and MDP drivers
probe/binding paths.

This removes code duplication between MDP5 and DPU1 MDSS drivers, by
merging them and moving to the top level.

This patchset depends on the patch
https://patchwork.freedesktop.org/patch/464362/?series=97310&rev=2 to be
applied (just 1/2, no need for 2/2).

----------------------------------------------------------------
Dmitry Baryshkov (4):
      drm/msm: unify MDSS drivers
      drm/msm: remove extra indirection for msm_mdss
      drm/msm: split the main platform driver
      drm/msm: stop using device's match data pointer

 drivers/gpu/drm/msm/Makefile              |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c   |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c  | 260 ------------------
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c  |  68 ++++-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c  |  11 +-
 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c | 252 -----------------
 drivers/gpu/drm/msm/msm_drv.c             | 260 ++++--------------
 drivers/gpu/drm/msm/msm_drv.h             |  16 ++
 drivers/gpu/drm/msm/msm_kms.h             |  18 --
 drivers/gpu/drm/msm/msm_mdss.c            | 438 ++++++++++++++++++++++++++++++
 10 files changed, 578 insertions(+), 758 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c
 delete mode 100644 drivers/gpu/drm/msm/disp/mdp5/mdp5_mdss.c
 create mode 100644 drivers/gpu/drm/msm/msm_mdss.c


