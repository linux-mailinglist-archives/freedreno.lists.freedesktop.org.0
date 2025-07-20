Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A8A52B0B5EE
	for <lists+freedreno@lfdr.de>; Sun, 20 Jul 2025 14:18:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1281E10E44E;
	Sun, 20 Jul 2025 12:17:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VfXObT7P";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D804B10E379
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:45 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56KBo3sP026587
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 eC4SNqgtxVB3YxPxYsJignz0kXw+qtoKkLkGllcnSfQ=; b=VfXObT7PiQXZ0SJR
 yUHAKVSic+9Bw2cMaGXhOz3lX9Ml9DLizaE+Ezc9qVGxBvk/hRot9siIzQuCHWo1
 jOFGNZkynr+/mzPy2K3xv94NedMwK34c0Zmj/7KGzLCDKKCzoy8IrWAo12uQTVNZ
 6+lC/wP27KFCERyilE6fjXJ2DwN4tor6Bsn1swnMbtiwrOvDWHvBF96KKJikTSLh
 ZFIlQcavrShj2qZu11h1iW2jmrawFiR42n1CzNdJirH7jT0kxk7boNnSXxKb77dv
 l3c2GAelRrKTj2of+Q9I7gpVlsIoSt+etwM+tC53zJLeGi2D1XeTV8BEzu145ERI
 j99Ujw==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044da661-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:44 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-748f3d4c7e7so2977512b3a.3
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 05:17:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753013855; x=1753618655;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eC4SNqgtxVB3YxPxYsJignz0kXw+qtoKkLkGllcnSfQ=;
 b=iYkhb4RAmhZGSYXESWdjAhA+tI2DiPFeKrSR8AkwGLUEFur2/6jbkL+Z/GwsLY1gj0
 3m1VGmRf4wrZv95wrD4pJOxE0AeyCCrGcTIt4hu/RhwcwlHeqPInobYHs4Pblr9puYxU
 7cxnWH1evRLI1v4IULBqDEi0eD2Hht60v338R4mTBwnOmeA6lzX/4CTLohYj8bNpu0jk
 D0BrpkAzevd6hRCSLdvQrffSI2xuJNLSea+hdlrBSufWD2E+4jpOqJ5FVz44Ugv1XNaT
 f+L3KnjXpPulVdP4qRYa+gTE/3kL9d/8vpIXQS6OkKCurAEBuLJpxpMf4n24GWy7V8op
 iOcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUzl0JJnr5yMA4MjIIbyRKPH1PMwC34s7h442GCLbX1frZJp+9cby4cyRjOmUC2UIfp1tX3ok1wrk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy/xv8Uxu4OREGZLvLQkelXsiiu2//ZX7KkYYN+MQ5YkHngt8AM
 ROaQvtICSWm8knMN9P1TPmwXdYp7uzOHaDBEcuXuBGEwDz9q4gl06bAdot4qhfI07s+jG8d6e1U
 c/SGyYqFAQjtk1ZYo94QFLlW70BrwgOP5oPQAHXhQxc4lESOe9JL4g9NSTEboxQR9yVcq5bw=
X-Gm-Gg: ASbGncsmOuF6BdfSLD3TmNdVYeuMa7Tv8FhfpV5i6Hfn9oBKQhuHN/waX/GG0+oj4KA
 75DN8MVgUuFpoNJUhlmGDAQ6FLOT89LxjC3NbU7GD4khIFeTzVtf6c0D9jU9wxGbtc2Cn6Ivjou
 2tvScQJywI+ydtUlF0PVoo2AgvS+2Tjovn0ZTX11Kj7+rAAF26I7PTmNXLO33+mlK+/Oi8r0MPR
 gfoDjs5kP/bBjho20sMOfCU8WkHqc2Bn8vkCo8z6a2hWqdNevt12NsMB+4+BkflTJDWdbXCHhGH
 z/GBeceO17Th6gOnQrotRmZt57CIrTRaWN7pF0vTpwwuGv51OgH4OpRa/GhrSwXM
X-Received: by 2002:a05:6a00:4fc3:b0:748:6a1f:6d3b with SMTP id
 d2e1a72fcca58-75724671bffmr24169906b3a.19.1753013854912; 
 Sun, 20 Jul 2025 05:17:34 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF9xGem0/glAJK06SACRoeTUX974pMhVeE1PsAYwyNLoNelCYqDBNKkq+MohsUr5PYvUcG6Hg==
X-Received: by 2002:a05:6a00:4fc3:b0:748:6a1f:6d3b with SMTP id
 d2e1a72fcca58-75724671bffmr24169866b3a.19.1753013854478; 
 Sun, 20 Jul 2025 05:17:34 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.17.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 05:17:34 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:12 +0530
Subject: [PATCH 11/17] drm/msm: Add support for IFPC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-11-9347aa5bcbd6@oss.qualcomm.com>
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
In-Reply-To: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=3903;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=L5HKQ79fHDKRoQCUJUYZBcmAzURDg5BUnlMom8bx9wY=;
 b=lT47NC5/k72Scks0xL8xes0trI36x01TctCWagCHGtEPai14c0mFIAKP+LcZoFMuPh1X9d2aH
 a2NsWDBcn97Dj4Gfimo6RuGMnBnIoMgiDimCQlk13duHAE8Hc9Z2SKj
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=687cde68 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=P3MwbOLga73G8009EeoA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 64bbHHdBRTRAg-nMWQYV86nVX1oJFM4P
X-Proofpoint-ORIG-GUID: 64bbHHdBRTRAg-nMWQYV86nVX1oJFM4P
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExOCBTYWx0ZWRfX2+Gdno3ZxO7F
 +1yRwsu2hg1LUwboN4hQLJKySTvudxU0F6TDTO5DeQqnMsdseez30Dwtxd++TanBQj+70/GZK4Y
 72lqklrp1TZpNKBwMfGHmz3uapDeUBaGHMt7wuEC5dC9Uq1W8E/q+217S+jD87aMzdrRjnbSgdG
 3PXHKMpZr4UVuAVUEOHT0DI5q1LhNnsrKP+spJjV+v6JvDo3Ppw86ToZOTmqyyP0WJFn8418wwq
 DJYdrQe6o9JlNXHSDoxpiswzsOP+RQW4bbTFY/SSwOCb+frU0lxoUqHomeegOFvi+05WeKJqGFv
 wp6g/DFbVjIpVZGlcUSPPrz6DBVFYATZdJbmK6gNL8nKaP+07LAhOpK0UzEIHwnQab6orVf447K
 SmDUlS+KadXkFUe5nWfRrPLMXnP1eVvAGYHkqD9MLxMqm+f8y+nyppvnk7ArH9oKJD0WIwR2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=999 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507200118
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

Add a new quirk to denote IFPC (Inter-Frame Power Collapse) support
for a gpu. Based on this flag send the feature ctrl hfi message to
GMU to enable IFPC support.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c   |  5 +++--
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c   | 33 +++++++++++++++++++++++++++------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
 3 files changed, 31 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 4d6c70735e0892ed87d6a68d64f24bda844e5e16..3bbcc78179c1cf1bfa21ff097e9350eb2f554011 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1961,8 +1961,9 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 	if (ret)
 		return ret;
 
-	/* Fow now, don't do anything fancy until we get our feet under us */
-	gmu->idle_level = GMU_IDLE_STATE_ACTIVE;
+	/* Set GMU idle level */
+	gmu->idle_level = (adreno_gpu->info->quirks & ADRENO_QUIRK_IFPC) ?
+		GMU_IDLE_STATE_IFPC : GMU_IDLE_STATE_ACTIVE;
 
 	pm_runtime_enable(gmu->dev);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index 8e69b1e8465711837151725c8f70e7b4b16a368e..20ade6b0558b016b581078f5cf7377e7e7c57f8e 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -21,6 +21,7 @@ static const char * const a6xx_hfi_msg_id[] = {
 	HFI_MSG_ID(HFI_H2F_MSG_PERF_TABLE),
 	HFI_MSG_ID(HFI_H2F_MSG_TEST),
 	HFI_MSG_ID(HFI_H2F_MSG_START),
+	HFI_MSG_ID(HFI_H2F_FEATURE_CTRL),
 	HFI_MSG_ID(HFI_H2F_MSG_CORE_FW_START),
 	HFI_MSG_ID(HFI_H2F_MSG_GX_BW_PERF_VOTE),
 	HFI_MSG_ID(HFI_H2F_MSG_PREPARE_SLUMBER),
@@ -765,23 +766,39 @@ static int a6xx_hfi_send_bw_table(struct a6xx_gmu *gmu)
 		NULL, 0);
 }
 
+static int a6xx_hfi_feature_ctrl_msg(struct a6xx_gmu *gmu, u32 feature, u32 enable, u32 data)
+{
+	struct a6xx_hfi_msg_feature_ctrl msg = {
+		.feature = feature,
+		.enable = enable,
+		.data = data,
+	};
+
+	return a6xx_hfi_send_msg(gmu, HFI_H2F_FEATURE_CTRL, &msg, sizeof(msg), NULL, 0);
+}
+
+#define HFI_FEATURE_IFPC 9
+
+static int a6xx_hfi_enable_ifpc(struct a6xx_gmu *gmu)
+{
+	if (gmu->idle_level != GMU_IDLE_STATE_IFPC)
+		return 0;
+
+	return a6xx_hfi_feature_ctrl_msg(gmu, HFI_FEATURE_IFPC, 1, 0x1680);
+}
+
 #define HFI_FEATURE_ACD 12
 
 static int a6xx_hfi_enable_acd(struct a6xx_gmu *gmu)
 {
 	struct a6xx_hfi_acd_table *acd_table = &gmu->acd_table;
-	struct a6xx_hfi_msg_feature_ctrl msg = {
-		.feature = HFI_FEATURE_ACD,
-		.enable = 1,
-		.data = 0,
-	};
 	int ret;
 
 	if (!acd_table->enable_by_level)
 		return 0;
 
 	/* Enable ACD feature at GMU */
-	ret = a6xx_hfi_send_msg(gmu, HFI_H2F_FEATURE_CTRL, &msg, sizeof(msg), NULL, 0);
+	ret = a6xx_hfi_feature_ctrl_msg(gmu, HFI_FEATURE_ACD, 1, 0);
 	if (ret) {
 		DRM_DEV_ERROR(gmu->dev, "Unable to enable ACD (%d)\n", ret);
 		return ret;
@@ -898,6 +915,10 @@ int a6xx_hfi_start(struct a6xx_gmu *gmu, int boot_state)
 	if (ret)
 		return ret;
 
+	ret = a6xx_hfi_enable_ifpc(gmu);
+	if (ret)
+		return ret;
+
 	ret = a6xx_hfi_send_core_fw_start(gmu);
 	if (ret)
 		return ret;
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index bc063594a359ee6b796381c5fd2c30e2aa12a26d..1135beafac464f3162a3a61938a7de0c7920455a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -58,6 +58,7 @@ enum adreno_family {
 #define ADRENO_QUIRK_HAS_CACHED_COHERENT	BIT(4)
 #define ADRENO_QUIRK_PREEMPTION			BIT(5)
 #define ADRENO_QUIRK_4GB_VA			BIT(6)
+#define ADRENO_QUIRK_IFPC			BIT(7)
 
 /* Helper for formating the chip_id in the way that userspace tools like
  * crashdec expect.

-- 
2.50.1

