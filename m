Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EB2C54DC81
	for <lists+freedreno@lfdr.de>; Thu, 16 Jun 2022 10:11:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 22BCF10FC13;
	Thu, 16 Jun 2022 08:11:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2B15110F6D1
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jun 2022 08:11:10 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id b7so670545ljr.6
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jun 2022 01:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1qbg9qXXSR6emdLRiopLdhShbC9ThAqArdO/gs7MONo=;
 b=FbDsXdOqnQj4yXB+zfSFUDL1JHL4n+irvfikBSA02l59GZ2mwhIXKeiNQjZQn+nIYw
 xL0BbA+mbR0GqZ4gAzC0aRtlsINd+7ZyC7BYeCoG4UdpbTB/KPTu8oSYueFg//1/nNlh
 Y4So0huPo9qi64qABkcZsIDTCdaPN7xx4eViZA9p0mV9ukYvmHrrtXdpWcC550531OmS
 666q6yd7z2WMon2YjT662RcJQsKo9QPtR4OLjDhr6VGTc6b9tFfBHzQTvUcl7tQ8nOx4
 8GRJbwObBw0CveTPqBSWVozk4vZbZWKVf7j0oyZTU8yGvxPEoB4bxzzfX0xibnD4LKyH
 AHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1qbg9qXXSR6emdLRiopLdhShbC9ThAqArdO/gs7MONo=;
 b=zE6L9uDQLV6wVUng/hq7x2TVQqbbNNdtTYZwgIdF2uD93AIkX/+1o2WqLQZ9k/LJOp
 6KoqDwhPgDGkTDKz8CG9q7usPwdmzqrG/XmRsqXKzMB2GtKKsXdGenY1/dgj/8rotuHp
 UqEml0ENdVooJNJ9ATe4w7u5p8G6cavjNoXDWKQcUvxwqbRWm35xD9J7DbaSUX18SkBK
 0VkSYg2KEl+nYE0tAsqH9u1BKSekrSAsk2Yql4y8aSfVgt02AsA6Gw9DHHfy2aCEsXhX
 QKq9PpR3bpbjJ2f5S7BneIaiuktkQ3i+rnjcy/qY36gd8jNnSfW1ijeEkEJLCxBo6mO4
 aEQw==
X-Gm-Message-State: AJIora/T0muZ24YqRh5XIPPWGWyOzNg9+wsg/5yQwLqzIpGl69QU82MW
 ZQweWtxZRfmTtfAoy1oFPe9Anw==
X-Google-Smtp-Source: AGRyM1vc1pJmylzW5eHRWv3Nd6IuZfh47MF5zJutwFg1Sir9CSqf8ArnpGkS7cxI7nAwIrRYgix7Nw==
X-Received: by 2002:a05:651c:b09:b0:25a:44fd:41f with SMTP id
 b9-20020a05651c0b0900b0025a44fd041fmr1869162ljr.366.1655367067892; 
 Thu, 16 Jun 2022 01:11:07 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 y29-20020a19641d000000b004790823d354sm142144lfb.26.2022.06.16.01.11.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 01:11:07 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 16 Jun 2022 11:11:01 +0300
Message-Id: <20220616081106.350262-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 0/5] drm/msm: fixes for KMS iommu handling
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

This series started from the applied and then reverted [2] patch by
Robin Murphy [1]. After the MDSS rework [3] has landed it is now
possible to reapply the extended version of the original patch. While we
are at it, also rework the IOMMU init code for DPU and MDP5 drivers.

For MDP5 this moves iommu_domain_alloc() call and removes struct
mdp5_cfg_platform remains.

For DPU this allows specifying the iommus = <...> either in the DPU
device (like all DPU devices do) or in the MDSS device (like MDP5
devices do).

Changes since v2:
 - Merge two return statements in msm_kms_init_aspace() (requested by
   Stephen)

Changes since v1:
 - Move aspace init to common helper
 - Use device_iommu_mapped() rather than semi-internal
   dev_iommu_fwspec_get() (suggested by Robin Murphy)

[1] https://patchwork.freedesktop.org/patch/480707/
[2] https://patchwork.freedesktop.org/patch/482453/
[3] https://patchwork.freedesktop.org/series/98525/

Dmitry Baryshkov (5):
  drm/msm/dpu: check both DPU and MDSS devices for the IOMMU
  drm/msm/mdp5: move iommu_domain_alloc() call close to its usage
  drm/msm: Stop using iommu_present()
  drm/msm: move KMS aspace init to the separate helper
  drm/msm: switch msm_kms_init_aspace() to use device_iommu_mapped()

 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c  | 24 ++----------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.c | 16 --------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_cfg.h |  6 ---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 31 +++------------
 drivers/gpu/drm/msm/msm_drv.c            | 49 +++++++++++++++++++++++-
 drivers/gpu/drm/msm/msm_drv.h            |  1 +
 6 files changed, 57 insertions(+), 70 deletions(-)

-- 
2.35.1

