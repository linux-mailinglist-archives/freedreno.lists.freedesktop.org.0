Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 1F6234B97B1
	for <lists+freedreno@lfdr.de>; Thu, 17 Feb 2022 05:31:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3D9010E7F9;
	Thu, 17 Feb 2022 04:31:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 03EA210E825
 for <freedreno@lists.freedesktop.org>; Thu, 17 Feb 2022 04:31:51 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id u16so6492510ljk.2
 for <freedreno@lists.freedesktop.org>; Wed, 16 Feb 2022 20:31:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WNj42/lJdlgSodUSxPSjU0zf2PPxy6ssj0HPCjOotes=;
 b=KMNVQoLGiu3fPSXvGiW2dZFnJjLkltmuc4YS47xtoJ8v3QzL6SNdLxct2awfSjjDNP
 TcH5H2IlmM0xQdl/hRa5dJo4ajrqFEcb6AiaJKKh3dNuVJs1gsuJozQBkKY8mV3Ohozo
 oLJFI2YTcQzw2O2/+Ksc+PfFxGbBmgNQ7CSCe6f0tZj7rq0PZiaMb5Dny7RJfqIZs0RQ
 ZLUF2gJXnvGqSmk88+fFbfa0VMa+vdAmTk5yPdpwUG9rGAiTTHyt3kOSQHd58mM3bCUB
 tGGr3me/GhBFXLxSNgsmgur/LMzRPjGRMXLKWK7SQYEAuVPvjlaXJixyYzb/vQGbMOzy
 nLrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=WNj42/lJdlgSodUSxPSjU0zf2PPxy6ssj0HPCjOotes=;
 b=vNWQq3szGICw0vhGUb9zmTR3rR12brk0W41T+RyUsZlK6DBA6mwveJjkw10R5mI3m0
 wAZyZP/hqoi+/jPWihEXAZO4PoSzikii3QiX/TmyhGtBSo9wKe4q6my31IBM3tBD+t9o
 c9UxkFZtlbvKHsRF+bHRTJKs2pO36amuOLKmdsLeEGOPjITcQ6nvCGzu5Yt7og0HJnnc
 hclsLSyTekM4YUE5jZH2sbI2R2t3fRkG/IkOf8f+vOljAvqetn4eq/9gHIML9OQy93gy
 swDz6SL2vV8VABEJk2OSvxqGke10LA6HauhxTT7YbnpnsXgYG7H8e4eDO0NsWwmN1FYI
 k3kg==
X-Gm-Message-State: AOAM530pjfbiQuA15pv2viqmVe0nHsX8nN1lUxPulgAro2zzOxDUdOSi
 Y0lsMRRy+6tJVy6nbL7eycA0bw==
X-Google-Smtp-Source: ABdhPJwnaCikXIxgUC8kjXsVHGKy7uZpNhrFPtf12oJlxW7wJ3rvfqN2M2wCLmApiOSDYSGfCsIsIQ==
X-Received: by 2002:a2e:bc03:0:b0:23c:af37:a6bd with SMTP id
 b3-20020a2ebc03000000b0023caf37a6bdmr980301ljf.14.1645072309302; 
 Wed, 16 Feb 2022 20:31:49 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id l8sm1463391ljb.140.2022.02.16.20.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 16 Feb 2022 20:31:48 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 17 Feb 2022 07:31:42 +0300
Message-Id: <20220217043148.480898-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 0/6] drm/msm/dpu: simplify IRQ helpers
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

This is the second part of
https://patchwork.freedesktop.org/series/91631/ reworked and cleaned up.

Changes since v1:
 - Fix warning ins dpu_trace.h related to
   dpu_core_irq_unregister_callback event
Changes since v1:
 - Use ARRAY_SIZE() rather INTR_IDX_MAX when clearing irq arrays.

Changes since the original pull request:
 - Split applied patches
 - Add unlikely and WARN_ON in dpu_core_irq_register_callback()
 - Remove extra checks in dpu_core_irq_unregister_callback()
 - Remove unused arguments of dpu_core_irq_unregister_callback()
 - Clean the cb and arg in dpu_core_irq_unregister_callback()
 - Split the last patch. Leave enum dpu_intr_idx intact. Pass irq index,
   callback and data directly to dpu_encoder helpers.


Dmitry Baryshkov (6):
  drm/msm/dpu: remove extra wrappers around dpu_core_irq
  drm/msm/dpu: remove always-true argument of dpu_core_irq_read()
  drm/msm/dpu: allow just single IRQ callback
  drm/msm/dpu: get rid of dpu_encoder_helper_(un)register_irq
  drm/msm/dpu: remove struct dpu_encoder_irq
  drm/msm/dpu: pass irq to dpu_encoder_helper_wait_for_irq()

 drivers/gpu/drm/msm/disp/dpu1/dpu_core_irq.h  |  32 ++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c   | 112 +++----------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h  |  43 +----
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  |  92 +++++-----
 .../drm/msm/disp/dpu1/dpu_encoder_phys_vid.c  |  51 +++---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 157 +++++++-----------
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.h |  12 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |  27 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.h       |  12 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_trace.h     |  67 ++++----
 10 files changed, 202 insertions(+), 403 deletions(-)

-- 
2.34.1

