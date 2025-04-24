Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 00BEBA9A7BC
	for <lists+freedreno@lfdr.de>; Thu, 24 Apr 2025 11:30:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4F78610E78A;
	Thu, 24 Apr 2025 09:30:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="pGFXOq5O";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFD6B10E789
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:33 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53O0F7ni010247
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 c0lUvSTsPxc5lkWV7yqgUJckTrtbVC9CMumomIWomoM=; b=pGFXOq5Or5ttyZJ2
 +4b2x6Zaq3MnjPshfANAVMk3Fu0aPE1ZmlIA4ACYjleyo2vLig+lRYhONHBXcfCk
 i/PTDBej41EBDfkz9/NpwxGnip4LHf2FcSTC56bwIrqNLqRSlrgvFhxRBgIY2izd
 Ve2K5SfZCj+ex3fFcOrXba3DbM9/L7M7moZ9vOETSW2waBMqOF3vAUc7ueWixhtD
 a9WBzN/wort1Sc6ccbOs3U/Y/Nc86cYBWV3UKYw4KMGWw2tWHDp+YZc1gTZZ7mBX
 voxFnxdb/3q/rqfoGnDIofKXyXTKWqLNq0x+ibrthwD0zIraWrUCIoF227pWw7/J
 YyGbsA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3mym6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 09:30:32 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c955be751aso128710185a.2
 for <freedreno@lists.freedesktop.org>; Thu, 24 Apr 2025 02:30:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745487032; x=1746091832;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=c0lUvSTsPxc5lkWV7yqgUJckTrtbVC9CMumomIWomoM=;
 b=BIvDuP9qxIHGfw9haksKHn2D0eyPp3bRTfbLIZeyOsZlQGD58UHyuXzIEYwh5ROVN2
 t+mOF3bYLcnooouOGf3AoY6kH/Ru+fY6SUR6nS7SPkX+ilURRpkdDYApUR0oXVtlPDkP
 FTi8SR43SARSTzahph9ShJmUW494Yb4mKT4J4AhYL996oAnCHLr0f14L3UR6IKI+D09K
 XzWGb/ei5+vLEE1nfF5wA1Ul2xfmwKwR93Dlotg228bANSMC3ZLvkPZj/od23W61xFZj
 3T0zYpzqlEvFL+rrZYDRzXWrfVhgtINT3NOBfxa4pcjjC2g8LmZpLdA6hCJwGGcbHG7r
 n/ng==
X-Forwarded-Encrypted: i=1;
 AJvYcCX69eit6yYQ/m3sbv/Krm4BCSny9rBxEJ3N6pGBx1suFKnERHvhOY99DE48RhhBV8e4PAlv2Jnsb/8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx1kJjHlMSXgC2EGitqp4BdyG8QcQQHphBNzcnfSD0N9GpjlIoi
 YhDsAg1IvSXzx/mVYmKOojmY6/y8k97WQ9HSOFN5I7AmUqN81yjbCxhV0a7vKhm6Xep4OtdPprY
 OKFIT8T5j6sPUEXK9EdvEOZIJrWpQEhks+cMPnZ1MAySMDuwK59F+FMVbrnWCziaE5Is=
X-Gm-Gg: ASbGncsIkfVfmV3SeemsnV03/20SOraAfPjY9IsecKVoOwOPbMs0t9f88fw1vuYYwz9
 uC6Kum9/Tt5Fd7ZoU8yp0Hz8DOWu3kygJzDzleC4d5ITEy+POo15vIFBloDjVbZkSHndx+X8jiM
 ojpJa2d1xrZzibUrn2SP6KOGZc77ZHuGeytQxujtHMzJTJW6xGmDtIo89EjWA7pSnt3i7su35BB
 14LdbYfTscISQ4UWhV/sQTzAUphrBCoeL4PBs6XYWwnQHrlnEzdI1EKwzyIJjtherAJzhtpW/VP
 WBq1dIgCJBMZRhOprBUUnJWpafU4IbFR2z7RMEueD9pRZH0ruhl+edEp/XG1zz0l5A86BV0BizF
 enVFe0Sr7n1n4LaLFvarv9Ohu
X-Received: by 2002:a05:620a:31a0:b0:7c5:3b3b:c9da with SMTP id
 af79cd13be357-7c956f334e9mr319893485a.40.1745487032127; 
 Thu, 24 Apr 2025 02:30:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWUHHejoPAWrPi677FUC/LXOAzZqmXm+Nu8bw/i4Gd23G4xaODXoIn0yKuicCcUyxeizcG3w==
X-Received: by 2002:a05:620a:31a0:b0:7c5:3b3b:c9da with SMTP id
 af79cd13be357-7c956f334e9mr319888385a.40.1745487031797; 
 Thu, 24 Apr 2025 02:30:31 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-317d1b9a304sm1820461fa.99.2025.04.24.02.30.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 24 Apr 2025 02:30:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 12:30:08 +0300
Subject: [PATCH v3 04/33] drm/msm/dpu: inline _setup_dsc_ops()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v3-4-cdaca81d356f@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1652;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pmq5vBCUeBdexnqWIWU7CFkRwfE1mAJP/nnHW7qtnOo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCgSqhsEhQWFa8FUQJirnBAfp4FL5UyiZYwL2j
 KSWqcA0JxaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAoEqgAKCRCLPIo+Aiko
 1RT7B/4lgGUG++hlUG/YtsFmd7Qoh4doQsDs+oVgtZvTumibpfEr+jSMdAVQEEydNd4LTj9r/3e
 7XJmv/FoQpLM9UXzNq565hGC+f5P34GP481Q8iXLcbBHhtJCX+SjeNxfP6fJRh6pC6NWhbV44lG
 iUmCXwzAYZUnr5hM4AQ0FBBlCGDZ0L2g7nW0WYbi3SQrWUK3ZY94wxeldCbk6nttodBiErfRMee
 Spk6Jv401RlstzoR3jfpNXozBO4tDoiBBEO4UavQHnldyWVXJ5LQDA59mar1bu8eKyn2sbxmreF
 lZmJtj2JU3tSoto4IKzJQ9w0z+jjPbxlB26AG1+jQp4dQxKv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: ylW0NE8cGxLNuUXhfswQg3vD3SyrV6lX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDI0MDA2MiBTYWx0ZWRfX9fR+YcBTtjcn
 INFuuhG/glIAY288wXRRjXI/ol91TqPU9AIydiP8RxnzQ9FP90aRAcQDrcb6jr+sNcd0urBQ9P5
 USi/JAnoJdyg6wb7Q6L8VYvCSRGIO7h4xe4Siwvs03VQd+xr7jkLkO4tdApqbo7YHLnUTTSe1YS
 t5fLn9w4kivH7cfV4AGHjt/CQHDtNypvJdrM9mv3gR0zhzDh4te5Lx70DSJG2X7Bou3QU9uTry3
 ikEcGxw2REYmzE2I45W/OdvpB2W/DxKuYNQk//ZDsFoi4OiQUzRd8aSXlgIuU9EeNIxhZFMaXrs
 BqNcyA6Ym56Dh9yTQL/Mxvce3WGghxLYlh+suEGXk8AzxFPvUfoUqdr9FhreyUYVqviDTqHFMFb
 5LhJStA6X4wsxc7clRXO4gAMLn2zP8pmJ1rZ7kyaQZu9SjCTqhGM/1/YMr+FDWXTjmsQehm1
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=680a04b8 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=KKAkSRfTAAAA:8 a=aBwJmt2KlYBR8C_sNNsA:9 a=QEXdDO2ut3YA:10
 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: ylW0NE8cGxLNuUXhfswQg3vD3SyrV6lX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-24_04,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504240062
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

Inline the _setup_dsc_ops() function, it makes it easier to handle
different conditions involving DSC configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index cec6d4e8baec4d00282465cfd2885d365f835976..c7db917afd27e3daf1e8aad2ad671246bf6c8fbf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -181,16 +181,6 @@ static void dpu_hw_dsc_bind_pingpong_blk(
 	DPU_REG_WRITE(c, dsc_ctl_offset, mux_cfg);
 }
 
-static void _setup_dsc_ops(struct dpu_hw_dsc_ops *ops,
-			   unsigned long cap)
-{
-	ops->dsc_disable = dpu_hw_dsc_disable;
-	ops->dsc_config = dpu_hw_dsc_config;
-	ops->dsc_config_thresh = dpu_hw_dsc_config_thresh;
-	if (cap & BIT(DPU_DSC_OUTPUT_CTRL))
-		ops->dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
-};
-
 /**
  * dpu_hw_dsc_init() - Initializes the DSC hw driver object.
  * @dev:  Corresponding device for devres management
@@ -213,7 +203,12 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 
 	c->idx = cfg->id;
 	c->caps = cfg;
-	_setup_dsc_ops(&c->ops, c->caps->features);
+
+	c->ops.dsc_disable = dpu_hw_dsc_disable;
+	c->ops.dsc_config = dpu_hw_dsc_config;
+	c->ops.dsc_config_thresh = dpu_hw_dsc_config_thresh;
+	if (c->caps->features & BIT(DPU_DSC_OUTPUT_CTRL))
+		c->ops.dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
 
 	return c;
 }

-- 
2.39.5

