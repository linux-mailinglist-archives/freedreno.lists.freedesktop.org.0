Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4539D54DC84
	for <lists+freedreno@lfdr.de>; Thu, 16 Jun 2022 10:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E1F3C112360;
	Thu, 16 Jun 2022 08:11:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF63A10F528
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jun 2022 08:11:10 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id b7so670577ljr.6
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jun 2022 01:11:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zG8AgCbvolywbm1HYRUBI+oIpM7+L6T+cPP5dNMB4hc=;
 b=ca6QfihE4eXibLWPlq9uDaBNu8Lus7TF7PcqKKlxmUxrlPHFpGoWXijBUQRMRlhTX8
 e0X+gG92wtF8ysvIkRHPCh5yv8qap9G/IrVJJqP+wQ9mbLf2cUkBG79X9lDHVgGa0jIt
 waioQ9FGfOBAZ88GWJdTbSaIVrotrn9Ygnj+dd5SdpDZwyfsi4Yflgo8D2wHE5WU44CJ
 SMwqC+BNm/PFb2E1LM9Xpy22Cis3afW4s3COpHueg/TCif3oXoi0q22s3Am4iZd+04Dc
 AvT98DY0OM2hU755yPuiy1+xbvYxa39Ke214V2HiteyvMVqcXViH0yIn7vZhMOIW3gDd
 Xa7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zG8AgCbvolywbm1HYRUBI+oIpM7+L6T+cPP5dNMB4hc=;
 b=czqwKoWPJtzeNBOTOWcgqKcZfsb+dyiuHgfNjb2q+ek/WOE7pN9tCtD242Ny/zaAsT
 fO7Cz7RWOcMYYQw9cDjvZ1bTPIL13PVQR4UJhC8IgTow+U7A0iparHp0ehVk5K/9hItb
 MvOinp28jqNuTvmqQTEGWzH1/RkvEWlRN18qcJ624gwE6zbFLdvVkn9suIoP7sOk2wxI
 s0PC2kXl+8R8hE8qwzFe4C0yLyaINbNxnmoq0f283FVfXRnhna3PauoUpEqjqzfApWjR
 Rvk9zQIAtLOnK5mSuVjP1UCJpMeQ/L6DB2R5xLGV0n+GvvSzEguDJZQIM4iviWdH3d6w
 JQOw==
X-Gm-Message-State: AJIora9pp00ITDPtCyFEPbkfo/DV+L8vyBPdCXvuBjhI+zZBPpQgxdcV
 ALtnTUsYcMAs8hPZH3AXsC60wg==
X-Google-Smtp-Source: AGRyM1uk/XeBo42spcjRTwN/mEek1/KIQ+zmRK6eOpObHUWjWIAB1rcdMXexy2X50jufv0VtCnjFbA==
X-Received: by 2002:a05:651c:1784:b0:259:eb76:b268 with SMTP id
 bn4-20020a05651c178400b00259eb76b268mr1933654ljb.75.1655367069258; 
 Thu, 16 Jun 2022 01:11:09 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 y29-20020a19641d000000b004790823d354sm142144lfb.26.2022.06.16.01.11.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Jun 2022 01:11:08 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 16 Jun 2022 11:11:02 +0300
Message-Id: <20220616081106.350262-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220616081106.350262-1-dmitry.baryshkov@linaro.org>
References: <20220616081106.350262-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 1/5] drm/msm/dpu: check both DPU and MDSS
 devices for the IOMMU
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

Follow the lead of MDP5 driver and check both DPU and MDSS devices for
the IOMMU specifiers.

Historically DPU devices had IOMMU specified in the MDSS device tree
node, but as some of MDP5 devices are being converted to the supported
by the DPU driver, the driver should adapt and check both devices.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index e23e2552e802..e8bc6d5f6ac1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1002,14 +1002,22 @@ static int _dpu_kms_mmu_init(struct dpu_kms *dpu_kms)
 	struct msm_mmu *mmu;
 	struct device *dpu_dev = dpu_kms->dev->dev;
 	struct device *mdss_dev = dpu_dev->parent;
+	struct device *iommu_dev;
 
 	domain = iommu_domain_alloc(&platform_bus_type);
 	if (!domain)
 		return 0;
 
-	/* IOMMUs are a part of MDSS device tree binding, not the
-	 * MDP/DPU device. */
-	mmu = msm_iommu_new(mdss_dev, domain);
+	/*
+	 * IOMMUs can be a part of MDSS device tree binding, or the
+	 * MDP/DPU device.
+	 */
+	if (dev_iommu_fwspec_get(dpu_dev))
+		iommu_dev = dpu_dev;
+	else
+		iommu_dev = mdss_dev;
+
+	mmu = msm_iommu_new(iommu_dev, domain);
 	if (IS_ERR(mmu)) {
 		iommu_domain_free(domain);
 		return PTR_ERR(mmu);
-- 
2.35.1

