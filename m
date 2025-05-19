Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B5D71ABC37A
	for <lists+freedreno@lfdr.de>; Mon, 19 May 2025 18:04:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8798610E409;
	Mon, 19 May 2025 16:04:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="gS2J3baG";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1871C10E409
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:04:23 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J97Uhe003010
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:04:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +junJqgQyRnn8zodYMx+P6mCYUvUx4LWqgBpoCQ/W90=; b=gS2J3baG230S3KHQ
 BaqfXM7DLtGSG5SUmB977e7P/EKNsluAnqWYD/FZOylhLBcWOt6544SaGIynX68Y
 csroqt+7LN/bLxe81QRVUtEej764YRFCSJDIIBWYj/Yr2E4/+C87BKDcZqUdFqL9
 i86D3O/5OFOfpD4W74z4o+ZR0pvIgZWPPbS/K53sftPbTHxAM2aTyh2s+Yck05BZ
 UwdjlCOZQO6chIjj/BKWKdRQRsI0yGBDauOJLh4GApUA6eiwKiLVIP8rC1ueW2Ts
 E9p0CInf4Y7QEWYxl6MdHHEPeFpLf60X1QUak5PYKQbDiQU0LiF0csc8c1ldQAuK
 2Z3B4g==
Received: from mail-oi1-f199.google.com (mail-oi1-f199.google.com
 [209.85.167.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjkyn13h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:04:22 +0000 (GMT)
Received: by mail-oi1-f199.google.com with SMTP id
 5614622812f47-3f9cbcfbb7aso5278312b6e.1
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 09:04:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747670660; x=1748275460;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+junJqgQyRnn8zodYMx+P6mCYUvUx4LWqgBpoCQ/W90=;
 b=FsO7o64cFMq6muaSEnJQ/f99U07f76LWuuHpzMyN++I8m99yiKy8lv2lAFm3G6qgcu
 +GB/6Vs/NaBDKl8USBFS7BKGhSbrN7fGYG8oYbnjdTbyyyN8Pn+sviMgEsEgcUfyNJAB
 FeciN7t3lT1MCtNN4Z2tD3pj353bNQKFYske5PqnD9fka6T5+fqtmmWijsREHaGEeCFV
 VtgstItmdyVPeZQfpawUtTtqjRY/9MGf12WlBv1vlyYkofkW1EsLHhy1xsKvwJw+tok7
 E00Lxw4Ml7lxaQj7Xbl5zRz3lGPjPYUuebUA3r1AQoNBNlmqC3NETKmMHRyS7LWeX9VE
 5k7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVTY24Qk0f2/mGPJadZnOfCnVaFXPFO4qxY49X7vng8chJJSDjeTRB2XaMN5dSquxnpmI75Bdua3lA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwtKb97JK1PHjXYYh4B4OpNWzaLzX1h0orsVxQaaK+89TQ7CIjO
 9y+Hq1DDY71ddcmbrMY79YIYKPjR90rNigrYLaYJyahUpU6+EQFGq3w5q48cXDBSWfffjLIVqeO
 Y6XdTnGV4SLR49POV5ODVz75TKkILfXlQOYAtj5VFXCyt5tyzGVTMOliQ7uX54GIaibqD6JFIpT
 6Rpuw=
X-Gm-Gg: ASbGncslzGaG0GrIVU7DdXNedEAmHXh90AJxhIhvk9ps4Uy7Q38USuVHL/PMA420mr4
 brYL3eSLs0IPU9QfIjs2PTjWFJ0rwru+2LJd8UVgOAzifIWLYq8X7NXsvzis7NtpDZNniDUiTi5
 pJ93y8RwlIgmmMAmBBiHhnv2OuTf3rcY+1dY2V6La27ArxioFSi9PgaDUeZd7QgZaxozUlAM46E
 PFKysw+/Cn1LjVvI8KQtffgFLkT8TcH5yGP8l6D7jTe7ugv/O333CTJl+R1vceYZ5sfpbx1FUJc
 K0+GOg+APaslAF7pKHuFCGIahnJu+dpCrRM7MlC2IStqYQrO4ca/eb4sTtjIWtempqV2eWlbFh+
 Ea1/E8dApuVErhwzyAda/9hLh
X-Received: by 2002:a05:6808:3090:b0:3f9:176a:3958 with SMTP id
 5614622812f47-404cd6a9338mr9457881b6e.11.1747670660452; 
 Mon, 19 May 2025 09:04:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEXLRFHvxuEE5irIcoQrOo5X+fviqDAHP7YPG7eI4HROz/F3c4AoxGfJuGZQirebYHQQ1UHEA==
X-Received: by 2002:a05:6808:3090:b0:3f9:176a:3958 with SMTP id
 5614622812f47-404cd6a9338mr9457834b6e.11.1747670660027; 
 Mon, 19 May 2025 09:04:20 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 09:04:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:05 +0300
Subject: [PATCH v4 03/30] drm/msm/dpu: inline _setup_ctl_ops()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-3-6c5e88e31383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5882;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=L2J78TQwlePt+wn5GF3lSQf1F0XcZ7MGKmi83q+Bgfo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z5mV6ojA+ItvfDayVELzkB2wYuP4WG+dNez
 OB/CoLqQE6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWeQAKCRCLPIo+Aiko
 1cu4B/4ro/dYaCWYudj5494vSCNYFTI7tN7tm/EF4SeEtQcGnyBhiWk+aq7RSSjsRJGg+CIbbjh
 8b2O6lZePklCx56nhivLVFdUXWsUWm7QH1Zuu7EGyUEn/tj0BFsniJUN3Yc6p8P2D3w8rvnVqpT
 9AsTODWRlhXwD2uyoI2boa10u983lJ8qo+itcPPxAXXFoFvI8H41TZLh+WVpZGXKCq4QOd7qBaR
 J2WymgGUH/O2ZD5AIzNJbERYciGuQ4W0i+OpKOCG4pV00EooUp4b4OiOdwZ6UQpRB8dmA+i5Uh9
 Tsu07+4YTeGs3fNq0s0h4eQQcVqBT9S1sxxRVGwGuxWbrn5J
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: _5CjCTkFeZk_ssE65mKAUF-i_bUB91jp
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX14aig76LyI5B
 DXIFjeEfTV7Dort1fBBOvUJQmxJ0Exhwkh7nK/iDwUeb4rJyAFB4yucGA8HMWQs/mLKImCBbjpk
 xVc3g5ldZ/xrYO73o82m9tkmHKg8X8HhMwDvY22Qe41CDvVZaXrKzsPzv4qYDk6gnNayt/uY96T
 Ujo0NklTSgSihM2hU+cUBL1pekkPsBYHVejXK9QWtWeH8DLjXAd3KkvmsBRNa92/ecVhMcwCpuI
 SQkuJ30m0qkICaUC7woh8isoLnYhH3jREUOq3Q2IDxxvPt7N1QrjeLG356YR2hu1G8SXGp2O1gU
 JfmbieEYGn/zPjtvkUKYx5dcBQ6hRG205wbhWb5EVbM2VxmeW+SElzTrdf/XQOYcMIl6wMeJ9wJ
 Fw9xG+3zdC7hEt3dYQXwU5Kb3g9kmfVp6gehP/8Bg+t6fBNmK4ONdIIRoneEyncmyTf5s6p4
X-Authority-Analysis: v=2.4 cv=H8Pbw/Yi c=1 sm=1 tr=0 ts=682b5686 cx=c_pps
 a=yymyAM/LQ7lj/HqAiIiKTw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=J8zulDhgwS0aM89Qmk8A:9
 a=QEXdDO2ut3YA:10 a=efpaJB4zofY2dbm2aIRb:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: _5CjCTkFeZk_ssE65mKAUF-i_bUB91jp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 bulkscore=0 clxscore=1015 mlxlogscore=999 adultscore=0
 phishscore=0 mlxscore=0 priorityscore=1501 suspectscore=0 malwarescore=0
 impostorscore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

Inline the _setup_ctl_ops() function, it makes it easier to handle
different conditions involving CTL configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c | 98 ++++++++++++++----------------
 1 file changed, 47 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
index 573e42b06ad068445b947c59955281ba6e238dad..d58a0f1e8edb524ff3f21ff8c96688dd2ae49541 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c
@@ -737,56 +737,6 @@ static void dpu_hw_ctl_set_active_fetch_pipes(struct dpu_hw_ctl *ctx,
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
-		ops->set_active_fetch_pipes = dpu_hw_ctl_set_active_fetch_pipes;
-};
-
 /**
  * dpu_hw_ctl_init() - Initializes the ctl_path hw driver object.
  * Should be called before accessing any ctl_path register.
@@ -812,7 +762,53 @@ struct dpu_hw_ctl *dpu_hw_ctl_init(struct drm_device *dev,
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
+		c->ops.set_active_fetch_pipes = dpu_hw_ctl_set_active_fetch_pipes;
+
 	c->idx = cfg->id;
 	c->mixer_count = mixer_count;
 	c->mixer_hw_caps = mixer;

-- 
2.39.5

