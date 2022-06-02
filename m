Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5E2D853BFB9
	for <lists+freedreno@lfdr.de>; Thu,  2 Jun 2022 22:24:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2618113449;
	Thu,  2 Jun 2022 20:24:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 73E0E11343D
 for <freedreno@lists.freedesktop.org>; Thu,  2 Jun 2022 20:24:51 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id s6so9518007lfo.13
 for <freedreno@lists.freedesktop.org>; Thu, 02 Jun 2022 13:24:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QnpqY7uSZkIjcnvWBh5WX4NtB+14lkn/cDIY5XypWiU=;
 b=V8x9UugTi+NUAHS7VIDD+H8ooMJX0nFbVGf5CFVBC/YX7hJJITDrtgOR4CZG3y9y/7
 YKvZmhezTevnQjudZ3Jl0cc6mRqya7HtCnnA9H5eLMu7VDuapKcSpNfEqwNCG/9ZPFL+
 4NNk0VrDpClVhig4K/qLV+xWfJjfErBZEzQ6r4oiwd6SmuvNC32GQpS4MQjZKQEKmI2x
 9wzqq1ZUlFu7KJhmf9wM17Ees03xTBUHUrWdbwayeN3W8i54nBp1ZWU9V9OTCXhrNl92
 qitVMI6lBcZROcRfUuS2TWQE+UH3OZYDs1mnwj7JmY0DfJDtT1GYLpz+3d5JivWeu/Da
 K2/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=QnpqY7uSZkIjcnvWBh5WX4NtB+14lkn/cDIY5XypWiU=;
 b=mHSHaXA7ra4+E0hm32+Lnhu+enwJOEcYUi1qLs/vr+1xIHzOswHUScV0QQsysFNWDl
 d7UgYtjK37irDtq551ONzFzB6Je5fHEBFjZJsauQPybt4j3OJt7N3o5GIh57UiESgMU8
 HqpYB5Invf8ddnMNXHDsWove/LV97VC49r7PqgHRBPlUwcYBeelRlT00znsbp26akt6f
 nzexWPXdxB1k3kmKSQhwusFTxp1A3i1Y7Rdks7bZwwfOyfDAn9E0xrywV0Pg5Brzl1FZ
 vAp5IWkFy5syABAiC0BL54P/K8D6bu1XABCOl96eKYT2su2P8PjabhRMHbed3d7W36aR
 MgUA==
X-Gm-Message-State: AOAM531+pSbUqBdWizEquLdZ/XY1X/2AG1FcDyXjnTXcofRaCLtWdIgs
 9mEYvZq9ba8SHYmRfQnUV9kSdg==
X-Google-Smtp-Source: ABdhPJzwnbItBXkAB/92vlcFEICxkkfN0YzB9bqgMnE4WzQKRCLbxMnmck7dZ67mcbKAhXHrIY596g==
X-Received: by 2002:a05:6512:3c93:b0:44b:4ba:c334 with SMTP id
 h19-20020a0565123c9300b0044b04bac334mr4723285lfv.27.1654201489800; 
 Thu, 02 Jun 2022 13:24:49 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([188.162.64.241])
 by smtp.gmail.com with ESMTPSA id
 d25-20020a056512369900b0047255d21114sm1205718lfs.67.2022.06.02.13.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 13:24:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu,  2 Jun 2022 23:24:40 +0300
Message-Id: <20220602202447.1755115-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 0/7] drm/msm: clean up the hw catalog init
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

Changes since v3:
 - Add missed Reviewed-by tags by Abhinav.

Changes since v2:
 - Add DPU_MIXER_COMBINED_ALPHA to sc7180's mixer features mask (noted
   by Abhinav).

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
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    | 502 ++++++++----------
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
 27 files changed, 283 insertions(+), 359 deletions(-)

-- 
2.35.1

