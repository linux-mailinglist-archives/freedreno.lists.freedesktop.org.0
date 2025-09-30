Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CA46FBAB86C
	for <lists+freedreno@lfdr.de>; Tue, 30 Sep 2025 07:50:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B6310E4F3;
	Tue, 30 Sep 2025 05:50:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="maM9JAzg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3836710E4F2
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 05:50:27 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58U4HjAr015093
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 05:50:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 5DcOYuuJJ+cW6vFNFMyOqLHX/YGKWTBxTGWvOie70iM=; b=maM9JAzgC8bn3UtP
 bK3l9Mr5pbIBVnd51dGsizmhHoKWbbpPi/8nG7N4p9sJEp+cARaCmUjI/BafMMBS
 OShbyK0S7NsVakVVhBPMC4di37if5ePlKzRjD+GcdQ+CjyaUmHzJt07bNQu42aDB
 nIlUYI6k8sfMZbjTEQKa41YRiaeXreNbDHN52R5E/qafzwncU7iaFwjom1g8Rb1f
 Hv4nzvTG68XgnXz7uoQMVUPqb7cA9QMwsFlMM1lj3AHvrhfTZ+8Rlj7Jzd09iudx
 tO+gOPVF28/UYIXaIVF5CW51UdhMXIA0SlO0BMYVP8hrofLC9foRJ2DHMtvG470Z
 SC9o0A==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49e6vqyswb-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 30 Sep 2025 05:50:26 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-32eb18b5500so8787492a91.2
 for <freedreno@lists.freedesktop.org>; Mon, 29 Sep 2025 22:50:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1759211426; x=1759816226;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5DcOYuuJJ+cW6vFNFMyOqLHX/YGKWTBxTGWvOie70iM=;
 b=hDvklSH2J9WkLwSqJJN4DTXVmUiDt0PnyHZVYYy4yhTJKTDS37GrWoJxbSs5f4vFs9
 ila/YcxHO+An2/y1S/wrOmhqI52S8HXpa/cmq0bjC2hreix7O//nRAwl20muhQLrYrnP
 yVQ314xZlqEUDg/vc//jg2YfSRVib7Cp2ia+PbBRdRLf0ynkwsf9rbMvaQdm/JWG9cEK
 +J9v+OllA7/tMecK7iJq6fYSVg8Wc0vkFAiFn1MCe4Y9nyEm1Eu78Zrzr1i21uXXF4jW
 1GDbsiEQIkdt+aqQ2F1bkKco84ARBq9adFsaJ4ME+BcILd0audZHB6aBxg/KcUf4EQBC
 lK6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNp5z4SDjpVKqoLrQsdk3t+sgjdnnWA7CSMdjm54X9oOX4fgDCyrRSxSIF/R+7Yn6yZ9SF+GMugZY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwWygMDOjyPyFMIPzR3IHI3QLno8wX35EfdgDPyfzP4RBrEdlVB
 Gzmh0B76qhSVlcGmWM4YSWD5chXkkYvp6WH7Fi9geOr3h0JTUM5LX/+ddCEIqTI8XyvOzv0zp0G
 Eh+Mq7hB/Ok9j0ciPEXlG4ZFnoMNarwIurHBfVf72Uo2YneLi2nfFItyE6DaPcUcrLcaNAUk=
X-Gm-Gg: ASbGncsZN98sFUf5PE5DNTYrBK0GJJ5iEoGDxgYVoLthsN0AZqh6Ywncc3d83oMr4Mz
 n4h8CQdk6xv0UTfr7f0Cwb68NsvCQlvzl5qzgKLJN53R8XnFdQG2hn4g2eieFlkxwwJnZFEwhts
 5NdI7SZ3ejRUs0dzvG+WCwMve6pQLJpEAHJKwF6xajS8RzCO5UVEsP8V4Wswb1Y2+MMvNOJXcvf
 Da/cHzqYEa1vqxR/tWHCDl7AZePLTXs0Tk3wLC4xfSQ5T2Y6tl56bFgwVAmZqqW2UiFcIKkzhXp
 FhmxGBiIJPVc6gscoSnjlzUAi4x+Z+Ff3OaX8g2qSt9u5lFAr0ZvHMy1No8ER3cQd1/jqA==
X-Received: by 2002:a17:90b:2684:b0:32b:94a2:b0d5 with SMTP id
 98e67ed59e1d1-3342a318acbmr22583490a91.37.1759211425542; 
 Mon, 29 Sep 2025 22:50:25 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUIQWH84fqllYLQOn6xvNXBsEPOR+cZgKu2hLJ5kpoceLfbQeC3W3x6mtJBPFDPhqUZSJFdQ==
X-Received: by 2002:a17:90b:2684:b0:32b:94a2:b0d5 with SMTP id
 98e67ed59e1d1-3342a318acbmr22583460a91.37.1759211425055; 
 Mon, 29 Sep 2025 22:50:25 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3341be23412sm19029779a91.20.2025.09.29.22.50.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 Sep 2025 22:50:24 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 30 Sep 2025 11:18:10 +0530
Subject: [PATCH 05/17] drm/msm/a6xx: Rename and move a7xx_cx_mem_init()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250930-kaana-gpu-support-v1-5-73530b0700ed@oss.qualcomm.com>
References: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
In-Reply-To: <20250930-kaana-gpu-support-v1-0-73530b0700ed@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1759211380; l=2329;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=r9oQbEwLVJJDIQbYTusbpAt6OAJRxZxziR2i2dJYHBs=;
 b=XtsAQGS6JKr43XfgTE3f3PxKYwJMKqXqAQxlF0DEooff7/mkggdbd/tl5m3RDE7pPZll3vDo/
 khRRRuP4zrzCfhmz8gkqnP94SAjFhZEUgylnY6MbreRTFexF/VIk2LO
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: Ow320Et4ekkj9qeWHS_o44IBciHVvz5g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI3MDAxNyBTYWx0ZWRfXzJIxgi43x5Ls
 UCG8DRKPLZWfaT0j6mUreyKirw2jDiBf5A/ORzLbv6dSWCN/jEJ2hxMvst0ZaQuCBo5bRUpguJ4
 7Temg//ClPcv0g7KNE3ld1BU1+C70zBG4HAtaul7Omhr1A094V4hgBEyBepI8p6CL4DB/QqWmSk
 +Wrm1lDxx4P31mKyvp2+fY9hUF62OHUXwHHvA1QoF1lC6DYSazTrjoAUmpgigdC3q+Waq3tLLG7
 zCzoM0uGJ9cRuGlCe66I9V8RFsWNaQzHXmygg43CYf8UWayyleDjtO6D6S/Q0EnAsCDyUH2p2Ay
 c+xw3X/7LOsG6N/TUqxhayXZXSR33IoLJ09s7D9gJE8MEynoRyahsulQxz3Cs7eJNVDJ8RJ9ypA
 8JKxPTsAT40WXKh/Frz583mYjer4rQ==
X-Authority-Analysis: v=2.4 cv=IeiKmGqa c=1 sm=1 tr=0 ts=68db6fa2 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=HijK2bQ2CIbjB8v2WwsA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-ORIG-GUID: Ow320Et4ekkj9qeWHS_o44IBciHVvz5g
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-30_01,2025-09-29_04,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 suspectscore=0 spamscore=0 adultscore=0 impostorscore=0 phishscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2509150000
 definitions=main-2509270017
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

Rename to a7xx_gpu_feature_probe() and move it to adreno_gpu_func list
so that we can simplify the caller.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 11 ++++++-----
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  1 +
 2 files changed, 7 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 9cc2f008388929f0c8e8f70a3e3e79fb4d35ab38..4be0117c3ab1d56dc81b43ff00e3cc48b02b080f 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -2065,10 +2065,10 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
 		a6xx_gpu->llc_mmio = ERR_PTR(-EINVAL);
 }
 
-static int a7xx_cx_mem_init(struct a6xx_gpu *a6xx_gpu)
+static int a7xx_gpu_feature_probe(struct msm_gpu *gpu)
 {
-	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
-	struct msm_gpu *gpu = &adreno_gpu->base;
+	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
+	struct a6xx_gpu *a6xx_gpu = to_a6xx_gpu(adreno_gpu);
 	u32 fuse_val;
 	int ret;
 
@@ -2621,6 +2621,7 @@ static const struct adreno_gpu_funcs funcs_a7xx = {
 	},
 	.get_timestamp = a6xx_gmu_get_timestamp,
 	.submit_flush = a6xx_flush,
+	.feature_probe = a7xx_gpu_feature_probe,
 };
 
 struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
@@ -2702,8 +2703,8 @@ struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
 		return ERR_PTR(ret);
 	}
 
-	if (adreno_is_a7xx(adreno_gpu)) {
-		ret = a7xx_cx_mem_init(a6xx_gpu);
+	if (adreno_gpu->funcs->feature_probe) {
+		ret = adreno_gpu->funcs->feature_probe(gpu);
 		if (ret) {
 			a6xx_destroy(&(a6xx_gpu->base.base));
 			return ERR_PTR(ret);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 77b1c73ff8946fb0f8ff279e16c973cade50c130..5abe442637e321fb996402fd833711f0a948e176 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -75,6 +75,7 @@ struct adreno_gpu_funcs {
 	struct msm_gpu_funcs base;
 	int (*get_timestamp)(struct msm_gpu *gpu, uint64_t *value);
 	void (*submit_flush)(struct msm_gpu *gpu, struct msm_ringbuffer *ring);
+	int (*feature_probe)(struct msm_gpu *gpu);
 };
 
 struct adreno_reglist {

-- 
2.51.0

