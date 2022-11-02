Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 84D0F616B40
	for <lists+freedreno@lfdr.de>; Wed,  2 Nov 2022 18:54:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DD1510E52F;
	Wed,  2 Nov 2022 17:54:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E993E10E515
 for <freedreno@lists.freedesktop.org>; Wed,  2 Nov 2022 17:54:51 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id u2so26085280ljl.3
 for <freedreno@lists.freedesktop.org>; Wed, 02 Nov 2022 10:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=pImxuC4Nf4aWPW221zQN7RnoGphkK7wE5klWAS+4940=;
 b=Wjm2dZp74y+lqu2Ke28grCipI3cG0+8+S49t0MZinbmHZ2Za/YjIrVauNbH8bpTr0M
 3deSromBU4Let5EjFgdAIsmIBbfxh9/rC3tsXKDDBXx5vx64ghErUiTsev7H3io5o+wW
 jwra/c0oVaONRNLGko2DpCYLveOyuVsEbUHKRaBnUapTsOgADhYEuLpV2DxhTtjr6DDk
 kO/tcKOTwbaXFu2MNcJuyAnADrC8G7PAq7dF4DfgiP8vZtyOK11QTEyIcn4jB42zpB38
 Msi+1+Rd0Vue6S2OshIL93Rosodvtj9oMfTGFPpHCQFS862k8ZJjrULF+JOvycCRteMb
 75/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=pImxuC4Nf4aWPW221zQN7RnoGphkK7wE5klWAS+4940=;
 b=jM0avdStUiX+2WUcijOoD7udKIInQkJhyIUgLaSnGyYF04zdy1zGYTHdBdpivLH/jC
 6BWYn1METETqUywHiZ7KvnG+WZfnKiq1a+Au4tguwCWdisRhWLv/l2zRMCa/9Nw/6GBH
 ypyuigPDyClfVlfLOH693BBa2aUUBVLj90fMJ1cP8S6hBH+eWOh59RHxVUqtx1j1n2Up
 KHFzixGmQyYVrKoAFGkpy4KtF5Us7S+PJrkfs8Ewu3uv1gkZ1EoMCpRkLUgESNPlLfPk
 P6UxjPUVNALCoTUm+5T8thINbQZXzpKaN3ZMjzcS2DvRZksdEb68j/UOaOPl5EsDJtqV
 LyHg==
X-Gm-Message-State: ACrzQf0+KgGqFxqSTHBTxbiPnrKazjPWEVL4BCiVlbhe+L81Zl/QY2Iq
 3jqZhcIIqKLWF/wB7Y2oEastMA==
X-Google-Smtp-Source: AMsMyM5mdbfw0TKMpb+OFf4RZ4EVt0v8uZKepz1A7AgftPyjFSvCji8FBMhn1kwdcNJ5H7vbqJBt4A==
X-Received: by 2002:a05:651c:1688:b0:277:2256:293d with SMTP id
 bd8-20020a05651c168800b002772256293dmr10133446ljb.514.1667411690248; 
 Wed, 02 Nov 2022 10:54:50 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d3-20020a056512368300b00492c663bba2sm2087625lfs.124.2022.11.02.10.54.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 10:54:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed,  2 Nov 2022 20:54:47 +0300
Message-Id: <20221102175449.452283-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 0/2] drm/msm: rework msm_iommu_new() and
 .create_address_space cb
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Simplify the MSM IOMMU code a bit. This moves iommu_domain_alloc() and
iommu_set_pgtable_quirks() calls to msm_iommu_new() to get rid of the
disbalance, when the iommu domain is allocated by the caller of
msm_iommu_new() and then it is freed by the msm_iommu code itself.

Changes since v3:
- Restored the condition to enable the quirk in a6xx code.

Changes since v2:
- Reorder the patches.
- Move iommu_set_pgtable_quirks() to the msm_iommu_new() too. It will
  not work if it's called after attaching the device.

Changes since v1:
- Fixed the uninitialized variable usage in a6xx_gmu_memory_probe()
  (reported by lkp)


Dmitry Baryshkov (2):
  drm/msm: move domain allocation into msm_iommu_new()
  drm/msm: remove duplicated code from a6xx_create_address_space

 drivers/gpu/drm/msm/adreno/a3xx_gpu.c    |  2 +-
 drivers/gpu/drm/msm/adreno/a4xx_gpu.c    |  2 +-
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c    |  2 +-
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c    | 12 ++++-----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c    | 33 +++---------------------
 drivers/gpu/drm/msm/adreno/adreno_gpu.c  | 29 +++++++++++----------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h  |  9 ++++---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 19 +++++++-------
 drivers/gpu/drm/msm/msm_drv.c            | 18 ++++++-------
 drivers/gpu/drm/msm/msm_iommu.c          | 20 +++++++++++---
 drivers/gpu/drm/msm/msm_mmu.h            |  3 ++-
 11 files changed, 69 insertions(+), 80 deletions(-)

-- 
2.35.1

