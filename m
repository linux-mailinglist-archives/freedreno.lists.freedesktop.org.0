Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 642A53ABEC8
	for <lists+freedreno@lfdr.de>; Fri, 18 Jun 2021 00:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 590006E2DC;
	Thu, 17 Jun 2021 22:20:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 579BC6E2DC
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jun 2021 22:20:33 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id q20so13047979lfo.2
 for <freedreno@lists.freedesktop.org>; Thu, 17 Jun 2021 15:20:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TnDxm5Myfwg5gbjOfoJxbYlC7zAotfbp+Dq9xZI9JiA=;
 b=MTgqmKBjCmaCC6ez9w4CKSQaheV4WhyLWOrnZc07tP/BHPdcg1WxNpVnSiJtVw0JIy
 uOo0RFhaDmQVfHNERPhPa9rpcmMoidbEkGsVXVBUbRpJWG4WDwmPrVRIts6g062MVQUd
 PeuQqTixHpFKm+0sSiCZUEoZkOgu+V4uIGdoDUfpdYMQOtdg7g6mv3TMHK7OT+uOLMWW
 EuLSTnRA9OAMm3SXz0WcRHEsV3rAxfG6FwVQjXm/99k3tO/BqfyXYydL9VlndoY/JBGo
 peKeg0twzAXBCCXMI8kKubMPzZNFQO05svRxlj01qL9k4tAMplLJQ2bStOVzMtX0iJ/b
 V6Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=TnDxm5Myfwg5gbjOfoJxbYlC7zAotfbp+Dq9xZI9JiA=;
 b=tKh/rJWvjjT7xf5pW2KDlmNAxE/WeSry+3nWdmIkvaZz++/wqQnKg2JsDT9UYWG7aE
 wAad2QVsdscYFO9hPVvayGGzmnrg7HwBjBqwRf5lNvAZJbFrfqP6LBHgm006sCBZ2mZW
 IE4JYmCdZIafG4xs2Mnp4A3qsU60BIUZc1bFxKp1rh3oLNT6k9V11KvoaPiQmbgV80g0
 46DIPoazsYLDL3qhvAxoQyB894E0VEPjlw9nQ0rbVWx0cYo64exizUMsr9rgpQCGCy2J
 cPZBhcLXk/YIgIe9ab7zfWvrpdYt7Jtj7hns7rQQCdiGI8Dk/vR6qDCKHpdE9IUT74kn
 lmVQ==
X-Gm-Message-State: AOAM530iRcyj1YCKuSk9G5W4/qzkFR+STJvdBKdrfV7hBE4kiMNZ1Hmy
 2U5MVGV1OVaAPI6d3Ut1Kw1Qkg==
X-Google-Smtp-Source: ABdhPJykKB4jPM0I75Oqa7g81G7IJicYX4WI5rZ8vxpGyRUdhcGZTKx7xBgzDHsrNbLQqsKJI/OpoA==
X-Received: by 2002:ac2:4833:: with SMTP id 19mr448547lft.231.1623968431683;
 Thu, 17 Jun 2021 15:20:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id a5sm895594ljq.0.2021.06.17.15.20.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Jun 2021 15:20:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Fri, 18 Jun 2021 01:20:22 +0300
Message-Id: <20210617222029.463045-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Freedreno] [PARCH v2 0/7] drm/msm/dpu: merge dpu_core_irq into
 dpu_hw_interrupts
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This patch series reworks DPU's irq handling code by merging
dpu_core_irq into dpu_hw_intr, reworking/dropping irq-related helpers
and wrappers, etc.

Changes since v1:
 - Rework callbacks registration code to allow just single callback per
   interrupt. This removes need to do any memory allocation in reg/unreg
   code and simplifies handling of interrupts.

The following changes since commit 7e0230fd096c03e9662e66150f951075dd16e496:

  drm/msm/mdp5: provide dynamic bandwidth management (2021-06-17 09:51:44 -0700)

are available in the Git repository at:

  https://git.linaro.org/people/dmitry.baryshkov/kernel.git dpu-irq-simplify-5

for you to fetch changes up to b2ae835c61b2065037c55b4596e16053484f4904:

  drm/msm/dpu: remove struct dpu_encoder_irq and enum dpu_intr_idx (2021-06-18 01:12:04 +0300)

----------------------------------------------------------------
Dmitry Baryshkov (7):
      drm/msm/dpu: squash dpu_core_irq into dpu_hw_interrupts
      drm/msm/dpu: don't clear IRQ register twice
      drm/msm/dpu: merge struct dpu_irq into struct dpu_hw_intr
      drm/msm/dpu: allow just single IRQ callback
      drm/msm/dpu: remove extra wrappers around dpu_core_irq
      drm/msm/dpu: get rid of dpu_encoder_helper_(un)register_irq
      drm/msm/dpu: remove struct dpu_encoder_irq and enum dpu_intr_idx

 drivers/gpu/drm/msm/Makefile                       |   1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c       | 256 --------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h       |  30 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c        | 111 ++-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h   |  66 +-----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |  99 ++++----
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |  56 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c  | 264 +++++++++++++++------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h  |  96 +-------
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |  27 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h            |  25 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h          |  51 ++--
 12 files changed, 334 insertions(+), 748 deletions(-)
 delete mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.c


_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
