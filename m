Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6831FABE364
	for <lists+freedreno@lfdr.de>; Tue, 20 May 2025 21:09:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 49AFC10E64C;
	Tue, 20 May 2025 19:09:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="kMfhJoQQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-f171.google.com (mail-qt1-f171.google.com
 [209.85.160.171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFE4B10E647
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 19:09:09 +0000 (UTC)
Received: by mail-qt1-f171.google.com with SMTP id
 d75a77b69052e-476c35637aeso1016901cf.2
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 12:09:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1747768149; x=1748372949; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=k/0lqXBgLimY0A+nlogIvRC91H4XJPyHb2uLAtGHc+4=;
 b=kMfhJoQQxWLvEnD1o+FyV42/fHLiwHx9jMo0wI5BiyfeijrJnTzySPIu/s9qtZSQZz
 ugpPbQaBAGeJRhaGsJAOVTgNbF59V3F8BAmOSSVmS2vLxb9Jw2+jtDNqUCJT6q1vQrH+
 eCtPAhzlZUSTTu5E7+kU0PCV8mNmt0wF0NV6DH6uKwq1jm2SG3TDiABvx9f6KE/pnOHY
 uGwbzlOytX+hD6d6Pi0RhcVBSo8fhDYC+K1H1yaGQ0OGnAZlWXyKpAktPfOAwhFK72pK
 dQ9Cysm0SFIwAtogXdzzz2PsB7SPtHceqBNvlsHEuAM/W5ZVPSi/TaOljOgmmXL3yPf6
 ec1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747768149; x=1748372949;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=k/0lqXBgLimY0A+nlogIvRC91H4XJPyHb2uLAtGHc+4=;
 b=ewNyEKrReTjpiWJstNG3uNM8FUgzOWyX0qvRT7Ec4EKAJvwzpZafu5nif2E7TzoeDQ
 V15U35SOSCHWwNMw7ZvUdPxrSfJDJ0NrFo2P1K5qbfMjnNfjdpUDBTnSdxFXSuINWh/T
 4+RDwKjwX5sQ/y4/fjMyWWcofL+LWajPN6+TU1P4xLRwvwoRdvhhFqAMycs5bWa1Lj9l
 8MxFrX6X/0VhHAWhXe1vWgTu0inR9s+q8ioBfA0418TWSmA54j81yGBPpv8EDJRgTIC8
 psIf/k7JVmoNw1amaBDXWbuJ2BM0EY3Kj88XeI9aXXFYosJYHE203sKSfoxeH2MSqkAd
 J57g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQDjW80V+iAp1c5YuayBK3UvHlZUyuFJkOXFKtr7CZTI/1pfDcDjhg8RwAKfN0AvmP5AQ4ROEezsY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwjtsO4ssTRF8VPaW/C8hlZnEFgWKXsoFZWpUwgyYXfnHFXrlH6
 rtBAHvixNm4gkHW02rVD2u/XMURSrXxoM6I8/+V+mULNRV03iwlhSlZa
X-Gm-Gg: ASbGncuGut7UI19fU+EwYlcANPuzVOYtq5tvHU1s61lyIKC2gEQEL649cjx7qckuPaZ
 N3NIUkjmdEKt3mbsNXyxtF2qIEXv5aqRRt4x2+//hh2fWKSP0ZON+jlQEbnUoRuYIZtL73FvePZ
 wmnts874dTHAO2FEIYu2bDDIrNZlXoJXLyRxQqNHCsgGFzIt7SP/Sx/HhkfZa2jmtx2pKJcIuC5
 mankHOheaHd7FiFUnyQYLPqsEPmcjfGMe9+tyIz8MPJTaM4a6q8qcf9G+jYVH4u5H+lByxmkGXl
 FqM7kf8Xbsh0KerVEOemm9BZ4nnFZYSLmGuD68GU67DqAO/Gy2hR9E4xlWU6Q/CMZX/739zRSau
 1DsosHAzCw5nFVefgNSloGnVrHwypEg==
X-Google-Smtp-Source: AGHT+IFR5pt9/GVP1EPATJ5cgZRIzs6LVruq0q5vYeQ0eAM0wqovWxYcOeeO8H0l7rzEaFl4O0FbJQ==
X-Received: by 2002:ac8:5893:0:b0:47a:e5b6:50d4 with SMTP id
 d75a77b69052e-494ae3f7e46mr90403491cf.10.1747768148499; 
 Tue, 20 May 2025 12:09:08 -0700 (PDT)
Received: from [192.168.124.1] (syn-067-243-142-039.res.spectrum.com.
 [67.243.142.39]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-494ae445b99sm76554051cf.48.2025.05.20.12.09.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 12:09:07 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Tue, 20 May 2025 15:09:00 -0400
Subject: [PATCH v8 7/7] iommu/smmu-arm-qcom: Delete resume_translation()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250520-msm-gpu-fault-fixes-next-v8-7-fce6ee218787@gmail.com>
References: <20250520-msm-gpu-fault-fixes-next-v8-0-fce6ee218787@gmail.com>
In-Reply-To: <20250520-msm-gpu-fault-fixes-next-v8-0-fce6ee218787@gmail.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747768138; l=1671;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=T92V8eX3Vz4beQQo+V6nyo4FyO6B+nwmyPWJT1oO+Pk=;
 b=V6LelLjLszEjGIEg7Z7nBX+1w5ysEhFN0tIa8dRMNROYBzA6VMJ+NwDe2jnJAGKdUiJCz18nz
 McgNjrJt/A6BgWCGL2r/nQUpmNIJeHTCHHVFZazeqlf0zl9zY1lh5XO
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

