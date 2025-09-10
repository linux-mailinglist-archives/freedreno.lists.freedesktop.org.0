Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3904FB52296
	for <lists+freedreno@lfdr.de>; Wed, 10 Sep 2025 22:44:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 139EB10E9DD;
	Wed, 10 Sep 2025 20:44:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HHIvGWYD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F342510E9E3
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 20:44:39 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58ACgERM029764
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 20:44:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 R/4Wft3ZFrBLCsBTvaTSzzDE7KvwF9edeAejAQ+B/BY=; b=HHIvGWYD30VWgh/x
 Y0GCG10lxYMkR+VEkiKxEny6Bw64sbPG9PzUNDVCF4cqgtSS5Ircjgk5HVzq5D+H
 NfoOrx9GGORI+uC6UqxqhhpCpVhygozg5sIw4RbB54EasURackySToq8mI0nmYrN
 lHSlQZa+CxDOc84l5j9B7GPDCQ7Wq7dTv7RkmV0owc2uhjOfRHcEMKnnhcTJ8eG/
 3HLjhmFD/qa0zKBbneoR2tmySKIYv6Oq+CWl71S/w1NlBog3irsytiQnhxQefaD+
 2WJwJ/eu1yXBRltpcIMW3OP8sEXDhaVJ0aW8jy5+FQa4UzO+dv+WOY0wzh9RZcfT
 Oru9Qw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapngs2-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 20:44:38 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-323766e64d5so1009183a91.0
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 13:44:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757537077; x=1758141877;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=R/4Wft3ZFrBLCsBTvaTSzzDE7KvwF9edeAejAQ+B/BY=;
 b=J/BLztdqH6HyRLDPoEdw8bU5AQ93jsfEwAchDiG+YvX6pL3CNMZQKohZKpPOAvfEOr
 Al4JKuTbZDe0AtY/ROgjNCu9FXSqqIJVo+73hSs3kMc1LTDPoFtXM8dshtqHUHxVL39J
 Eiyq9hx107baDa+n1ohn0/G2NcDHFjXsQz1xQ6NDej4pfRy1mYkfatolVhjwynKcOJyW
 HikKFrlnpjyAKDbErMewJkMSMBYiKwfZhI00cBs8c0pS7fmc5e7j9WuDzFb9iprWCP3O
 3slmIquu4zxfvQP5JvJ7NCG6zQY8Dt2Hp4zQkceGbMHVoAEiY6dihjmpwG6IeP+5l/jt
 WfTA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVoZ0U1lLxz5Trjat17CmDku+X17LMTZuLJ7uftl39iysJ4jLk8en0RpmtonryEdOVMMNLOCk7AW2g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXo3tfAz9mAIITj888DchTTCmuakpmERUPOTJdXgKxK1fHqa/R
 BgCN8+33Ws8Cf8uVHPaZwUuTtRcGsk+jQ6qpZUKg23bskqMnD+BMmB9hGMiptUxdEMNZgcRJmHE
 eLvk430WJlkLIhaiy5vUVmIYh11Q1kwMjP+B9Y5VXqW/kHAa9OTvlLqUPtST2pK15r+BoLak=
X-Gm-Gg: ASbGnctthPMaBsNDsetWNOPd4+q+ejfAPe6d5k5nE26nLZKDN6NpGlp6ABL994BRfwy
 lyvlhXi4NRkynyKV9VUpiQkog40mrAbLa2RrRdcpKKNl8EF3dX34NiOAbxSVaFg734NaYAv35I2
 HC3xG5Xg2emm7WmzImNQpJ47xNtLyAf06x3JueLiRu9F7n5HEEF4cpOXmcn9q+PGa+aOFvqJRDN
 Aaygu192uak64BCBdxwR+6tEG01tJ1o1CthWH3rbmvT2SRWdLoiEDIcTQhTb/sJF1Q5huTU76je
 a3VKDV0qlgcK2x7CgS/fMuz+oWy+vldRQ9V0YZjgzO+jRxu5n6IIITkxT3TqnZbs
X-Received: by 2002:a17:90b:3b81:b0:32b:96f2:e2c9 with SMTP id
 98e67ed59e1d1-32dd1dbb188mr764751a91.12.1757537077217; 
 Wed, 10 Sep 2025 13:44:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEZ34b2+3kXaCBM79RfDIeYcFfBZlEs+rc1jvA1GOQktZ1ERKp+SFIbOTtPjv3X0doccjwcwQ==
X-Received: by 2002:a17:90b:3b81:b0:32b:96f2:e2c9 with SMTP id
 98e67ed59e1d1-32dd1dbb188mr764732a91.12.1757537076739; 
 Wed, 10 Sep 2025 13:44:36 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32dd61eaa42sm46771a91.5.2025.09.10.13.44.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 13:44:36 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 02:14:05 +0530
Subject: [PATCH v2 2/4] drm/msm/a6xx: Fix GMU firmware parser
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-assorted-sept-1-v2-2-a8bf1ee20792@oss.qualcomm.com>
References: <20250911-assorted-sept-1-v2-0-a8bf1ee20792@oss.qualcomm.com>
In-Reply-To: <20250911-assorted-sept-1-v2-0-a8bf1ee20792@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757537061; l=1478;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=QH5mzD4A8ywK4YBRLZvZeIsieAJxopW4JPv0czcGn2k=;
 b=E/JQ2p+GzDCp/eeNWvlYpTUdKgONOclrECZtOlrFo0XCQnrPuI5PqEEU6YFEduipWLvfU2Wdh
 vzsHgYpuTkTB2Q1CS2zJyzIgbG0fCoHVY2D4nELZY3onLWrozaS2Ia+
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68c1e336 cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=gF2G-XVBjaN319PmpW4A:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-GUID: jF2_pSs3XZfLH7v0elGEijMcYCJzi4gp
X-Proofpoint-ORIG-GUID: jF2_pSs3XZfLH7v0elGEijMcYCJzi4gp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfX6hFU51QNWbnK
 wybakEH+2F+Tqy55DPd4IciK/ObzMrD6do4Y2JWBsaq26xwG9uy9DIYCv5vYtIqEgh+mEVqFoR6
 //Ph1ZBDw09hhaNm7SM0N58rUvdMQUDs2FmRR8ws5L7ghwjp7Grncs+gK8rFDuZZnReB3OWtEOU
 i/kB3DReBWAO3OjiMqQf4GNqdazI+Mxye0AUB5i380shfu5S+Xv4OrJy7scXDX9Ak9383QZDqIk
 wsindf9gUIk1neZF1781FMugyEaXiBhZhHDrxuGdZPrRgbJ5LUmpuQbiL+8VwVhCQ6TPaNdpdet
 cOjS1nqwcNYHrIE24IxDh8HpVhhedKAG9ij9jYLXFS5dvl+oh5ZT54Pei2q01BkD33Jqo2x37yl
 Rj3cDhgW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000
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

Current parser logic for GMU firmware assumes a dword aligned payload
size for every block. This is not true for all GMU firmwares. So, fix
this by using correct 'size' value in the calculation for the offset
for the next block's header.

Fixes: c6ed04f856a4 ("drm/msm/a6xx: A640/A650 GMU firmware path")
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 28e6705c6da682c7b41c748e375dda59a6551898..4c0510cc784864da990af8cad086176a5d92ae8a 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -758,6 +758,9 @@ static bool fw_block_mem(struct a6xx_gmu_bo *bo, const struct block_header *blk)
 	return true;
 }
 
+#define NEXT_BLK(blk) \
+	((const struct block_header *)((const char *)(blk) + sizeof(*(blk)) + (blk)->size))
+
 static int a6xx_gmu_fw_load(struct a6xx_gmu *gmu)
 {
 	struct a6xx_gpu *a6xx_gpu = container_of(gmu, struct a6xx_gpu, gmu);
@@ -789,7 +792,7 @@ static int a6xx_gmu_fw_load(struct a6xx_gmu *gmu)
 
 	for (blk = (const struct block_header *) fw_image->data;
 	     (const u8*) blk < fw_image->data + fw_image->size;
-	     blk = (const struct block_header *) &blk->data[blk->size >> 2]) {
+	     blk = NEXT_BLK(blk)) {
 		if (blk->size == 0)
 			continue;
 

-- 
2.50.1

