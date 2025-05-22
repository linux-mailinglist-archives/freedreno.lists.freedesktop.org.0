Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 075A7AC141B
	for <lists+freedreno@lfdr.de>; Thu, 22 May 2025 21:05:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 95B3010E985;
	Thu, 22 May 2025 19:04:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XnZgKkb1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B282010E923
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:04:55 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MFp6am006792
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:04:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 jnOg1M2bZC9YlYkqITQA3w9t/g70zzttTgLTdcMRUEQ=; b=XnZgKkb1y5kCdNSE
 DDCpHhfHzDETU7Fc+uWpW1f2BnDyapKJhLGf4bAqOi3nxv36LfFth/LyXViovxpI
 Vay9jtGoq5Wmuwbyzeiw3Fb96oJafy4H33mXEKn0C3A0TJGxR3j2U7HEUkXO6gPs
 XfO5RhlvEyeTfw2iz9phucwQ5KcR+M4I4rn9WEsg+1Sqirrqx1aNofM9Y0VuZCAn
 7p3dHDUzr2SOeESpyUsGljkO/ydL1qc0g77ITCovFp5XsRQATDnyYg7gVFDSpgfT
 YRfy700/cMXK4WjSBfrCCNAKlwyebbnuDU5KsDc5Ga10sFOECJFgaIzoN5wPXJpY
 sVw4IQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf0qkvs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:04:55 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c5e28d0cc0so1372503885a.3
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 12:04:55 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747940694; x=1748545494;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jnOg1M2bZC9YlYkqITQA3w9t/g70zzttTgLTdcMRUEQ=;
 b=lu2BFkK7vE6Z/fNMq8dayUeOc01ZFOezpD1tZTjifCK4lmPaxiWUx1PqsT32jwfPWU
 wSvR6bKis55Qm+YodzFtMdmzdzzjnn/dL2JgM6QfoioSJkX/4pKpZ43KrDyjVUmmq0nQ
 0jLow42ZE71Qs7QS7MvIY5HX02I6qop+crdPAYtFZ8BfFW58e1lz+WzDTZmfK40MDUiK
 Tu2dbGEHvs7xqx7U/y91ILVYCQ2slu3oXHhqDhrYuQKWQuJYP3HCC2BPFDuvJTJx5GRO
 KXYm3/9P+9JZOe/D5GIegVAxqKSIo7i5dzUWMuDgnIN0H+lSyNaYesvs+/eZyq8nwy6J
 zkbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXetuhkct6ElJy4vS/UDozXXawYG1QMtoOGv4umxbwt/8JEXWYL/dpEu9AG1RozKkXcZf7TrznsGcY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIWKTcqIOBAz8qhHWI5hgAvZGbk0ZkSF3AuQy89r7i7e5vNlmC
 rrYxas1poV0tW44rbYmnHClURAMM7azkw5L0MGXQ1RQHZwfax5u5jqcA0O2zgcKsscy5F2y5J/O
 /PFsMvZqZFS5kBu2eTis9PJTwCzlh2n3hHNeXbKxFCMWeqWTShQJGlD6lscy0plzMQNQlho4=
X-Gm-Gg: ASbGnctwtnfM3vsZindXIf6PmXYJrPDLq3cAbAOrWtM08H4oGQ68xczHs++qVRp5RKs
 iezd0KVuOMxGNDnBgUQsPxbfiDJwynZYE27zO3+nfRJ5jODUPW4y4l9605rQuexy0VJB1BIqDOv
 Mt/U8eQP2Jdb1R5+Fi1dc5eUK0MsoqAZ5h6R4jl52AfrHXnM9qfWMbNorfCM0AFFbgkPQN/M0UO
 Tbr1LrXURLKITLJUr8YxqLsIC6n05/RPdqE5jekntTIOficZD10sXzuGudkKYTWFy8nn3Fkr2uT
 g+L20ukwAvRt7yOb+vC32y4ooAsnOb692SNia2uGZ1TFe/NFIYPJ/ByTjrNPJUd0/zs0qMtjoTt
 g3YiJ25y4L15AGuAi1hBKX5jr
X-Received: by 2002:a05:620a:400f:b0:7c7:694e:1ba0 with SMTP id
 af79cd13be357-7cd4677d294mr4167212485a.44.1747940693805; 
 Thu, 22 May 2025 12:04:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHjcLc2sPE5Sg0jgDhOzm+gjAvrwhMlfl9yw4J/cxGCECts0yRwpyzhheSdHFWbTSgZfN+8qw==
X-Received: by 2002:a05:620a:400f:b0:7c7:694e:1ba0 with SMTP id
 af79cd13be357-7cd4677d294mr4167207085a.44.1747940693346; 
 Thu, 22 May 2025 12:04:53 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 12:04:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:48 +0300
Subject: [PATCH v5 29/30] drm/msm/dpu: drop ununused MIXER features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-29-3b2085a07884@oss.qualcomm.com>
References: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
In-Reply-To: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1176;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pxAdYTmaogRQHBMvHaDa09r4i4VRhS75YE1TSgSsEq0=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3UAMR8c8v1LH0Q5G+F+m4l8MrzYG4LWw1Z+u
 LhhMQ4xUX6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC91AAAKCRCLPIo+Aiko
 1eScB/43JoU+oCxhxPw8J8RbiyMcraZ8IT3l2HsG6AYvn7TMPCqdkAlbM47zI0Hir17zhVefYZz
 yKxNPG4vh9+fnzoLUr5h+TFrwVUIAz31mzA4TE0+t9libr48MWMAmWbDC8YXTeu2guOOg14LeJs
 2eRmxS3Qs0Txcd77G55RudXbmZhbgd9enJ+tRiT0+Osjoj5xBMYPK4IGa2B96qtX4ZW821QuRmb
 VuOLOywiyra8uqmdVYtQSXV64wDBndYCC7ttalKBGTvUO5vQYB2GgQlw/pftMqFHMw5ZEZNjcXK
 gfI++5ls+vfXoZ5U7Nhq9NwmxAKqzrMnCIWsTLRZb2GQal91
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: fCShRYkAXOFmfyEZcHTWLXhsjiT6xpoe
X-Authority-Analysis: v=2.4 cv=J/Sq7BnS c=1 sm=1 tr=0 ts=682f7557 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=87smWpNc5u_ETeg062IA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: fCShRYkAXOFmfyEZcHTWLXhsjiT6xpoe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfX2zVv5ncqfuyW
 sPtq+/TlZ2KYKWfQ5bBN59PZrx2pZYqcR9W+RxPl+YWsd0yFtDpV294tLpyU0avOyCSmGEmoHON
 +m5oL1390rJx8Qp4ZzDTRGm6tiIvqwAPzG6Z/00anJgjr0eYectckaJKi0330mW7lx9Eq4PF0np
 lbVBMDTEhmo4jdOqA9nc5Ck0WlGu9I4haHHwkf5gbcxL7k36Wlo0+sTFYCVvNwUg+v+edKMCJZ6
 Ul/X1csnoIpMHF8rA9lBWohIo52BukeBniT+aPEkTPS4THtp9fag/0JySpFKIjIPbUU9rI6sKlq
 VNAOIRFe4gQsCM0vx0IhBfBsFZYSH2MwrV08yKc8uvSDZm7L5glq9aklQs/xGJlNonqTsAd4KjR
 uS12ABWrjYNaJVaF+SgpoHxtXr8WlmxGkplGMyGBa0xS5l1rniVVds23iRR5HH1/5n6Ibhrx
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 mlxlogscore=999 suspectscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 phishscore=0 impostorscore=0
 lowpriorityscore=0 malwarescore=0 adultscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220192
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Drop unused LM features from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 8 ++------
 1 file changed, 2 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index c1488a2c160b0e2ab08243a6e2bd099329ae759b..d51f6c5cdf62f3c00829167172ef6fd61f069986 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -66,16 +66,12 @@ enum {
 
 /*
  * MIXER sub-blocks/features
- * @DPU_MIXER_LAYER           Layer mixer layer blend configuration,
  * @DPU_MIXER_SOURCESPLIT     Layer mixer supports source-split configuration
- * @DPU_MIXER_GC              Gamma correction block
  * @DPU_MIXER_MAX             maximum value
  */
 enum {
-	DPU_MIXER_LAYER = 0x1,
-	DPU_MIXER_SOURCESPLIT,
-	DPU_MIXER_GC,
-	DPU_MIXER_MAX
+	DPU_MIXER_SOURCESPLIT = 0x1,
+	DPU_MIXER_MAX,
 };
 
 /**

-- 
2.39.5

