Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F9378B230C
	for <lists+freedreno@lfdr.de>; Thu, 25 Apr 2024 15:44:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDA77112001;
	Thu, 25 Apr 2024 13:44:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Ek8W5G6p";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com
 [209.85.128.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BF97112001
 for <freedreno@lists.freedesktop.org>; Thu, 25 Apr 2024 13:44:49 +0000 (UTC)
Received: by mail-wm1-f54.google.com with SMTP id
 5b1f17b1804b1-41b62970084so2309995e9.1
 for <freedreno@lists.freedesktop.org>; Thu, 25 Apr 2024 06:44:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714052687; x=1714657487; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=4RFVnmOo8A5tNCWQYVrv1gyOa6F8hSBqaR1nrZ9un+U=;
 b=Ek8W5G6pf5wkbci9VUbTuYeffUi1JldHC41aSPbWRs1CJ7MIO1QDGvrRP7uvpYG3s7
 rZXD/CJo4YmF2U/Qkc3NN7BQV4qjj00gxxR+gz8B1Zo2ZUWuzcdINqv2gdsbR+RDE/Xr
 r4jWAgMsfIF/A0B14kxQNq+RCMn+cVU63EOEMHFQYZCUF86Ux9fclurb1Ifufc8094Xd
 YuvOo+oXeH/NOXvSAx1eSiqU1Girhfm6VOAEEGwoAkoLzn0AWa8qv22pw8IWRzMy42Zv
 4krjTAaT38Qw6pSi0O4iEnJaBQCLtS7NdeuGIqJlsZBUb+f58Rs7sZ7L9eeVmeJEBA/H
 +WhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714052687; x=1714657487;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4RFVnmOo8A5tNCWQYVrv1gyOa6F8hSBqaR1nrZ9un+U=;
 b=qmIVTNAQx5UG/w9V519USY6KG99s9gAbe/qL0iFNgqWcjhnTC/5yWbH5Uoiz7s+a8o
 u191SlAehPWVh2xgRJ2+jsZy/+3H/yMxqOKgciLX3fmv3PFGw9uUyFJhpuwF+je2IWA/
 CoWw/uRkRdBq2tIreITxVm7K1nzVNQTEtNcB0t1lFkAuvrlGm3sxB+6xUg5JSY3a5sab
 46cdGe26lEb0EBgnQw07Y/iqnELElFN864ZjAqdCPyn7kKSn/XX7+gqHnVH9olKaXmn1
 XsSSJ4MpjbV8m8IUs3pImibBuVVio3PqUj3TxM/uJSxBQWc+dV9TfsKtlMMvdFAtR/Cm
 27mg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/QHNtgAa5HUEnkM/8I4HOIiwmRzlU4caALQMOdu3pUAilUIhAe3F6AyzNF9GpjOPIUdNF7ZwIYfnGrsC9vTTuf7rgm4PC5pqA5Y1et2eG
X-Gm-Message-State: AOJu0YwjrZihvrgaBtmlkYoic/eWR7KhU/23F6MnnR8y6fMaOI3m0rjV
 LGuZ9uq19wHLSkEzDKljVXaGq0GR0z2SrKKS3VVPl5qV9Aq/ClNP
X-Google-Smtp-Source: AGHT+IF/vzLeiuLcCVw2n0fBwad5kx+1qLvBsRs9a1VyKzFnQzt6YUgMuJbFTayG4LQSuxcQ3ZGn3g==
X-Received: by 2002:a05:600c:4fc3:b0:419:87ab:f6da with SMTP id
 o3-20020a05600c4fc300b0041987abf6damr4553524wmq.3.1714052687207; 
 Thu, 25 Apr 2024 06:44:47 -0700 (PDT)
Received: from lucy.. (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net.
 [86.12.82.21]) by smtp.gmail.com with ESMTPSA id
 bg11-20020a05600c3c8b00b0041a9c3444a6sm11235579wmb.28.2024.04.25.06.44.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Apr 2024 06:44:46 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org
Cc: Connor Abbott <cwabbott0@gmail.com>
Subject: [PATCH 3/6] drm/msm: Update a6xx registers
Date: Thu, 25 Apr 2024 14:43:51 +0100
Message-Id: <20240425134354.1233862-4-cwabbott0@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240425134354.1233862-1-cwabbott0@gmail.com>
References: <20240425134354.1233862-1-cwabbott0@gmail.com>
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

Update to mesa commit ff155f46a33 ("freedreno/a7xx: Register updates
from kgsl").

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 28 +++++++++++++++++--
 1 file changed, 25 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 78524aaab9d4..43fe90c12679 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -1227,6 +1227,7 @@ to upconvert to 32b float internally?
 		<bitfield name="DEBBUS_INTR_0" pos="26" type="boolean"/>
 		<bitfield name="DEBBUS_INTR_1" pos="27" type="boolean"/>
 		<bitfield name="TSBWRITEERROR" pos="28" type="boolean" variants="A7XX-"/>
+		<bitfield name="SWFUSEVIOLATION" pos="29" type="boolean" variants="A7XX-"/>
 		<bitfield name="ISDB_CPU_IRQ" pos="30" type="boolean"/>
 		<bitfield name="ISDB_UNDER_DEBUG" pos="31" type="boolean"/>
 	</bitset>
@@ -1503,6 +1504,9 @@ to upconvert to 32b float internally?
 	<reg32 offset="0x0287" name="RBBM_CLOCK_MODE_BV_VFD" variants="A7XX-"/>
 	<reg32 offset="0x0288" name="RBBM_CLOCK_MODE_BV_GPC" variants="A7XX-"/>
 
+	<reg32 offset="0x02c0" name="RBBM_SW_FUSE_INT_STATUS" variants="A7XX-"/>
+	<reg32 offset="0x02c1" name="RBBM_SW_FUSE_INT_MASK" variants="A7XX-"/>
+
 	<array offset="0x0400" name="RBBM_PERFCTR_CP" stride="2" length="14" variants="A6XX"/>
 	<array offset="0x041c" name="RBBM_PERFCTR_RBBM" stride="2" length="4" variants="A6XX"/>
 	<array offset="0x0424" name="RBBM_PERFCTR_PC" stride="2" length="8" variants="A6XX"/>
@@ -2842,7 +2846,11 @@ to upconvert to 32b float internally?
 		</reg32>
 	</array>
 	<!-- 0x891b-0x8926 invalid -->
-	<reg64 offset="0x8927" name="RB_SAMPLE_COUNT_ADDR" type="waddress" align="16" usage="cmd" variants="A6XX"/>
+	<doc>
+		RB_SAMPLE_COUNT_ADDR register is used up to (and including) a730. After that
+		the address is specified through CP_EVENT_WRITE7::WRITE_SAMPLE_COUNT.
+	</doc>
+	<reg64 offset="0x8927" name="RB_SAMPLE_COUNT_ADDR" type="waddress" align="16" usage="cmd"/>
 	<!-- 0x8929-0x89ff invalid -->
 
 	<!-- TODO: there are some registers in the 0x8a00-0x8bff range -->
@@ -2950,7 +2958,7 @@ to upconvert to 32b float internally?
 	<!-- 0x8e1d-0x8e1f invalid -->
 	<!-- 0x8e20-0x8e25 more perfcntr sel? -->
 	<!-- 0x8e26-0x8e27 invalid -->
-	<reg32 offset="0x8e28" name="RB_UNKNOWN_8E28" low="0" high="10"/>
+	<reg32 offset="0x8e28" name="RB_CMP_DBG_ECO_CNTL"/>
 	<!-- 0x8e29-0x8e2b invalid -->
 	<array offset="0x8e2c" name="RB_PERFCTR_CMP_SEL" stride="1" length="4"/>
 	<array offset="0x8e30" name="RB_PERFCTR_UFC_SEL" stride="1" length="6" variants="A7XX-"/>
@@ -3306,6 +3314,15 @@ to upconvert to 32b float internally?
 		<bitfield name="DISCARD" pos="2" type="boolean"/>
 	</reg32>
 
+	<!-- Both are a750+.
+	     Probably needed to correctly overlap execution of several draws.
+	-->
+	<reg32 offset="0x9885" name="PC_TESS_PARAM_SIZE" variants="A7XX-" usage="cmd"/>
+	<!-- Blob adds a bit more space {0x10, 0x20, 0x30, 0x40} bytes, but the meaning of
+	     this additional space is not known.
+	-->
+	<reg32 offset="0x9886" name="PC_TESS_FACTOR_SIZE" variants="A7XX-" usage="cmd"/>
+
 	<!-- 0x9982-0x9aff invalid -->
 
 	<reg32 offset="0x9b00" name="PC_PRIMITIVE_CNTL_0" type="a6xx_primitive_cntl_0" usage="rp_blit"/>
@@ -4293,7 +4310,7 @@ to upconvert to 32b float internally?
 	<!-- always 0x100000 or 0x1000000? -->
 	<reg32 offset="0xb600" name="TPL1_DBG_ECO_CNTL" low="0" high="25" usage="cmd"/>
 	<reg32 offset="0xb601" name="TPL1_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
-	<reg32 offset="0xb602" name="TPL1_UNKNOWN_B602" low="0" high="7" type="uint" usage="cmd"/>
+	<reg32 offset="0xb602" name="TPL1_DBG_ECO_CNTL1" usage="cmd"/>
 	<reg32 offset="0xb604" name="TPL1_NC_MODE_CNTL">
 		<bitfield name="MODE" pos="0" type="boolean"/>
 		<bitfield name="LOWER_BIT" low="1" high="2" type="uint"/>
@@ -4965,6 +4982,11 @@ to upconvert to 32b float internally?
 	<reg32 offset="0x0001" name="SYSTEM_CACHE_CNTL_0"/>
 	<reg32 offset="0x0002" name="SYSTEM_CACHE_CNTL_1"/>
 	<reg32 offset="0x0039" name="CX_MISC_TCM_RET_CNTL" variants="A7XX-"/>
+	<reg32 offset="0x0400" name="CX_MISC_SW_FUSE_VALUE" variants="A7XX-">
+		<bitfield pos="0" name="FASTBLEND" type="boolean"/>
+		<bitfield pos="1" name="LPAC" type="boolean"/>
+		<bitfield pos="2" name="RAYTRACING" type="boolean"/>
+	</reg32>
 </domain>
 
 </database>
-- 
2.31.1

