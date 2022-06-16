Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAD6054DC8E
	for <lists+freedreno@lfdr.de>; Thu, 16 Jun 2022 10:11:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 737921122E1;
	Thu, 16 Jun 2022 08:11:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF3A111247A
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jun 2022 08:11:12 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id h23so1057658lfe.4
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jun 2022 01:11:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=aLVnUM+AqDl4tXNkj90J627+4z77zCYSsGSFtgLCsrQ=;
 b=tU8wJlzCAB9KAxWRVZYppXhrZRGt+jzRnYQpAl3BNoGOATcHnBQOY2/mAx7GckMCXS
 RkjnetmGIHJVl2jxHUro0vUn7AEEA3xVBvRmek1RQHm0hHtrZ1GOuu7o6FSF/imylrQY
 Az2JAiqCJiXFaGiSvOCKHN2tF0c6+4BrCxksbob0Z1+aK2LEXupPTHS48M0ZMsBydXfL
 jlOO0xNTAFpj2B4t+Z5hRJo8aL/f7ghIwVt+uv5p0GZ8dzqhOczWi8TTMXaJ7V9OpJQM
 74r3SVO6LkxA+81nb0BQ6q6HxdX3YQ6HFhXkW/H6F8MTdJnL5978M3YsVbSSBomjWDtJ
 eBUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=aLVnUM+AqDl4tXNkj90J627+4z77zCYSsGSFtgLCsrQ=;
 b=FDMNcJUCvnt7dyi56SGEsWZZaCTDhVAeD6wHISl6YQatZYRr6i9rvCVwY27TtSsbdV
 wOUT2QZQvnZiEMWKryWGTWBb7Ic+Hi2hczM8SWhngTSVMnGn8cEQuwnVHlg84TtaXpYc
 iPUxi2YtlruzcMDwHdYDv/1q+z+AT+ikHztwzjiIubgK1BxPOCEKtkYFOtkbl1dHDu4o
 mwP6x6JZiTOtJj3OKxpwvd3enFQMDiwMoIPZvdk5Kp96nKg2ZgCRb/DMqxftpCDz/Db6
 VEHsOzCreyNDW+gkMJVJy2AREu3RIff1PFdk4AT+rIIkQQCML5MZIlXEnrTGqlg0DLLa
 1eAQ==
X-Gm-Message-State: AJIora/KdKpKVX5/MSNBXdwv0HJQmV+20WOQawMVyhyAIueWOK8uj1Yf
 Fj8Vood8aS6UbX4Cdsxi36EgiQ==
X-Google-Smtp-Source: AGRyM1v5s3DiaabHbHg4BhCVByW26chL0Mvy/RL3fwSwKimfMRFRtdA8vLdVpzN7Qirit67Tf5ZxXA==
X-Received: by 2002:a05:6512:1399:b0:448:9f0b:bf4f with SMTP id
 p25-20020a056512139900b004489f0bbf4fmr1959636lfa.67.1655367071239; 
 Thu, 16 Jun 2022 01:11:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 y29-20020a19641d000000b004790823d354sm142144lfb.26.2022.06.16.01.11.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 01:11:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 16 Jun 2022 11:11:04 +0300
Message-Id: <20220616081106.350262-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616081106.350262-1-dmitry.baryshkov@linaro.org>
References: <20220616081106.350262-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 3/5] drm/msm: Stop using iommu_present()
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
 Robin Murphy <robin.murphy@arm.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 Stephen Boyd <swboyd@chromium.org>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Even if some IOMMU has registered itself on the platform "bus", that
doesn't necessarily mean it provides translation for the device we
care about. Replace iommu_present() with a more appropriate check.

On Qualcomm platforms the IOMMU can be specified either for the MDP/DPU
device or for its parent MDSS device depending on the actual platform.
Check both of them, since that is how both DPU and MDP5 drivers work.

Co-developed-by: Robin Murphy <robin.murphy@arm.com>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 44485363f37a..c781307464a0 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -271,8 +271,14 @@ bool msm_use_mmu(struct drm_device *dev)
 {
 	struct msm_drm_private *priv = dev->dev_private;
 
-	/* a2xx comes with its own MMU */
-	return priv->is_a2xx || iommu_present(&platform_bus_type);
+	/*
+	 * a2xx comes with its own MMU
+	 * On other platforms IOMMU can be declared specified either for the
+	 * MDP/DPU device or for its parent, MDSS device.
+	 */
+	return priv->is_a2xx ||
+		device_iommu_mapped(dev->dev) ||
+		device_iommu_mapped(dev->dev->parent);
 }
 
 static int msm_init_vram(struct drm_device *dev)
-- 
2.35.1

