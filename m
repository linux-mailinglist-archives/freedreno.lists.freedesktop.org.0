Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AE339B0B5D9
	for <lists+freedreno@lfdr.de>; Sun, 20 Jul 2025 14:17:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7981C10E372;
	Sun, 20 Jul 2025 12:17:09 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pGlAy1j1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E2DD610E370
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:07 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56KAswNc022604
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kW1RdFmcoOsd1EwSoqf5o3Zsu7xmMON1mp5RNrIB+Pw=; b=pGlAy1j1w0BPkw9q
 OqoPVYZpD1yWIRztmchbQhabtaijsVtXSxz0ii10+HUti0UOP9Y1chBEXfCJ6wPs
 cr3ca4ZYA4CXzyao3IcYNyXzs6oU8uDdX5Eo+iIapJonSnahqpsB6WFuHY6nIOAz
 rPmZa220YEvmQ9CPrivOoQx8Btnc0giA0WV1B/c1Z4sYT8eTqmD3TMmnyQmmA1Uf
 gzdmOb61QzuHM0ixyaGhwZdONlTYHooKWhqLoonMN50LsHnLjZiyj6FEvGU+divW
 iZ4MXt4ReRwk9sAb2Txj5jWC7MIZ3RSfBbpu7Ne8+zzSZre8nlgcwnx120cx8EMF
 bMBEVg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 480459j5sj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 12:17:07 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-748d96b974cso3377588b3a.2
 for <freedreno@lists.freedesktop.org>; Sun, 20 Jul 2025 05:17:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753013826; x=1753618626;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kW1RdFmcoOsd1EwSoqf5o3Zsu7xmMON1mp5RNrIB+Pw=;
 b=gelwCK7tQKSSyhll9eNIaohFnpDP0Wwzy1BgnSrHsFRZqH9fKTgmKIhr1lYIQsVUBq
 zchBHTQPQDNFyDzEIrXm625tXBIkCu6auMnZFUZpN8aHC0+bFnrLzpe1D1C60pgcZf6z
 a/udQLzav06u3NBIVetWPT9NcHvYP9oN+1cFHOsMrWO/tWTWWpaGJPVmDG+nO20Ypvoi
 FG1vyuhASsiaAKoOGDYuBAxUWk3ERsJMs0zMD4Pgs2gm/uLAZqCugcVqbAfuywgMXK8c
 bwPq61DnD8ItUlFInBgM+eL4XvPvBaeklEAhrENRblDOe2jp4mUaR+bwunbzCQNLNMSQ
 aPTw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9y7/wE4AaDb8C3/HyIcGXOHgjEhrVuaBPidud0H4hTZTKXVWTGVu3RrpluNSa1vzU0Qq4tZ8IWwE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwMx+GxQD0WN212PTDlcYPRSVqQxwmqW5skmfBcs/NvsYOouR52
 9gXgeF2zoZrEg6TaRG3Xq6j2bgfHGc23SA4mp/nz9xaf0/4OCiLjz0vUkfbmo8Gh1Al9bfJNu2V
 HShmUgvgqPKtZs5gPFI2Z8gX0HnfrU6lDjebIppETfwp4zpgA5wnoF7kFrtxKKU4n2GwqtRI=
X-Gm-Gg: ASbGncsjwkoOEBcF1zu4828+0BKolLTEZEYY9FcHq0Hkp38zlL4Ht4T/3NyfPoazcLy
 vot8HF7vTZRA65BMuFCgl+6DqKSRpxdBCx3b2afFBrMpedYLIMJAp72egBTaizRH/8AjYzHB0Mc
 vHyo+NGpu6nrVjhfrHjpEdCxJ177lWxG85+AdgQiAyfAClBcQXbAjHZwyIUDzeWQS7eqR21hq2b
 YQtauqvRHu61qNQmq+go3xlnTmYQuir+7V7qFxQA36jxJYmTXbt3fVyD5+e0uSTlBe3rAzg2CJk
 B0uwDT19xM4w6FqIuA9HEfSe9Ugk+2dIWpa3zsbdJ9kQGxWeiSJqZBOJo7f/pk73
X-Received: by 2002:a05:6a00:92a7:b0:74d:f997:1b45 with SMTP id
 d2e1a72fcca58-756e81a0b16mr30560719b3a.8.1753013826566; 
 Sun, 20 Jul 2025 05:17:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFJCPBQtnMXy/jZOOBKiFVdjpswk8HG9jRo/IJ5LNgu7cBW5KadTD0q9XkvVA+KGaxqwWZhYQ==
X-Received: by 2002:a05:6a00:92a7:b0:74d:f997:1b45 with SMTP id
 d2e1a72fcca58-756e81a0b16mr30560678b3a.8.1753013826033; 
 Sun, 20 Jul 2025 05:17:06 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-759cb154755sm4097933b3a.69.2025.07.20.05.17.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 20 Jul 2025 05:17:05 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Sun, 20 Jul 2025 17:46:05 +0530
Subject: [PATCH 04/17] drm/msm/a6xx: Poll additional DRV status
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250720-ifpc-support-v1-4-9347aa5bcbd6@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753013805; l=1549;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=3stwORXOyD2lHblr894e/45a/C3w1GwYkrVrwU46SQM=;
 b=18D4fLzbFzbWn0lxY8knNtoN1Y/tXd2BzOVJmRzc5l+AkfoVEX0r2tMLbpEmrVxCkaWemcti7
 3z95YWbq0QbC08z2Xo5a7RbYiQ7+dZgYQcq+GPAXdz3j6ZBQF1W+rhp
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: NDT9jpUnW2jZj0ius1IjyXuZegGimKxr
X-Authority-Analysis: v=2.4 cv=fdyty1QF c=1 sm=1 tr=0 ts=687cde43 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=D93cZsf7Dk1NQdFOo6kA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: NDT9jpUnW2jZj0ius1IjyXuZegGimKxr
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIwMDExNyBTYWx0ZWRfX9tXfz8yM40r+
 cforUqUbOQvY7uVc/ZFMOamy74kIKTFe1ACEciMc+xZlF9Y02dJcid/56T9XOBK2fpjPMhaTJQ7
 0QpJwnmTeaGWZVbTnUuVkZ0ZAAyVAwR8LNLfK+o0RTLx2Ppuh7Ol3/fdoq2XV66pHYo98ny2JNe
 wsFI8A2GC7JqaREiPx9U5ADze32H5KOT0iSShygPwWjs7FvJUfZPix/jIrdP4jGHHJ3M8jQn3rE
 vHztjnyM77zzdOZFWLdMRUuIkUi5wjpDDtGNLOIduBtWif5R2Kv+dxZLq7aNM0NP31Lcr72XMcB
 xEf74wjniiWKPsbHUK2/D6hGYdPycOJEqipyZfAwauIb68xYG6LV63CAJ1bL+yM202ew8i+zL8F
 cv4juKesfyiCUPzIJaUtbFgfw8I8Sro2g2ctYZETjYniXQwQDTwGk8vTGxtxa0TbHzmHNV55
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-19_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 priorityscore=1501 phishscore=0 impostorscore=0
 mlxlogscore=900 mlxscore=0 spamscore=0 bulkscore=0 malwarescore=0
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

A7XX_GEN2 generation has additional TCS slots. Poll the respective
DRV status registers before pm suspend.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 790ef2f94a0b0cd40433d7edb6a89e4f04408bf5..3bebb6dd7059782ceca29f2efd2acee24d3fc930 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -987,6 +987,22 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
 		val, (val & 1), 100, 10000);
 	gmu_poll_timeout_rscc(gmu, REG_A6XX_RSCC_TCS3_DRV0_STATUS + seqmem_off,
 		val, (val & 1), 100, 1000);
+
+	if (!adreno_is_a740_family(adreno_gpu))
+		return;
+
+	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS4_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 10000);
+	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS5_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 10000);
+	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS6_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 10000);
+	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS7_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 1000);
+	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS8_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 10000);
+	gmu_poll_timeout_rscc(gmu, REG_A7XX_RSCC_TCS9_DRV0_STATUS + seqmem_off,
+		val, (val & 1), 100, 1000);
 }
 
 /* Force the GMU off in case it isn't responsive */

-- 
2.50.1

