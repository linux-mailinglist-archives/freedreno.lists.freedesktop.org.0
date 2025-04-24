Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 09060A9A7CC
	for <lists+freedreno@lfdr.de>; Thu, 24 Apr 2025 11:30:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 975E210E790;
	Thu, 24 Apr 2025 09:30:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WbROGqVF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9CEB10E797
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:48 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F7BW003415
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:48 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 yyPCpdExNHYyCfka5wJ1DgOakGmSWlxEKnN0dB+rNyA=; b=WbROGqVFtURaoPkN
 ygMGXjhv6pg9g7Synyob1P3lBLQWdMdvpapaV9zrO8NAQR7Zj3T7jkiYIFAHKn4I
 whM5KuXGXa2nLI88y+spPYIczCTQSsmIbAMfSa5bzCEA0CIcm+NwBsDmk5izQ5g1
 huMROmEUqlsHpxl8wszj4t5Fq9PSfMm0D9bxkr58RyPAGsMjL0hT/7DdMZPxNDFv
 5ZLV8Cl68OoFqZm8JVvrTNRDgWJHl5vKUGeJBUpA7BCrnq0YozvAUe4i1mnM3GyA
 woGzxE2TK2ns7xTGp8KO5orjLkUgMFghbbCq4rPJ+Ehx8mVA81RS6y2ynj5g52Ir
 hOAuZQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh0my7p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:47 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5e2872e57so133597685a.0
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 02:30:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745487031; x=1746091831;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=yyPCpdExNHYyCfka5wJ1DgOakGmSWlxEKnN0dB+rNyA=;
 b=rjQPaTU2nA2TCl9k33Ec27QWg/wNkpR1vXbO2c32XOn17YNja7D25p+FLtoemwkuR7
 M6v8QYO8pJADZco49f6iaR9uYihy6yKwF8WqMmld6mH9lyA6URiyj+xNXtLJAfYmcsda
 SIMQbO2NsyIX1yzPovlLeLoPAbV/zak9gBf96jdPCeqNC2CDj/0eCf+bv1qt39qN2w2x
 STxLa4IPNMfZgRQO6bmJEWcH8JKEb0ZiHzcIZZlPKnU3EIzPCjBDTnZm2Hw8bIEZ5icK
 yMSie4vuZrT4+sWVBHDtO0cMPGaLtE5H70zWYc81x8o5bGF/mK00PFU2RZ4DZWNOsxTw
 Y77Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNwC039PnPjLnJxquO2WcpOxrAxibguDZ3luzkPeRxUuLpnr/QIwwwtXrVlt6EtIbAFxZqcgG6uag=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyn+pH2DEEFFWfUq1IsNVHW5E4QCzSW3vtwOTe0BuhXAveeKKEl
 dTA9uQNch8xmea2BWd1RaLn6S3tHPqW+OgEs2laQwl2fuZujZ+hx7l/YhKoukEXhvzQ6czbGkax
 47f3GYUr8Q90y7iC2eoGyN8XC0Xz+UTybHNlPDqpzmeH/pSPb4EnbgMN5oi7xEjgISfw=
X-Gm-Gg: ASbGncs5AynrRJ44LKzQNlnyC+vL6uBfXkvqPiOyXMpe8KUoZIPklCdWz1aW1H2mCBu
 90islmaOcy3WMJ7q9R98qGwR8ynvVvn87aNCizM9gMC4zJeKmfkzOsu5vGjlk9zT6bb2+/ujGjK
 QvM/qA7qCLwWuglVrBWi7NMdiFDrv+Z3pRSchodugP9Wm+4KWHrZ94t+c/qd3arzzKzRVxcKZA/
 npZeHBP7V0uxNzZMQogpdZWE+tsWP6vtkO1nb+RkpHPNFwGgruaR+v4BJNyKuthi+CJdWc1g2HY
 fr3dTL102KFyGos9gOdkZJ00cVO/nFwX9+Wy40U3amXm8Do+XGP6dCrqOV4fACs4PVzPp40jkAQ
 lVrayrL6FSRRJJSPAOEjA/hs6
X-Received: by 2002:a05:620a:240c:b0:7c8:b141:29a with SMTP id
 af79cd13be357-7c956f434e9mr295632885a.53.1745487030630; 
 Thu, 24 Apr 2025 02:30:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEx9uaadwaX8bJYGxUDegggO2ScWj1v+mzcXVJ3LgUY++bid1Lg/SAxfptX6bTexPiMslZnTA==
X-Received: by 2002:a05:620a:240c:b0:7c8:b141:29a with SMTP id
 af79cd13be357-7c956f434e9mr295629685a.53.1745487030283; 
 Thu, 24 Apr 2025 02:30:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 02:30:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:07 +0300
Subject: [PATCH v3 03/33] drm/msm/dpu: inline _setup_ctl_ops()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-3-cdaca81d356f@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5798;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=6nM57vgHQs62/wjwRtInuGG9vKrODBr++a+KVt2bcP8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSqaDbO1cyuYOI8GY2KGOace+EMYeHMZnN4M
 8YTpevhqVKJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEqgAKCRCLPIo+Aiko
 1ZzKCACc/Fqq3vdDRKnSwfbFcgQLxFyD9c/N04fCkEkisVRf1/kEa4lDji6r27tOe0LWjEAj7eG
 P+VqwUVMg9mNZmvpeWfRfnYcX60FxVk6WyiAocC3uh+WQco8rtSBtHALHqz4g/w1UKYsu+QLtXE
 LxQbEPx+5PJ+MOTz9XrcX7S1lp7PvafCYFDWW7DxJNl9hOxwehH3/0fVR+BLbrBb2g3dRAVHHAJ
 w+Uk5G9fN/NtZATLDFOzJ3+4HxVD15GSqCY1YmhXeEx5feUZSUKYF+GKYHA1r0aLKrTBtzaDYU7
 SMzVcqzF+eX7lrmMR6Flji9l2BH4LBken36gXJqA0pd3aonX
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: Df28xDD-tFwnd1tiuHy_whwrlV_wP5pC
X-Authority-Analysis: v=2.4 cv=ftfcZE4f c=1 sm=1 tr=0 ts=680a04c7 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=RpF703knbOfOEe3tTfUA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: Df28xDD-tFwnd1tiuHy_whwrlV_wP5pC
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MyBTYWx0ZWRfX8YBGLH8yuDNd
 U40rZtsYodgcHqu/NRbtgDZOE4ZhAdvEJ/P8eVwcUbubwjASG0zIBBHWbbUEbNwHmqGhJ4s+OWd
 GSkZLqfhN54UKVhwk0IL8yovFZKtOivZwEdKgXf01KF2LQeI+pjn44IjOXb+hIOp2zsL1YMK0ZA
 Ydh8F7DzTEOrUhi2oqEURxJN8VmS6vvcg5FadE0KKypeqXwptcxvA4UBlPAGkCpR8pLo3Xt4Z1F
 KMUCdo2BKPSRoaNQKdmUi8hIcrUfUPOz+hB5u/tISTgXa0LOHdLgY1aGXzVXPHf02PtIlwVR9X6
 TY0eviG3NKDvIJteVub/Uh95XO+WZ42LxjZ3w0vNKk7/0KIP/X1grBH6QHfq8ryHUhctVjxvp++
 LW/NcgX6qNI/kKGtGhSEhpr/48OVKlH2O2XGFbzPbNtog1dIxo5rse17qIKaX8cHGFYHWMe2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 mlxscore=0
 suspectscore=0 mlxlogscore=999 lowpriorityscore=0 phishscore=0
 malwarescore=0 impostorscore=0 adultscore=0 spamscore=0 clxscore=1015
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240063
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

Inline the _setup_ctl_ops() function, it makes it easier to handle
different conditions involving CTL configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 98 ++++++++++++++----------------
 1 file changed, 47 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 411a7cf088eb72f856940c09b0af9e108ccade4b..466bfee3db52d980877a5cdc4eeb739cae250afc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -714,56 +714,6 @@ static void dpu_hw_ctl_set_fetch_pipe_active(struct dpu_hw_ctl *ctx,
 	DPU_REG_WRITE(&ctx->hw, CTL_FETCH_PIPE_ACTIVE, val);
 }
 
-static void _setup_ctl_ops(struct dpu_hw_ctl_ops *ops,
-		unsigned long cap)
-{
-	if (cap & BIT(DPU_CTL_ACTIVE_CFG)) {
-		ops->trigger_flush = dpu_hw_ctl_trigger_flush_v1;
-		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg_v1;
-		ops->reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;
-		ops->update_pending_flush_intf =
-			dpu_hw_ctl_update_pending_flush_intf_v1;
-
-		ops->update_pending_flush_periph =
-			dpu_hw_ctl_update_pending_flush_periph_v1;
-
-		ops->update_pending_flush_merge_3d =
-			dpu_hw_ctl_update_pending_flush_merge_3d_v1;
-		ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;
-		ops->update_pending_flush_cwb = dpu_hw_ctl_update_pending_flush_cwb_v1;
-		ops->update_pending_flush_dsc =
-			dpu_hw_ctl_update_pending_flush_dsc_v1;
-		ops->update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm_v1;
-	} else {
-		ops->trigger_flush = dpu_hw_ctl_trigger_flush;
-		ops->setup_intf_cfg = dpu_hw_ctl_intf_cfg;
-		ops->update_pending_flush_intf =
-			dpu_hw_ctl_update_pending_flush_intf;
-		ops->update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb;
-		ops->update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm;
-	}
-	ops->clear_pending_flush = dpu_hw_ctl_clear_pending_flush;
-	ops->update_pending_flush = dpu_hw_ctl_update_pending_flush;
-	ops->get_pending_flush = dpu_hw_ctl_get_pending_flush;
-	ops->get_flush_register = dpu_hw_ctl_get_flush_register;
-	ops->trigger_start = dpu_hw_ctl_trigger_start;
-	ops->is_started = dpu_hw_ctl_is_started;
-	ops->trigger_pending = dpu_hw_ctl_trigger_pending;
-	ops->reset = dpu_hw_ctl_reset_control;
-	ops->wait_reset_status = dpu_hw_ctl_wait_reset_status;
-	ops->clear_all_blendstages = dpu_hw_ctl_clear_all_blendstages;
-	ops->setup_blendstage = dpu_hw_ctl_setup_blendstage;
-	ops->update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
-	ops->update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
-	if (cap & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
-		ops->update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_sub_blocks;
-	else
-		ops->update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
-
-	if (cap & BIT(DPU_CTL_FETCH_ACTIVE))
-		ops->set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
-};
-
 /**
  * dpu_hw_ctl_init() - Initializes the ctl_path hw driver object.
  * Should be called before accessing any ctl_path register.
@@ -789,7 +739,53 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
 	c->hw.log_mask = DPU_DBG_MASK_CTL;
 
 	c->caps = cfg;
-	_setup_ctl_ops(&c->ops, c->caps->features);
+
+	if (c->caps->features & BIT(DPU_CTL_ACTIVE_CFG)) {
+		c->ops.trigger_flush = dpu_hw_ctl_trigger_flush_v1;
+		c->ops.setup_intf_cfg = dpu_hw_ctl_intf_cfg_v1;
+		c->ops.reset_intf_cfg = dpu_hw_ctl_reset_intf_cfg_v1;
+		c->ops.update_pending_flush_intf =
+			dpu_hw_ctl_update_pending_flush_intf_v1;
+
+		c->ops.update_pending_flush_periph =
+			dpu_hw_ctl_update_pending_flush_periph_v1;
+
+		c->ops.update_pending_flush_merge_3d =
+			dpu_hw_ctl_update_pending_flush_merge_3d_v1;
+		c->ops.update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb_v1;
+		c->ops.update_pending_flush_cwb = dpu_hw_ctl_update_pending_flush_cwb_v1;
+		c->ops.update_pending_flush_dsc =
+			dpu_hw_ctl_update_pending_flush_dsc_v1;
+		c->ops.update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm_v1;
+	} else {
+		c->ops.trigger_flush = dpu_hw_ctl_trigger_flush;
+		c->ops.setup_intf_cfg = dpu_hw_ctl_intf_cfg;
+		c->ops.update_pending_flush_intf =
+			dpu_hw_ctl_update_pending_flush_intf;
+		c->ops.update_pending_flush_wb = dpu_hw_ctl_update_pending_flush_wb;
+		c->ops.update_pending_flush_cdm = dpu_hw_ctl_update_pending_flush_cdm;
+	}
+	c->ops.clear_pending_flush = dpu_hw_ctl_clear_pending_flush;
+	c->ops.update_pending_flush = dpu_hw_ctl_update_pending_flush;
+	c->ops.get_pending_flush = dpu_hw_ctl_get_pending_flush;
+	c->ops.get_flush_register = dpu_hw_ctl_get_flush_register;
+	c->ops.trigger_start = dpu_hw_ctl_trigger_start;
+	c->ops.is_started = dpu_hw_ctl_is_started;
+	c->ops.trigger_pending = dpu_hw_ctl_trigger_pending;
+	c->ops.reset = dpu_hw_ctl_reset_control;
+	c->ops.wait_reset_status = dpu_hw_ctl_wait_reset_status;
+	c->ops.clear_all_blendstages = dpu_hw_ctl_clear_all_blendstages;
+	c->ops.setup_blendstage = dpu_hw_ctl_setup_blendstage;
+	c->ops.update_pending_flush_sspp = dpu_hw_ctl_update_pending_flush_sspp;
+	c->ops.update_pending_flush_mixer = dpu_hw_ctl_update_pending_flush_mixer;
+	if (c->caps->features & BIT(DPU_CTL_DSPP_SUB_BLOCK_FLUSH))
+		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp_sub_blocks;
+	else
+		c->ops.update_pending_flush_dspp = dpu_hw_ctl_update_pending_flush_dspp;
+
+	if (c->caps->features & BIT(DPU_CTL_FETCH_ACTIVE))
+		c->ops.set_active_pipes = dpu_hw_ctl_set_fetch_pipe_active;
+
 	c->idx = cfg->id;
 	c->mixer_count = mixer_count;
 	c->mixer_hw_caps = mixer;

-- 
2.39.5

