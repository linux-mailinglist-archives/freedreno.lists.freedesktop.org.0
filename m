Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3E1E89FFF29
	for <lists+freedreno@lfdr.de>; Thu,  2 Jan 2025 20:03:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1691210E205;
	Thu,  2 Jan 2025 19:03:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="nmgeQRCh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com
 [209.85.214.178])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E1D8A10E205
 for <freedreno@lists.freedesktop.org>; Thu,  2 Jan 2025 19:03:05 +0000 (UTC)
Received: by mail-pl1-f178.google.com with SMTP id
 d9443c01a7336-2163bd70069so60886705ad.0
 for <freedreno@lists.freedesktop.org>; Thu, 02 Jan 2025 11:03:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1735844525; x=1736449325; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZmBLyMaEsdOn4Q5STQE+mhdoJd5pHTPZlhfFO4wWcQY=;
 b=nmgeQRChZY4oSWD6Kxh3wJhjWHaKSE1ZIjUmMj3oynVpPzKj9hTPKbESQZpc/UlblD
 KYaAehA9fhqVCsoJpBmXaaa9fJFhhsYaNDYbQR28aLx1/Farz4+W64LZfZqlsiIDXTVC
 JPO6NdFvqyxogsFVBvJUJXjxtklDdcXpYDt4ixzYJzg0TdpArudUdKQpYuxlVhU/ZqYc
 sP0G0pGGNt/ye7K2a7sb2qlc5SoUKLx2OxmVsUY/UKoWsQJza/hxB+LWmYyRJUV3FDIQ
 PkETU3j7dji3h4eyuEsBa9QB4xIdNR4k+Deg2GbbtmzjGuv2Bd52N9Xfh8u/6rbfahAu
 X8DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1735844525; x=1736449325;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZmBLyMaEsdOn4Q5STQE+mhdoJd5pHTPZlhfFO4wWcQY=;
 b=Ju81la8OXxdTHy6qAer6v6mTR4w5LvuDRiM/5VAGQx5yEks7VCk6dIHQ0XRHvgP5mm
 OGcoU6OYmXbs7+TYl3Vcso6MclYbNiVYP9sZfmFGv9PrkZe9B1EhTOD1jRYE5S2j8Bpg
 MYmB7zk0KOU3PqzHGM1ibf77OCzYjnRMco/EnU01oqelSRMtnGVWT5yYkdjSy3SssCbS
 grnZebddudH4n6ypbKsIBbDvL3LY9H67r/VSBdwz6dZRxw0cMuOyhUecLifo9AY6I8pN
 yAsigkfm1a2vy1D68eGqvot96YivJ4ZF8PKm9rn0YyzLYAITO91ZpzEo+zYwULfnDTs8
 n/Kg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXYqOWRmE8z7cYmGuF5e2HpZetHw986iARlKNB561alG7wFF1AELhYQRbPlF5oUGmGWlsGA/oPSp2s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwdHNAPeWnx32vEh4ZGdm58xMNbnQnStem+Sf5/MdDhcBE24pvz
 6LEoAASRFW9kuUC2RdbUWkO1Vka5YUJMTbXD30LC+0DZm2u45wIPbKTK5Q==
X-Gm-Gg: ASbGnctWrVug2+dHHjLua+KGvcxeQ2W7ta86aU/kHCYuGlV3Aack4oAXYYOZgsK6GC/
 wc1K6N6lwCcztVcmNaYXkVytDLEfOCQUD2SuHmUovs6mBYr27z6y60jmUNpR1uo1vVHJZ8YLawv
 laHpbdot0dNlHFRP4YqRBcQas6wt6PT0aqsrzmcgyD2xB3sp8/CgDeMT0NTXJitK8rVWNhyiOD2
 kO8vaIDoLkrNEKAAzs5n70iLGCpZ+kW34iisgZPPViEXdr4dik+2iRLhK14RP+MdI1VDoO8XYv6
 nL4/PhDmPpYn5NxXJXiqKSeux+CBg6I=
X-Google-Smtp-Source: AGHT+IHpGOLVThnWV3UDWPVggKt9JZyqBWGCDD4mG3rXl7oRcepmQ9fGjP9tbJJ2H/XG2/M6m4kRPA==
X-Received: by 2002:a05:6a00:3406:b0:725:eacf:cfdb with SMTP id
 d2e1a72fcca58-72abdeeed6emr71219209b3a.24.1735842756061; 
 Thu, 02 Jan 2025 10:32:36 -0800 (PST)
Received: from localhost ([2a00:79e1:2e00:1301:12e9:d196:a1e9:ab67])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72aad8dbbabsm25601698b3a.101.2025.01.02.10.32.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 02 Jan 2025 10:32:35 -0800 (PST)
From: Rob Clark <robdclark@gmail.com>
To: iommu@lists.linux.dev
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robdclark@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Joerg Roedel <joro@8bytes.org>,
 linux-arm-kernel@lists.infradead.org (moderated list:ARM SMMU DRIVERS),
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v2] iommu/arm-smmu-qcom: Only enable stall on smmu-v2
Date: Thu,  2 Jan 2025 10:32:31 -0800
Message-ID: <20250102183232.115279-1-robdclark@gmail.com>
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
because of GMU going off into the weeds.

What we _think_ is happening is that, if the GPU generates 1000's of
faults at ~once (which is something that GPUs can be good at), it can
result in a sufficient number of stalled translations preventing other
transactions from entering the same TBU.

Signed-off-by: Rob Clark <robdclark@chromium.org>
---
v2: Adds a modparam to override the default behavior, for debugging
    GPU faults in cases which do not (or might not) cause lockup.
    Also, rebased to not depend on Bibek's PRR support.

 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 19 +++++++++++++++++--
 1 file changed, 17 insertions(+), 2 deletions(-)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 6372f3e25c4b..3239bbf18514 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -16,6 +16,10 @@
 
 #define QCOM_DUMMY_VAL	-1
 
+static int enable_stall = -1;
+MODULE_PARM_DESC(enable_stall, "Enable stall on iova fault (1=on , 0=disable, -1=auto (default))");
+module_param(enable_stall, int, 0600);
+
 static struct qcom_smmu *to_qcom_smmu(struct arm_smmu_device *smmu)
 {
 	return container_of(smmu, struct qcom_smmu, smmu);
@@ -210,7 +214,9 @@ static bool qcom_adreno_can_do_ttbr1(struct arm_smmu_device *smmu)
 static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 		struct io_pgtable_cfg *pgtbl_cfg, struct device *dev)
 {
+	const struct device_node *np = smmu_domain->smmu->dev->of_node;
 	struct adreno_smmu_priv *priv;
+	bool stall_enabled;
 
 	smmu_domain->cfg.flush_walk_prefer_tlbiasid = true;
 
@@ -237,8 +243,17 @@ static int qcom_adreno_smmu_init_context(struct arm_smmu_domain *smmu_domain,
 	priv->get_ttbr1_cfg = qcom_adreno_smmu_get_ttbr1_cfg;
 	priv->set_ttbr0_cfg = qcom_adreno_smmu_set_ttbr0_cfg;
 	priv->get_fault_info = qcom_adreno_smmu_get_fault_info;
-	priv->set_stall = qcom_adreno_smmu_set_stall;
-	priv->resume_translation = qcom_adreno_smmu_resume_translation;
+
+	if (enable_stall < 0) {
+		stall_enabled = of_device_is_compatible(np, "qcom,smmu-v2");
+	} else {
+		stall_enabled = !!enable_stall;
+	}
+
+	if (stall_enabled) {
+		priv->set_stall = qcom_adreno_smmu_set_stall;
+		priv->resume_translation = qcom_adreno_smmu_resume_translation;
+	}
 
 	return 0;
 }
-- 
2.47.1

