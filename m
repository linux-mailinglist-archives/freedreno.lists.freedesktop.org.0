Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 45519A99A09
	for <lists+freedreno@lfdr.de>; Wed, 23 Apr 2025 23:10:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0D3AB10E26E;
	Wed, 23 Apr 2025 21:10:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="hyklh5Dp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9982E10E26E
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:35 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NKqLfr016813
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 wU2b7WfJGWmDy7O3q2e4zKnSnfMJfQufOtUC0ao9gYc=; b=hyklh5DpWrYWgT6j
 jF5UOfHhmQXYfFXU0xaIm4h1FZBZGsX3wBlUVOJBqcVAh/tPLyAEsJZY0XzdLZzJ
 25Ah54YYAF7g4KlG7BVe8OCEDt0D2RJBlef3MAs9Lwlysxv7eZ/oBUEM9ELOB3hQ
 vj1TRguvRboR0bsTdS3NDMma8BB4DNDolq/udlLPLMKbNgpinX6gSoDoTr8A0yrl
 ZYcQLMjZM38JhdN3/JdSsHF1IgjYTrMqr70pxAKybbQ0C1SPHdF7VvaoIi98S7zt
 HW3C4EsNYSuxAlW1VXCLqE/tOK6UU5PcXyTmrN+npMIPMH+Wio8Vx2DhtVuqQgsM
 gUKYtw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0bf09-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5d9d8890fso270845585a.1
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 14:10:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745442632; x=1746047432;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wU2b7WfJGWmDy7O3q2e4zKnSnfMJfQufOtUC0ao9gYc=;
 b=qPIIKdLZl+f2DiENenee14aNbBgUm2MItAKtp9AJsvA6prs972K/2IyjXwQVaGj6Hm
 Ri/mHX0ryM2+KmOtpBVxwBwAT7AsmOPOGCEZOAhhMJfBbCdgtUVG/D3mLv39pkeOczpS
 dENQAiTGlbWD7pNRyypGqMKs2EQpr/FklJHpsgWpssCLZVbTOYQzjk6qIu9JTL4YVJu6
 p9cTHLU0xhZEKVF0IR61Br8kLjSTVlLq2HqNqDiSRdQFcVnN2r00cPcRBa4ix4m2Nr3K
 gD31gEM5/riXYIqbywE+x87flslWzSXCxjJOfQ30OA0IJynYOtN07CVa7/Q57M7iDoUz
 LxFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXM2PwyqbnIi+tF2Nrd588uIcq4A8e8kqcFIzaVWsxMt4B4L/QlPdvpiGHPrjJACbCU2eDGV1GWaVc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwVpWtFS5GLe1N6O5i8k9p7kH/FrKUaAl/BSxW5iOJxLDuETCfO
 5Gh0aXYziXNKEnf5nCauHGKT6vy0AbUkYvV6Kwy05AMopkfunZH8eDDLvOSFTI9PxprYQSxBBmL
 APVEu14nVgAQtfWmvS9Pv69NsS5T7TaIkGemUmhnw5mdXB+1AlVkPFTZ1fdYbXaja3zk=
X-Gm-Gg: ASbGncsw4hJXGmh0pSbvi+s+HiAQzLefyn/CDRlXJ++hOA6tPS9tn5kL0dKFb7bkcon
 qSPxyUBvmRx+mNZtawF2bKpqSSr4vbRa2uVhBKiXsWmjcNDCqAEsRI5giM/yBArjQ0nkkRq3b+5
 lFT/IFdbUHHzVRoX7Wru35XcChZI6LedMIzZf4qKOED50ff21p3i8uUCnQbgw87iS6wzAO6WAed
 uCJXn62fyJApRc/oCNd6p2nuJcjHwtZ3v1C3vw2VbFirtVyD2KYz9v9ZbZ098mWvU4dZBfWP4z3
 4hl5BPOsOEzeOJSa6fdrPNXPUmfswFVeoCqmwBjC9cNmYzN+UNvg5IE2lkkEMcGjMGI3gtmceaP
 PyDBGtHcmp0vanHT2MAwHJy5+
X-Received: by 2002:a05:620a:4306:b0:7c5:6b46:e1ee with SMTP id
 af79cd13be357-7c9577f5f9amr14944185a.4.1745442632485; 
 Wed, 23 Apr 2025 14:10:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHmewskMEPP6s5DobLR1sTztqQ+ubcgGXuvXsjj++JR0bGf/EfOca/ZAlrhkxjPq4F4IC2xMw==
X-Received: by 2002:a05:620a:4306:b0:7c5:6b46:e1ee with SMTP id
 af79cd13be357-7c9577f5f9amr14941385a.4.1745442632155; 
 Wed, 23 Apr 2025 14:10:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 14:10:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:06 +0300
Subject: [PATCH v2 10/33] drm/msm/dpu: get rid of DPU_CTL_FETCH_ACTIVE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-10-0a9a66a7b3a2@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2516;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=DsDYyaEtmcEU0Q3DXm3LKbekIuXiOgkLRrmoNbxq0Rs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcrYuy68P+aFAst+64lDjz2r1QUnWPTC/ioG
 m+VsW9g8O2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXKwAKCRCLPIo+Aiko
 1ZXFB/9Tg6zrWMlR/btCGy5hpZnnysbbj2S9t0oeK+N1SVTNATupVvE0v0ItHeJ/ukwiUP70xXl
 OX8fMKWtnEKpN5vpzpunp2YYa7Ylow/QePSZeT0eNE8C2gAZM1aVqftxmR6QirQFUyetFTJcJ44
 H/sB40DGQeNdbu1YC+/NyqHiuerWa6ETpeLZ6qpifvKPmeGPRo5vYdIMk+tFBbfuDAs/ZJxCNUM
 mqgfXWEFuQbZwcCZuwnjj+ZRK01h5lSFMvqvq7ag1yio8TrY/WsjA3qaa4Iswj28PqdAPm7kKPW
 DuSr3Jssa0YqGaQPXyhrBLugW4nVAnHe/rPK4i86wJXtqpo/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: EYyzFI2wuSq5lXoe9fIlVoQlZf62O_hg
X-Proofpoint-ORIG-GUID: EYyzFI2wuSq5lXoe9fIlVoQlZf62O_hg
X-Authority-Analysis: v=2.4 cv=Fv0F/3rq c=1 sm=1 tr=0 ts=6809574b cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=k2A94KsD3O5M_qN9siwA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfX4QYp3/fqF2D1
 DbfG1/DfP/CIQtC6e0rMItDeuJHxsUhkvBZ33qaCjy0+2faaKnPLjrFvvaKSAa19Xi3018L6eJ4
 5+oUzdLxZmqjfXY5v5XYtDQXe6ZixAWF9+FsOjBaJ7L/pFd/+9HQuBxUtjtn5Y13C3qHpa7qpyN
 HXr7iClm33/TvQAtq1rWhT0mPO1Ns9QHTJTCKJPgTbaupa8p9YK+izN9yNYDBDLiyMVfavo0e/i
 Gic0pAE3ytz3xqBsZlzS9TB+BbUogzLkBMdfEoywNNAwtNsQtZEO6RtSG7itXs+dzYRRzmDO5zN
 wIxVk9/KGWBVNsVXt+DBorCYL01z7JGGhVjGcyN7cgiu2AYRG9/ZnNxTrMHeH5gUXKzx0MmfkgS
 lYqQjVww7e6jFyxwe/qgOAzje4eBQFAAgc8EYi4Eia9YkXunSibxANlOPe/qhxClv1x3vU9w
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 mlxscore=0
 malwarescore=0 mlxlogscore=916 priorityscore=1501 suspectscore=0
 adultscore=0 bulkscore=0 clxscore=1015 spamscore=0 lowpriorityscore=0
 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144
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

From: Dmitry Baryshkov <lumag@kernel.org>

Continue migration to the MDSS-revision based checks and replace
DPU_CTL_FETCH_ACTIVE feature bit with the core_major_ver >= 7 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c     | 2 +-
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 0fcc9fb975c0955f459ba4264b6a114a4b17af52..3431b3c956486aee99664ea9b7c2e00f5c130b7f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -111,8 +111,7 @@
 	(BIT(DPU_PINGPONG_DITHER) | BIT(DPU_PINGPONG_DSC))
 
 #define CTL_SC7280_MASK \
-	(BIT(DPU_CTL_FETCH_ACTIVE) | \
-	 BIT(DPU_CTL_VM_CFG) | \
+	(BIT(DPU_CTL_VM_CFG) | \
 	 BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
 
 #define INTF_SC7180_MASK \
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index b6c45ed4fa3d18ed21c2a2547b0d5af4debd974e..ae168e73026d8ebbe605397c6bbd95552193498c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -134,14 +134,12 @@ enum {
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
index c63a6cbd07d94acae04b6edf534b1a7f5d4119b1..593da532d40042ca31fb452679d3de04c3b0d1a7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -786,7 +786,7 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	else
 		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
 
-	if (c->caps->features & BIT(DPU_CTL_FETCH_ACTIVE))
+	if (mdss_ver->core_major_ver >= 7)
 		c->ops.set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
 
 	c->idx = cfg->id;

-- 
2.39.5

