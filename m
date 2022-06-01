Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B152653A9BF
	for <lists+freedreno@lfdr.de>; Wed,  1 Jun 2022 17:16:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1125810E212;
	Wed,  1 Jun 2022 15:16:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A285F10E212
 for <freedreno@lists.freedesktop.org>; Wed,  1 Jun 2022 15:16:16 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id u23so3314850lfc.1
 for <freedreno@lists.freedesktop.org>; Wed, 01 Jun 2022 08:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g6KOzK1wBJwy3fIC+H9t0O69JIU0L0pK8Y3WOrDMzMo=;
 b=o/5TryVyPmMjLG6+uoJ4V8nADbhbsOpy17OYQL62lVOvXlC2q5J+9UVnUdOke4QS41
 ZzMO+QbvpjNqfPyXJsTeAcc6GEPL7a1khH4SYRZKeo2O565kW5rkHYikDAnKimuiCyYW
 brW74y/z1jnYvkttaBtPoejriej4ubcSVsUXwU6XLUoABdIewEAsvH0kfA3TlyYcna0j
 UxsgRZiJAGyUDJMB72D3AEaeDaVdoskleRS6mM8mYW1S4+aA+ZcvLcSEsQNTfNBMg8SB
 ko32JA625HVN4cVQQtQu9+GepOkD4vQZWGD+DPV+bldvTeU+jhDdBuaMbluiTUfFFa6K
 O2kQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=g6KOzK1wBJwy3fIC+H9t0O69JIU0L0pK8Y3WOrDMzMo=;
 b=KGD5FjdiLlOLU0ZTSoPLz/Hbn9rUkGgnP9SE5eohTTKSXiPqPNUI09Tw0sOmdOXaEs
 6UXFVkuIYmZxxpILkk7iHvZ/PvhRD9C7LN1Hvdo3ggfZ4cs0u8KqASqbskIQT2UUpCZR
 C/M/yx9fp6gwJsiySfe3nMT5v9o8wJRh1UBlhMWecu3y4tOX71eGfPBxOICCAl32B3Qf
 NMP7DV/++jr3PbffmahNVn7JvUzitBZBHo/4dt1gP15vAndUTEkznUq/f5RDh6kHC42X
 nhWPMIsy8Qph7qN1LfdLJYaauI73ugZaF5CZhjzgDvXJ0SAzFD4eBE1SkmHEc9aqXjp1
 CAmA==
X-Gm-Message-State: AOAM533mPgR+Ntpzv0BuXzSmJ4EMPRyUUz0LgUZ1pS+FZMCBhoyzdV7c
 zqa/2sYt6zddFS2tZJ0xNoW4pw==
X-Google-Smtp-Source: ABdhPJxxgtMFmzHwUs2iXsWaBdtpeFiYbbmXLIq9X+HInbKbcMdBW7tel2W6a9F27fzw3+04H5Tn9w==
X-Received: by 2002:a05:6512:c04:b0:478:f837:d813 with SMTP id
 z4-20020a0565120c0400b00478f837d813mr136328lfu.17.1654096574815; 
 Wed, 01 Jun 2022 08:16:14 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 bp17-20020a056512159100b0047255d21186sm415294lfb.181.2022.06.01.08.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Jun 2022 08:16:14 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed,  1 Jun 2022 18:16:08 +0300
Message-Id: <20220601151613.1513554-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v1 0/5] drm/msm: clean up the hw catalog init
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Replace superfluous cfg_init functions, which just assign a static
config to the struct dpu_mdss_cfg, with static instances of struct
dpu_mdss_cfg.

Dmitry Baryshkov (5):
  drm/msm/dpu: use feature bit for LM combined alpha check
  drm/msm/dpu: move VBIF_XINL_QOS_LVL_REMAP size to hw_catalog
  drm/msm/dpu: remove hwversion field from data structures
  drm/msm/dpu: constify struct dpu_mdss_cfg
  drm/msm/dpu: make dpu hardware catalog static const

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   4 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |   4 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 500 ++++++++----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  16 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c    |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c    |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h    |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c   |   1 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |   5 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c   |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c     |   7 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c    |   1 -
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c    |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   2 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_vbif.c   |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   6 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |   2 +-
 27 files changed, 258 insertions(+), 334 deletions(-)

-- 
2.35.1

