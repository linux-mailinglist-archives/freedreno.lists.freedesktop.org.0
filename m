Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 00C649F3709
	for <lists+freedreno@lfdr.de>; Mon, 16 Dec 2024 18:10:25 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6905A10E714;
	Mon, 16 Dec 2024 17:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="SJrX4PFZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBBA110E714
 for <freedreno@lists.freedesktop.org>; Mon, 16 Dec 2024 17:10:22 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id
 d9443c01a7336-2164b1f05caso40168885ad.3
 for <freedreno@lists.freedesktop.org>; Mon, 16 Dec 2024 09:10:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1734369022; x=1734973822; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=vU+dmUIEOB3Bn235Q13lqV4rtbETnj3tLnp1CwkpGgc=;
 b=SJrX4PFZ/4gO5aqU4bS1+H5OsbYrO3Eul1suyUrsrsKEPDv0+lS+PLRLD72rfssW6P
 8wciaXLCMr5fJuKKIZEvE9k1UBW0WaNnBrj+4LKgDD/gB1ExNYwbWRnAmVPHwpDRYWnj
 nmHkcsbJisDM7qPzOfRSdCjGhFyO5trlHKAAuvgdz7HdJdEPBOZGb0ktxd3PSKVqgtJq
 KvygxL7X3xKql16roIK5evlRZAALSJVx32qphPd8A34OiGEI3HyqP43sxKxlsN3bx4gC
 iUL98dL6y/X6RsflOjbkCMsC414ew1hlSCEw81K43O96harp9jX3zE2QBBwiYo4T4ieY
 rbDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734369022; x=1734973822;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vU+dmUIEOB3Bn235Q13lqV4rtbETnj3tLnp1CwkpGgc=;
 b=dBO46kgClSFKoEWkB51sjHobzSf2y9XMKIQu+DcS9ls7Bkrd66E9T4csbdYbWf+4eM
 YttJB1sBcquKLVrbkeFo24Ui84O7fczlR/SJmhehDaXMNR7SjY1EdL9QBVaeWwv0sh++
 4rCq3Ce+Z45TPwaH0CMYP+m/fNVZ2vci0NHh5+ujd52CmBglv42/an0hMXuE4WNqAqDV
 OgFPQzhSMBykUJ3Cd4UFfUE2/gusaa1oWckW8vKBlbFxynHiY6NMWShImMuWhoWqTxAz
 0K8Gxhq9332ewl92wq3JRXgOdqRAqttzOimWcdAiisB42cuXij9IftZ00bcx+43HFieV
 /mLA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVhmjJSmHeT6b8DX8Ihb0X8rhR6Ds7akNlM2zl1eVGAFPHPXNhN3O3kkbeLKkZn3LnON1JUiXOdilA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoCBmSsS3EPO0P3ctvA6V9Q95RbpoWLhwN6jT7s/i7Iq95jNmS
 XaRCR4bo7hX2rhycwIgLCl8HDcgdaBejte9z6lwwnilnB3uIIyiZ
X-Gm-Gg: ASbGnct4xhn4OI7g+Ycv/N9E6/LDiOz2c6DlRglZ6DE+yBz3+etXonrC2eYu9RFWyXA
 lv6962cOB/FTrQNir0tJBMREnAa5x2mU7pjjvGFJcucRxDktStJXhaRkxjjBNWR4JenzWw/oPwa
 FKeu+WegHhfyTqFn+2iLwa0vAhh37Y7DsH9i/HSS8k75BQtrSjouQhJkRY2c4AP12IEQrWnPPVL
 IYGCYp5asuHd3H3CQAfj71lpk81vATQppFSnGagsBgLVQxM+EBghCIkPrd7jnpKTTPAw2ixq3/e
 qa0BA86p52vmyIYwc34J4CwlM5X0l0o=
X-Google-Smtp-Source: AGHT+IELBk5CES1wF4PHrucRwTPjdWhx8XVgyIQNlfgXs1jGjow9SanGNGa0Yz59QLbcpGn4/Q+npQ==
X-Received: by 2002:a17:902:c409:b0:215:a05d:fb05 with SMTP id
 d9443c01a7336-218c8dd54aamr3975465ad.32.1734369022087; 
 Mon, 16 Dec 2024 09:10:22 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-218a1dcb4d6sm45181925ad.80.2024.12.16.09.10.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 09:10:21 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
Date: Mon, 16 Dec 2024 09:10:17 -0800
Message-ID: <20241216171017.4881-1-robdclark@gmail.com>
X-Mailer: git-send-email 2.47.1
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Rob Clark <robdclark@chromium.org>

On mmu-500, stall-on-fault seems to stall all context banks, causing the
GMU to misbehave.  So limit this feature to smmu-v2 for now.

This fixes an issue with an older mesa bug taking outo the system
because of GMU going off into the year.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index c4c52f7bd09a..1c881e88fc4d 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -331,8 +331,10 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	priv->get_ttbr1_cfg = qcom_adreno_smmu_get_ttbr1_cfg;
 	priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
 	priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
-	priv->set_stall = qcom_adreno_smmu_set_stall;
-	priv->resume_translation = qcom_adreno_smmu_resume_translation;
+	if (of_device_is_compatible(np, "qcom,smmu-v2")) {
+		priv->set_stall = qcom_adreno_smmu_set_stall;
+		priv->resume_translation = qcom_adreno_smmu_resume_translation;
+	}
 	priv->set_prr_bit = NULL;
 	priv->set_prr_addr = NULL;
 
-- 
2.47.1

