Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 25CB854DC92
	for <lists+freedreno@lfdr.de>; Thu, 16 Jun 2022 10:11:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DDC77112A00;
	Thu, 16 Jun 2022 08:11:17 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 94B511122E1
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jun 2022 08:11:15 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id a29so1074073lfk.2
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jun 2022 01:11:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R/TT3SVdPUhdUl9OHtlgB8o553M+9pau4/RhWjQqxiY=;
 b=qiUUeXk7cxeJ6BSkWCmvqUcL5iptuOVmiMiNiRZKtw5Hz95e1PgW30HPeEzKBmSp2N
 yn/JlnroKZUB1hurPbIHZ2KiRq9y5d6fRvjhwFnJVW9LaHoPDwBZ+iovqovQ1mTKn/F3
 mWkhRVsv7iwNQkPPL6yWbUb6eM4ANxlmeXCQqPH0RgFA3/5dFtRzzMg/QcS8QXEio8b3
 lErsozlByvmtzOkWxH2I/nYdD5+RrmEuHKvCIh5OgDNL/bFrjMVEYoZOzReon18Vv+Sg
 y0lHpPNQxz7uSujY6sHzU17mPP9NXOeVE1WVesrHoANP6SJEjuoerxeJ5Wx+kWq65WSk
 nkSQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R/TT3SVdPUhdUl9OHtlgB8o553M+9pau4/RhWjQqxiY=;
 b=BrnX9Yz8VkWNcG31duxqLf/8q2UDVIOAkBJdy1QyiaFhQBDL2Sbc+iuUmtE0qypy17
 2lUffQxuxqC2Mx8pBJPkmfgMMK5FXccb342girN1upqYUyP32EEi88N/Pr9XgeCIgRAV
 UqqCE6byhJ1ePqQ4Sdgzy/HGq+f84jxIfYjelmixPoP7V7HKBIgtCSxk03cPdG0Wbn/s
 MW+KQi08YewqFIWtyy36jLSxXRpOKcEaz6obWCQsoMnuQpEwxJhrm/DHhRzm+9tnvjkS
 XU3UFZDCsLzIORoI319MRMwB/QlWbXwX2Pn0ePe9F1MHiOnXsDhSBRirNPlLzZCULCWS
 G3Pg==
X-Gm-Message-State: AJIora+zM04SQtgWtrexLPOAUQ1FgYGnOSzX4llWiyu4lrDq1N3T4T0l
 nuQXE+KFAhQyZNwbaUtjXSHyEVELJkiFmolj
X-Google-Smtp-Source: AGRyM1vms3xvojLkKGSylTCS0S+TI+LfzjHCSz2KHF17sM+nqnWa75t2amiGeUH7V5gOn+gmlrXcqA==
X-Received: by 2002:ac2:55a4:0:b0:47d:aab8:a67c with SMTP id
 y4-20020ac255a4000000b0047daab8a67cmr1920619lfg.301.1655367073851; 
 Thu, 16 Jun 2022 01:11:13 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 y29-20020a19641d000000b004790823d354sm142144lfb.26.2022.06.16.01.11.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 01:11:12 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 16 Jun 2022 11:11:06 +0300
Message-Id: <20220616081106.350262-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616081106.350262-1-dmitry.baryshkov@linaro.org>
References: <20220616081106.350262-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 5/5] drm/msm: switch msm_kms_init_aspace() to
 use device_iommu_mapped()
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

Change msm_kms_init_aspace() to use generic function
device_iommu_mapped() instead of the fwnode-specific interface
dev_iommu_fwspec_get(). While we are at it, stop referencing
platform_bus_type directly and use the bus of the IOMMU device.

Suggested-by: Robin Murphy <robin.murphy@arm.com>
Reviewed-by: Robin Murphy <robin.murphy@arm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 14 +++++++-------
 1 file changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 258632d5c411..8e18eca82bc6 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -277,21 +277,21 @@ struct msm_gem_address_space *msm_kms_init_aspace(struct drm_device *dev)
 	struct device *mdss_dev = mdp_dev->parent;
 	struct device *iommu_dev;
 
-	domain = iommu_domain_alloc(&platform_bus_type);
-	if (!domain) {
-		drm_info(dev, "no IOMMU, fallback to phys contig buffers for scanout\n");
-		return NULL;
-	}
-
 	/*
 	 * IOMMUs can be a part of MDSS device tree binding, or the
 	 * MDP/DPU device.
 	 */
-	if (dev_iommu_fwspec_get(mdp_dev))
+	if (device_iommu_mapped(mdp_dev))
 		iommu_dev = mdp_dev;
 	else
 		iommu_dev = mdss_dev;
 
+	domain = iommu_domain_alloc(iommu_dev->bus);
+	if (!domain) {
+		drm_info(dev, "no IOMMU, fallback to phys contig buffers for scanout\n");
+		return NULL;
+	}
+
 	mmu = msm_iommu_new(iommu_dev, domain);
 	if (IS_ERR(mmu)) {
 		iommu_domain_free(domain);
-- 
2.35.1

