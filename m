Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D0BFB14350
	for <lists+freedreno@lfdr.de>; Mon, 28 Jul 2025 22:34:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 71F0B10E598;
	Mon, 28 Jul 2025 20:34:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zn/Jihe6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8D9810E595
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:26 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlOVA023603
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=I8t+2xKA9TH
 HZTmJzGvWTh6YVgWzaeQG0zONpcACs58=; b=Zn/Jihe6d+bzp6z/IcaME1UWJC5
 GillVYY1LDFxQ1lU6yCMRy6zJ9eDOUpeeLk2BDSfXrjIDPQdU1oqHMxhDHUsX0nI
 fZCvXDNCn/8+y3k9RddhKe94kfDoKawqT6p4oGEaMFFBNWFsM6EimnAHT4AsWrMB
 dXERVW8mi4U+Fe3AXQ6Vtouqcps7GtB68ykAow32KhqSJkp//9DAi0pnIbWeMyXV
 LuVpFO5gOaYg2vAnHqZpHBPj5eh1ubi0qfopGR/VIPND7xH/AgUkfWI/FyW7tP5j
 g3LLkwIe9X4zDktg0zi+FtTf7taMjldos6ut6xJp+zya5amVH5tQ33zOzkw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qnqy1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:26 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-3141f9ce4e2so7616213a91.1
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 13:34:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753734865; x=1754339665;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=I8t+2xKA9THHZTmJzGvWTh6YVgWzaeQG0zONpcACs58=;
 b=E5YpUFy15iMrcxYVDMlbSytWa0S8Nnjz5/CA6bNTcOKRG0e9rhFn/oYkKY+yCeHxea
 ezS18XI0oWemD+9jgc/082t46WQjhrAlEH6B2XqmPLNugkIYoay9RU6VEjgN8oMRyCDk
 OPpgsfXvlUez1TDL1ggk9snCL/oXvZjxLPTVeMkrqdTUHghhrI6y6wTU303FeaOvGDo+
 uc5QBHcRpU3FtUacAsPXu3nZY79pn7W4wQBE+hbYQL6W3NZDlPc/8YOL+PGDzCKgz4qm
 Mj5ZZeZrDxjou6GuD5i0lwtWbyjgIEDGXhBffY0POHGVr4GEsV6+3D84ghhIgqllzGYd
 9HUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV8lMscuCE+KGZHGhfL5Keqq0/Do1f9/drtsP7bEZcsOUgs9XcGusd6dDrkrZg0xmedAkAE/xh7DQU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZmsZMPHchFuAiFfFrIBdQhhC7cJqEgdyK8qitXOWoDt/Kkzkt
 KTxHZdHx7y2iFppt9Y8tg5EdLpWihqL4Xyeodi7CfQmQk2mweiEza8ksPbDI4XO6jVOwiyAZawx
 dtpgtgSwkgIhzCm5aLeQxZ+eRkdz/o+T+f1ytKB9vX/UhbORVJ8oeUzAuXIn+dqU+RivIQew=
X-Gm-Gg: ASbGncsGEnG631q3oBKio29kwHENKtPDIPNVNRPyYVDaSUYaq3eFCRMKm6PWmV5aHlV
 Mtj8f1X3g2ybZklvaXOkSciQnSOAAWxv/MO1okPEVscwguACG/p3802jRECuUFP0DerkdxieEwj
 BSZhpdTjr9cew1cZEOxn5QvkH/oUA79SzHo+0TGy7c5EVwZ1L1hVFhXpNXngm8Oz5uiYhQyNSgh
 zXqJ18Ldq30sfrBsw8nxnbeqccwEjt35blvSfkTGw4Xf3Wr/IZaUQ97gJfIU/VhBv41zvs1JSPi
 2gv3ic/0zsqgbd4RpcUZm7ow9ElZ6yVU3STARvAL1mqoRmESlQA=
X-Received: by 2002:a17:90b:2409:b0:31e:d2a5:c08d with SMTP id
 98e67ed59e1d1-31ed2a5c5a1mr6681367a91.33.1753734865318; 
 Mon, 28 Jul 2025 13:34:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdlbZQJgZiV/klf4QMEE5MCR2s1YEQimkMRUs0qJyT+RaCeltmukYVdgn4Uepp3jzkO6MZlA==
X-Received: by 2002:a17:90b:2409:b0:31e:d2a5:c08d with SMTP id
 98e67ed59e1d1-31ed2a5c5a1mr6681351a91.33.1753734864911; 
 Mon, 28 Jul 2025 13:34:24 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31f00e778f4sm2480959a91.23.2025.07.28.13.34.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 13:34:24 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 5/7] drm/msm: Fix a7xx debugbus read
Date: Mon, 28 Jul 2025 13:34:05 -0700
Message-ID: <20250728203412.22573-6-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
References: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDE1MSBTYWx0ZWRfXzFMznYbM0GX3
 1EdMP+ZQBmKMWIm+VDBCvoaFeBDdzBzMtN9cyQYDXRRnAgls9LR7MsqjHYQaMN3q18NpWfIFLw9
 d8nqehifMDEQO5U2rmyeHSiccd341pNTBexV1nXKk4DY6mT1wi+WZKUSTFn0peolpJdA+fou0z+
 cagIREi7fY4t2JZLtVoMdmXaUD7LIn+lrgKvRfGxkOAVDXJQkB3zay2GeXjMP/0jhpOXj11fM45
 tryPAmTpd6Pd05f0sXDUDDXfvNp3r4vbxAnuDryAkBr8icVHJNZTu85tJjzOgSdiLAXnXp8jCJW
 1R+GV7mKs4Y8VoZpFl5NGXN8k5Yt4YIsSVrtzW3KxItACai+2bIIp5lfpcKTmFL9jgimiCs3isY
 i7x5G3HxSw4tEbrC+nHis+Hp0bJvowMohQTcNfDI6Tmtn2nTqlKRqXOyNJei4MEJcuve1l6e
X-Proofpoint-ORIG-GUID: pWyEOr97b-qUwteu4qgEXGv4srBEQSag
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=6887ded2 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=EUspDBNiAAAA:8 a=E4Rgrv4FocJ6r0LxV30A:9 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: pWyEOr97b-qUwteu4qgEXGv4srBEQSag
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280151
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

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c
index 7ba7113f33cd..33df12898902 100644
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
+		reg = FIELD_PREP(GENMASK(7, 0), offset) |
+			FIELD_PREP(GENMASK(24, 16), block);
+	} else {
+		reg = A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_INDEX(offset) |
+			A6XX_DBGC_CFG_DBGBUS_SEL_D_PING_BLK_SEL(block);
+	}
 
 	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_A, reg);
 	gpu_write(gpu, REG_A6XX_DBGC_CFG_DBGBUS_SEL_B, reg);
-- 
2.50.1

