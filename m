Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9341DB186FD
	for <lists+freedreno@lfdr.de>; Fri,  1 Aug 2025 20:00:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E3BE10E8E6;
	Fri,  1 Aug 2025 18:00:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kKlD83Pp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD48910E8DD
 for <freedreno@lists.freedesktop.org>; Fri,  1 Aug 2025 18:00:23 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571HfOT0028475
 for <freedreno@lists.freedesktop.org>; Fri, 1 Aug 2025 18:00:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=c4KQRsxVztP
 sTBbcxsf/rU0NN9GCrtgWESCaGZHxR9Y=; b=kKlD83PpUsSxT+R9tgtLKssh7oa
 axtF6CJtuTg5VLR1lshYjT5/h82lbogM/aA8syWTCnGjh+JXEDBI9rsaZ0T1Iv6U
 JihWXcgAAaUxL5EV36kx/BSpbuyYFRxK6J0QiTt19S+87SbaeNNWOm7d0nXOr5p3
 QWbz2beTVcQgppV+Ok7D4tlCyFHXAIFcNED1k9B0l+RvIoxFI4ZLxiVjVW1AUio9
 haVhuAL4ZSQHHGvyWvv/oQ+/6GKE+qsfbeMFuTzgJep3tY0OknlZcBvcFzVRqlQo
 KZMKqEnEQIpeBtmWX+IGWLIwT6ayQiu3weljB1rfEHWIFqbBDKGuuOxOs+w==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484q86d5aa-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 01 Aug 2025 18:00:22 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b421b03d498so889071a12.3
 for <freedreno@lists.freedesktop.org>; Fri, 01 Aug 2025 11:00:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754071222; x=1754676022;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c4KQRsxVztPsTBbcxsf/rU0NN9GCrtgWESCaGZHxR9Y=;
 b=bcZtvHmnuRhdcU0RlHwfe6eljicJLPv2sbA8KGPe3QlvHK9g2h2Jf9+f+mCK/mf3na
 EtMmIlMSdcIIOpHArl3MPmJbb1XTzL7gh0JOPcu3VoPeOsRM74suHHRvqLUkMQ43d1BG
 pyVoQY5dG4N8n3Sl0euhmkogMfYnJvOczCQnus82cQGMR8+Oqu0e3A3XNf3BvGULa8ar
 KNuxP1L62zXI3vF7x/GfWnW3Rc/5j1zK9+wzkpdCh5H+7yVV16KUALoQmrPxTHyzXjx/
 ZS4NY/fQZMbg1g3F9ZARIORyAoTodAcrLZ9wl7Vrc5vpR3P37gQTiloEM8DG0ovs+cTs
 A3eA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgiihMS62Pla79KjFmPRub0wrIohh5NmHXWAKoBBYU3ECx7M+Noio0r+Gn42g6eqWMWO7Nc4N8T68=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNKuzbzF/6i9Fa8yna50wWJM9HnNWH7CD7OWSnNeajwzTm2xkP
 0o7nFplTZSwvBjmSsq/l3DZKH4lcogfoqCuKZ7HZaoEqAMWoFNLYwji6kFJ+fPLySRVlhltQWWB
 xx+NaNBi4zpbsYtEH18zft46B/ReoGBz0p/cZnEJy2+XPI123PcmtjZoidXhWyPzrLzhPsnc=
X-Gm-Gg: ASbGncufLhmy7owDPY7uR+dhjq7DKDoI5tKv6R+K1YOkRhPNiFFq5LJSraPgmrtphon
 LeA36+QkZgSyholW0+aAKUtySaI424VtqpXlj4mfYRgCj+VJT0wSCMa9AmjTkzej57E0JVzg4yy
 nJ/x3IouFwakvxBi0LIBLBvau+jp0wt6f51MuN61HfAW90qGj9eeBr3mKPu+7tGhZXLx/G2ceP2
 VOkS/PC0M5adqjN/NiNik5+QDunHuGpVYUA+P2LNCWbbcBN1wLOY/Gxru6y/IfXqWeHWa1lOR40
 fWLrIHt1kRcico6tEHxjfjlq2YeAeeeQTLEr22lFgbnzOOTlLxc=
X-Received: by 2002:a17:90b:1d4c:b0:312:959:dc42 with SMTP id
 98e67ed59e1d1-321161f13afmr971400a91.11.1754071222057; 
 Fri, 01 Aug 2025 11:00:22 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHuZ5/YHyU5W5/PGpq9mfkW8lN3EVfPrvr2fz5DIS9QKgNMf1X1fXg1DmF3I6ux4H1PpGawMA==
X-Received: by 2002:a17:90b:1d4c:b0:312:959:dc42 with SMTP id
 98e67ed59e1d1-321161f13afmr971344a91.11.1754071221443; 
 Fri, 01 Aug 2025 11:00:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b422bb0be58sm3946576a12.57.2025.08.01.11.00.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 11:00:20 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH v3 5/7] drm/msm: Fix a7xx debugbus read
Date: Fri,  1 Aug 2025 11:00:02 -0700
Message-ID: <20250801180009.345662-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250801180009.345662-1-robin.clark@oss.qualcomm.com>
References: <20250801180009.345662-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDE0MSBTYWx0ZWRfX5c8jWAIQPNw3
 zaQ4AdjcPt6+6EjSIcG6S33WYvs+4xEsNTWhdkaUtnZSVXrzlyandwhC+ZfJqKIefeAVbEoaOWN
 dQl0HcsfHUOdFmZcNAzuy8T3acwjD/78OMOw9InyXU2qgfMv+SnxhSWr+4+gnl0PhUYriyKVCg7
 NNe25/D71j0dRiszh2yWRU9pjvRbLV5YWW8c5EjS6NtmBqxj7Jxuy28KnLJJPaF014w+l+uprSe
 +83Izuom7JR/4Y8ZD57ygzMkKZT253+j2Gba6m+K8EAw5yRAC5AemXDbFWkJeEvJQ8AD/aS6yVQ
 FM0wJAU1iYVomQ9X1fO6UrZzat6FSyPokTgmb2LQPGkchqdbO5UNGmBLgwJQAUlterWAJBwTI0i
 +T0GpQtSESMw7dEvdyWlJ0YEauvEg99WBoDUh0KNO2GBFZ7myHtNePB3awcpgWI3Mse882Pt
X-Authority-Analysis: v=2.4 cv=TqLmhCXh c=1 sm=1 tr=0 ts=688d00b7 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=EUspDBNiAAAA:8 a=aM-jV3debDdmslfU2skA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: 4Oe0GxlkMsyQOSEOFOjsz0f7TA6xdTz_
X-Proofpoint-GUID: 4Oe0GxlkMsyQOSEOFOjsz0f7TA6xdTz_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_06,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 malwarescore=0 adultscore=0 spamscore=0 priorityscore=1501 clxscore=1015
 impostorscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010141
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

The bitfield positions changed in a7xx.

v2: Don't open-code the bitfield building
v3: Also fix cx_debugbus

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   | 32 ++++++++++++++-----
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 14 +++++++-
 2 files changed, 37 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 173c14f215a7..2c7a52fb0b9b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
@@ -174,8 +174,15 @@ static int a6xx_crashdumper_run(struct msm_gpu *gpu,
 static int debugbus_read(struct msm_gpu *gpu, u32 block, u32 offset,
 		u32 *data)
 {
-	u32 reg = A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_INDEX(offset) |
-		A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_BLK_SEL(block);
+	u32 reg;
+
+	if (to_adreno_gpu(gpu)->info->family >= ADRENO_7XX_GEN1) {
+		reg = A7XX_DBGC_CFG_DBGBUS_SEL_D_PING_INDEX(offset) |
+			A7XX_DBGC_CFG_DBGBUS_SEL_D_PING_BLK_SEL(block);
+	} else {
+		reg = A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_INDEX(offset) |
+			A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_BLK_SEL(block);
+	}
 
 	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_A, reg);
 	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_B, reg);
@@ -198,11 +205,18 @@ static int debugbus_read(struct msm_gpu *gpu, u32 block, u32 offset,
 	readl((ptr) + ((offset) << 2))
 
 /* read a value from the CX debug bus */
-static int cx_debugbus_read(void __iomem *cxdbg, u32 block, u32 offset,
+static int cx_debugbus_read(struct msm_gpu *gpu, void __iomem *cxdbg, u32 block, u32 offset,
 		u32 *data)
 {
-	u32 reg = A6XX_CX_DBGC_CFG_DBGBUS_SEL_A_PING_INDEX(offset) |
-		A6XX_CX_DBGC_CFG_DBGBUS_SEL_A_PING_BLK_SEL(block);
+	u32 reg;
+
+	if (to_adreno_gpu(gpu)->info->family >= ADRENO_7XX_GEN1) {
+		reg = A7XX_CX_DBGC_CFG_DBGBUS_SEL_A_PING_INDEX(offset) |
+			A7XX_CX_DBGC_CFG_DBGBUS_SEL_A_PING_BLK_SEL(block);
+	} else {
+		reg = A6XX_CX_DBGC_CFG_DBGBUS_SEL_A_PING_INDEX(offset) |
+			A6XX_CX_DBGC_CFG_DBGBUS_SEL_A_PING_BLK_SEL(block);
+	}
 
 	cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_SEL_A, reg);
 	cxdbg_write(cxdbg, REG_A6XX_CX_DBGC_CFG_DBGBUS_SEL_B, reg);
@@ -315,7 +329,8 @@ static void a6xx_get_debugbus_block(struct msm_gpu *gpu,
 		ptr += debugbus_read(gpu, block->id, i, ptr);
 }
 
-static void a6xx_get_cx_debugbus_block(void __iomem *cxdbg,
+static void a6xx_get_cx_debugbus_block(struct msm_gpu *gpu,
+		void __iomem *cxdbg,
 		struct a6xx_gpu_state *a6xx_state,
 		const struct a6xx_debugbus_block *block,
 		struct a6xx_gpu_state_obj *obj)
@@ -330,7 +345,7 @@ static void a6xx_get_cx_debugbus_block(void __iomem *cxdbg,
 	obj->handle = block;
 
 	for (ptr = obj->data, i = 0; i < block->count; i++)
-		ptr += cx_debugbus_read(cxdbg, block->id, i, ptr);
+		ptr += cx_debugbus_read(gpu, cxdbg, block->id, i, ptr);
 }
 
 static void a6xx_get_debugbus_blocks(struct msm_gpu *gpu,
@@ -526,7 +541,8 @@ static void a6xx_get_debugbus(struct msm_gpu *gpu,
 			int i;
 
 			for (i = 0; i < nr_cx_debugbus_blocks; i++)
-				a6xx_get_cx_debugbus_block(cxdbg,
+				a6xx_get_cx_debugbus_block(gpu,
+					cxdbg,
 					a6xx_state,
 					&cx_debugbus_blocks[i],
 					&a6xx_state->cx_debugbus[i]);
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index d860fd94feae..86fab2750ba7 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -594,10 +594,14 @@ by a particular renderpass/blit.
 	<reg32 offset="0x0600" name="DBGC_CFG_DBGBUS_SEL_A"/>
 	<reg32 offset="0x0601" name="DBGC_CFG_DBGBUS_SEL_B"/>
 	<reg32 offset="0x0602" name="DBGC_CFG_DBGBUS_SEL_C"/>
-	<reg32 offset="0x0603" name="DBGC_CFG_DBGBUS_SEL_D">
+	<reg32 offset="0x0603" name="DBGC_CFG_DBGBUS_SEL_D" variants="A6XX">
 		<bitfield high="7" low="0" name="PING_INDEX"/>
 		<bitfield high="15" low="8" name="PING_BLK_SEL"/>
 	</reg32>
+	<reg32 offset="0x0603" name="DBGC_CFG_DBGBUS_SEL_D" variants="A7XX-">
+		<bitfield high="7" low="0" name="PING_INDEX"/>
+		<bitfield high="24" low="16" name="PING_BLK_SEL"/>
+	</reg32>
 	<reg32 offset="0x0604" name="DBGC_CFG_DBGBUS_CNTLT">
 		<bitfield high="5" low="0" name="TRACEEN"/>
 		<bitfield high="14" low="12" name="GRANU"/>
@@ -3796,6 +3800,14 @@ by a particular renderpass/blit.
 	<reg32 offset="0x0030" name="CFG_DBGBUS_TRACE_BUF2"/>
 </domain>
 
+<domain name="A7XX_CX_DBGC" width="32">
+	<!-- Bitfields shifted, but otherwise the same: -->
+	<reg32 offset="0x0000" name="CFG_DBGBUS_SEL_A" variants="A7XX-">
+		<bitfield high="7" low="0" name="PING_INDEX"/>
+		<bitfield high="24" low="16" name="PING_BLK_SEL"/>
+	</reg32>
+</domain>
+
 <domain name="A6XX_CX_MISC" width="32" prefix="variant" varset="chip">
 	<reg32 offset="0x0001" name="SYSTEM_CACHE_CNTL_0"/>
 	<reg32 offset="0x0002" name="SYSTEM_CACHE_CNTL_1"/>
-- 
2.50.1

