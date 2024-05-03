Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1FB8BADEC
	for <lists+freedreno@lfdr.de>; Fri,  3 May 2024 15:43:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA19F112178;
	Fri,  3 May 2024 13:43:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=gmail.com header.i=@gmail.com header.b="Zbh3xhh3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com
 [209.85.221.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 70DE7112175
 for <freedreno@lists.freedesktop.org>; Fri,  3 May 2024 13:43:20 +0000 (UTC)
Received: by mail-wr1-f54.google.com with SMTP id
 ffacd0b85a97d-34d7b0dac54so1732230f8f.0
 for <freedreno@lists.freedesktop.org>; Fri, 03 May 2024 06:43:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1714743798; x=1715348598; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rIBYIy5sx84JAML7/BYhUNYKu82fIVeAqq62KF2FXO8=;
 b=Zbh3xhh3hKtTrM5UnPGVTLVMbg5DInHbM7WSSHcmHhxw3PuT4gw3gj7yJkNueHCXyy
 RizpNNoyeC94Fo0AFhWRqU6aL8s+F0l5jI5o+JtJf26rcfzZ/3rk7DoDTI3yKRajyt4n
 3x4DJc5TCqbJD3EEZ9a6WhZ0CuyaP2c1SmfAizz6KW3pszgL6cMQA0ptgt7pbhaHHM6K
 X9CoyQus3eq9M7z7yqnkqBNn8NKvSQ/YVcnZczH+cWB1Kv1P+hyYipX7AM8UVIa3yXBx
 HEMYVmhU9PSe9jMgsF+DyBFQPMDuFcpnGzSH44YcojqIxQSagfjaorN2bF5iYhIK75Ml
 mbvQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1714743798; x=1715348598;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rIBYIy5sx84JAML7/BYhUNYKu82fIVeAqq62KF2FXO8=;
 b=qQdSHgQcVFdvycOpYgIytzWlG6DVh3cHdo9d92U3goVFEzjEEvLzXXrVZXV1djV+WX
 nSgl4KvmncomZVaZFl0Io0HV9YOlBFfwOypRah4tOoD+vRWzgCiftdPaYIgvdrXq2p/9
 TcHLfO20r1yRvGA+cRNFJFyi9OTylt+AafIOa66USUbxtUEiazRP08xpYYfbesFSQ9lj
 FV3CZFJ7HScVqRTsbI+fKONwbiidcTa8GENzXJy4WOGsqFGhV4BsPSfy4MEK8l/UlfoC
 woH9pLBRYkT+aSTKurROncXmSVkwnfIcf5YvH06KCUoOSO/Kx8RC5ZWPF36eKg/INRUF
 6tXA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVi02mRyA30IvYlxhd0uBPJFxDjNP1PRNUFsb0gMiicSSa2LmR+FiOfXokn6eOYL+tzMj41Br2YNGyWE8DT0Qw3znwUL9ttXaaQNpsc6ywq
X-Gm-Message-State: AOJu0YyyeLxVslxzdM/ZJt0Ox6ky/bOMLWEeU0JFecQlgR7aUd8ajpnQ
 0kdDwig4X1RJWdmQHZfkiKsjiDberO5StlAaE9JFM9H53IDWCgiUcvefYw==
X-Google-Smtp-Source: AGHT+IFlaJrkExWU8XpeLvyVoq0pfb9fRTrHaOxrtaSnbgzfidxMsqeTRrrI7AjCj0XywIJsUS0JdQ==
X-Received: by 2002:a5d:5542:0:b0:34c:769e:d9a0 with SMTP id
 g2-20020a5d5542000000b0034c769ed9a0mr2832427wrw.26.1714743797879; 
 Fri, 03 May 2024 06:43:17 -0700 (PDT)
Received: from [192.168.0.20]
 (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net. [86.12.82.21])
 by smtp.gmail.com with ESMTPSA id
 z18-20020adff1d2000000b0034df178a9acsm3782482wro.99.2024.05.03.06.43.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 May 2024 06:43:17 -0700 (PDT)
From: Connor Abbott <cwabbott0@gmail.com>
Date: Fri, 03 May 2024 14:42:32 +0100
Subject: [PATCH 3/5] drm/msm: Update a6xx registers XML
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240503-a750-devcoredump-v1-3-04e669e2c3f7@gmail.com>
References: <20240503-a750-devcoredump-v1-0-04e669e2c3f7@gmail.com>
In-Reply-To: <20240503-a750-devcoredump-v1-0-04e669e2c3f7@gmail.com>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org, 
 Connor Abbott <cwabbott0@gmail.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1714743792; l=6403;
 i=cwabbott0@gmail.com; s=20240426; h=from:subject:message-id;
 bh=ezAgAuArgCd+tmkLIfDI7l1WOjk7yaPZvxxhFEDHLkQ=;
 b=9hvmKcEbD32CIeqreyeyoB9n6l6xwfRKkEyRIu1w3eDlD9KBaA0I5sjBLyF3KOe8aFmdh+UEy
 EJV/dPnBpqGCIeAchq+VH0lGIF7pMoiuM8d43muduV9GTwRqCD2HH0c
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

Update to Mesa commit e82d70d472cc ("freedreno/a7xx: Add
A7XX_HLSQ_DP_STR location from kgsl").

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 47 +++++++++++++++++++++++++--
 1 file changed, 44 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 78524aaab9d4..2dfe6913ab4f 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -397,6 +397,7 @@ by a particular renderpass/blit.
 	<value value="1" name="A7XX_HLSQ_DP"/>
 	<value value="2" name="A7XX_SP_TOP"/>
 	<value value="3" name="A7XX_USPTP"/>
+	<value value="4" name="A7XX_HLSQ_DP_STR"/>
 </enum>
 
 <enum name="a7xx_pipe">
@@ -1227,6 +1228,7 @@ to upconvert to 32b float internally?
 		<bitfield name="DEBBUS_INTR_0" pos="26" type="boolean"/>
 		<bitfield name="DEBBUS_INTR_1" pos="27" type="boolean"/>
 		<bitfield name="TSBWRITEERROR" pos="28" type="boolean" variants="A7XX-"/>
+		<bitfield name="SWFUSEVIOLATION" pos="29" type="boolean" variants="A7XX-"/>
 		<bitfield name="ISDB_CPU_IRQ" pos="30" type="boolean"/>
 		<bitfield name="ISDB_UNDER_DEBUG" pos="31" type="boolean"/>
 	</bitset>
@@ -1460,6 +1462,24 @@ to upconvert to 32b float internally?
 	<reg32 offset="0x0b40" name="CP_LPAC_FIFO_DBG_ADDR" variants="A7XX-"/>
 	<reg32 offset="0x0b81" name="CP_LPAC_SQE_CNTL"/>
 	<reg64 offset="0x0b82" name="CP_LPAC_SQE_INSTR_BASE"/>
+
+	<reg64 offset="0x0b70" name="CP_AQE_INSTR_BASE_0" variants="A7XX-"/>
+	<reg64 offset="0x0b72" name="CP_AQE_INSTR_BASE_1" variants="A7XX-"/>
+	<reg32 offset="0x0b78" name="CP_AQE_APRIV_CNTL" variants="A7XX-"/>
+
+	<reg32 offset="0x0ba8" name="CP_AQE_ROQ_DBG_ADDR_0" variants="A7XX-"/>
+	<reg32 offset="0x0ba9" name="CP_AQE_ROQ_DBG_ADDR_1" variants="A7XX-"/>
+	<reg32 offset="0x0bac" name="CP_AQE_ROQ_DBG_DATA_0" variants="A7XX-"/>
+	<reg32 offset="0x0bad" name="CP_AQE_ROQ_DBG_DATA_1" variants="A7XX-"/>
+	<reg32 offset="0x0bb0" name="CP_AQE_UCODE_DBG_ADDR_0" variants="A7XX-"/>
+	<reg32 offset="0x0bb1" name="CP_AQE_UCODE_DBG_ADDR_1" variants="A7XX-"/>
+	<reg32 offset="0x0bb4" name="CP_AQE_UCODE_DBG_DATA_0" variants="A7XX-"/>
+	<reg32 offset="0x0bb5" name="CP_AQE_UCODE_DBG_DATA_1" variants="A7XX-"/>
+	<reg32 offset="0x0bb8" name="CP_AQE_STAT_ADDR_0" variants="A7XX-"/>
+	<reg32 offset="0x0bb9" name="CP_AQE_STAT_ADDR_1" variants="A7XX-"/>
+	<reg32 offset="0x0bbc" name="CP_AQE_STAT_DATA_0" variants="A7XX-"/>
+	<reg32 offset="0x0bbd" name="CP_AQE_STAT_DATA_1" variants="A7XX-"/>
+
 	<reg32 offset="0x0C01" name="VSC_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
 	<reg32 offset="0x0018" name="RBBM_GPR0_CNTL"/>
 	<reg32 offset="0x0201" name="RBBM_INT_0_STATUS" type="A6XX_RBBM_INT_0_MASK"/>
@@ -1503,6 +1523,9 @@ to upconvert to 32b float internally?
 	<reg32 offset="0x0287" name="RBBM_CLOCK_MODE_BV_VFD" variants="A7XX-"/>
 	<reg32 offset="0x0288" name="RBBM_CLOCK_MODE_BV_GPC" variants="A7XX-"/>
 
+	<reg32 offset="0x02c0" name="RBBM_SW_FUSE_INT_STATUS" variants="A7XX-"/>
+	<reg32 offset="0x02c1" name="RBBM_SW_FUSE_INT_MASK" variants="A7XX-"/>
+
 	<array offset="0x0400" name="RBBM_PERFCTR_CP" stride="2" length="14" variants="A6XX"/>
 	<array offset="0x041c" name="RBBM_PERFCTR_RBBM" stride="2" length="4" variants="A6XX"/>
 	<array offset="0x0424" name="RBBM_PERFCTR_PC" stride="2" length="8" variants="A6XX"/>
@@ -2842,7 +2865,11 @@ to upconvert to 32b float internally?
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
@@ -2950,7 +2977,7 @@ to upconvert to 32b float internally?
 	<!-- 0x8e1d-0x8e1f invalid -->
 	<!-- 0x8e20-0x8e25 more perfcntr sel? -->
 	<!-- 0x8e26-0x8e27 invalid -->
-	<reg32 offset="0x8e28" name="RB_UNKNOWN_8E28" low="0" high="10"/>
+	<reg32 offset="0x8e28" name="RB_CMP_DBG_ECO_CNTL"/>
 	<!-- 0x8e29-0x8e2b invalid -->
 	<array offset="0x8e2c" name="RB_PERFCTR_CMP_SEL" stride="1" length="4"/>
 	<array offset="0x8e30" name="RB_PERFCTR_UFC_SEL" stride="1" length="6" variants="A7XX-"/>
@@ -3306,6 +3333,15 @@ to upconvert to 32b float internally?
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
@@ -4293,7 +4329,7 @@ to upconvert to 32b float internally?
 	<!-- always 0x100000 or 0x1000000? -->
 	<reg32 offset="0xb600" name="TPL1_DBG_ECO_CNTL" low="0" high="25" usage="cmd"/>
 	<reg32 offset="0xb601" name="TPL1_ADDR_MODE_CNTL" type="a5xx_address_mode"/>
-	<reg32 offset="0xb602" name="TPL1_UNKNOWN_B602" low="0" high="7" type="uint" usage="cmd"/>
+	<reg32 offset="0xb602" name="TPL1_DBG_ECO_CNTL1" usage="cmd"/>
 	<reg32 offset="0xb604" name="TPL1_NC_MODE_CNTL">
 		<bitfield name="MODE" pos="0" type="boolean"/>
 		<bitfield name="LOWER_BIT" low="1" high="2" type="uint"/>
@@ -4965,6 +5001,11 @@ to upconvert to 32b float internally?
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

