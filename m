Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 341A0AC13EE
	for <lists+freedreno@lfdr.de>; Thu, 22 May 2025 21:04:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2597010E807;
	Thu, 22 May 2025 19:04:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mPHlmqgd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 955E410E807
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:04:02 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MGEAp0009837
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:04:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SAXuCHIXzob7I7yDg4by0JQEOARzxYVn7zXbtJ2VPvk=; b=mPHlmqgdOd+nPfI0
 NHDnL8hyhJjcyor/EpLFFA546rCa0gX5hsTTx8ACMqWiTlCdaRddg/py1jqfFpAI
 A/xxHkY8/2nn15WM/xohI9f+sn6+EQo8CloAE4LZRSrIVcZOorbBmzpXrLKVBDBv
 KOa466GL4dwwtsW1/gDsvcAcULvDIZClTN6epOhVRVbp8dLBbMzoxVopd7pP3jyg
 Jgc4CeFkg17280DBE2pFh7Eq3MqDCMdYrD/GE4T+Iz9EJos2NWUSFtE9PqdCdWEd
 xAaNGlBS+J6nq3XKyDT/TLjK8VLyUm2DvQ1IxeTP8to+JbhzLDEIWv1q9Ip4qT1a
 NtgdDA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb7b4p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:04:01 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5750ca8b2so1214580185a.0
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 12:04:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747940640; x=1748545440;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SAXuCHIXzob7I7yDg4by0JQEOARzxYVn7zXbtJ2VPvk=;
 b=vWqsjjLdkmBp96R44P7DhutHJJd9DMuoOLWGJfIz6gkN8X7dOfIHLtasnj83NdqNqz
 IGKwFHOWfhjqWAn58W5zOnfsoK74SdxJEzRNmSnIFldaOUxNH5BHtgiOTRrbG5+VAEFH
 zzCgVWqhRH6Hpsoo1Q/N/0JpFq4ANfuxDC5dr/vMhf61aE9fCXhQlr1xPOUQ9rz9PmgQ
 ZjDDDgOUX42pY0YKdd2+fXLG0f3dCRh9NhnqNMbPB/2b+hAoX8hfIyjyL/7/C3NLfdp5
 h9dIVexXryPXAhmzDVI9Ww1Cgk8zXAifikR7C4PhDAuvLpvZoQ6ffS+23NWFcRqnZBR3
 kOYg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrVdePpQDsAHjleXQMLdC4OTM7dlAHF0NQbY5PCssoxA//P2/kt+O4N2hpIqXCTxILvtpIHgQLm8g=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz1SHybYAr4mWa+qj73Isy583yF/gplwE1JorJ27aUdYLSABRNQ
 CQtbmOSZ2UPGkXq2tygyUIpfjrIP90nAY6984DgyI2eCtTP0xRy8s8j6uWOwgbSLZohKzRZyJFx
 PTCq6NkwsRPc4GKVwSoEbrBaJjsWzmpfywyNK6XYnWCbJn7LzZ5b4yUrOZK/ErEyGECOxJJI=
X-Gm-Gg: ASbGncvDL4dhhoJpYSqP0y/TZszvQ+g0FNTfHVIZyr9Sowt4JJowh7KzGrWQ0OoiDpj
 LakT/jdVHOp718uCWnSSmn/MHThgs+ed61NXMec2Z4okefVCkuxcBuY7E1Yh99FwJjvXY4VefyR
 TGXTT0LK2/EBjnD4o6cSv8eguWsB0ncyWUt7hektoh520j7oa7Uug9jqMKUnBAQXJJxa8gryIAS
 FmY1+sTTVtE/Mljh1YqoL0KHyZQZB9kBTapp2swMz8PU3A84xXAs/AcbPnWD1pUY9odxS9US0gr
 jLnN2nJiUKpjpRqoahhOCP5ZjkohGTz+rm4bVEYenU3vkaZsq1YPe8Q02TbbF7AWDxcrSDYE6Um
 3lZDBb6UwxKhwGNFdFv5I2s+j
X-Received: by 2002:a05:620a:400f:b0:7ce:d352:e2c0 with SMTP id
 af79cd13be357-7ced352e386mr1146829985a.25.1747940639729; 
 Thu, 22 May 2025 12:03:59 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFtop1DYOBlB+JkelLga98KWOgpBTnz/VdiqX4EP3GRjMG13kaJhcMsqY3geHDRZhiht48xFA==
X-Received: by 2002:a05:620a:400f:b0:7ce:d352:e2c0 with SMTP id
 af79cd13be357-7ced352e386mr1146825485a.25.1747940639378; 
 Thu, 22 May 2025 12:03:59 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 12:03:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:29 +0300
Subject: [PATCH v5 10/30] drm/msm/dpu: get rid of DPU_CTL_FETCH_ACTIVE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-10-3b2085a07884@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2649;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=73PNb9U9hPhtgDIYoKDO+U5RvVBCB7fQuR7leMk88VQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T9Ulgcc13VbVg3mZTLs57CraySRoXFZ3SMP
 Xnb3jmUDjiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/QAKCRCLPIo+Aiko
 1cwyB/0VZxlJnkCsz1D9/IronGDMdIKooY2W+C8xzh923SPBrMQs1H1xI2jVhTZx+u14OTyjE0R
 SNUFfR0RDAbgcVxRmjtHM2iQFpLNCfzZae+qPvsw4LhwZEI+dQN0Q0nmtaHUnCNiWt2cBtUni0E
 DB2ow8sHTIMbXq7vWcOgMFJ28Yn/ZDvsp24MMI4UO4uGoVmkT/h79xCSDZ29k3Olh61DreMw8a+
 +kC2lb4oW1WemQu1BMBLsgGzUHRr/bl4grnC1Ma7M8kZlUw/dT6Atug8bzxJyvgIPg+THdsEzH5
 Y0nlt3/br5DFL3aipAVNa/V+I1gIxso1XumVWcETHsAKxFaP
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: UmIin6KLFQl_0Vn4wUiPV4ujovNRm48L
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MSBTYWx0ZWRfX9RIo6wdlSXgv
 IeORQScDVAf7XPA8u5RaJMYeDhw0REUBjXOBmMvYEiNT5/cgISQh5a6GiGyf07RsCUvrY507+2P
 cSrloR3Ae7EMB0jMswvydV3aVYdgNAw+4DfJK0bdul9HKcwOhAW3YV7iQ1QEd2Q0RRapEffAF7X
 KO0Vli5bKmjhBDGFMxlQnpkwWcsEA9Jm09Cluj9D8GxureXVr/1zXqnshHX7dNaILc1JD7kSM9k
 e7j4IJ1rp2xczdgltSZifOlaWqe6vz+5snqlzYvPIIWCuxhwaMA1UH2cPPpiTR9ryvc03p7kQEB
 EcSmd17M/qqBA6s2bTmtjbbd2ttle040p2lBwepivy2ipX+JjNfJT6NanQi4khYmQJrhQuexr7E
 kSswTKERQYhKiJK+UVJ3dU4h6ElRSfqkPnenyAzbIOdN/6HmzNjb1eR+WmUrMEzCIviOXkwY
X-Proofpoint-GUID: UmIin6KLFQl_0Vn4wUiPV4ujovNRm48L
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=682f7521 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=1CFBwsujT04XwbEipTUA:9 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=925 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220191
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

Continue migration to the MDSS-revision based checks and replace
DPU_CTL_FETCH_ACTIVE feature bit with the core_major_ver >= 7 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0863e5cfb3283ed32f61ddd4483220742df8633d..6fed2cce082c476c1f7f8ee683f2a6f3eeaa5231 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -105,8 +105,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_FETCH_ACTIVE) | \
-	 BIT(DPU_CTL_VM_CFG) | \
+	(BIT(DPU_CTL_VM_CFG) | \
 	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
 
 #define INTF_SC7180_MASK \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 9981d090b689b46bbc378d1965b0efd1df0efa8b..82f04de6300eca7d05ece3ac880c26f3a56505b9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -132,14 +132,12 @@ enum {
 /**
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
- * @DPU_CTL_FETCH_ACTIVE:	Active CTL for fetch HW (SSPPs)
  * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
  * @DPU_CTL_DSPP_BLOCK_FLUSH:	CTL config to support dspp sub-block flush
  * @DPU_CTL_MAX
  */
 enum {
 	DPU_CTL_SPLIT_DISPLAY = 0x1,
-	DPU_CTL_FETCH_ACTIVE,
 	DPU_CTL_VM_CFG,
 	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
 	DPU_CTL_MAX
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 2dfb7db371a3915f663cf134e4dd62f92224185b..772df53bfc4fcc2ff976f66ef7339be1ae3da8f4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -809,7 +809,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	else
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
 
-	if (c->caps->features & BIT(DPU_CTL_FETCH_ACTIVE))
+	if (mdss_ver->core_major_ver >= 7)
 		c->ops.set_active_fetch_pipes = dpu_hw_ctl_set_active_fetch_pipes;
 
 	c->idx = cfg->id;

-- 
2.39.5

