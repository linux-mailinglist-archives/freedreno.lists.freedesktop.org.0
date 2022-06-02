Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C59553BF8D
	for <lists+freedreno@lfdr.de>; Thu,  2 Jun 2022 22:22:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A60CA11337C;
	Thu,  2 Jun 2022 20:22:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADCE1113355
 for <freedreno@lists.freedesktop.org>; Thu,  2 Jun 2022 20:22:11 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id y32so9528402lfa.6
 for <freedreno@lists.freedesktop.org>; Thu, 02 Jun 2022 13:22:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RrzI1getV/ADdiH5dGCs6DMyqPDlpomnMlv6FBCfN08=;
 b=UoLzTlReBPtoSAm60o3euqpY4Sk9mVIPfEcdsDo57kir3+XJYWcH+nq4kFyoQ0U2yw
 Pm7Kdqb8cOSf8APRE2eeQvhA3NlFxoNTJ82Us66rhtP61vpb3r9QgWo/F6JZoHIXKGq9
 4tD4zGGS2gGzdXGEucia2hJYs1llxVPIQyc+4ny3hhv7bfRK9kPM/lNwSluneLbsWgJA
 MqvrgYxtTBq2Qitlv8x4yEyO1eRfo6svCEzAzqcFfKDGml0hxZD3n6Ol4XRP8AI1urxw
 KbSGQpMNjo+F+ee5kVmhFS6yURZJPYi0uVWoDgMY+KFHkRYkgJgJ1xvjC/cBRczyuLwK
 gKAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=RrzI1getV/ADdiH5dGCs6DMyqPDlpomnMlv6FBCfN08=;
 b=Zf7a/yW5M/1mI+bnredO4c6SVaBuKHVBBLImQF+z9V1KjGw1H8KB9hvMTTwI8S6b7L
 OObiOijVUxfP7UPzNfSFXtgC3tuI4BXMLbTCovEKbg8GwPV8HSYMlk6pduFrowjPcGma
 RMo/+uGn604L9xNK/KFy/yRxoABTj5EspkDoeuGv6cFCFeAEgaJu81BZ23C1ouf98tUr
 ZmoYTkqc7jfO+km6CmYUwNgR9HnaaVDuiwbL1CvWP+v9v7tY1mKgWRNSDr5pXiFNmRlq
 wCQ9Q64cr3P8Bax/ECdsd9tu5/t/vU0WD4HrrNrl96enJoGIpQmJHuBjdikbHlGQKubN
 ZDNA==
X-Gm-Message-State: AOAM5337N5knXoFaqY5V4Ge6nIH32NqwfXGgBjtma4NnfTPBrqX6a91U
 ZtWsrOb8uPU88bqOntI49u9A8A==
X-Google-Smtp-Source: ABdhPJwEUXwiDUMxztF8zKjhhHhRtlRc54Z4h8FmkgESO7euNGoHEKnRxlJhpUx+2cpKYHKcEnPUvQ==
X-Received: by 2002:ac2:555b:0:b0:478:7e7d:1b4 with SMTP id
 l27-20020ac2555b000000b004787e7d01b4mr37043095lfk.537.1654201329992; 
 Thu, 02 Jun 2022 13:22:09 -0700 (PDT)
Received: from eriador.lumag.spb.ru ([94.25.229.139])
 by smtp.gmail.com with ESMTPSA id
 p12-20020a2e740c000000b0024f3d1daef5sm992451ljc.125.2022.06.02.13.22.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jun 2022 13:22:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu,  2 Jun 2022 23:22:00 +0300
Message-Id: <20220602202207.1754351-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 0/7] drm/msm: clean up the hw catalog init
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

