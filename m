Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E7C5C80BC82
	for <lists+freedreno@lfdr.de>; Sun, 10 Dec 2023 19:07:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A72D010E036;
	Sun, 10 Dec 2023 18:07:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x42a.google.com (mail-pf1-x42a.google.com
 [IPv6:2607:f8b0:4864:20::42a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54C4E10E036
 for <freedreno@lists.freedesktop.org>; Sun, 10 Dec 2023 18:07:02 +0000 (UTC)
Received: by mail-pf1-x42a.google.com with SMTP id
 d2e1a72fcca58-6cea2a38b48so3139387b3a.3
 for <freedreno@lists.freedesktop.org>; Sun, 10 Dec 2023 10:07:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1702231622; x=1702836422; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=/OTV7HGPkUIAwckXy51M7re7fb1HUU7ow6BY0UtdbRw=;
 b=N+yMkN7QAmWY5CRI51gFA1nJ3bXTSeEMJr0D+OG2nmQ7417W4ovu20pR2D0GSEmt0a
 P5cIRGBAccTVoOsgQCr5xI+g8fWVN++qei+F3B7A5OSj9gMDVGJvsATBzQyp2Oim4A5n
 LMQK5p6gS0e0xp4P/tTVsZ9s1Z+yAJf3ZuLMmmhfXe5bu4jMt773Zi8IijN3r2etTji+
 rxnEDgu7NZOUEjGCrHq5zQliYw45DvmoI1234aya5WzcYNJnFvigOI+RfDohSY77uVk5
 0Nh39LkGDSrbLe2iV8UK1Zeg3mQ2UAelPZPmGAWkM1IFlAaiH8D0ufiEWwNnEpaTCxRh
 +xGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702231622; x=1702836422;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/OTV7HGPkUIAwckXy51M7re7fb1HUU7ow6BY0UtdbRw=;
 b=gWIkj7CvIiP67PnKyBBlgGWPafFL8GlWSq7MbrqYCXSlLgJVsKMABS2uaB0HInKSjV
 MPQMZqzsFGGLGKP++lY/2CHwv+rHLHbmXThnzno0jP2JlEbmYBbWH+Ay9/4+IEuPh0EX
 Yfhi9rDxtrnXoyjOZCfzM9VEhTcjfzsZkDEdBn1SLUFgsXd2SUltKEDOx3Q+V6YbVQkg
 jg066u7qgj9Z98E4Ed3qiP4Oy2yLRH8GixNQsBB56w6Zzz98FWbdvqRh9Obm1g89QuqJ
 TeGVBF8bGd+Lnv/Et1uBM9CdINzqNE7hZpNAecAjQ7R7WKuHdRtB1S4EFXgqrswmVpVq
 mHMQ==
X-Gm-Message-State: AOJu0Yyo2STqnYsz3RMQKIHbDGdPB9+2A7bL23Tjs9MuTM83BuVp+c3D
 IZ65YB6f/oDhdNeRc0A/amY=
X-Google-Smtp-Source: AGHT+IGf1cjoJui1YLxDAmJIwqwz1hXkSEY0wBxCHb7JCefydWE1QX71XuqaZiGK7iUv67Arc0VJrQ==
X-Received: by 2002:a05:6a20:7f9b:b0:18f:97c:8a3b with SMTP id
 d27-20020a056a207f9b00b0018f097c8a3bmr5034958pzj.102.1702231621767; 
 Sun, 10 Dec 2023 10:07:01 -0800 (PST)
Received: from localhost (c-73-37-105-206.hsd1.or.comcast.net. [73.37.105.206])
 by smtp.gmail.com with ESMTPSA id
 11-20020a63154b000000b005b458aa0541sm4769792pgv.15.2023.12.10.10.07.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 10 Dec 2023 10:07:01 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux-foundation.org
Subject: [PATCH v2] iommu/arm-smmu-qcom: Add missing GMU entry to match table
Date: Sun, 10 Dec 2023 10:06:53 -0800
Message-ID: <20231210180655.75542-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.43.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: Rob Clark <robdclark@chromium.org>,
 Bjorn Andersson <quic_bjorande@quicinc.com>, Will Deacon <will@kernel.org>,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 Joerg Roedel <joro@8bytes.org>, open list <linux-kernel@vger.kernel.org>,
 Robin Murphy <robin.murphy@arm.com>, stable@vger.kernel.org,
 Johan Hovold <johan@kernel.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 "open list:IOMMU SUBSYSTEM" <iommu@lists.linux.dev>,
 Danila Tikhonov <danila@jiaxyga.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Elliot Berman <quic_eberman@quicinc.com>, freedreno@lists.freedesktop.org,
 "moderated list:ARM SMMU DRIVERS" <linux-arm-kernel@lists.infradead.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

In some cases the firmware expects cbndx 1 to be assigned to the GMU,
so we also want the default domain for the GMU to be an identy domain.
This way it does not get a context bank assigned.  Without this, both
of_dma_configure() and drm/msm's iommu_domain_attach() will trigger
allocating and configuring a context bank.  So GMU ends up attached to
both cbndx 1 and later cbndx 2.  This arrangement seemingly confounds
and surprises the firmware if the GPU later triggers a translation
fault, resulting (on sc8280xp / lenovo x13s, at least) in the SMMU
getting wedged and the GPU stuck without memory access.

Cc: stable@vger.kernel.org
Signed-off-by: Rob Clark <robdclark@chromium.org>
---

I didn't add a fixes tag because really this issue has been there
all along, but either didn't matter with other firmware or we didn't 
notice the problem.

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 549ae4dba3a6..d326fa230b96 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -243,6 +243,7 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 
 static const struct of_device_id qcom_smmu_client_of_match[] __maybe_unused = {
 	{ .compatible = "qcom,adreno" },
+	{ .compatible = "qcom,adreno-gmu" },
 	{ .compatible = "qcom,mdp4" },
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,sc7180-mdss" },
-- 
2.43.0

