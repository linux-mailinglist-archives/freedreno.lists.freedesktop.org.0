Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C7EF0ABE207
	for <lists+freedreno@lfdr.de>; Tue, 20 May 2025 19:45:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A774E10E5D0;
	Tue, 20 May 2025 17:45:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="gmfq04sX";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com
 [209.85.219.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9383C10E5C5
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 17:45:09 +0000 (UTC)
Received: by mail-qv1-f43.google.com with SMTP id
 6a1803df08f44-6f8b0f7c42dso9874466d6.2
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 10:45:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747763108; x=1748367908; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=k/0lqXBgLimY0A+nlogIvRC91H4XJPyHb2uLAtGHc+4=;
 b=gmfq04sX2WD9KB7+kq7e3bI94NPrz7W66xgVT2S1ej/lKHni7t9y/zR60EuL1asrS4
 OmGXINoZry9ZHpX6MWDKzDBp7vel78mEVFZQrgbqfwleWOar5QVJj4lS7KJzZLbyc98d
 H4W9MSQLIzQFJgmS5g2L09omQUMO37x7OuAgCxvO6e0ykgMOeJvMaqwUuP2aQeL8Mw5c
 GPe9lIP/N0AvzdEwPUCiKtov4WXETgujMn1Qb5OQoTHBo/DGSAGwnHFzBv9KiNAHamaf
 O1FH/OB97hGIeDpOxQjtuHZZuvfqkpOCPSQ9qJdmAzp/eOoJES9C+NKXyiwHTJU1tQMN
 6XPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747763108; x=1748367908;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k/0lqXBgLimY0A+nlogIvRC91H4XJPyHb2uLAtGHc+4=;
 b=WAWMto9OnRXto4NhndIS7qbTrAvdYfjbV367hmvFlgiD7lRAf1fItsioWdCJSC2aZX
 MuYhsSknvC0B1ISMcCMD0N4lZaN8JXOxil67Dk6j4/djkSyksDz5luZiwqksGk+M1LPF
 v+AwAW3T9Q3Pr/kBw8Vy/29fDWzczKYRA4qrqzXaA1zspda5Qd6YctuzqL/6+DUQnkLI
 fjwHdW8oHLoxcwbPHy3D/CeJbWM3a242tTdxTD8uMz90jyLAntZmgGpRkJbaD4rT+777
 XCQAbydedGZPjzvLTDO7WB1ApgMBMGZI1Yhmo31of2GyfyJBXEp2oQlfmqvasJw7k3dg
 tz2w==
X-Forwarded-Encrypted: i=1;
 AJvYcCV2DPpph0qdVcTrgJ+97mQhtnqvw8JYvtIWrulMRJxYP0P3PSzcvzImGyJXJ7EVzQcp7oAJ/NIs86g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVIgntuuqveEF1GrWL4kqdlort2MYTR1UUrzvM9zNxTwAbnLWH
 J3Y9rhaud4Iu6ix1Mzn5q1NsCxAYrCpUhoHL7GJiLyxXrsS+VeWwYdR7vVE3zs0F
X-Gm-Gg: ASbGnctoLjrkXeNCwGvzwj6UmLubBqPdzEgACnRxeMVUxJpRapMSOfGUmveG59PpzhH
 aEJC58ZpRU93ppIhF6lieP/ow2SbO2rciKlRz+3oiSEeE5eNtn6SrOZbioyMZ9X5G2Gyhc3V1gG
 /xnLrQWhKSZrw3Rq3Bkdg2S8m7h0wznDtIQmqiwgbGpwcpWii1OWIL8HwtczksJs0gKTyR+8fvC
 N2+oMqR/OHvn6OkNDeXxLwLSN8QLwouUspicxqO6KWl9M6b9F330gYuXQlQQ/JJMZNwMC/spdZp
 LwxV1fVNmrnKnPMdeHsg+xrA3RjzS7ODy21kXc7+hCfWoAYc9MIv2WQNAWXRX5hD4VMljz9BOEk
 AYf8FZW2RMWnhHfWVYQk=
X-Google-Smtp-Source: AGHT+IFCdFtXD0ROOtYtBP0OI+hMuOVWsDmLO4ZEV9rDAumTtHnKdWFKDekI52EYfVxWEILyc/wwTA==
X-Received: by 2002:ad4:5f8e:0:b0:6f5:3c5e:27fc with SMTP id
 6a1803df08f44-6f8b089442dmr94348406d6.4.1747763108580; 
 Tue, 20 May 2025 10:45:08 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com.
 [67.243.142.39]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-6f8b096ddb4sm74126586d6.78.2025.05.20.10.45.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 10:45:08 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 13:44:56 -0400
Subject: [PATCH v7 7/7] iommu/smmu-arm-qcom: Delete resume_translation()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v7-7-96cd1cc9ae05@gmail.com>
References: <20250520-msm-gpu-fault-fixes-next-v7-0-96cd1cc9ae05@gmail.com>
In-Reply-To: <20250520-msm-gpu-fault-fixes-next-v7-0-96cd1cc9ae05@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: iommu@lists.linux.dev, linux-arm-msm@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747763098; l=1671;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=T92V8eX3Vz4beQQo+V6nyo4FyO6B+nwmyPWJT1oO+Pk=;
 b=vtKS5WA2jt4fvTdysRQedDxOh8WN7S66xhFGBrNMjcLIhRmubh69gcLR/NbqQtWPPrry50qfq
 lDnb+3B5orhDydZLJby6AbGaTMBEjlxIm7FW0NgjDlqGLt+O1uUASXR
X-Developer-Key: i=cwabbott0@gmail.com; a=ed25519;
 pk=dkpOeRSXLzVgqhy0Idr3nsBr4ranyERLMnoAgR4cHmY=
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

Unused since "drm/msm: Delete resume_translation()".

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 include/linux/adreno-smmu-priv.h | 6 ++----
 1 file changed, 2 insertions(+), 4 deletions(-)

diff --git a/include/linux/adreno-smmu-priv.h b/include/linux/adreno-smmu-priv.h
index d83c9175828f792f1f43bcc8056102a43d822c96..4106b6b372117119bbebe67896de18fc6286fb44 100644
--- a/include/linux/adreno-smmu-priv.h
+++ b/include/linux/adreno-smmu-priv.h
@@ -46,9 +46,8 @@ struct adreno_smmu_fault_info {
  * @get_fault_info: Called by the GPU fault handler to get information about
  *                  the fault
  * @set_stall:     Configure whether stall on fault (CFCFG) is enabled. If
- *                 stalling on fault is enabled, the GPU driver must call
- *                 resume_translation()
- * @resume_translation: Resume translation after a fault
+ *                 stalling on fault is enabled, the GPU driver should return
+ *                 -EAGAIN from the fault handler if retrying is required.
  *
  * @set_prr_bit:   [optional] Configure the GPU's Partially Resident
  *                 Region (PRR) bit in the ACTLR register.
@@ -71,7 +70,6 @@ struct adreno_smmu_priv {
     int (*set_ttbr0_cfg)(const void *cookie, const struct io_pgtable_cfg *cfg);
     void (*get_fault_info)(const void *cookie, struct adreno_smmu_fault_info *info);
     void (*set_stall)(const void *cookie, bool enabled);
-    void (*resume_translation)(const void *cookie, bool terminate);
     void (*set_prr_bit)(const void *cookie, bool set);
     void (*set_prr_addr)(const void *cookie, phys_addr_t page_addr);
 };

-- 
2.47.1

