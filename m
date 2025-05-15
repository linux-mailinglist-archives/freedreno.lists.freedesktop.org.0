Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 32516AB905C
	for <lists+freedreno@lfdr.de>; Thu, 15 May 2025 21:59:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 043A110E959;
	Thu, 15 May 2025 19:59:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="K7JpYqsE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com
 [209.85.219.50])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4522410E051
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 19:59:39 +0000 (UTC)
Received: by mail-qv1-f50.google.com with SMTP id
 6a1803df08f44-6f8a694d622so1305196d6.1
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 12:59:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747339178; x=1747943978; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qWJZCHLwo4+rNxVq1K/n30vdDm3CIQkELPwI2pLPS/o=;
 b=K7JpYqsEWJOUX40/+K9z/cDW2y/dZzDIuE/ihjIK4Th4c6uXcwGa3GlNDSBMPDFZeG
 cz5x+safxDsQVyBgC0M+jzPVYFtW8BFvNgn7MRs9ZJrKdSDJN3NVl73MLa8DN0+3eFk8
 4/Y0pju+qq/CtnwFhH8tqYvI7CvZJZrrY4huLxmZv9LM2U1jrp3RMqSsPiTUTUs+ogJd
 WdsHyWGJXAYBoZef5aRetA7l1MRfd2nOrcEP4mKx/WTuy4tATjtpI3/xGAzd6LNgHTpQ
 N+kys0pQ3G8NDar6417JqPPVDBTjsETzP4WFknJAyKQ+rxB0H+dlsmvHjcwaIZ3w35Cz
 sk1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747339178; x=1747943978;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qWJZCHLwo4+rNxVq1K/n30vdDm3CIQkELPwI2pLPS/o=;
 b=IgiqMQi7vIiyFzJ40LeUfVbhxtbwTe7dcMhtaVMBf/HTw56D24lJ8X9GwYuFRrZNCl
 u3h1EhJ/sqGp+kZm619eyK8yvRXhOaAO0lQRVJIS/yd+8LLMtifhVWWZRCZsEv3X34KJ
 jXTfQEeiMDBW1J3QWIe/Uo1sv9xVdwIr07nAXOhAnt5RBikd9KoWu/eDijEsaTOARRgW
 SC8P9lYdFL/wN+ilC2P2pkWcfWVkZUTSwwYz2mNWB4HIzbnu4t1b5MrFfjXWPzUnw29n
 Cfzhn3M/MtKoCV+yeInFufRnmoT/XeX+icB2meIRKAH7dEZ+ii8T0NLmAKhdNzz+xbXa
 A5UQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWQpOc+orth12tfUInj983TCArq8OAaN2cLWAYUXmILRxaApwX/CbHRxUYFksIiECTVjBGQvEYNfJo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyP6CZ1qdW9te4ALuR6+LnA/k4NfRnjm5G3ORYLtK/O/Qffe1Ev
 MddiiRPUT5A7KCZjj5xx7iohp3vaFAeqJs0+IU9t44f5tuq08Q2WzpM4
X-Gm-Gg: ASbGncsuDNG+VskmbLG2wkDP4ehxPxOSmRKsLkycFonQfB5VqNENGBiN0AyIJfbo8XF
 V32BqPrg+6y7EVjtt5wBAKrLHrhigxMCYvTS7OHInf6MZ5NynrMEic38+XjnnlZaY6fsKyRKOKe
 OjwjpJR6Ktev33MRQ4QHTWUCFOiFeYwzrCdO/tdaDV4Cf32dPvKC1Xd8utKaZ741D46Bn5trtJ7
 hw8ciKXU3/P0oc4Coq584MkHY5MbnrpwaM61GgbueBIHZE1Q6gD2nGiW20bwa5ZgCTKU5Qunb7y
 OAGgFHUzZAMsoeM8yssfBp86lTv5hPthbP9ziReW0O78X/xFHKcko4fxrk5ruXER+45QEV5GHon
 OcdxYMWfiUJwhmtR5urI=
X-Google-Smtp-Source: AGHT+IH82TQ9c8cVYqaXjsAhzpScTuQetKQyv8EkyvQLwXx7nU7GdytaDPOdEesc7oYyyCkeN49+/Q==
X-Received: by 2002:ac8:5951:0:b0:475:876:ac3d with SMTP id
 d75a77b69052e-494ae41e3a4mr3460681cf.13.1747339178066; 
 Thu, 15 May 2025 12:59:38 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com.
 [67.243.142.39]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-494ae4fd80bsm1957231cf.56.2025.05.15.12.59.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 May 2025 12:59:37 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Thu, 15 May 2025 15:58:43 -0400
Subject: [PATCH v6 1/7] iommu/arm-smmu-qcom: Enable threaded IRQ for Adreno
 SMMUv2/MMU500
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250515-msm-gpu-fault-fixes-next-v6-1-4fe2a583a878@gmail.com>
References: <20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com>
In-Reply-To: <20250515-msm-gpu-fault-fixes-next-v6-0-4fe2a583a878@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747339176; l=2173;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=DPKRVjaqGjt+UvV8ZZCM0hAEA0xW5F7yYBkPh+fJ4X4=;
 b=62Z0w3hpPUoa4KOiyVuNO04DfGNn3v70J7ZnmSCozzrwREkvpBQansvHOQaEZoUFL+zftDl/L
 uXXn7xCS28bAYrzU5iTGeMySBdN12STsv+/vLopzuc9rlGmgu1VXpvp
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

The recommended flow for stall-on-fault in SMMUv2 is the following:

1. Resolve the fault.
2. Write to FSR to clear the fault bits.
3. Write RESUME to retry or fail the transaction.

MMU500 is designed with this sequence in mind. For example,
experimentally we have seen on MMU500 that writing RESUME does not clear
FSR.SS unless the original fault is cleared in FSR, so 2 must come
before 3. FSR.SS is allowed to signal a fault (and does on MMU500) so
that if we try to do 2 -> 1 -> 3 (while exiting from the fault handler
after 2) we can get duplicate faults without hacks to disable
interrupts.

However, resolving the fault typically requires lengthy operations that
can stall, like bringing in pages from disk. The only current user,
drm/msm, dumps GPU state before failing the transaction which indeed can
stall. Therefore, from now on we will require implementations that want
to use stall-on-fault to also enable threaded IRQs. Do that with the
Adreno MMU implementations.

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
index 6372f3e25c4bc24cb52f9233095170e8aa510a53..2b21b7208bc7b439d69e36ca678acd2eacbd5b85 100644
--- a/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
+++ b/drivers/iommu/arm/arm-smmu/arm-smmu-qcom.c
@@ -468,6 +468,7 @@ static const struct arm_smmu_impl qcom_adreno_smmu_v2_impl = {
 	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
 	.write_sctlr = qcom_adreno_smmu_write_sctlr,
 	.tlb_sync = qcom_smmu_tlb_sync,
+	.context_fault_needs_threaded_irq = true,
 };
 
 static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
@@ -477,6 +478,7 @@ static const struct arm_smmu_impl qcom_adreno_smmu_500_impl = {
 	.alloc_context_bank = qcom_adreno_smmu_alloc_context_bank,
 	.write_sctlr = qcom_adreno_smmu_write_sctlr,
 	.tlb_sync = qcom_smmu_tlb_sync,
+	.context_fault_needs_threaded_irq = true,
 };
 
 static struct arm_smmu_device *qcom_smmu_create(struct arm_smmu_device *smmu,

-- 
2.47.1

