Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CC9B0AC13FA
	for <lists+freedreno@lfdr.de>; Thu, 22 May 2025 21:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B714910E8B6;
	Thu, 22 May 2025 19:04:13 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KhpLG+sq";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6013E10E85B
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:04:05 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MFUHDt024754
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:04:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 520oFGgAVIHzUGYZ4vVIsy4Q9fI3b2Y3ZlgCsgK2yUc=; b=KhpLG+sqWiXdcRLC
 BWyw2duimxDxkvLngJpTkpPY/00G1Wg9QUTYOT4JgSn8PuRUl8i0VwbnBVX0Abeu
 95MCov5VQ2xoH997/J/6O4Y+ZK+X27769+ZYtwFZ3SRA2IAQgAtz38TIwFRLfIMK
 pcfKyxThBe/cpR6h8vGrE88eAyYNhVQuBaYm5IJmMCEYT3fJMiF3uZ2Zyjj0/0K9
 4eMPckThdV0Nbc/l1o4tLlkY/Fa34+ci7Uc8dM2gZBJHwVO6nYp8DYO/tBdTwMIa
 K3zP3LnByqwPNpN9nJytwAbZesjgGc/B5CS9JeMsALr0ftkQToaxNIPlFzxIPV7U
 TRAPCw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf4yd0m-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:04:04 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5b9333642so1020384685a.3
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 12:04:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747940643; x=1748545443;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=520oFGgAVIHzUGYZ4vVIsy4Q9fI3b2Y3ZlgCsgK2yUc=;
 b=BHUbGt96alyQiUY1kKVin0HNGcg7K7Tp3sKvVqJ5XShrsxBAor7sfs/QaiYnET2ht9
 J5M8p6jW44wjdJs9wegmEKnvA5IOZBop26QtIN9N3THwiGihDaK7xXJSHW05tzsansou
 TpEr+iLgDGtHezp/kbVe77avCt+X1xpGYoTQXL+sQjdd33MtA+8vkL3GeQiiCtCQaGmo
 ZKyI/1cCcDNYr+1mQFxZ7ugQjKZvkt76nhfaRDFaGr6LQrz4NE+W3SD8RJ8igvWzmDaY
 b4vOFbjTbEiPxz6orVV1aREJBB1hMv2wzzWb3TLDWI+lVrVyKSC/SkAbE3RDzeEnaiCt
 XJBw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp7//pld7NEiLi/AfTcXAU8iO5n3uhxhR5JMmzpK3TrokmMKY62tKCbs4ETZoL/WYPv4kSp62zYeg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yziuqan0xMfhp2o9XB27c9CXaQ0VlgfkuJ+sLZZJ27TgHY/ZOaQ
 4tgnAiOxrLyFe198rg378gxzyJgF01oznmqCEDgj0IbigoX/QJBNDJ6b7moYUaMocNjVgt8DNJ7
 WjJIQ91oHBlz4BfpmisMKmy8agdZp0cGjMDc2MZ4P3KPZzkSwctDBNqWVhHsCV3PPnKHvuvA=
X-Gm-Gg: ASbGnctoWJZCCNx/XJCE9hGmplcIHAkdgtz7dhAnJLuZWJkVo5i43fB4SHzEpULbYjP
 78c4FS40gadwiE8j7+NDdY6KQxGwWywfeHEpwO7NO88kN83sx9mGusNTJoIGyoZha9Rn2Ha1Fxo
 a1HdFgo+5d1ils1aoNJMgIeO6iv4WY+MboDLc8L/O2g9rlfnOnZL/MwV2vtn2+GxcksRK2J2p87
 iaFEwS4gvUMQpcRoUBHgIfuUCRIPcdnuvmX9eQU3zMGds3dykj1jvtw/YzLPl8pUx7R3Efi+uBq
 RrWeUI9xqmCSJNe4s4QnHLTHDTfwSoi/mvScVhnXUbD+FfeGSwQGjWgG5nnrXHjk26xngDgyTTq
 iV4FHb867d56UrYuwvcoDUvZj
X-Received: by 2002:a05:620a:25c6:b0:7ca:df2c:e112 with SMTP id
 af79cd13be357-7cee326c929mr6910485a.45.1747940642860; 
 Thu, 22 May 2025 12:04:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFzxquIY8HhNhqWCNPDmBe+j5FWdsACOdAapT72f/I0iKVGXenxbZCexTv1LjK3ndZUkz5kFw==
X-Received: by 2002:a05:620a:25c6:b0:7ca:df2c:e112 with SMTP id
 af79cd13be357-7cee326c929mr6906585a.45.1747940642445; 
 Thu, 22 May 2025 12:04:02 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.03.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 12:03:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:30 +0300
Subject: [PATCH v5 11/30] drm/msm/dpu: get rid of DPU_CTL_DSPP_SUB_BLOCK_FLUSH
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-11-3b2085a07884@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2781;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=R2pfqwbiufRy26Qr61RXns309s3JHy9UAH0Tqdyv7QE=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T95UgV39T4ep2h1SCm0PcapDyxtsT11KWVj
 05MDktyaQCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/QAKCRCLPIo+Aiko
 1cgdCACccb8v+ZZmGPkgp6/u9+Y0q/lteJhu/gtu0N1swCzsf6TSIejBwxhN3hXB0QniQYc01ii
 olrJpEPhQMDysiBdkPLX4+xicK3NOFy5Fgw+HGLgxKfN4/4dYS6/OWqYcfBC5d0N/fGZ9mtqlBF
 CztSUKRQLC3wh7bkEjiPAcQwPn6N5Pcne2BobCrW7haNU4Fm3I2UMyoJ6l+N3gmED/NcyvjDQxj
 +mTdZnPle9yLLA9OII/QQGYyQ+rFKIZtNRxjs82zYbw0xFY5Yvkahq/OHH4M8ILYzdWcMMd6GTI
 zSCNJoTeh3AGRv5yiP/Q5A6tuXgQahGdG6LbOsOoAjpugz3O
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: 2rfFUwBX0xoyxwyMs8qLW2IHKh8G4HQz
X-Proofpoint-ORIG-GUID: 2rfFUwBX0xoyxwyMs8qLW2IHKh8G4HQz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfX6GPd1p6AiF5g
 mgKSHE/S3nE6xe//WMlGqx3t5owbRM0vvF0qrZ9Ij44uIAj8wsyVevFsDHSiWKr9OdrpxJT99se
 gtgr0nHO7PePRF6+tJjGbFZbxXdcd+VbFBe4CwBCwTopwAOLJLfiWySXUyiMErlw9TtVZbldMu+
 UJcg0o3MAaaNO+hEwnUJc+OwyjTihb8OqQIFqupCaPIuurpbL+uZ6/zoKAaZ3pbCSDl+6rFxoAY
 7WZCGT8Jpgxq6FccyXR3IIo3Vktd6dRGhewVxQgHZKSrI8JxSNWVXH8cf6UP6P5frF5K8usgrca
 FiQBFJ12a1EU088Tbaos56RlrhHG46L+IasJRv7DZmdCvVf51eEek63QdUZ8KrZAls/350BLZjp
 djqk4yc0RXGJawU/ZJX8MLthCZ/ERa2/0OW341ccZE5gOWr3aqsrj1C+WGsQj5ppGyaZVqpY
X-Authority-Analysis: v=2.4 cv=R7UDGcRX c=1 sm=1 tr=0 ts=682f7524 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=Yf7QHpgQJbPwferW474A:9 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 priorityscore=1501 spamscore=0
 bulkscore=0 lowpriorityscore=0 malwarescore=0 suspectscore=0 mlxscore=0
 impostorscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220192
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
DPU_CTL_DSPP_SUB_BLOCK_FLUSH feature bit with the core_major_ver >= 7
check.

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
index 6fed2cce082c476c1f7f8ee683f2a6f3eeaa5231..19a859e2a1f80c2321789af4ec7c5e299f0fb873 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -105,8 +105,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_VM_CFG) | \
-	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+	(BIT(DPU_CTL_VM_CFG))
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 82f04de6300eca7d05ece3ac880c26f3a56505b9..1e5fc1d5873975189a1759212b8a6c6078de22f9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -133,13 +133,11 @@ enum {
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display
  * @DPU_CTL_VM_CFG:		CTL config to support multiple VMs
- * @DPU_CTL_DSPP_BLOCK_FLUSH:	CTL config to support dspp sub-block flush
  * @DPU_CTL_MAX
  */
 enum {
 	DPU_CTL_SPLIT_DISPLAY = 0x1,
 	DPU_CTL_VM_CFG,
-	DPU_CTL_DSPP_SUB_BLOCK_FLUSH,
 	DPU_CTL_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 772df53bfc4fcc2ff976f66ef7339be1ae3da8f4..edb82c81b0a449b1a7273fc258961b9447be8d9d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -804,7 +804,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	c->ops.setup_blendstage = dpu_hw_ctl_setup_blendstage;
 	c->ops.update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
 	c->ops.update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
-	if (c->caps->features & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+	if (mdss_ver->core_major_ver >= 7)
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_sub_blocks;
 	else
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;

-- 
2.39.5

