Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F0125B48707
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 10:28:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B648210E488;
	Mon,  8 Sep 2025 08:28:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FlxAKuTa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ED88410E488
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 08:28:15 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5883lUUe013569
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 08:28:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 vz6TxjIbrwRntYK8rL5nZ8VrVI87LAGFTolpn+41CWI=; b=FlxAKuTa4YQFL5i3
 Lr1Sg7Eoigr2sQIO0vLqBg6mSj9SZXCxpr/kMckJKu7W0BZK6ctCa6C85KyWZacR
 rf03JNWe8WzFItsNSKuoNCzHh/ciZ0kBGRe0GHIUoAzoFLBj4WhT+Pr9u6p0r9Io
 18DeaKNYB4uUnuOUVHk+yrGYIDgUDq+COqXit9AIdR172Nr8WQUL43/0WE9r9SMm
 w2PaRBk/E/DBqSP/6w96J46tmcP2uKwkdaBMkZemLtne++fOHhte15IVSacR14ol
 3QZ2bRbB1cFlLiQgdebwR6Ioow68/e9tu+5DGsbCRhGFMTXZFcgOUCZrTr0eUZiX
 SM1pFA==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdrnd9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 08:28:15 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-329ccb59ef6so4983195a91.0
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 01:28:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757320094; x=1757924894;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vz6TxjIbrwRntYK8rL5nZ8VrVI87LAGFTolpn+41CWI=;
 b=oJH7RvmN9S5XXjPBq4pfKq4cKl4XRo4C0LmpAQjxCWlV2sQPDe4tlYF1Irru6xrBGV
 TaHDsUKSV8PB8Ye8Q8UoqeVyXtCusUbBAf21S2shoCQ1+/E31HWD/gExDSMglwhqBj0c
 MLOy666e48KairpOICxHJ4qT72jly5H72uWNeXK3oW08YeBjpZ5hH6RkzPVDZBBz2z/W
 AoMB8K8ZmUmpJJYkOgJnX5lwxdqqg0+sFO/8IiNEzgTY1m9bz3VWo3tZZNDZGrqgAz4p
 76biL0wNUWCbJMflF2aM6azbJ2oCD6D25KeRYvXHzTa02Z1TfPMJb4nSixbp+A/afdDS
 nTZQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUO9WSA+mm4Z76H9m2o2d/4kHG5wqafZhMpWzwYgWKWuUfEzXCnVQoDTIc8gkeNK0pvgn6hwg1dF4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YySvktr5B80s2YVzs9DiG6BwVYXll2p3mxEQyxSM5PTQMHEE0Rl
 O8yjKjqVW9MI+5Kb3qrZw5i6PGONqxREId1xuEAIUg4X7RILpepZvid3H1LmJZhHRC0FoLK4QOr
 rtrCPfjf/LNlkrEpVdi3gVPQw5PATRHi1l8sTm+hAZ5zbSicNG/52ufX7vBK6cO62/8zeMag=
X-Gm-Gg: ASbGncscUO/bV4I6gt9r16YlNHUdk+CRHVfpAEaD38kMeLTRXt40JHHSOLOe3hzU+f3
 ClksoK1sh67I8JZwzTjq0uVzdR1wfkuExdMUnUyLK1Y1ZQEH+o9a+ZU0knYaQ9QyO9y61SkUtiP
 lqX/ktQcRJwoDL0v/COMyNhhtYrPeAYJoLYmHZx5k1GsMxabGfG9Zt9pIwSVsO2YBQr2IKMXrlm
 7FOlFOJhB7T+6qxuI1Xun8N8DklqQMzA3LztbLR0X9M884sGVLb1VC9kvbvKRcxakrZs1cLgi1+
 3zhPk/CPXt4vdtfq+BPWww/xuJ/kAiP4TRhE3HxqHy9k3Apyoqlt3B+J25ChHPz5
X-Received: by 2002:a17:90a:5186:b0:329:f7fe:19a5 with SMTP id
 98e67ed59e1d1-32d43f98f05mr6293819a91.29.1757320094450; 
 Mon, 08 Sep 2025 01:28:14 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGdVtgX0M/N/rY2LTPdVh7osZsGoVH4LY/vXWFtabGHHLKji5snSpH3SYJgpihN+vwguCSC2A==
X-Received: by 2002:a17:90a:5186:b0:329:f7fe:19a5 with SMTP id
 98e67ed59e1d1-32d43f98f05mr6293799a91.29.1757320093944; 
 Mon, 08 Sep 2025 01:28:13 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a26bc9csm29157523b3a.18.2025.09.08.01.28.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 01:28:13 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 08 Sep 2025 13:57:05 +0530
Subject: [PATCH v2 12/16] drm/msm/a6xx: Fix hangcheck for IFPC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250908-ifpc-support-v2-12-631b1080bf91@oss.qualcomm.com>
References: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
In-Reply-To: <20250908-ifpc-support-v2-0-631b1080bf91@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>,
 Neil Armstrong <neil.armstrong@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757320036; l=1733;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=/iBCcOjQRFAJtVUwHHvMO3maSUVXqEkyAINnqw7b6JY=;
 b=Yc3JK87kaA/kMtzrzX+y6eNZdaAWw7k+Obs994LrA1qoz1b8udhNxiU9ISGaVPNd52mdKns7W
 Z0IwaVVAB7HCHJIaFZwWBSBsREqhcuWIDUiL/aTaxmzWKwQtskHSNn2
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: HV74bZPqCw6gaB94Q2w4HmWh-O_u0UyH
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfXwW4i7I4Tv1ra
 w8Qy41462nIEZqRE7q1mmTpudd7WQS+JY6NpsMYQXdfIBUJD1qMexyrz+35MDcpoW7Rm6Nl05qE
 fymUvwhNrm0bUSIe3YV+KpzLGveaInVXncISwi71VbkxLy5TLK8k1PUqGGQn9axWMkgFjcIwDtH
 8Lzh8+DLmjx4JQVnrhGKOVgD/dU/BqGiv0+9e/RC6PTnFjbKmm5+mTkVJZOyyP7WcXu3C+7M5NZ
 9U1YFh0f1oOny58+0emZroPUqVh4wyHwVRBUcWL1qWPKzi1Nxvh5W1wfn9ZBt5KvLrYQuCu3ekP
 QiAue2RpXdUw3MB1baL69Bc8/PiZuFQDcLaRc8ynzAq7SUAflwPfg8Tq8myKyhxfevgYOeM6a+D
 GqJ46ZN5
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68be939f cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=DHE891H7Gske2VlohvUA:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-ORIG-GUID: HV74bZPqCw6gaB94Q2w4HmWh-O_u0UyH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034
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

From the hangcheck handler, KMD checks a few registers in GX
domain to see if the GPU made any progress. But it cannot access
those registers when IFPC is enabled. Since HW based hang detection
is pretty decent, lets rely on it instead of these registers when
IFPC is enabled.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 15 +++++++++++++--
 1 file changed, 13 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index bba09c02f9809ed24b4a9c30b1eb993ce01c7ec0..61538b6912883a0e7ec7802cf5f5cfc8649ece2b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2417,13 +2417,24 @@ static uint32_t a6xx_get_rptr(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 
 static bool a6xx_progress(struct msm_gpu *gpu, struct msm_ringbuffer *ring)
 {
-	struct msm_cp_state cp_state = {
+	struct msm_cp_state cp_state;
+	bool progress;
+
+	/*
+	 * With IFPC, KMD doesn't know whether GX power domain is collapsed
+	 * or not. So, we can't blindly read the below registers in GX domain.
+	 * Lets trust the hang detection in HW and lie to the caller that
+	 * there was progress.
+	 */
+	if (to_adreno_gpu(gpu)->info->quirks & ADRENO_QUIRK_IFPC)
+		return true;
+
+	cp_state = (struct msm_cp_state) {
 		.ib1_base = gpu_read64(gpu, REG_A6XX_CP_IB1_BASE),
 		.ib2_base = gpu_read64(gpu, REG_A6XX_CP_IB2_BASE),
 		.ib1_rem  = gpu_read(gpu, REG_A6XX_CP_IB1_REM_SIZE),
 		.ib2_rem  = gpu_read(gpu, REG_A6XX_CP_IB2_REM_SIZE),
 	};
-	bool progress;
 
 	/*
 	 * Adjust the remaining data to account for what has already been

-- 
2.50.1

