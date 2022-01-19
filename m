Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BCECA4942E4
	for <lists+freedreno@lfdr.de>; Wed, 19 Jan 2022 23:16:22 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6086710EE8B;
	Wed, 19 Jan 2022 22:16:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3BA610EE89
 for <freedreno@lists.freedesktop.org>; Wed, 19 Jan 2022 22:16:19 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id m3so14196082lfu.0
 for <freedreno@lists.freedesktop.org>; Wed, 19 Jan 2022 14:16:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wentIdGMex7cJsypmwDQmsmO24X3lRILvlbSaTQV1CE=;
 b=codcPLfy/wN5lv0LpcSen1o7LnvOWLomPolURzU8l5GS0JIzHXuAX9sF+nJICfBwz+
 FGZi88g5QZI4vnNCHAfjI88yrW2EexSYY4AA2eGlIg/VIRMS+Tk8ff6ITMezaNSdsXvz
 S6Hxhd0udKBxmDl7caK+uFMyz4WomgnAgTgFUTPlDP5/d+HYvyOqVw5ZI25IPDwbTI0q
 V/JtSbVSFwvbO4Tabrlv5IGYwsARj7a2xFPt54+DBxu/vyc9hlxf4+hb3x0VNYgJ1JlN
 vFLMI4ITTO3bjEIREuFFqqRMkUqmqq6AqgjiYpc/2DpoUPHwn1kO09EriGceEv455AYl
 BkSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=wentIdGMex7cJsypmwDQmsmO24X3lRILvlbSaTQV1CE=;
 b=U0PO56+WWtr1QJnB5EpKWiB9+JEuv8brmYas42azf01uzN/tpcEzoUbwFFViQgTYE2
 eV/PBIb0T07wB8vV7Jpysmwmfx5fs2t9UjS/EpgfuCvumgTu8ay27bzRn4/qnwiHG+Jy
 snGIa4eXku9gkB+brQZsIQac5eU+4IJSz2R1Qdd9f41m8DKqhnE86ff/h5WcRP7E8tHX
 JJ8bPDTtaFfxS3FuC77jPft0ttWMV0F7Oa+7QNnyNFfvtsX2oIA+DT2x0qnBTWqY1xEO
 LULUK+mDIl97TzZBuSylj7x8FQyKEv4+UylzxC1q1rBfRqM0685YBp0JOjnKZHMLlLuf
 gESQ==
X-Gm-Message-State: AOAM5312VnaQDQSQBpT7QCG+122g29IgMq/CPwttnKwrkV2MYgxid6wt
 5i2F3wYLTj8n1rZp1WyWZQDIwA==
X-Google-Smtp-Source: ABdhPJytPZPvnBPnSyVQVLks9jbTqGrJIo13plYjVI4Z+OCSKv8FExvgtw1WJYiyvsBysqV2M1pcag==
X-Received: by 2002:a2e:9646:: with SMTP id z6mr17891630ljh.51.1642630577935; 
 Wed, 19 Jan 2022 14:16:17 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id b11sm89053lfb.277.2022.01.19.14.16.16
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 19 Jan 2022 14:16:17 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 20 Jan 2022 01:16:13 +0300
Message-Id: <20220119221616.3089119-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 0/3] drm/msm: rework clock handling
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

msm_dss_clk_*() functions significantly duplicate clk_bulk_* family of
functions. Drop custom code and use bulk clocks directly. This also
removes dependency of DP driver on the DPU driver internals.

Prerequisites: [1]

Changes since v2:
 - Retain conditional code/prints in DP code to ease debugging
 - Rebase on top of msm-next and [1]
 - Split helper functions to msm_io_utils.c as suggested by Jessica

Changes since v1:
 - Rebase on top of current tree to fix conflicts

Dmitry Baryshkov (3):
  drm/msm: move utility functions from msm_drv.c
  drm/msm/dpu: simplify clocks handling
  drm/msm/dp: rewrite dss_module_power to use bulk clock functions

[1] https://patchwork.freedesktop.org/series/98521/

 drivers/gpu/drm/msm/Makefile                  |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  24 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c   | 187 ------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h   |  40 ----
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  46 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_mdss.c      |  26 +--
 drivers/gpu/drm/msm/dp/dp_ctrl.c              |  19 +-
 drivers/gpu/drm/msm/dp/dp_parser.c            |  21 +-
 drivers/gpu/drm/msm/dp/dp_parser.h            |  17 +-
 drivers/gpu/drm/msm/dp/dp_power.c             |  82 +++++---
 drivers/gpu/drm/msm/msm_drv.c                 | 119 +----------
 drivers/gpu/drm/msm/msm_drv.h                 |   1 +
 drivers/gpu/drm/msm/msm_io_utils.c            | 176 +++++++++++++++++
 15 files changed, 305 insertions(+), 465 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.c
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_io_util.h
 create mode 100644 drivers/gpu/drm/msm/msm_io_utils.c


base-commit: 6ed95285382d6f90a3c3a11d5806a5eb7db715c3
prerequisite-patch-id: b5572c353efa8ebefb32fc70e54bc537f78ff2bd
prerequisite-patch-id: 40a854aee69b6ddf5b1c33cac3647efae3e3ebf1
prerequisite-patch-id: 8b687a19047983e26262a1bb2feda8a9fd5bc97f
-- 
2.34.1

