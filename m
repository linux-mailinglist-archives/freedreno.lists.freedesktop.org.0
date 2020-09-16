Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 22C7D26C1F2
	for <lists+freedreno@lfdr.de>; Wed, 16 Sep 2020 13:07:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 86D5B6E158;
	Wed, 16 Sep 2020 11:07:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x443.google.com (mail-wr1-x443.google.com
 [IPv6:2a00:1450:4864:20::443])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C1AB6E9A5
 for <freedreno@lists.freedesktop.org>; Wed, 16 Sep 2020 11:07:10 +0000 (UTC)
Received: by mail-wr1-x443.google.com with SMTP id z1so6467452wrt.3
 for <freedreno@lists.freedesktop.org>; Wed, 16 Sep 2020 04:07:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9nu6UrMqV2SVJMMVWIQbvvsBT41Bk/x2/rbQZZMvR5c=;
 b=RPRtBcCg7Nlj0wORAHGE/VDKI3mlLQS/qXvivUL4M7/JW5ECAKalvw72hjSbxez8Aw
 lMCZYbPq15i6bIjwQAxfIDpzMfPNPU/WZzWlPgKpy/oc+Y6L6jiGzWLpVMJB08/BtSZT
 oD2dRBEBNsclb8R+SHrzd4iEmmwYG8+TCQGsqD7GKc1k8aVkk3vybhh7XzdFgXUgO9lI
 QYDm0ol0pN3tx1rzzGaDqWMGc+wiiGj82UfSpSfbYEgpd1LIf+jsy1e4OB0MSuUMFEro
 jQSQHm/io9aXGCi5lKWqazsAZMtxawDIHKwA08vwThJ4DSoOkZZBbBDobGS4XE3i1iKb
 ItAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=9nu6UrMqV2SVJMMVWIQbvvsBT41Bk/x2/rbQZZMvR5c=;
 b=PiTf63twxVD32UU92VuLnB4ZNKYpC+jNHI7N/nsVdzhv5yFVroGU1Cg979v8Gliu7J
 CLJRYpjVUJeHSsfvpmaKXhRiDUczY6COzqFp3ptmOv2cATeyyfdYinE+A1KS2DoPW9x0
 ebuuKwQMx5Ata5QBk3C2uEnPHL3r8UDbZnmfylNMpROVKjzYhOgKt7WwF7J52/OBigYo
 9m5Pmxb9qKOsLKcPooBKHn8KLWJf/z0gT+9/bE6hW7SeaSECSR48HJi+VVzxZsHAGYj3
 Hm2aPakjF1i/3vLRYGKG5QTvq/S4Ev6MvMD6BMLfrj8lQq2O2D+gKiTI51tf2SsWcLUf
 ZyZw==
X-Gm-Message-State: AOAM5303Ab//05ii3zC4QbIvJYEiHFySkx9pSY8d1HhjJaJIcl6wtnDN
 TJjKUnT85xp99eX3UWE1g0jEqg==
X-Google-Smtp-Source: ABdhPJzs9y1RZuz1TgxiB6r0FtvUq2fsAnxRCKUrCMfPgN1zHNdHumy2WgbVHV91xEdhhPCKXoSDYQ==
X-Received: by 2002:a5d:60d0:: with SMTP id x16mr25862069wrt.196.1600254428922; 
 Wed, 16 Sep 2020 04:07:08 -0700 (PDT)
Received: from localhost.localdomain ([212.45.67.2])
 by smtp.googlemail.com with ESMTPSA id l19sm4682554wmi.8.2020.09.16.04.07.07
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 16 Sep 2020 04:07:08 -0700 (PDT)
From: Georgi Djakov <georgi.djakov@linaro.org>
To: robdclark@gmail.com,
	sean@poorly.run
Date: Wed, 16 Sep 2020 14:07:06 +0300
Message-Id: <20200916110706.6671-1-georgi.djakov@linaro.org>
X-Mailer: git-send-email 2.27.0
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm: Remove depends on interconnect
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
Cc: airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 freedreno@lists.freedesktop.org, georgi.djakov@linaro.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The dependency on interconnect in the Kconfig was introduced to avoid
the case of interconnect=m and driver=y, but the interconnect framework
has been converted from tristate to bool now. Remove the dependency as
the framework can't be a module anymore.

Signed-off-by: Georgi Djakov <georgi.djakov@linaro.org>
---
 drivers/gpu/drm/msm/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/Kconfig b/drivers/gpu/drm/msm/Kconfig
index 5c55cd0ce9f9..3348969460ab 100644
--- a/drivers/gpu/drm/msm/Kconfig
+++ b/drivers/gpu/drm/msm/Kconfig
@@ -6,7 +6,6 @@ config DRM_MSM
 	depends on ARCH_QCOM || SOC_IMX5 || (ARM && COMPILE_TEST)
 	depends on OF && COMMON_CLK
 	depends on MMU
-	depends on INTERCONNECT || !INTERCONNECT
 	depends on QCOM_OCMEM || QCOM_OCMEM=n
 	select QCOM_MDT_LOADER if ARCH_QCOM
 	select REGULATOR
_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
