Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7EAB0B5D3
	for <lists+freedreno@lfdr.de>; Sun, 20 Jul 2025 14:17:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 43DB210E366;
	Sun, 20 Jul 2025 12:17:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HgExPltN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC40710E364
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:16:59 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56K7vA2N002640
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:16:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GUUWHPjbvH6QTNjk1RlubS+78L4dbRVcEyaUCE6DYUY=; b=HgExPltNrDystxWj
 WZSR665Nt+p9eq7eWJL4f2uy3uI+HpwXDQYDrPnrlciuwblpGP6a1lROBcGD/GnX
 iO/qiPEJIpwUaWVhp8WBMubwqXqMs5upEjfl6snNyjaVl8AIYNQm/OVyVGiBRyrp
 MWhfdC07X46zqFp8bdmMfMnCnYB2DBZxrSnhGY5lyTO2/J9xPyYl9k6ldIw+u1t/
 GMzzRKZuvNFuhgTbGUozprK1iRM8lFx5NYcti+vysoQyt9+ck0cUKxkgv4KieOHC
 c+EvBJbQj9GQKhRmYSIlIfB/T23yTX6bidXWecrSzzrSKOeHfArKug4atTbBbT22
 3XivkQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480459j5ry-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:16:59 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-74d15d8dcd1so2457426b3a.2
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 05:16:58 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753013818; x=1753618618;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=GUUWHPjbvH6QTNjk1RlubS+78L4dbRVcEyaUCE6DYUY=;
 b=cggvadeY5zxl1e6xi7+7E/4ITVkvluDmGB2rqC9in7BCbHsdywr+a4qAQ8PANmSzt5
 9c10Rd990vzM9u868p5HweSOVCtnqfgMoDf5JFk/Eao69aWZCJTBjh70Etp0DCWYTVnl
 eM4kOuu2gAzy/iy0b4dPffF3Os0+CL+VSGwW+X/SGt3KDdOKZLczpy1CP8MzMxNo0Mz3
 atWkceyACagf4Iy0iACHCoEIcVQK3u3z0BGTCMDx/L34OygrcN5s1AtO3vwzq+vODZJW
 7LyxXvUWq1TUGmQxEn4eHiZ0Ig0b2kro9uQtw/6JtaX9sapCYaboKy2iCqvB/cKZvsGX
 1Oww==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGH7TKTek/gTjjwdOeCrpJq9aQUkUCMMI5sX+IhGMy/kuH0gzxGDXtxIxkNwcdR82BjmwGeosTFMY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy6x/aO63OEIG172W68/ibdwHXMej0cx65FJ5uRln4bylkabz7J
 VBnvc//AyMVCBJWuMCXLeYud1MBqjBtMZVSDE+oKXC2tKnpUvVoJr8yrIpNBhV7+iVmjx9BAotT
 +CSQvOqZgIND7d/vdxw4E3rRtFCzaPbe01kdI3cvI+8sTtp+Kv+RcdoPOFZ0h8QBAvX3LZXM=
X-Gm-Gg: ASbGncvYxpywMu64Ig91vsGjxNBh5oLcOKX/g8n/VVAofOyN9DrbVtOvjUV+w9zNYOw
 Rkyv0CXGj00lcfgad54ovBQqaH9n1bO7gGLijTuLtsYPkgNOmwH84T/5Y0bWSy1yyjHb4nak8+p
 DDmn3XUrbSSFRqtzApu0e0QPsK6qYX/iuYmd32rY3+HXbVSl74WUoTENb88IJ+0VJDV/xuSSE7K
 g8wJWhlRAIFf5VUlRSRhcAZ4+UF/Uu2DkViwZH3BM9P7r5uW1CSOHXH6xiTsoKQeZVnw3qJUsrs
 cQkL3swniUc6CG62027H+0Cw3LQzlS4QlifAzBDXkU2xsRedc9oh4ylaocUjd/zX
X-Received: by 2002:a05:6a00:1307:b0:742:da7c:3f30 with SMTP id
 d2e1a72fcca58-7572558c61fmr24351253b3a.19.1753013818090; 
 Sun, 20 Jul 2025 05:16:58 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2Vjaw1ovzeerTh8e3mq89qtc7qgvuqtULfKqLQ9vBCRz3+D/lvo3jTsyzzzXJz4o8Q5Sl3w==
X-Received: by 2002:a05:6a00:1307:b0:742:da7c:3f30 with SMTP id
 d2e1a72fcca58-7572558c61fmr24351225b3a.19.1753013817655; 
 Sun, 20 Jul 2025 05:16:57 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.16.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 05:16:57 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:03 +0530
Subject: [PATCH 02/17] drm/msm: a6xx: Refactor a6xx_sptprac_enable()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-2-9347aa5bcbd6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=1332;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=V3hva8uUglYlyb//OHKwJr7lHWspUGiRoLgjciN1ylE=;
 b=/a8q8Jnntk2Oh0OvDR281W+cUylzzDVAVr7i2H6et8pObobL9+nzaq243ZkTe+PAVHRFFJ5xA
 hd2GgfpCPOLCDh2kiyxqoNAVe7BveNjYHWS3I8ME97cIVRxBYs1amvF
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: _XGjKoMgOUgGQdITw9ghUwb1oljlwJWm
X-Authority-Analysis: v=2.4 cv=fdyty1QF c=1 sm=1 tr=0 ts=687cde3b cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=vRh7XmUrzz2ipe4V1moA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: _XGjKoMgOUgGQdITw9ghUwb1oljlwJWm
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExNyBTYWx0ZWRfX9QCUxybcE0v2
 d0VYMkPrptyUgp2ikOJJ3kIaONNqe/UN3sWL62YtdnSyexR8OLnz+ckoOstd7Jh8bRmiA91xAlX
 YUYIy+te3vQPtAamjH/hL5md3wdbIVU9A7MGj7x45uD7JLQgPGl/X7cmQ3LxHCUwTQ85DzEZ48t
 jfQdAk6EZOAaJVk1V6W+nFg1busxtAx8UUJRac1YEe7/CZk1Js0Bc+Au49VBIeXje8a8mWaGqOb
 TQGaJFJge/Th5e2vRM8YGK6vsbI9KGZmfNCrMb1fpkL5HzBJKCDOLha+oRVg1sDAUlQObbjlQGU
 vbh5J07r0tWFFR2VE5r7J1IOu6Mh9QOiaF0lbt7guZNL1oUhHWLYXNzBMcsFnuUuKPMIEv/EL56
 XThzyU3s8z6XgXPkYx1Fjw7qMISQtYt4BKg/os5xgdEigPq79uatZnxtqezcxTZvpFkE1vL1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 mlxlogscore=658 mlxscore=0 spamscore=0 bulkscore=0 malwarescore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507200117
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

A minor refactor to combine the subroutines for legacy a6xx GMUs under
a single check. This helps to avoid an unnecessary check and return
early from the subroutine for majority of a6xx gpus.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 38c0f8ef85c3d260864541d83abe43e49c772c52..41129692d127b70e9293b82bea5ccb6b911b0bfb 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -403,7 +403,10 @@ int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
 	int ret;
 	u32 val;
 
-	if (!gmu->legacy)
+	WARN_ON(!gmu->legacy);
+
+	/* Nothing to do if GMU does the power management */
+	if (gmu->idle_level > GMU_IDLE_STATE_ACTIVE)
 		return 0;
 
 	gmu_write(gmu, REG_A6XX_GMU_GX_SPTPRAC_POWER_CONTROL, 0x778000);
@@ -925,10 +928,7 @@ static int a6xx_gmu_fw_start(struct a6xx_gmu *gmu, unsigned int state)
 		ret = a6xx_gmu_gfx_rail_on(gmu);
 		if (ret)
 			return ret;
-	}
 
-	/* Enable SPTP_PC if the CPU is responsible for it */
-	if (gmu->idle_level < GMU_IDLE_STATE_SPTP) {
 		ret = a6xx_sptprac_enable(gmu);
 		if (ret)
 			return ret;

-- 
2.50.1

