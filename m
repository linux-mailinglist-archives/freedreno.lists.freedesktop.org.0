Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3325983C364
	for <lists+freedreno@lfdr.de>; Thu, 25 Jan 2024 14:13:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F266B10EA8F;
	Thu, 25 Jan 2024 13:13:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com
 [209.85.221.48])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D068510F8D0
 for <freedreno@lists.freedesktop.org>; Thu, 25 Jan 2024 13:13:20 +0000 (UTC)
Received: by mail-wr1-f48.google.com with SMTP id
 ffacd0b85a97d-337d90030bfso5679278f8f.2
 for <freedreno@lists.freedesktop.org>; Thu, 25 Jan 2024 05:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=gmail.com; s=20230601; t=1706188339; x=1706793139; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1/Milmrti4zbsv6lLzB+2P/Vy+CLtDLbellfXolYX8M=;
 b=Mj62GuhGg4kLd8v8E/ORvVCzBZbVXf9879w1daNjFdQAvq29qhV0sYs5B/nb/foC15
 3iZwTrHaCzand9+/1gSj/i0rPUyPZjPdeNQcPxQYuRATMrRlb9HOT3pJNpdMpVop50+2
 ZQ4vj6p5RDhnvv4ft+2g4ny46Q2MK+ECXfM/ezzGgQ48a1sGI0dBodhPpgPBJEu+uxiB
 EdZd7ljKfBfsJDcJXUyPXyaxUavV8i4jW+3SoUtWqPsXkwJfVT8XIB5paXjM0AN9PBBN
 O5+rMUbcc1XWnhn4BG/JLwPxGv8deBwA1A5QGSYPynoyZttoBRj53AgroVVeVMIr+3Kc
 x6zA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1706188339; x=1706793139;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1/Milmrti4zbsv6lLzB+2P/Vy+CLtDLbellfXolYX8M=;
 b=drU0ITuUGnFeG+BHrnKG1PRKfhPreN/MoQhzLnolsFRhGptJ2i53MQUde3OefLHkVi
 cnbrx8q5KRdj+GTlQs1xuXjN5PHnqCiSr3h5CjO+5e/797I1vhiSlLlC4OcE6LD8jxp0
 F76K3/cQvCT5RGxZtJbcGPhCpS5GetYU56udlMe80kevgzgR7upPPHOa6taXApLIwZoW
 VMd5dwqRLPfSyd2WwL3mygeei96fpS1XksHOYa68oYfD1SilSncwag1RX6B5KyeEsBrD
 lHnlUhx/h/PXC2o0XpLpvwIipzdRKsOnrunM4lCCqOtGOlp0yOsIcmVMHeQnAK0Bn8Mr
 36og==
X-Gm-Message-State: AOJu0YxAfh/rNz4HXi65bQrGiP0pG0cdwP6Pux1tsxYoXwr4NIkDXJnx
 E/Rb/766UbWc+1s1jZJUS7pj+Eo1p6Cpr9BwIjZOQ0gntkqhLbb4npGdaaKStIY=
X-Google-Smtp-Source: AGHT+IHPQ8LGeKkWq7dfbpimtfRUNgd+nRafdRKNBl376n3Xm1s2KHvYEpYCp9n2J//RxT5+53ZvTQ==
X-Received: by 2002:adf:f14e:0:b0:333:13cf:dd18 with SMTP id
 y14-20020adff14e000000b0033313cfdd18mr293886wro.69.1706188338786; 
 Thu, 25 Jan 2024 05:12:18 -0800 (PST)
Received: from lucy.. (cpc115152-dals23-2-0-cust532.20-2.cable.virginm.net.
 [86.12.82.21]) by smtp.gmail.com with ESMTPSA id
 s17-20020a5d4251000000b00337d84efaf7sm17076114wrr.74.2024.01.25.05.12.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Jan 2024 05:12:18 -0800 (PST)
From: Connor Abbott <cwabbott0@gmail.com>
To: freedreno@lists.freedesktop.org
Subject: [PATCH 2/5] drm/msm/adreno: Update a6xx headers for a7xx devcoredump
Date: Thu, 25 Jan 2024 13:10:55 +0000
Message-Id: <20240125131058.2084628-3-cwabbott0@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20240125131058.2084628-1-cwabbott0@gmail.com>
References: <20240125131058.2084628-1-cwabbott0@gmail.com>
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
Cc: Rob Clark <robdclark@chromium.org>, Connor Abbott <cwabbott0@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Signed-off-by: Connor Abbott <cwabbott0@gmail.com>
---
 drivers/gpu/drm/msm/adreno/a6xx.xml.h | 785 ++++++++++++++++++--------
 1 file changed, 535 insertions(+), 250 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx.xml.h b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
index ad6f6be9bfae..e2272cd8016d 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx.xml.h
@@ -9,10 +9,10 @@ git clone https://gitlab.freedesktop.org/mesa/mesa.git
 
 The rules-ng-ng source files this header was generated from are:
 
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/a6xx.xml          ( 227290 bytes, from Thu Jan  4 07:25:22 2024)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/freedreno_copyright.xml  (   1572 bytes, from Fri Jun  2 14:59:26 2023)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_common.xml (  15434 bytes, from Fri Jun  2 14:59:26 2023)
-- /home/robclark/src/mesa/mesa/src/freedreno/registers/adreno/adreno_pm4.xml    (  85691 bytes, from Wed Nov 29 09:06:03 2023)
+- /home/cwabbott/src/mesa/src/freedreno/registers/adreno/a6xx.xml          ( 237973 bytes, from Mon Jan 22 11:53:05 2024)
+- /home/cwabbott/src/mesa/src/freedreno/registers/freedreno_copyright.xml  (   1572 bytes, from Mon Dec  7 12:18:19 2020)
+- /home/cwabbott/src/mesa/src/freedreno/registers/adreno/adreno_common.xml (  15434 bytes, from Fri Jul 14 18:12:07 2023)
+- /home/cwabbott/src/mesa/src/freedreno/registers/adreno/adreno_pm4.xml    (  85691 bytes, from Tue Jan 16 19:58:43 2024)
 
 Copyright (C) 2013-2024 by the following authors:
 - Rob Clark <robdclark@gmail.com> Rob Clark
@@ -251,6 +251,85 @@ enum a6xx_shader_id {
 	A6XX_HLSQ_INST_RAM_1 = 115,
 };
 
+enum a7xx_statetype_id {
+	A7XX_TP0_NCTX_REG = 0,
+	A7XX_TP0_CTX0_3D_CVS_REG = 1,
+	A7XX_TP0_CTX0_3D_CPS_REG = 2,
+	A7XX_TP0_CTX1_3D_CVS_REG = 3,
+	A7XX_TP0_CTX1_3D_CPS_REG = 4,
+	A7XX_TP0_CTX2_3D_CPS_REG = 5,
+	A7XX_TP0_CTX3_3D_CPS_REG = 6,
+	A7XX_TP0_TMO_DATA = 9,
+	A7XX_TP0_SMO_DATA = 10,
+	A7XX_TP0_MIPMAP_BASE_DATA = 11,
+	A7XX_SP_NCTX_REG = 32,
+	A7XX_SP_CTX0_3D_CVS_REG = 33,
+	A7XX_SP_CTX0_3D_CPS_REG = 34,
+	A7XX_SP_CTX1_3D_CVS_REG = 35,
+	A7XX_SP_CTX1_3D_CPS_REG = 36,
+	A7XX_SP_CTX2_3D_CPS_REG = 37,
+	A7XX_SP_CTX3_3D_CPS_REG = 38,
+	A7XX_SP_INST_DATA = 39,
+	A7XX_SP_INST_DATA_1 = 40,
+	A7XX_SP_LB_0_DATA = 41,
+	A7XX_SP_LB_1_DATA = 42,
+	A7XX_SP_LB_2_DATA = 43,
+	A7XX_SP_LB_3_DATA = 44,
+	A7XX_SP_LB_4_DATA = 45,
+	A7XX_SP_LB_5_DATA = 46,
+	A7XX_SP_LB_6_DATA = 47,
+	A7XX_SP_LB_7_DATA = 48,
+	A7XX_SP_CB_RAM = 49,
+	A7XX_SP_LB_13_DATA = 50,
+	A7XX_SP_LB_14_DATA = 51,
+	A7XX_SP_INST_TAG = 52,
+	A7XX_SP_INST_DATA_2 = 53,
+	A7XX_SP_TMO_TAG = 54,
+	A7XX_SP_SMO_TAG = 55,
+	A7XX_SP_STATE_DATA = 56,
+	A7XX_SP_HWAVE_RAM = 57,
+	A7XX_SP_L0_INST_BUF = 58,
+	A7XX_SP_LB_8_DATA = 59,
+	A7XX_SP_LB_9_DATA = 60,
+	A7XX_SP_LB_10_DATA = 61,
+	A7XX_SP_LB_11_DATA = 62,
+	A7XX_SP_LB_12_DATA = 63,
+	A7XX_HLSQ_DATAPATH_DSTR_META = 64,
+	A7XX_HLSQ_L2STC_TAG_RAM = 67,
+	A7XX_HLSQ_L2STC_INFO_CMD = 68,
+	A7XX_HLSQ_CVS_BE_CTXT_BUF_RAM_TAG = 69,
+	A7XX_HLSQ_CPS_BE_CTXT_BUF_RAM_TAG = 70,
+	A7XX_HLSQ_GFX_CVS_BE_CTXT_BUF_RAM = 71,
+	A7XX_HLSQ_GFX_CPS_BE_CTXT_BUF_RAM = 72,
+	A7XX_HLSQ_CHUNK_CVS_RAM = 73,
+	A7XX_HLSQ_CHUNK_CPS_RAM = 74,
+	A7XX_HLSQ_CHUNK_CVS_RAM_TAG = 75,
+	A7XX_HLSQ_CHUNK_CPS_RAM_TAG = 76,
+	A7XX_HLSQ_ICB_CVS_CB_BASE_TAG = 77,
+	A7XX_HLSQ_ICB_CPS_CB_BASE_TAG = 78,
+	A7XX_HLSQ_CVS_MISC_RAM = 79,
+	A7XX_HLSQ_CPS_MISC_RAM = 80,
+	A7XX_HLSQ_CPS_MISC_RAM_1 = 81,
+	A7XX_HLSQ_INST_RAM = 82,
+	A7XX_HLSQ_GFX_CVS_CONST_RAM = 83,
+	A7XX_HLSQ_GFX_CPS_CONST_RAM = 84,
+	A7XX_HLSQ_CVS_MISC_RAM_TAG = 85,
+	A7XX_HLSQ_CPS_MISC_RAM_TAG = 86,
+	A7XX_HLSQ_INST_RAM_TAG = 87,
+	A7XX_HLSQ_GFX_CVS_CONST_RAM_TAG = 88,
+	A7XX_HLSQ_GFX_CPS_CONST_RAM_TAG = 89,
+	A7XX_HLSQ_GFX_LOCAL_MISC_RAM = 90,
+	A7XX_HLSQ_GFX_LOCAL_MISC_RAM_TAG = 91,
+	A7XX_HLSQ_INST_RAM_1 = 92,
+	A7XX_HLSQ_STPROC_META = 93,
+	A7XX_HLSQ_BV_BE_META = 94,
+	A7XX_HLSQ_INST_RAM_2 = 95,
+	A7XX_HLSQ_DATAPATH_META = 96,
+	A7XX_HLSQ_FRONTEND_META = 97,
+	A7XX_HLSQ_INDIRECT_META = 98,
+	A7XX_HLSQ_BACKEND_META = 99,
+};
+
 enum a6xx_debugbus_id {
 	A6XX_DBGBUS_CP = 1,
 	A6XX_DBGBUS_RBBM = 2,
@@ -310,6 +389,140 @@ enum a6xx_debugbus_id {
 	A6XX_DBGBUS_SPTP_5 = 93,
 };
 
+enum a7xx_state_location {
+	A7XX_HLSQ_STATE = 0,
+	A7XX_HLSQ_DP = 1,
+	A7XX_SP_TOP = 2,
+	A7XX_USPTP = 3,
+};
+
+enum a7xx_pipe {
+	A7XX_PIPE_NONE = 0,
+	A7XX_PIPE_BR = 1,
+	A7XX_PIPE_BV = 2,
+	A7XX_PIPE_LPAC = 3,
+};
+
+enum a7xx_cluster {
+	A7XX_CLUSTER_NONE = 0,
+	A7XX_CLUSTER_FE = 1,
+	A7XX_CLUSTER_SP_VS = 2,
+	A7XX_CLUSTER_PC_VS = 3,
+	A7XX_CLUSTER_GRAS = 4,
+	A7XX_CLUSTER_SP_PS = 5,
+	A7XX_CLUSTER_VPC_PS = 6,
+	A7XX_CLUSTER_PS = 7,
+};
+
+enum a7xx_debugbus_id {
+	A7XX_DBGBUS_CP_0_0 = 1,
+	A7XX_DBGBUS_CP_0_1 = 2,
+	A7XX_DBGBUS_RBBM = 3,
+	A7XX_DBGBUS_GBIF_GX = 5,
+	A7XX_DBGBUS_GBIF_CX = 6,
+	A7XX_DBGBUS_HLSQ = 7,
+	A7XX_DBGBUS_UCHE_0 = 9,
+	A7XX_DBGBUS_UCHE_1 = 10,
+	A7XX_DBGBUS_TESS_BR = 13,
+	A7XX_DBGBUS_TESS_BV = 14,
+	A7XX_DBGBUS_PC_BR = 17,
+	A7XX_DBGBUS_PC_BV = 18,
+	A7XX_DBGBUS_VFDP_BR = 21,
+	A7XX_DBGBUS_VFDP_BV = 22,
+	A7XX_DBGBUS_VPC_BR = 25,
+	A7XX_DBGBUS_VPC_BV = 26,
+	A7XX_DBGBUS_TSE_BR = 29,
+	A7XX_DBGBUS_TSE_BV = 30,
+	A7XX_DBGBUS_RAS_BR = 33,
+	A7XX_DBGBUS_RAS_BV = 34,
+	A7XX_DBGBUS_VSC = 37,
+	A7XX_DBGBUS_COM_0 = 39,
+	A7XX_DBGBUS_LRZ_BR = 43,
+	A7XX_DBGBUS_LRZ_BV = 44,
+	A7XX_DBGBUS_UFC_0 = 47,
+	A7XX_DBGBUS_UFC_1 = 48,
+	A7XX_DBGBUS_GMU_GX = 55,
+	A7XX_DBGBUS_DBGC = 59,
+	A7XX_DBGBUS_CX = 60,
+	A7XX_DBGBUS_GMU_CX = 61,
+	A7XX_DBGBUS_GPC_BR = 62,
+	A7XX_DBGBUS_GPC_BV = 63,
+	A7XX_DBGBUS_LARC = 66,
+	A7XX_DBGBUS_HLSQ_SPTP = 68,
+	A7XX_DBGBUS_RB_0 = 70,
+	A7XX_DBGBUS_RB_1 = 71,
+	A7XX_DBGBUS_RB_2 = 72,
+	A7XX_DBGBUS_RB_3 = 73,
+	A7XX_DBGBUS_RB_4 = 74,
+	A7XX_DBGBUS_RB_5 = 75,
+	A7XX_DBGBUS_UCHE_WRAPPER = 102,
+	A7XX_DBGBUS_CCU_0 = 106,
+	A7XX_DBGBUS_CCU_1 = 107,
+	A7XX_DBGBUS_CCU_2 = 108,
+	A7XX_DBGBUS_CCU_3 = 109,
+	A7XX_DBGBUS_CCU_4 = 110,
+	A7XX_DBGBUS_CCU_5 = 111,
+	A7XX_DBGBUS_VFD_BR_0 = 138,
+	A7XX_DBGBUS_VFD_BR_1 = 139,
+	A7XX_DBGBUS_VFD_BR_2 = 140,
+	A7XX_DBGBUS_VFD_BR_3 = 141,
+	A7XX_DBGBUS_VFD_BR_4 = 142,
+	A7XX_DBGBUS_VFD_BR_5 = 143,
+	A7XX_DBGBUS_VFD_BR_6 = 144,
+	A7XX_DBGBUS_VFD_BR_7 = 145,
+	A7XX_DBGBUS_VFD_BV_0 = 202,
+	A7XX_DBGBUS_VFD_BV_1 = 203,
+	A7XX_DBGBUS_VFD_BV_2 = 204,
+	A7XX_DBGBUS_VFD_BV_3 = 205,
+	A7XX_DBGBUS_USP_0 = 234,
+	A7XX_DBGBUS_USP_1 = 235,
+	A7XX_DBGBUS_USP_2 = 236,
+	A7XX_DBGBUS_USP_3 = 237,
+	A7XX_DBGBUS_USP_4 = 238,
+	A7XX_DBGBUS_USP_5 = 239,
+	A7XX_DBGBUS_TP_0 = 266,
+	A7XX_DBGBUS_TP_1 = 267,
+	A7XX_DBGBUS_TP_2 = 268,
+	A7XX_DBGBUS_TP_3 = 269,
+	A7XX_DBGBUS_TP_4 = 270,
+	A7XX_DBGBUS_TP_5 = 271,
+	A7XX_DBGBUS_TP_6 = 272,
+	A7XX_DBGBUS_TP_7 = 273,
+	A7XX_DBGBUS_TP_8 = 274,
+	A7XX_DBGBUS_TP_9 = 275,
+	A7XX_DBGBUS_TP_10 = 276,
+	A7XX_DBGBUS_TP_11 = 277,
+	A7XX_DBGBUS_USPTP_0 = 330,
+	A7XX_DBGBUS_USPTP_1 = 331,
+	A7XX_DBGBUS_USPTP_2 = 332,
+	A7XX_DBGBUS_USPTP_3 = 333,
+	A7XX_DBGBUS_USPTP_4 = 334,
+	A7XX_DBGBUS_USPTP_5 = 335,
+	A7XX_DBGBUS_USPTP_6 = 336,
+	A7XX_DBGBUS_USPTP_7 = 337,
+	A7XX_DBGBUS_USPTP_8 = 338,
+	A7XX_DBGBUS_USPTP_9 = 339,
+	A7XX_DBGBUS_USPTP_10 = 340,
+	A7XX_DBGBUS_USPTP_11 = 341,
+	A7XX_DBGBUS_CCHE_0 = 396,
+	A7XX_DBGBUS_CCHE_1 = 397,
+	A7XX_DBGBUS_CCHE_2 = 398,
+	A7XX_DBGBUS_VPC_DSTR_0 = 408,
+	A7XX_DBGBUS_VPC_DSTR_1 = 409,
+	A7XX_DBGBUS_VPC_DSTR_2 = 410,
+	A7XX_DBGBUS_HLSQ_DP_STR_0 = 411,
+	A7XX_DBGBUS_HLSQ_DP_STR_1 = 412,
+	A7XX_DBGBUS_HLSQ_DP_STR_2 = 413,
+	A7XX_DBGBUS_HLSQ_DP_STR_3 = 414,
+	A7XX_DBGBUS_HLSQ_DP_STR_4 = 415,
+	A7XX_DBGBUS_HLSQ_DP_STR_5 = 416,
+	A7XX_DBGBUS_UFC_DSTR_0 = 443,
+	A7XX_DBGBUS_UFC_DSTR_1 = 444,
+	A7XX_DBGBUS_UFC_DSTR_2 = 445,
+	A7XX_DBGBUS_CGC_SUBCORE = 446,
+	A7XX_DBGBUS_CGC_CORE = 447,
+};
+
 enum a6xx_cp_perfcounter_select {
 	PERF_CP_ALWAYS_COUNT = 0,
 	PERF_CP_BUSY_GFX_CORE_IDLE = 1,
@@ -1432,8 +1645,48 @@ static inline uint32_t A6XX_CP_ROQ_AVAIL_VSD_REM(uint32_t val)
 
 #define REG_A6XX_CP_APERTURE_CNTL_HOST				0x00000a00
 
+#define REG_A7XX_CP_APERTURE_CNTL_HOST				0x00000a00
+#define A7XX_CP_APERTURE_CNTL_HOST_PIPE__MASK			0x00003000
+#define A7XX_CP_APERTURE_CNTL_HOST_PIPE__SHIFT			12
+static inline uint32_t A7XX_CP_APERTURE_CNTL_HOST_PIPE(enum a7xx_pipe val)
+{
+	return ((val) << A7XX_CP_APERTURE_CNTL_HOST_PIPE__SHIFT) & A7XX_CP_APERTURE_CNTL_HOST_PIPE__MASK;
+}
+#define A7XX_CP_APERTURE_CNTL_HOST_CLUSTER__MASK		0x00000700
+#define A7XX_CP_APERTURE_CNTL_HOST_CLUSTER__SHIFT		8
+static inline uint32_t A7XX_CP_APERTURE_CNTL_HOST_CLUSTER(enum a7xx_cluster val)
+{
+	return ((val) << A7XX_CP_APERTURE_CNTL_HOST_CLUSTER__SHIFT) & A7XX_CP_APERTURE_CNTL_HOST_CLUSTER__MASK;
+}
+#define A7XX_CP_APERTURE_CNTL_HOST_CONTEXT__MASK		0x00000030
+#define A7XX_CP_APERTURE_CNTL_HOST_CONTEXT__SHIFT		4
+static inline uint32_t A7XX_CP_APERTURE_CNTL_HOST_CONTEXT(uint32_t val)
+{
+	return ((val) << A7XX_CP_APERTURE_CNTL_HOST_CONTEXT__SHIFT) & A7XX_CP_APERTURE_CNTL_HOST_CONTEXT__MASK;
+}
+
 #define REG_A6XX_CP_APERTURE_CNTL_CD				0x00000a03
 
+#define REG_A7XX_CP_APERTURE_CNTL_CD				0x00000a03
+#define A7XX_CP_APERTURE_CNTL_CD_PIPE__MASK			0x00003000
+#define A7XX_CP_APERTURE_CNTL_CD_PIPE__SHIFT			12
+static inline uint32_t A7XX_CP_APERTURE_CNTL_CD_PIPE(enum a7xx_pipe val)
+{
+	return ((val) << A7XX_CP_APERTURE_CNTL_CD_PIPE__SHIFT) & A7XX_CP_APERTURE_CNTL_CD_PIPE__MASK;
+}
+#define A7XX_CP_APERTURE_CNTL_CD_CLUSTER__MASK			0x00000700
+#define A7XX_CP_APERTURE_CNTL_CD_CLUSTER__SHIFT			8
+static inline uint32_t A7XX_CP_APERTURE_CNTL_CD_CLUSTER(enum a7xx_cluster val)
+{
+	return ((val) << A7XX_CP_APERTURE_CNTL_CD_CLUSTER__SHIFT) & A7XX_CP_APERTURE_CNTL_CD_CLUSTER__MASK;
+}
+#define A7XX_CP_APERTURE_CNTL_CD_CONTEXT__MASK			0x00000030
+#define A7XX_CP_APERTURE_CNTL_CD_CONTEXT__SHIFT			4
+static inline uint32_t A7XX_CP_APERTURE_CNTL_CD_CONTEXT(uint32_t val)
+{
+	return ((val) << A7XX_CP_APERTURE_CNTL_CD_CONTEXT__SHIFT) & A7XX_CP_APERTURE_CNTL_CD_CONTEXT__MASK;
+}
+
 #define REG_A7XX_CP_BV_PROTECT_STATUS				0x00000a61
 
 #define REG_A7XX_CP_BV_HW_FAULT					0x00000a64
@@ -6920,6 +7173,38 @@ static inline uint32_t A7XX_SP_2D_DST_FORMAT_MASK(uint32_t val)
 #define REG_A7XX_SP_UNKNOWN_AE6C				0x0000ae6c
 
 #define REG_A7XX_SP_READ_SEL					0x0000ae6d
+#define A7XX_SP_READ_SEL_LOCATION__MASK				0x000c0000
+#define A7XX_SP_READ_SEL_LOCATION__SHIFT			18
+static inline uint32_t A7XX_SP_READ_SEL_LOCATION(enum a7xx_state_location val)
+{
+	return ((val) << A7XX_SP_READ_SEL_LOCATION__SHIFT) & A7XX_SP_READ_SEL_LOCATION__MASK;
+}
+#define A7XX_SP_READ_SEL_PIPE__MASK				0x00030000
+#define A7XX_SP_READ_SEL_PIPE__SHIFT				16
+static inline uint32_t A7XX_SP_READ_SEL_PIPE(enum a7xx_pipe val)
+{
+	return ((val) << A7XX_SP_READ_SEL_PIPE__SHIFT) & A7XX_SP_READ_SEL_PIPE__MASK;
+}
+#define A7XX_SP_READ_SEL_STATETYPE__MASK			0x0000ff00
+#define A7XX_SP_READ_SEL_STATETYPE__SHIFT			8
+static inline uint32_t A7XX_SP_READ_SEL_STATETYPE(enum a7xx_statetype_id val)
+{
+	return ((val) << A7XX_SP_READ_SEL_STATETYPE__SHIFT) & A7XX_SP_READ_SEL_STATETYPE__MASK;
+}
+#define A7XX_SP_READ_SEL_USPTP__MASK				0x000000f0
+#define A7XX_SP_READ_SEL_USPTP__SHIFT				4
+static inline uint32_t A7XX_SP_READ_SEL_USPTP(uint32_t val)
+{
+	return ((val) << A7XX_SP_READ_SEL_USPTP__SHIFT) & A7XX_SP_READ_SEL_USPTP__MASK;
+}
+#define A7XX_SP_READ_SEL_SPTP__MASK				0x0000000f
+#define A7XX_SP_READ_SEL_SPTP__SHIFT				0
+static inline uint32_t A7XX_SP_READ_SEL_SPTP(uint32_t val)
+{
+	return ((val) << A7XX_SP_READ_SEL_SPTP__SHIFT) & A7XX_SP_READ_SEL_SPTP__MASK;
+}
+
+#define REG_A7XX_SP_DBG_CNTL					0x0000ae71
 
 #define REG_A7XX_SP_UNKNOWN_AE73				0x0000ae73
 
@@ -8790,7 +9075,7 @@ static inline uint32_t A6XX_CX_DBGC_CFG_DBGBUS_BYTEL_1_BYTEL15(uint32_t val)
 #ifdef __cplusplus
 template<chip CHIP> constexpr inline uint16_t CMD_REGS[] = {};
 template<chip CHIP> constexpr inline uint16_t RP_BLIT_REGS[] = {};
-template<> constexpr inline uint16_t CMD_REGS<A6XX>[] = {
+template<> constexpr inline uint16_t CMD_REGS<A7XX>[] = {
 	0xc03,
 	0xc04,
 	0xc30,
@@ -8801,13 +9086,27 @@ template<> constexpr inline uint16_t CMD_REGS<A6XX>[] = {
 	0xc35,
 	0xc36,
 	0xc37,
+	0xce2,
+	0xce3,
+	0xce4,
+	0xce5,
+	0xce6,
+	0xce7,
+	0xe10,
+	0xe11,
 	0xe12,
 	0xe17,
 	0xe19,
+	0x8009,
+	0x800a,
+	0x800b,
+	0x800c,
 	0x8099,
 	0x80af,
 	0x810a,
 	0x8110,
+	0x8120,
+	0x8121,
 	0x8600,
 	0x880e,
 	0x8811,
@@ -8820,14 +9119,16 @@ template<> constexpr inline uint16_t CMD_REGS<A6XX>[] = {
 	0x881e,
 	0x8864,
 	0x8891,
+	0x8899,
 	0x88f0,
 	0x8927,
 	0x8928,
 	0x8e01,
 	0x8e04,
+	0x8e06,
 	0x8e07,
-	0x9210,
-	0x9211,
+	0x8e09,
+	0x8e79,
 	0x9218,
 	0x9219,
 	0x921a,
@@ -8863,11 +9164,14 @@ template<> constexpr inline uint16_t CMD_REGS<A6XX>[] = {
 	0x9600,
 	0x9601,
 	0x9602,
-	0x9e08,
-	0x9e09,
+	0x9810,
+	0x9811,
+	0x9e24,
 	0x9e72,
 	0xa007,
 	0xa009,
+	0xa600,
+	0xa82d,
 	0xa8a0,
 	0xa8a1,
 	0xa8a2,
@@ -8885,6 +9189,7 @@ template<> constexpr inline uint16_t CMD_REGS<A6XX>[] = {
 	0xa8ae,
 	0xa8af,
 	0xa9a8,
+	0xa9ae,
 	0xa9b0,
 	0xa9b1,
 	0xa9b2,
@@ -8899,8 +9204,12 @@ template<> constexpr inline uint16_t CMD_REGS<A6XX>[] = {
 	0xa9bb,
 	0xa9bc,
 	0xa9bd,
+	0xa9be,
 	0xa9c2,
 	0xa9c3,
+	0xa9c5,
+	0xa9cd,
+	0xa9df,
 	0xa9e2,
 	0xa9e3,
 	0xa9e6,
@@ -8915,14 +9224,33 @@ template<> constexpr inline uint16_t CMD_REGS<A6XX>[] = {
 	0xa9ef,
 	0xa9f0,
 	0xa9f1,
+	0xa9f2,
+	0xa9f3,
+	0xa9f4,
+	0xa9f5,
+	0xa9f6,
+	0xa9f7,
+	0xaa01,
 	0xaaf2,
+	0xab01,
+	0xab02,
 	0xab1a,
 	0xab1b,
+	0xab1f,
 	0xab20,
+	0xab22,
 	0xae00,
 	0xae03,
 	0xae04,
+	0xae06,
+	0xae08,
+	0xae09,
+	0xae0a,
 	0xae0f,
+	0xae6a,
+	0xae6b,
+	0xae6c,
+	0xae73,
 	0xb180,
 	0xb181,
 	0xb182,
@@ -8930,28 +9258,16 @@ template<> constexpr inline uint16_t CMD_REGS<A6XX>[] = {
 	0xb302,
 	0xb303,
 	0xb309,
+	0xb310,
 	0xb600,
 	0xb602,
-	0xb605,
-	0xb987,
-	0xb9d0,
-	0xbb08,
-	0xbb11,
-	0xbb20,
-	0xbb21,
-	0xbb22,
-	0xbb23,
-	0xbb24,
-	0xbb25,
-	0xbb26,
-	0xbb27,
-	0xbb28,
-	0xbb29,
-	0xbe00,
-	0xbe01,
-	0xbe04,
+	0xb608,
+	0xb609,
+	0xb60a,
+	0xb60b,
+	0xb60c,
 };
-template<> constexpr inline uint16_t CMD_REGS<A7XX>[] = {
+template<> constexpr inline uint16_t CMD_REGS<A6XX>[] = {
 	0xc03,
 	0xc04,
 	0xc30,
@@ -8962,27 +9278,13 @@ template<> constexpr inline uint16_t CMD_REGS<A7XX>[] = {
 	0xc35,
 	0xc36,
 	0xc37,
-	0xce2,
-	0xce3,
-	0xce4,
-	0xce5,
-	0xce6,
-	0xce7,
-	0xe10,
-	0xe11,
 	0xe12,
 	0xe17,
 	0xe19,
-	0x8009,
-	0x800a,
-	0x800b,
-	0x800c,
 	0x8099,
 	0x80af,
 	0x810a,
 	0x8110,
-	0x8120,
-	0x8121,
 	0x8600,
 	0x880e,
 	0x8811,
@@ -8995,16 +9297,14 @@ template<> constexpr inline uint16_t CMD_REGS<A7XX>[] = {
 	0x881e,
 	0x8864,
 	0x8891,
-	0x8899,
 	0x88f0,
 	0x8927,
 	0x8928,
 	0x8e01,
 	0x8e04,
-	0x8e06,
 	0x8e07,
-	0x8e09,
-	0x8e79,
+	0x9210,
+	0x9211,
 	0x9218,
 	0x9219,
 	0x921a,
@@ -9040,14 +9340,11 @@ template<> constexpr inline uint16_t CMD_REGS<A7XX>[] = {
 	0x9600,
 	0x9601,
 	0x9602,
-	0x9810,
-	0x9811,
-	0x9e24,
+	0x9e08,
+	0x9e09,
 	0x9e72,
 	0xa007,
 	0xa009,
-	0xa600,
-	0xa82d,
 	0xa8a0,
 	0xa8a1,
 	0xa8a2,
@@ -9065,7 +9362,6 @@ template<> constexpr inline uint16_t CMD_REGS<A7XX>[] = {
 	0xa8ae,
 	0xa8af,
 	0xa9a8,
-	0xa9ae,
 	0xa9b0,
 	0xa9b1,
 	0xa9b2,
@@ -9080,12 +9376,8 @@ template<> constexpr inline uint16_t CMD_REGS<A7XX>[] = {
 	0xa9bb,
 	0xa9bc,
 	0xa9bd,
-	0xa9be,
 	0xa9c2,
 	0xa9c3,
-	0xa9c5,
-	0xa9cd,
-	0xa9df,
 	0xa9e2,
 	0xa9e3,
 	0xa9e6,
@@ -9100,33 +9392,14 @@ template<> constexpr inline uint16_t CMD_REGS<A7XX>[] = {
 	0xa9ef,
 	0xa9f0,
 	0xa9f1,
-	0xa9f2,
-	0xa9f3,
-	0xa9f4,
-	0xa9f5,
-	0xa9f6,
-	0xa9f7,
-	0xaa01,
 	0xaaf2,
-	0xab01,
-	0xab02,
 	0xab1a,
 	0xab1b,
-	0xab1f,
 	0xab20,
-	0xab22,
 	0xae00,
 	0xae03,
 	0xae04,
-	0xae06,
-	0xae08,
-	0xae09,
-	0xae0a,
 	0xae0f,
-	0xae6a,
-	0xae6b,
-	0xae6c,
-	0xae73,
 	0xb180,
 	0xb181,
 	0xb182,
@@ -9134,16 +9407,28 @@ template<> constexpr inline uint16_t CMD_REGS<A7XX>[] = {
 	0xb302,
 	0xb303,
 	0xb309,
-	0xb310,
 	0xb600,
 	0xb602,
-	0xb608,
-	0xb609,
-	0xb60a,
-	0xb60b,
-	0xb60c,
+	0xb605,
+	0xb987,
+	0xb9d0,
+	0xbb08,
+	0xbb11,
+	0xbb20,
+	0xbb21,
+	0xbb22,
+	0xbb23,
+	0xbb24,
+	0xbb25,
+	0xbb26,
+	0xbb27,
+	0xbb28,
+	0xbb29,
+	0xbe00,
+	0xbe01,
+	0xbe04,
 };
-template<> constexpr inline uint16_t RP_BLIT_REGS<A6XX>[] = {
+template<> constexpr inline uint16_t RP_BLIT_REGS<A7XX>[] = {
 	0xc02,
 	0xc06,
 	0xc10,
@@ -9210,70 +9495,6 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A6XX>[] = {
 	0xc55,
 	0xc56,
 	0xc57,
-	0xc58,
-	0xc59,
-	0xc5a,
-	0xc5b,
-	0xc5c,
-	0xc5d,
-	0xc5e,
-	0xc5f,
-	0xc60,
-	0xc61,
-	0xc62,
-	0xc63,
-	0xc64,
-	0xc65,
-	0xc66,
-	0xc67,
-	0xc68,
-	0xc69,
-	0xc6a,
-	0xc6b,
-	0xc6c,
-	0xc6d,
-	0xc6e,
-	0xc6f,
-	0xc70,
-	0xc71,
-	0xc72,
-	0xc73,
-	0xc74,
-	0xc75,
-	0xc76,
-	0xc77,
-	0xc78,
-	0xc79,
-	0xc7a,
-	0xc7b,
-	0xc7c,
-	0xc7d,
-	0xc7e,
-	0xc7f,
-	0xc80,
-	0xc81,
-	0xc82,
-	0xc83,
-	0xc84,
-	0xc85,
-	0xc86,
-	0xc87,
-	0xc88,
-	0xc89,
-	0xc8a,
-	0xc8b,
-	0xc8c,
-	0xc8d,
-	0xc8e,
-	0xc8f,
-	0xc90,
-	0xc91,
-	0xc92,
-	0xc93,
-	0xc94,
-	0xc95,
-	0xc96,
-	0xc97,
 	0x8000,
 	0x8001,
 	0x8002,
@@ -9281,7 +9502,9 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A6XX>[] = {
 	0x8004,
 	0x8005,
 	0x8006,
-	0x8010,
+	0x8007,
+	0x8008,
+	0x8010,
 	0x8011,
 	0x8012,
 	0x8013,
@@ -9427,6 +9650,7 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A6XX>[] = {
 	0x80a4,
 	0x80a5,
 	0x80a6,
+	0x80a7,
 	0x80b0,
 	0x80b1,
 	0x80b2,
@@ -9502,6 +9726,8 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A6XX>[] = {
 	0x8106,
 	0x8107,
 	0x8109,
+	0x810b,
+	0x8113,
 	0x8400,
 	0x8401,
 	0x8402,
@@ -9525,6 +9751,7 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A6XX>[] = {
 	0x880d,
 	0x880f,
 	0x8810,
+	0x8812,
 	0x8820,
 	0x8821,
 	0x8822,
@@ -9638,6 +9865,7 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A6XX>[] = {
 	0x88e1,
 	0x88e2,
 	0x88e3,
+	0x88e5,
 	0x8900,
 	0x8901,
 	0x8902,
@@ -9665,10 +9893,6 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A6XX>[] = {
 	0x8918,
 	0x8919,
 	0x891a,
-	0x8a00,
-	0x8a10,
-	0x8a20,
-	0x8a30,
 	0x8c00,
 	0x8c01,
 	0x8c17,
@@ -9690,7 +9914,6 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A6XX>[] = {
 	0x8c2d,
 	0x8c2e,
 	0x8c2f,
-	0x9100,
 	0x9101,
 	0x9102,
 	0x9103,
@@ -9699,6 +9922,10 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A6XX>[] = {
 	0x9106,
 	0x9107,
 	0x9108,
+	0x9109,
+	0x910a,
+	0x910b,
+	0x910c,
 	0x9200,
 	0x9201,
 	0x9202,
@@ -9727,6 +9954,7 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A6XX>[] = {
 	0x9304,
 	0x9305,
 	0x9306,
+	0x9307,
 	0x9800,
 	0x9801,
 	0x9802,
@@ -9735,15 +9963,13 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A6XX>[] = {
 	0x9805,
 	0x9806,
 	0x9808,
-	0x9980,
-	0x9981,
+	0x9809,
 	0x9b00,
 	0x9b01,
 	0x9b02,
 	0x9b03,
 	0x9b04,
 	0x9b05,
-	0x9b06,
 	0x9b07,
 	0x9b08,
 	0xa000,
@@ -10018,6 +10244,7 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A6XX>[] = {
 	0xa823,
 	0xa824,
 	0xa825,
+	0xa827,
 	0xa830,
 	0xa831,
 	0xa832,
@@ -10032,6 +10259,7 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A6XX>[] = {
 	0xa83b,
 	0xa83c,
 	0xa83d,
+	0xa83f,
 	0xa840,
 	0xa842,
 	0xa843,
@@ -10069,6 +10297,7 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A6XX>[] = {
 	0xa863,
 	0xa864,
 	0xa865,
+	0xa867,
 	0xa870,
 	0xa871,
 	0xa872,
@@ -10108,6 +10337,7 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A6XX>[] = {
 	0xa894,
 	0xa895,
 	0xa896,
+	0xa898,
 	0xa980,
 	0xa982,
 	0xa983,
@@ -10148,13 +10378,39 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A6XX>[] = {
 	0xa9a6,
 	0xa9a7,
 	0xa9a9,
+	0xa9aa,
+	0xa9bf,
+	0xa9c6,
+	0xa9c7,
+	0xa9c8,
+	0xa9c9,
+	0xa9ca,
+	0xa9cb,
+	0xa9d4,
+	0xa9d5,
+	0xa9d6,
+	0xa9d7,
+	0xa9d8,
+	0xa9d9,
+	0xa9da,
+	0xa9db,
+	0xa9dc,
+	0xa9dd,
+	0xa9de,
 	0xa9e0,
 	0xa9e1,
 	0xa9e4,
 	0xa9e5,
 	0xab00,
+	0xab03,
 	0xab04,
 	0xab05,
+	0xab0a,
+	0xab0b,
+	0xab0c,
+	0xab0d,
+	0xab0e,
+	0xab0f,
 	0xab10,
 	0xab11,
 	0xab12,
@@ -10165,57 +10421,22 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A6XX>[] = {
 	0xab17,
 	0xab18,
 	0xab19,
-	0xacc0,
+	0xab21,
+	0xb2c0,
+	0xb2c2,
+	0xb2c3,
+	0xb2ca,
+	0xb2cb,
+	0xb2cc,
+	0xb2d2,
 	0xb300,
 	0xb301,
 	0xb304,
 	0xb305,
 	0xb306,
 	0xb307,
-	0xb4c0,
-	0xb4c1,
-	0xb4c2,
-	0xb4c3,
-	0xb4c4,
-	0xb4ca,
-	0xb4cb,
-	0xb4cc,
-	0xb4d1,
-	0xb800,
-	0xb801,
-	0xb802,
-	0xb803,
-	0xb980,
-	0xb982,
-	0xb983,
-	0xb984,
-	0xb985,
-	0xb986,
-	0xb990,
-	0xb991,
-	0xb992,
-	0xb993,
-	0xb994,
-	0xb995,
-	0xb996,
-	0xb997,
-	0xb998,
-	0xb999,
-	0xb99a,
-	0xb99b,
-	0xb9c0,
-	0xb9c1,
-	0xb9c2,
-	0xb9c3,
-	0xb9c4,
-	0xb9c5,
-	0xb9c6,
-	0xb9c7,
-	0xb9c8,
-	0xb9c9,
-	0xbb10,
 };
-template<> constexpr inline uint16_t RP_BLIT_REGS<A7XX>[] = {
+template<> constexpr inline uint16_t RP_BLIT_REGS<A6XX>[] = {
 	0xc02,
 	0xc06,
 	0xc10,
@@ -10282,6 +10503,70 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A7XX>[] = {
 	0xc55,
 	0xc56,
 	0xc57,
+	0xc58,
+	0xc59,
+	0xc5a,
+	0xc5b,
+	0xc5c,
+	0xc5d,
+	0xc5e,
+	0xc5f,
+	0xc60,
+	0xc61,
+	0xc62,
+	0xc63,
+	0xc64,
+	0xc65,
+	0xc66,
+	0xc67,
+	0xc68,
+	0xc69,
+	0xc6a,
+	0xc6b,
+	0xc6c,
+	0xc6d,
+	0xc6e,
+	0xc6f,
+	0xc70,
+	0xc71,
+	0xc72,
+	0xc73,
+	0xc74,
+	0xc75,
+	0xc76,
+	0xc77,
+	0xc78,
+	0xc79,
+	0xc7a,
+	0xc7b,
+	0xc7c,
+	0xc7d,
+	0xc7e,
+	0xc7f,
+	0xc80,
+	0xc81,
+	0xc82,
+	0xc83,
+	0xc84,
+	0xc85,
+	0xc86,
+	0xc87,
+	0xc88,
+	0xc89,
+	0xc8a,
+	0xc8b,
+	0xc8c,
+	0xc8d,
+	0xc8e,
+	0xc8f,
+	0xc90,
+	0xc91,
+	0xc92,
+	0xc93,
+	0xc94,
+	0xc95,
+	0xc96,
+	0xc97,
 	0x8000,
 	0x8001,
 	0x8002,
@@ -10289,8 +10574,6 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A7XX>[] = {
 	0x8004,
 	0x8005,
 	0x8006,
-	0x8007,
-	0x8008,
 	0x8010,
 	0x8011,
 	0x8012,
@@ -10437,7 +10720,6 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A7XX>[] = {
 	0x80a4,
 	0x80a5,
 	0x80a6,
-	0x80a7,
 	0x80b0,
 	0x80b1,
 	0x80b2,
@@ -10513,8 +10795,6 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A7XX>[] = {
 	0x8106,
 	0x8107,
 	0x8109,
-	0x810b,
-	0x8113,
 	0x8400,
 	0x8401,
 	0x8402,
@@ -10538,7 +10818,6 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A7XX>[] = {
 	0x880d,
 	0x880f,
 	0x8810,
-	0x8812,
 	0x8820,
 	0x8821,
 	0x8822,
@@ -10652,7 +10931,6 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A7XX>[] = {
 	0x88e1,
 	0x88e2,
 	0x88e3,
-	0x88e5,
 	0x8900,
 	0x8901,
 	0x8902,
@@ -10680,6 +10958,10 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A7XX>[] = {
 	0x8918,
 	0x8919,
 	0x891a,
+	0x8a00,
+	0x8a10,
+	0x8a20,
+	0x8a30,
 	0x8c00,
 	0x8c01,
 	0x8c17,
@@ -10701,6 +10983,7 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A7XX>[] = {
 	0x8c2d,
 	0x8c2e,
 	0x8c2f,
+	0x9100,
 	0x9101,
 	0x9102,
 	0x9103,
@@ -10709,10 +10992,6 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A7XX>[] = {
 	0x9106,
 	0x9107,
 	0x9108,
-	0x9109,
-	0x910a,
-	0x910b,
-	0x910c,
 	0x9200,
 	0x9201,
 	0x9202,
@@ -10741,7 +11020,6 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A7XX>[] = {
 	0x9304,
 	0x9305,
 	0x9306,
-	0x9307,
 	0x9800,
 	0x9801,
 	0x9802,
@@ -10750,13 +11028,15 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A7XX>[] = {
 	0x9805,
 	0x9806,
 	0x9808,
-	0x9809,
+	0x9980,
+	0x9981,
 	0x9b00,
 	0x9b01,
 	0x9b02,
 	0x9b03,
 	0x9b04,
 	0x9b05,
+	0x9b06,
 	0x9b07,
 	0x9b08,
 	0xa000,
@@ -11031,7 +11311,6 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A7XX>[] = {
 	0xa823,
 	0xa824,
 	0xa825,
-	0xa827,
 	0xa830,
 	0xa831,
 	0xa832,
@@ -11046,7 +11325,6 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A7XX>[] = {
 	0xa83b,
 	0xa83c,
 	0xa83d,
-	0xa83f,
 	0xa840,
 	0xa842,
 	0xa843,
@@ -11084,7 +11362,6 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A7XX>[] = {
 	0xa863,
 	0xa864,
 	0xa865,
-	0xa867,
 	0xa870,
 	0xa871,
 	0xa872,
@@ -11124,7 +11401,6 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A7XX>[] = {
 	0xa894,
 	0xa895,
 	0xa896,
-	0xa898,
 	0xa980,
 	0xa982,
 	0xa983,
@@ -11165,39 +11441,13 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A7XX>[] = {
 	0xa9a6,
 	0xa9a7,
 	0xa9a9,
-	0xa9aa,
-	0xa9bf,
-	0xa9c6,
-	0xa9c7,
-	0xa9c8,
-	0xa9c9,
-	0xa9ca,
-	0xa9cb,
-	0xa9d4,
-	0xa9d5,
-	0xa9d6,
-	0xa9d7,
-	0xa9d8,
-	0xa9d9,
-	0xa9da,
-	0xa9db,
-	0xa9dc,
-	0xa9dd,
-	0xa9de,
 	0xa9e0,
 	0xa9e1,
 	0xa9e4,
 	0xa9e5,
 	0xab00,
-	0xab03,
 	0xab04,
 	0xab05,
-	0xab0a,
-	0xab0b,
-	0xab0c,
-	0xab0d,
-	0xab0e,
-	0xab0f,
 	0xab10,
 	0xab11,
 	0xab12,
@@ -11208,20 +11458,55 @@ template<> constexpr inline uint16_t RP_BLIT_REGS<A7XX>[] = {
 	0xab17,
 	0xab18,
 	0xab19,
-	0xab21,
-	0xb2c0,
-	0xb2c2,
-	0xb2c3,
-	0xb2ca,
-	0xb2cb,
-	0xb2cc,
-	0xb2d2,
+	0xacc0,
 	0xb300,
 	0xb301,
 	0xb304,
 	0xb305,
 	0xb306,
 	0xb307,
+	0xb4c0,
+	0xb4c1,
+	0xb4c2,
+	0xb4c3,
+	0xb4c4,
+	0xb4ca,
+	0xb4cb,
+	0xb4cc,
+	0xb4d1,
+	0xb800,
+	0xb801,
+	0xb802,
+	0xb803,
+	0xb980,
+	0xb982,
+	0xb983,
+	0xb984,
+	0xb985,
+	0xb986,
+	0xb990,
+	0xb991,
+	0xb992,
+	0xb993,
+	0xb994,
+	0xb995,
+	0xb996,
+	0xb997,
+	0xb998,
+	0xb999,
+	0xb99a,
+	0xb99b,
+	0xb9c0,
+	0xb9c1,
+	0xb9c2,
+	0xb9c3,
+	0xb9c4,
+	0xb9c5,
+	0xb9c6,
+	0xb9c7,
+	0xb9c8,
+	0xb9c9,
+	0xbb10,
 };
 #endif
 
-- 
2.31.1

