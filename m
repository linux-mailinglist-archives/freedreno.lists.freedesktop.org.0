Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2959AFA48F
	for <lists+freedreno@lfdr.de>; Sun,  6 Jul 2025 12:50:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9A7AE10E280;
	Sun,  6 Jul 2025 10:50:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="goY77ZMh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7E3910E27E
 for <freedreno@lists.freedesktop.org>; Sun,  6 Jul 2025 10:50:46 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5667h2TL029922
 for <freedreno@lists.freedesktop.org>; Sun, 6 Jul 2025 10:50:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TXj2kLxWlavFfODBCwO4C0ty0sy70kRk1f8+2FzBiKk=; b=goY77ZMh7wpYl4CD
 97r0d25IbvAKRjshLAnj/gebj0p7V0ciNSu2pJKCR7nZ5W2rnw7vU8x2pcT8TWMr
 WreXaFnLMszLfn6FJrz3ISm2wYOz3qlwyCIDLOK+wtwm9k1sgmngyxnegxB72q9Q
 cUH59uIqnc2DBCLcXsmdxQNVom040/8Yj/PritiKPxk+LbHNxcP3vWnEBH4aONrt
 mEEccjWRn3JMMfC2csJclEHKVPurYmRsLCW43jaGhuEhH1awuHbXddPRcnmucP6d
 o8383lK+NTs5/RSKWMuSX0recRtg01/A2II/03Lr1TjjfmZVSLKfFUcRM92Rdvns
 PtCYMw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pwbd3du5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 06 Jul 2025 10:50:46 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7d460764849so559484785a.1
 for <freedreno@lists.freedesktop.org>; Sun, 06 Jul 2025 03:50:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751799045; x=1752403845;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TXj2kLxWlavFfODBCwO4C0ty0sy70kRk1f8+2FzBiKk=;
 b=xUj6bUSFPeuVkrPepe5V867VCYMAMkR5ieVJ4oJ3S10TJUH00r6+nFSCg20Z4c5Ycw
 b4Cpem7eMqE2cpcCk3aUT6d/e91iy+VcmaM7DG5x5MaND07UHs37vIulWYQD/+H2LjNW
 xBJON0vDg61CghLS9nZsq0L1NFygxWBfWJLmTADtSZt3s7MlYjucneCzQittSMxQhd9z
 GvsIEC2uZlp7ctSDBnoMcQxcS1lsiVP+TpO3JrxGsDv3f9bO2wspfeNRFpcWXC0jcj5/
 Ih7jvs1eZL8F+EotOIXgNfY8j/5v4qQ4e2R1id8w8WmnzSTF2KnnO905my02FwgKWWnb
 eWMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXkflXV3nxJFTTxG8bvd6Fz15BNSfaWKj13cLwHpjnmQuynPGZ/Pljp4LE/a86xaRTXW1HiwE/8S5I=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzYTVxJStd2N9iJf2yvdErIZk8NAaFD67L7xRsqrq5ky613G46K
 e+FNpGjwgGZb91GfvmJHB81LxKXQL+me0Zg3UY521AfRk3r+95UooDX+02p79xq2D5of80xpoUE
 P/WtL6IkXecI4frGstRiYFlUmJVIvOVwfunCyou0sqDiDZPc2CJKnDLkr12FY0W/Q8oxMx7g=
X-Gm-Gg: ASbGnct6GcyrM0sZPxxpkqXsaIftzNv9u2GP26RD0ibNGdgOGlh6RaeKu7ZqyzYZLlb
 AZKxE5dLkj5c17UFHoDYF0ljfVVAJmJSpiyx0+x173UGtdsSkY0VcG2EE121NqZHavwU+TdOMSz
 1BJNnMNE3EvIKZgjSklIuLukR9v9pANAihQsvzKA/75rOFbAkBGcIcDnLxfQCxu6DtnigihWRTq
 ClI9nSTLRMkyXSK29VEHhd3YYv6lwV4U5VSDw/jXoKniH0yppINJljyEHDlXOyvtYO0hSQz4kM/
 mwuTmmac8lddlgiRJyxG5NeGxLjijI59+prtcUyy8w+2a58p4uJlmvW4a8xgG+xAMU664+q0FwB
 X1OxSCGCKGpuqZCcX5m/nENFYTAnp30N/0us=
X-Received: by 2002:a05:620a:6289:b0:7c5:95e6:62c9 with SMTP id
 af79cd13be357-7d5dcd47e14mr1035825985a.29.1751799045086; 
 Sun, 06 Jul 2025 03:50:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IENzyvjnnPNU0+auiROsO8L9tJv+5rcHPjjuz97ShcVFzt8dFEs20zG+8sIADzQBxRqDaUTUA==
X-Received: by 2002:a05:620a:6289:b0:7c5:95e6:62c9 with SMTP id
 af79cd13be357-7d5dcd47e14mr1035824685a.29.1751799044764; 
 Sun, 06 Jul 2025 03:50:44 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-556383bb555sm920621e87.20.2025.07.06.03.50.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jul 2025 03:50:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 06 Jul 2025 13:50:36 +0300
Subject: [PATCH 1/3] drm/msm/mdp4: stop supporting no-IOMMU configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250706-msm-no-iommu-v1-1-9e8274b30c33@oss.qualcomm.com>
References: <20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com>
In-Reply-To: <20250706-msm-no-iommu-v1-0-9e8274b30c33@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Antonino Maniscalco <antomani103@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1188;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=N1V1r2a+Uu111oA5aVLPWmTma/v7zxodScONBUW8ukI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoalUBQahHAv2TwvvVK6FFPuXM20VbAQOAG8788
 ssuEBgbNNGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGpVAQAKCRCLPIo+Aiko
 1f0mB/9PUKhWISZlHBDACtU3YF/1alKgkRr5n3JHsdRqlQeuTcv7GtWeTdbBgfcxxcR1qnFRZwd
 +o40ttKKbXMaTPm3hfz9nSbot1W+caMuNXSLtZUzk2tDECCK0EGsPk5UrRHzVOV9RGR8fWK0Gqo
 GW9m7ZEIJOJqOPXtzaXSeF9DBgHtbWr4mvxSvipVlRBUgJzUCQ8rmNdkpcvdwB/LWtX+d9OSdGD
 XuiYccV7R44JUN6RSc6EhjfQM953FfA9QFRMvrTSqbYhpy+DrYQyOGQm+MvMJmU45x+ofhnueYa
 6rrDlr4nMhqujzT8V2Zrk7tqCMpl4zFHJMRZGA/hBUIxxDMa
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: qYxfnAy5bwpJPH1KB3yoNBNedLB1QroK
X-Proofpoint-ORIG-GUID: qYxfnAy5bwpJPH1KB3yoNBNedLB1QroK
X-Authority-Analysis: v=2.4 cv=e/kGSbp/ c=1 sm=1 tr=0 ts=686a5506 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=0pe4r8NFi1m0JDAohsgA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA2MDA2NyBTYWx0ZWRfXxmiPViYDUF5x
 E9A65P43xodzkcUPozFQETT172xFi0jkvcDutioNAGLP2KVufDdiwvW2QMkgM3SdW189vngK0hG
 iyubvPVmIgwvkq5OQuykU8hpnxl0RY3/lAV+Yh3qTSPo/MX9H6s3Fl+RP6UbKZT5KNN/2Y3182L
 mfNoB0tHQwrWyHFPfrUCShCNDPkuBJOo2SahsRrMnOKlRyR3rjYKAQ4TcnzshBNPl4IL3dmkTPp
 NK7bfbfXltzyADpJWyjdulG5Y8oPQ8mpK/WV36ZMc/Ff6JyWXySkiW6StEOdlQX6Sf9+cPXiqma
 cklikO7OjMvinJWVVkreUD9bQuZjmxJvgSJgf7VJKrRVRYPgio0uQodmbbhq+ArCa3tBiSvhqOg
 R8t8MEuv/06VokMEFOEEDV1gnrjwPbXawggKt/bD2/0wCEg7ArZ7TYBeNon83438b6thHJ/l
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 impostorscore=0 adultscore=0 mlxlogscore=999
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 mlxscore=0 phishscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507060067
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

With the switch to GPUVM the msm driver no longer supports the no-IOMMU
configurations (even without the actual GPU). Return an error in case we
face the lack of the IOMMU for an MDP4 device.

Fixes: 111fdd2198e6 ("drm/msm: drm_gpuvm conversion")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
index 0952c7f18abdca4a7e24e5af8a7132456bfec129..88296c41d1a5eb0e16cb6ec4d0475000b6318c4e 100644
--- a/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp4/mdp4_kms.c
@@ -463,9 +463,9 @@ static int mdp4_kms_init(struct drm_device *dev)
 		ret = PTR_ERR(mmu);
 		goto fail;
 	} else if (!mmu) {
-		DRM_DEV_INFO(dev->dev, "no iommu, fallback to phys "
-				"contig buffers for scanout\n");
-		vm = NULL;
+		DRM_DEV_INFO(dev->dev, "no IOMMU configuration is no longer supported\n");
+		ret = -ENODEV;
+		goto fail;
 	} else {
 		vm  = msm_gem_vm_create(dev, mmu, "mdp4",
 					0x1000, 0x100000000 - 0x1000,

-- 
2.39.5

