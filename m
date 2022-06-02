Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 336EC53B9A9
	for <lists+freedreno@lfdr.de>; Thu,  2 Jun 2022 15:30:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0E5E10FDFB;
	Thu,  2 Jun 2022 13:30:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5519810FDFB
 for <freedreno@lists.freedesktop.org>; Thu,  2 Jun 2022 13:30:42 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id h23so7832136lfe.4
 for <freedreno@lists.freedesktop.org>; Thu, 02 Jun 2022 06:30:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u3whyehpi0aZCL0iJ2vFWoTKNdbN9RZd/7JoMAO4pSc=;
 b=w0WrhdGE6Xjz/JLc7g9BFS2Yxgn4ta8BjzEhys1Q09fliDtkgxhIZTu5Z3A3fTueO9
 8fqIdvpV6L80t6WIeGUQPWmfqPbL3DhbTELR2bL6DCzkFivhotsgkrJggun0OoJplkzm
 XqyJ7q7IKAod117wVmUZlG7OOnqnwwpeC9VVykFpPgDt4qDC+62A+USnA3V/9iB+fSDI
 Aa4ctRn0nA332JPPVy/0oil3RrjgSOgm+i+Oc+8niuXlELV54c1UC8+EZTpZKCLopcXL
 qIk7li5O+SqwjAdBGwsaXcbnL6CrmhbiYKroh/RPhVyhx1fK5ftyiU5E24Dcm1WUeNhU
 pYUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=u3whyehpi0aZCL0iJ2vFWoTKNdbN9RZd/7JoMAO4pSc=;
 b=Fm+fjv6Dgn6EtDrvTF6CXfDOnlsr3t949xieeCtRwCeLuVLlq8dWYeVOzRclJbEWM2
 KUclEaqSxj247RceODMdMPRwKT7Ne9/BgLhMpGYuTuwsqj2heckDdHpvYr8UfALZIF2H
 6pjcsAmo8pTu3ZAUqE8XUbm4DvkdPIwLq+hbcDcaL0yEcS4Rjv8TGHOWuQUq/qOBV9K/
 oNIiuSTn6iHRGM1LkZ8j0K6CgqhzWI84XZ1Y+Zf41y4sUJeBLNBEpdVw/Nc2aP8me8UC
 hwoHoGjo3vQtzZnXgMRSVSRZX7jmg7gORd94omtsz8F+RC/eM+Rah9jI5gJX7NK3WTwQ
 wGcg==
X-Gm-Message-State: AOAM530fFKe988Ja76Htvd8Fne+DVyiPBE8P83MPwvrQ3M7mbMyDe2n5
 S4iHJD8mD0rr0DKsCwMObwYF2g==
X-Google-Smtp-Source: ABdhPJwFnfXhKy3OI3IhgNTaU8saaxeVINMCI7Yz4/mhqO9i/NQxz2ls+H55yXTyM6K+JhIF1o80KQ==
X-Received: by 2002:a05:6512:31d3:b0:478:6a68:e24 with SMTP id
 j19-20020a05651231d300b004786a680e24mr3764732lfe.364.1654176640376; 
 Thu, 02 Jun 2022 06:30:40 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 i20-20020a056512341400b0047255d211a2sm1025399lfr.209.2022.06.02.06.30.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 06:30:39 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu,  2 Jun 2022 16:30:32 +0300
Message-Id: <20220602133039.1739490-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 0/7] drm/msm: clean up the hw catalog init
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

Changes since v1:
 - Turn catalog->perf and catalog->dma_cfg to be pointers, otherwise
   clang complains that they are not constant.

Dmitry Baryshkov (7):
  drm/msm/dpu: use feature bit for LM combined alpha check
  drm/msm/dpu: move VBIF_XINL_QOS_LVL_REMAP size to hw_catalog
  drm/msm/dpu: remove hwversion field from data structures
  drm/msm/dpu: change catalog->perf to be a const pointer
  drm/msm/dpu: change catalog->dma_cfg to be a const pointer
  drm/msm/dpu: constify struct dpu_mdss_cfg
  drm/msm/dpu: make dpu hardware catalog static const

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c |  24 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   |   4 +-
 .../drm/msm/disp/dpu1/dpu_encoder_phys_wb.c   |  12 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 500 ++++++++----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  20 +-
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
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c     |  20 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c        |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.h        |   2 +-
 27 files changed, 282 insertions(+), 358 deletions(-)

-- 
2.35.1

