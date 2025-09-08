Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D92F0B499F3
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 21:30:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A3A2F10E5BC;
	Mon,  8 Sep 2025 19:30:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QGDFtKpv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A2C410E5B7
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 19:30:36 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588DMK8N004866
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 19:30:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=V9UZtlyyn5h
 KtDyVI3Ro3LMaxycsPRVDyyu4mClJs1Y=; b=QGDFtKpv6a0HoUFcg9gqeuvyZJW
 cyS8PMsj3PXDDusPcXUsanRpU3zy0PxOr85suw73Xa0VXL4TBHAMOOAB45EKtpkJ
 l2mfUhF7ghzr61G6EWsBDyFrOOBdhKelZq84X6gYGBpRJWM/liWW8tWuC+9Axodp
 xUzEzzyfNqapkP3Ye+wjan0aZsiRG8rzGHiMUTg8MCNbLmNi0Xchdbf3KHry5hLz
 33toAxnLcOmE+amDBnlG7+oXtHHtWspWORlX8T+VHK0vqr8pITPIh4Jvoq2Ve+1A
 knwb78y7xBXj4s8Y/W7PogAFFTk4JK3cfslJK6B0YHFCsHmm5XNd6zCVM5A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491t37t7t8-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 19:30:36 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-b4fbb90b453so7885259a12.2
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 12:30:35 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757359835; x=1757964635;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=V9UZtlyyn5hKtDyVI3Ro3LMaxycsPRVDyyu4mClJs1Y=;
 b=YcbfApFqisJwt9Lhmubu7j5SrnT0t5f+Fl8+l6G7yG1adXSKuCq6YdhgcHStn5xVeC
 i/Vsx2IRyB/rovOKZmGSn+bos3HWYZZ0Ae1kLg/WA7RotJJWkDgLLTdfDxl5MgbhEIMt
 5lOSmYn5wR3Zl8yJmast0N1ldgszFs67JVM+gjMCjERIEyt4E8a0mj7+yuhAYLKTfsXR
 308gkt75trvHKdMS1ZfAMAd6YZbdAopYUXXh9N1QCDZHTa4mwdoiIMkWsLt+R3UYQlv9
 8PffI2UNQQW6wIESToinQOqC4zRp2nfl8OEWvKnuL/Un/Euj2TxZYpndDA8f5CB3eEAu
 5ksw==
X-Gm-Message-State: AOJu0Yw+h3hO2Scp+Qga6JTwsou/eR569L6TWb3q7fIZ+66C0prsHHE8
 FrG5AnztU+EX1IQdXduhs8D+Oom9Cs9GMomCnxrzJLji6LMGbM/UFZQeJlX72T32clA7RoykTzV
 cs0fNobf+5MO0u0P6JYCCYVf8TgCcxrDRz3DEpKcAC7E2eOPcPomMGErFhOynrrxYNQpL1tg=
X-Gm-Gg: ASbGncugU1K9v+rm4cMkUR6vqqWkuIaCEDnaQgYwL3CwjREZY8Hj0dv6xxJGAAl9DJp
 eaav933+aYukM/Xcb8o9IJrSGMzo3gV+r/MpiTCMcMniUQ0InFZRnbqTcnyna6RT07avTyNq/+X
 nbnIs2tD92gfdB3aLyiMNpOwp5RU8Xnj094PcSkb26TmKdJ3m57NFw0WMrv4jE56LdvZegdJOna
 ddmeE1/Hl/a/1Enk2TC0eWtpSP+/9m/1dqr9GJzzHfcDMucNqUym79ByEliguSep8ARM8vC3xUc
 +ByECWU9Ys2jsalgmwJvNq4qFi+/qzs5jeZwL/WukAc2TtJhOQ8=
X-Received: by 2002:a17:902:f68a:b0:24c:be1f:c1f3 with SMTP id
 d9443c01a7336-251736ded57mr130795935ad.35.1757359835085; 
 Mon, 08 Sep 2025 12:30:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEp6yo1Uy7RBj42hLfgm+tadYfLbQIubWtzG/4AK1CsZzs6I6GYEqVGCGj4HBQRVCJizgZa2Q==
X-Received: by 2002:a17:902:f68a:b0:24c:be1f:c1f3 with SMTP id
 d9443c01a7336-251736ded57mr130795565ad.35.1757359834632; 
 Mon, 08 Sep 2025 12:30:34 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24c829d9114sm156524285ad.57.2025.09.08.12.30.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 12:30:34 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org (open list)
Subject: [PATCH 3/5] drm/msm/registers: Make TPL1_BICUBIC_WEIGHTS_TABLE an
 array
Date: Mon,  8 Sep 2025 12:30:06 -0700
Message-ID: <20250908193021.605012-4-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
References: <20250908193021.605012-1-robin.clark@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: -DGs-eetf97D9DXaGJnJETkDMLNp25xg
X-Proofpoint-GUID: -DGs-eetf97D9DXaGJnJETkDMLNp25xg
X-Authority-Analysis: v=2.4 cv=NdLm13D4 c=1 sm=1 tr=0 ts=68bf2edc cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=xqWC_Br6kY4A:10 a=yJojWOMRYYMA:10
 a=EUspDBNiAAAA:8 a=TOpUcsStXtwAwhZrRvYA:9 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDA2NiBTYWx0ZWRfX6RNh/WJdUvkY
 rBzNtFw4xezYqu8PzIAbIke/D97/++ohiHZRi8fyAeXqPkevqHIiWw1b5E+TnJHhmqsIZx0Kqde
 5mPa7ZtEfBQYX/xrt2gE3QpmF02TfAgC4INGB88TzRLL71hqnX7A3ncbgg9B8qXXdLL2pYLBTAp
 uSV7Ob3FkNEsDBbcWuh+fRXSI4AKpbVF/uVOI9U+ZMAjoxN4DY/NTemthSMbm9UAqDJuSe+5j5U
 xh1/kMMOkvOvG/QQU0WVxM3SfKJDiesHxrGv40PVYxgAYL6FhE+8E5gYCmBqi/93boLkK4az7bM
 bvQJVOYpIfBH6GeTUSOpcBCvFpvd26cEhl9u3GXD/kG4ScBZtZoAyQuG4jksmVtxBqEdgplTdZZ
 3nUSMi/S
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 adultscore=0 suspectscore=0 phishscore=0
 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080066
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

Synced from mesa commit 77c42c1a5752 ("freedreno/registers: Make
TPL1_BICUBIC_WEIGHTS_TABLE an array").

Signed-off-by: Rob Clark <robin.clark@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_catalog.c     | 10 +++++-----
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c         | 10 +++++-----
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 18 +++++++-----------
 3 files changed, 17 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
index a2d587e1a4f5..44df6410bce1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_catalog.c
@@ -1355,11 +1355,11 @@ DECLARE_ADRENO_REGLIST_LIST(a7xx_pwrup_reglist);
 
 /* Applicable for X185, A750 */
 static const u32 a750_ifpc_reglist_regs[] = {
-	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0,
-	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
-	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_2,
-	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_3,
-	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4,
+	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(0),
+	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(1),
+	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
+	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
+	REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
 	REG_A6XX_TPL1_NC_MODE_CNTL,
 	REG_A6XX_SP_NC_MODE_CNTL,
 	REG_A6XX_CP_DBG_ECO_CNTL,
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 2f68394d6c3b..a45c3917ae9b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1337,14 +1337,14 @@ static int hw_init(struct msm_gpu *gpu)
 
 	/* Set weights for bicubic filtering */
 	if (adreno_is_a650_family(adreno_gpu) || adreno_is_x185(adreno_gpu)) {
-		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_0, 0);
-		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_1,
+		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(0), 0);
+		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(1),
 			0x3fe05ff4);
-		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_2,
+		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(2),
 			0x3fa0ebee);
-		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_3,
+		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(3),
 			0x3f5193ed);
-		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE_4,
+		gpu_write(gpu, REG_A6XX_TPL1_BICUBIC_WEIGHTS_TABLE(4),
 			0x3f0243f0);
 	}
 
diff --git a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
index 86fab2750ba7..28d4e7149a5c 100644
--- a/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
+++ b/drivers/gpu/drm/msm/registers/adreno/a6xx.xml
@@ -3296,17 +3296,13 @@ by a particular renderpass/blit.
 	</reg32>
 	<reg32 offset="0xb605" name="TPL1_UNKNOWN_B605" low="0" high="7" type="uint" variants="A6XX" usage="cmd"/> <!-- always 0x0 or 0x44 ? -->
 
-	<reg32 offset="0xb608" name="TPL1_BICUBIC_WEIGHTS_TABLE_0" low="0" high="29" variants="A6XX"/>
-	<reg32 offset="0xb609" name="TPL1_BICUBIC_WEIGHTS_TABLE_1" low="0" high="29" variants="A6XX"/>
-	<reg32 offset="0xb60a" name="TPL1_BICUBIC_WEIGHTS_TABLE_2" low="0" high="29" variants="A6XX"/>
-	<reg32 offset="0xb60b" name="TPL1_BICUBIC_WEIGHTS_TABLE_3" low="0" high="29" variants="A6XX"/>
-	<reg32 offset="0xb60c" name="TPL1_BICUBIC_WEIGHTS_TABLE_4" low="0" high="29" variants="A6XX"/>
-
-	<reg32 offset="0xb608" name="TPL1_BICUBIC_WEIGHTS_TABLE_0" low="0" high="29" variants="A7XX" usage="cmd"/>
-	<reg32 offset="0xb609" name="TPL1_BICUBIC_WEIGHTS_TABLE_1" low="0" high="29" variants="A7XX" usage="cmd"/>
-	<reg32 offset="0xb60a" name="TPL1_BICUBIC_WEIGHTS_TABLE_2" low="0" high="29" variants="A7XX" usage="cmd"/>
-	<reg32 offset="0xb60b" name="TPL1_BICUBIC_WEIGHTS_TABLE_3" low="0" high="29" variants="A7XX" usage="cmd"/>
-	<reg32 offset="0xb60c" name="TPL1_BICUBIC_WEIGHTS_TABLE_4" low="0" high="29" variants="A7XX" usage="cmd"/>
+	<array offset="0xb608" name="TPL1_BICUBIC_WEIGHTS_TABLE" stride="1" length="5" variants="A6XX">
+		<reg32 offset="0" name="REG" low="0" high="29"/>
+	</array>
+
+	<array offset="0xb608" name="TPL1_BICUBIC_WEIGHTS_TABLE" stride="1" length="5" variants="A7XX">
+		<reg32 offset="0" name="REG" low="0" high="29" usage="cmd"/>
+	</array>
 
 	<array offset="0xb610" name="TPL1_PERFCTR_TP_SEL" stride="1" length="12" variants="A6XX"/>
 	<array offset="0xb610" name="TPL1_PERFCTR_TP_SEL" stride="1" length="18" variants="A7XX"/>
-- 
2.51.0

