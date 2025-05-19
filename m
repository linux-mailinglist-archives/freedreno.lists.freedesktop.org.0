Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 923E5ABC387
	for <lists+freedreno@lfdr.de>; Mon, 19 May 2025 18:04:40 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AC0210E45F;
	Mon, 19 May 2025 16:04:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="o99O5crK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B8E5E10E4A0
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:04:35 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9rZc2003157
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:04:35 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lkwgbgLOgj4d3qvjEvXAKDmuRE8+O+K7/mbUy9e7Yv0=; b=o99O5crK873QodzC
 RIyWQOZY9oHz6k/48NXpcIM9JOQuM6eTf/U8MaoZoqTBZSu8eSRFDhHGTPY2GVYo
 plntw1EuqDLcksJL3lvj5gZHCshBANZ7htcYI/NV5+FYfFQsOUlbY5xbTFXrAOG/
 DxIlFTDSA9vhwwJfmEcLto1lEAQqfX8TSB4WNvN6ICa/WmELCGliHKIzjb2WjYhu
 hUd5bPqDgSjO63Px5S9WLiHal1GpBWlXFNGeOQjgw1dHOZ+bXbMvLKnZNgoI8RmK
 a+E3kbHt7t2VCFT25ZiXO5gLTJDsvl55XsIMDDI2R7zRw4DbbSSgihQxTp9S0rHd
 rhLjRA==
Received: from mail-oa1-f69.google.com (mail-oa1-f69.google.com
 [209.85.160.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4mu6k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:04:34 +0000 (GMT)
Received: by mail-oa1-f69.google.com with SMTP id
 586e51a60fabf-2db0ec3edd3so568996fac.2
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 09:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747670672; x=1748275472;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lkwgbgLOgj4d3qvjEvXAKDmuRE8+O+K7/mbUy9e7Yv0=;
 b=cTzXjOoMJWOFH8yO2VBgxxo7oOHCGAL1g6YMH7Ci4/7+J2XeXDIrUSZ9KBT4FdM6pa
 LMBBuGRjxB4S+A3uxh9hjeOvRJkTG2EL6e8lurT1Lm58LKOSaatiX7TCMmSjmsl7dJuO
 DZli12AaojKVbZ/HU5udA2qD86GGc9N4oyLmYq6LEeKSB2Ef/bDcSQlxgISIcvCrRMm8
 dEp8HJADSqjhJsdub61ouXI33hNhkzbwp2WZUJnnbQxwO/PVNcErOQ/l08j0Hs9pB+kU
 34ndg9/dBe9w1MnZT/j7eHWX6hUXamFa1+Uv7MJSh+PqrfovulcHXWkzktNkczjYptKc
 dmxg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWCluhqR4x3TBSdP+nfxp9FoI99eGdeCo4HuJRr5Df1YBnjzxaZmOtWuRBVerZkvjy5F5jDzt8Fl20=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxBL0nJhW6QMsmVLhu6aN/Ap45bRpu7vReGORnz6KaPeYNVwjy1
 4xh8YcTUaKKE6jty8NuwV7zyHkkci8+famgZ+pxY7wR7OGDyGi/cOsBOLhfYGbxA9UChliQ08s4
 zu8mwEYS4+T24XXM9CTEYG7HcCb34JbLkQ8B9PAKD3/mtfd7V8uEOkiJqSw4fD66Lau1DLhw=
X-Gm-Gg: ASbGnctGDAfIsVZeukUsJueLN1ORFlNnReEeLQ/UqPAc6VOxDvJ05tn9UxrRfWeTlFe
 qZvBSm/rsJ7N7FYv1bikzqpL6PWVYikwUpLjy8LlGOYNUpBkuLnN9mTdJTBkkneEOD2XbtEqvZa
 wXrdHWrY1TmmerMJcxC5SSFr3s5XQ/YeF6xjnWg0I/nDtLHzxC24l+j4mfGIcOaFg84JAhAhq6m
 dBJBkIklp5qW5IIZ3sm54/WK6nKbiDQHd9BP/t1KoXmfAJYuWPUny2XymrHDwrG8pswmksJiTKm
 +/vcwVa6voTknRC7APeNdsf7fiJh+N9Kb7TMMDeN1vSqmkXN4F21fmuMHsuKBazKou2SZC4lSdZ
 vJNjbuGWoXc6D2ecRmAHscrOA
X-Received: by 2002:a05:6808:6907:b0:404:f125:407 with SMTP id
 5614622812f47-404f12504f9mr4618164b6e.19.1747670671766; 
 Mon, 19 May 2025 09:04:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFSISujwU8lrobwRd3mozh8yz/HYjzCWY1OeWbJw5uS6+xeKb62OMUpojjSAlgxFf1iosixJQ==
X-Received: by 2002:a05:6808:6907:b0:404:f125:407 with SMTP id
 5614622812f47-404f12504f9mr4618105b6e.19.1747670671310; 
 Mon, 19 May 2025 09:04:31 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 09:04:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:12 +0300
Subject: [PATCH v4 10/30] drm/msm/dpu: get rid of DPU_CTL_FETCH_ACTIVE
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-10-6c5e88e31383@oss.qualcomm.com>
References: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
In-Reply-To: <20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2592;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=T4FSjImmMI/5tZIFCML1RoMebVbAYsPcJFHUVlcmc8I=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z6fysDl8sDZ3MznEr3n4u1Qo2NCo2THp4WG
 YMMjC7SGW+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWegAKCRCLPIo+Aiko
 1RHmB/0d9Th9/V09WijgOOsdRNZa4hYTJSsYMTZcwglXLc8Wpa2fJLJoZQcEzErO/2s5taOYmS+
 3AHPUG3fvvoOV+a0yxWBKUvy5IYgiBqbpCFmuftqyh0FCZQ9OFWb4Wt/TwjkEG4i6rB2vx/5Zgo
 UXSdPcJrR+3qNgc8X0luwwrlUCwYlfsAnR7m2gMf8vlBSzdSnzYxRbAqgLGYrXukrM2TA1WfN93
 yi+IdfrxdxQus4jvxn4qM4FeFzmhzgJTPy81CGUPEY9UFB9cuyzXeKdYGMfbJLm/fdIbYTb6pZj
 1WRoizjQ4fQsXpDXDcymOROdH1pEWbBpSfiZEczh6YgyASnG
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: h7cywnEgLjWhTIyka0maW1j42dgn2M4e
X-Authority-Analysis: v=2.4 cv=C4bpyRP+ c=1 sm=1 tr=0 ts=682b5692 cx=c_pps
 a=zPxD6eHSjdtQ/OcAcrOFGw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=1CFBwsujT04XwbEipTUA:9 a=QEXdDO2ut3YA:10 a=y8BKWJGFn5sdPF1Y92-H:22
 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: h7cywnEgLjWhTIyka0maW1j42dgn2M4e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX76aIopxTvGIn
 NmEkKmMWpVZDKWiuWt7kF6foRvryNuFBv/HZnGh681w62T8HOr1Zb0BZA0ctpGH4hvnXWFsEoOb
 XfXt7XDVePo9t7t8+YOv933TOnXvP/xNQ5uDTFvWqFt4o7E4wHU/J8rsIuT2azbSj/nWZYRo8Ah
 Gve6DqG8OFpmqHIqubV+xjTVRIQZhBZX1IKXdymbNQWDqqej7JDtpaXF1bLesr/zSH3K6cfn3+w
 lAuzj4GC0ZJzedWjcKI7O9p2//T7IDYlmdLtwwydfTDciFZQy/fY9onOK44ekZ+5T+Qm5aOY3Nx
 tUvoF19MQuhmYDgEhz1g5+FiuoFK2FRAT8PTJhhkNWC9JDvuiP9kch7Rp54WK79QsQu8nduS9B/
 Wag99KChxeWjyJD8wEsmoTMOorogfCEfRU+QKSLUNvUjhCq8XBpUh0Ex3wRGs89h9VVW8LCI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 suspectscore=0 impostorscore=0 adultscore=0
 mlxlogscore=864 spamscore=0 lowpriorityscore=0 phishscore=0 mlxscore=0
 bulkscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505190150
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

