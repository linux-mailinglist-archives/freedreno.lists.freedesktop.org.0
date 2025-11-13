Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 920DFC5A8D9
	for <lists+freedreno@lfdr.de>; Fri, 14 Nov 2025 00:29:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6952A10E964;
	Thu, 13 Nov 2025 23:29:53 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KvOv8OPQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="EvkaeHpO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 784C010E965
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 23:29:52 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMacJf1484502
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 23:29:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 DbqxdCr13kMbVMqadmJF4CnX3GwPJlihXZxUWaf1cSs=; b=KvOv8OPQjRl0Yk6N
 GG6XOAzcr2BgYjbcy3Hs5UNvU9iudmZVNrf3cQqHxVsQKx2A7PqUJRSKWEgRRLTF
 XLIOfAXzjHxgWMwdeuhLCThWdMaEJ+tLP0qgmN7G+qWSVjwQtpkL8ZAhLjhz73lN
 h7cgTQz8EDgf/V1K+WSOaWCz6z+hLrSL+RZuaNpSUvQ8IsJTLbtBQJijIMNiB9qw
 xjqSh9DVrZu+8NeGAq8aD9usSriFtPAOCOwQaiOrOfHxUuEqrrrbDhZF+4YJL5qb
 9xS+KMZ38VU++4KwUPUNNkpSvydDd06oWAUx55m1StxImY7kVw1mZ3b9LHpKPgJ7
 U8qA0A==
Received: from mail-pg1-f197.google.com (mail-pg1-f197.google.com
 [209.85.215.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9cg42m-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 23:29:52 +0000 (GMT)
Received: by mail-pg1-f197.google.com with SMTP id
 41be03b00d2f7-bc0de474d4eso2866036a12.0
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 15:29:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763076591; x=1763681391;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DbqxdCr13kMbVMqadmJF4CnX3GwPJlihXZxUWaf1cSs=;
 b=EvkaeHpOPHmMO7T9wmc6huyeHnvRUmA0uIipu2EaxB73RfFbqDQjxEpiohOl8Xzxpd
 lkNfkjTJ1Zo2r9cLUDIQPAlezlO8Ih4F9VBOG1Vt4tF08rbmIWQJj6LL6oeeJvetNwIV
 yV7f1hZ4jUuwGelslWka/jkK80BVxQZM7pS8j5BCOflaYvp7b4xZJjyfLHogukNN0Yxc
 KNyqZpctosfZxBvafTL+H71Q77jCHcZSrdFaUFGzN3tTyof3b3lO9hkEqyIcNGBU1gij
 FRr4GPhxVDK0UoQJIbl5EY7MmY8OTOiR5bChSVJZLamM2p4MAohyF+7xCARp9izrRqAB
 3VxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763076591; x=1763681391;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=DbqxdCr13kMbVMqadmJF4CnX3GwPJlihXZxUWaf1cSs=;
 b=BzIwG5H4WDWj+eDSn4BT7NClZaqXDm1Dqe0R7VeNNxMyUlMV9wmGqAF3T91zAVU39G
 emZ/9xrD7k8jr8+pmy+qsgR9jamFYuF5gsBnUPrPgH+/fEU+CJUP9jANDi+NypiG5SEc
 bOp02Z+PuBmR75AKEi2PmA8eFj7uOm3iMJUWMyty994C3lkAif8tWb4vCF3zpuPnhylQ
 GKXEQiEqWcWS/OzXkZAsDNuxSao4isP67xj3AEUKDbJd6FihVyfuWReZV4DSlbGIwHsH
 dEARPoi6kidsn3FJQDlE93hzxNq/tYjn+ukkrehfmPTqlJOFg5g78sh+3HyA3P5N5J2Y
 GukQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUKcMllPO+gEf5RTPSHr7z/vYa4zfrj6hjgVPHRlfTXIcWx8o3FrPPbD3hX1usAgiJ6X2Q+EQvSVIc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzmfvSD/vXKBeh+VEJ4uZuUZvtft2juDcWCmgibFAXAERJH3Jn2
 kW+CYgJJQl8AXw0IkMkQIaOA8YZAznGoHCJtuxPk2OHDWmuWnoNdG0iHyyU9c0MpMyan7ZIoa2Q
 1+rdbDQytsZlEBtCEtGBuIc+ADFMLLlvISWrZ63LbyQUrx8QJNd3TIIXhWAatwC/0HsvkTuY=
X-Gm-Gg: ASbGncu69azVKrnaO3lIQqsl1XomVTvZDJNDlgnAuXoiYHJQIdc4uvrNe7c4XcVaGPc
 RgSpbT5omebKRXdn/dhxO2mPdML0ZwrYmh/ADUygmrnbqlTe5Fce4O+RdZmJ47XFBbjmTtHDK3+
 qWCRBjWaAbM+RvjJ+Z70EfgWfP2NZu2yw5F0MqLcmRW2uZXvjB1b1hmXUEmlbwCGlGOHwUh8Kf9
 Tw1/WT4vGPY5IcWSOGI6/qMV3p6OPgb/t5COLtOMwYD3UfcXmW0cBmE8eHFr6aKHs1yQg+NVafc
 BNfE6DB9OJwBxZvUhNsgESijVNa/JDRFRL+CR8fOgCylbZWpsUxAGBlgbVpuxfcWUBNBWh5Upwi
 Q5iIzrnr9NRrNN5B/bZEQwKc=
X-Received: by 2002:a05:6a21:999a:b0:34f:ce39:1f47 with SMTP id
 adf61e73a8af0-35ba1d8b9femr1418093637.38.1763076591308; 
 Thu, 13 Nov 2025 15:29:51 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEeBbGRvCFU+UB+lpyJ3viuKd80lm9qg/SW6FqrTQPCqEVq2jmUv7RyRXNmK9UZPN5Ft+Hy5Q==
X-Received: by 2002:a05:6a21:999a:b0:34f:ce39:1f47 with SMTP id
 adf61e73a8af0-35ba1d8b9femr1418047637.38.1763076590803; 
 Thu, 13 Nov 2025 15:29:50 -0800 (PST)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bc36ed72cd1sm3049486a12.11.2025.11.13.15.29.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 15:29:50 -0800 (PST)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 04:58:58 +0530
Subject: [PATCH v3 01/20] drm/msm/a6xx: Flush LRZ cache before PT switch
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-kaana-gpu-support-v3-1-92300c7ec8ff@oss.qualcomm.com>
References: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
In-Reply-To: <20251114-kaana-gpu-support-v3-0-92300c7ec8ff@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Sean Paul <sean@poorly.run>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jonathan Marek <jonathan@marek.ca>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Connor Abbott <cwabbott0@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
 devicetree@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1763076573; l=1701;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=P0TGR9JNBdFdJf9lbTMB3me/b527sl6CR0hvyTZlFRU=;
 b=I95TcxJrZo5IfCg2YLag6wnr+kCPKB/xqUAfc8bUf+PfKRdx17k8+cUdMO4lgWu4+f96+05+p
 nU3+6ArVQ+8AtFUkQwj2m6kgMzzvLE2RHpuoKjwRJqkhXIvMDr5t/LF
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: JnmeNXZaMUgNuXDXaNDam-R7Y-Bcw-sQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTEzMDE4NSBTYWx0ZWRfX68i8Q/9nTidi
 XdJsAY/QZyUy3m0e9ER3BAgtbj77z4lZdzX0S35gvnwFMcUaHH2ibMPG5KYJM0+xloDhKvFa7f9
 cn0omElNRMsdr/ldkGREQyQ34w+jBiOyCiI8R99/et5W1hRtt7iwgWO+E1wV0XM8U1CPF8Ki/5k
 Z8x79MnNftrnPCw/PBrJPgBZjzwy/5r1FZFPKrF9yqHBUIVgm8UOh8dYQYK0hQEGjDsW1zvHmKH
 BhzaeMj7LQBqWrB0fnBo32bU98Z2exMRMgCoubqS9W0EPBOFQtlI6jVWMOMzrCPmWK3JZbkeGkw
 FCdqoPewKQLCT3z4GfrMKtxvQPr3PhtnorouCydUYsS5xMjkMRLRYjgjCv+8YY7HdZm9sfbssiQ
 H2jJTcmtF9JyQbWO43npgFxPAzzw6A==
X-Authority-Analysis: v=2.4 cv=MNdtWcZl c=1 sm=1 tr=0 ts=691669f0 cx=c_pps
 a=rz3CxIlbcmazkYymdCej/Q==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=bBR9okFf-Jgdumx6fEkA:9
 a=QEXdDO2ut3YA:10 a=bFCP_H2QrGi7Okbo017w:22
X-Proofpoint-ORIG-GUID: JnmeNXZaMUgNuXDXaNDam-R7Y-Bcw-sQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_06,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 priorityscore=1501 bulkscore=0 spamscore=0
 clxscore=1015 lowpriorityscore=0 adultscore=0 malwarescore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511130185
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

As per the recommendation, A7x and newer GPUs should flush the LRZ cache
before switching the pagetable. Update a6xx_set_pagetable() to do this.
While we are at it, sync both BV and BR before issuing  a
CP_RESET_CONTEXT_STATE command, to match the downstream sequence.

Fixes: af66706accdf ("drm/msm/a6xx: Add skeleton A7xx support")
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index b8f8ae940b55..6f7ed07670b1 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -224,7 +224,7 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 		OUT_RING(ring, submit->seqno - 1);
 
 		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
-		OUT_RING(ring, CP_SET_THREAD_BOTH);
+		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);
 
 		/* Reset state used to synchronize BR and BV */
 		OUT_PKT7(ring, CP_RESET_CONTEXT_STATE, 1);
@@ -235,7 +235,13 @@ static void a6xx_set_pagetable(struct a6xx_gpu *a6xx_gpu,
 			 CP_RESET_CONTEXT_STATE_0_RESET_GLOBAL_LOCAL_TS);
 
 		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
-		OUT_RING(ring, CP_SET_THREAD_BR);
+		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BOTH);
+
+		OUT_PKT7(ring, CP_EVENT_WRITE, 1);
+		OUT_RING(ring, LRZ_FLUSH);
+
+		OUT_PKT7(ring, CP_THREAD_CONTROL, 1);
+		OUT_RING(ring, CP_THREAD_CONTROL_0_SYNC_THREADS | CP_SET_THREAD_BR);
 	}
 
 	if (!sysprof) {

-- 
2.51.0

