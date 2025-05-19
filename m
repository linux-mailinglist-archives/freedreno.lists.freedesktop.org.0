Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 904D2ABC37F
	for <lists+freedreno@lfdr.de>; Mon, 19 May 2025 18:04:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5408510E42A;
	Mon, 19 May 2025 16:04:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="I1f3+sUo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8533E10E42A
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:04:28 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J9Uih0002152
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:04:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3dOSnZXmw0KW6iA4owOHQhUjrobwGldc7f6qBPHIIEE=; b=I1f3+sUooKHzN3kB
 p4CYpEnOxN3E352DDRYkS+1jWnv1HXpxz7q3ZeThgukufIUCWY8HdGJ81AFGKQ+H
 X27/ilqG2hQOZ5RsyVi2zIUbhFTgCeQSK1RRljz/Wghflr/s1b9UUZTtb/seF7gx
 96zJehAbl7zjRPbQu/QCVa69logmWZWM19iiEGJ6KXMXvBfNWpi6TP+9AH7kkg+W
 0c8+Ly8CdXyh8EiePH3IS4CTaUh0OGgfQfhq2/PAVGRsmSDSgIO7d8C9EXKsatU7
 deum6J0i+td1qqkfDuqqXSjkEpzrhP5xTcen1/RUAaOxH5AvTFi/R0IU6NKuVOTZ
 SoCTDg==
Received: from mail-oi1-f197.google.com (mail-oi1-f197.google.com
 [209.85.167.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjm4vy1g-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:04:27 +0000 (GMT)
Received: by mail-oi1-f197.google.com with SMTP id
 5614622812f47-402ebf9ac19so5177025b6e.0
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 09:04:27 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747670667; x=1748275467;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3dOSnZXmw0KW6iA4owOHQhUjrobwGldc7f6qBPHIIEE=;
 b=eO5JAGyeSLKc2blfYssNuNeOdUiOu11b8yjRsdCk0azFSt/wQGGVxSj3zAyZ6ix4Wy
 SYKbeuseqSrg4qjF4AioE+YicVq8rq8Uj9pFNMeC/I7YsQbcI3OZ6yV8M82s9PZX8/XL
 /DNvkwuii5wP3Ik2zxOsaWsLY3UacEQwXU9RWEE3x+UbdUszelsRmKftse79TNm0IXGl
 7FKlSkbBWDNXEQoWLXY6ffYZnZ0HN0gjpGBwMXv7SAC6P3iMdEQXHBcHlwPf0k6A/VuY
 4rOZ+KzMbQaSeltMDMO3YKLUVdBpWT/SDZOtCODRncg0gxicUcLlFj+Gw+TAWMNg2lhb
 NAMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUX7MmR/XIzr50z/yF33/vzRqGBkZgeN5IkW10LWctuXDmckRg0ifxPZ0tR6sFQ93RXpJgW+HIHiM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxcEY0OQC/skQA2W4bkPkE0BRA4ynNcH5CoWgtLC78EJf6Yo3RQ
 /UyGUDNNubQk73mA8al4fl8ZjnCfb3GLzpINByovYr+BkQt4nIYngnmYYYoO8gZ3yXHsk3s8M0L
 P4vWG+m4SQDcX8RBWONjYFVbh3O9u8+1VcfDV53sEX7uzl+t/FChLoCAXmHEDYMgRYfLuUdc=
X-Gm-Gg: ASbGncswZAiddNFeRY0Ursbi1FLlUeL2OFOcXYgfyrrexxQEiuyy2CMytyY2aDAtMXH
 ZMVYFQl+cKb7/2dWQkLLUKRXpAbM+HBm6WPG8fqs+ozWyXbvFcpXYlm5MRLUNcH2synDv6wfyDI
 2G0tDo67guxI+eLeD9TSYyPYvRag/2Rw+XzgisnNPoHnxVjKyiJUaGdFJeBFHnJAhd3T6Lbvfjv
 Es1XvadndmZRk0koqMdl7RUrG1BAefgJTCLu9GDCQgGXd80UPwcG7ZSFSJCsQoo5o19S9fjtQGl
 t9ccEjt49+hxsXVSNBiTlIqtWr0gb0KU7ykPPyrbYRnIinbVx8VdfNCEwE2/hLjn/eQHTh+jMJd
 5cUTZ0+NvQJxcqh73nkMhjsm6
X-Received: by 2002:a05:6808:6b97:b0:3fc:1f7b:c3b3 with SMTP id
 5614622812f47-404da7b8d69mr7382783b6e.33.1747670666795; 
 Mon, 19 May 2025 09:04:26 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEWGNkqDoudO9RrWuCi0wKzqrGIqcsU0h/pgq0zgnKD1jGMqg5LdIRqVst60xFqiYKu58bYqA==
X-Received: by 2002:a05:6808:6b97:b0:3fc:1f7b:c3b3 with SMTP id
 5614622812f47-404da7b8d69mr7382740b6e.33.1747670666447; 
 Mon, 19 May 2025 09:04:26 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 09:04:25 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:08 +0300
Subject: [PATCH v4 06/30] drm/msm/dpu: inline _setup_mixer_ops()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-6-6c5e88e31383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2168;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=KY1YKEATuXx9KSgl3eMXV6sbTxL9UFjeSDTpsHW5e6A=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z6q/sPeQO2gwYXC1xpGu3yco8msBFdP9+Ot
 w3qbkta0g2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWegAKCRCLPIo+Aiko
 1YlKB/0QFom0Icz72zmEmsevu7heit4rtZvRppGBGc2foEzGKdj1WXTfDxIRVslcwZXU2GnVw0M
 VFr1qR9Ag+ybL4Fttyxj7nvkUx1LbfRlJjPN1M4MY7uhwR2beS85hN3lG/Td+G0ruxNE9VWO0qM
 XEsw1XW1hRxVJsVy+zupSCLqmkDwKhjI0okQJ2BB84z/wdGobaqISK3wctI5MxR7/0jjMR8ILIf
 viBhwxTrGvMhrDRb90MhFPVzJyIRkIruGFCqdF7ubCDr+PpIEPXRQ1yBchqHnjle86niXVngEJC
 8P5nQetdYPlPyGD1k5j1d/DeZxRQaJLnWqZcnJ9cZQQCzcFV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=dIimmPZb c=1 sm=1 tr=0 ts=682b568c cx=c_pps
 a=WJcna6AvsNCxL/DJwPP1KA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=2ONPo-prfMSwqFkLVuAA:9
 a=QEXdDO2ut3YA:10 a=_Y9Zt4tPzoBS9L09Snn2:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: a2Rk6xfyzI56B2n2Il1FDGUVkjG95xmG
X-Proofpoint-GUID: a2Rk6xfyzI56B2n2Il1FDGUVkjG95xmG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX4vxT4VlwtSoa
 Cd3jSeAbv5IH5d5wlszHZdCXBa3BOuL2pxE+EEA8p5irN3CfRUTlp29uQabS72rzfXCEP/Am0Wm
 V45PkvoaMSuIddxhrVMhw49zkdxe7SU38+A17QFjrvCYnin3tuLSW2kS9kFWN1dSXqqImQHqKSS
 PVM/Brd077M981qswMW9lTPaMyUhe+yGd8YgIyDqS6JQ8nw/Mvr7ikUXVAqoeO1P5STHxZcUT/T
 gejC5ZiReIGMBlgXcmyE7RGKdB3LYkywFUzIhtVP3Zp7RqInYD2EaMJSJrRRz+vZ+OcvMcT9O2P
 XJbgJkjH5anuB509F85sEZ/MW0MchS/qQJxGsKcZtBG5uIIX2g0KdqThlaiWDqYX3gEY6e67aKj
 tDR8NSo7KN0i+9wMp6lR+yhEYfi1yFUL0CixiA6IpqIWqMi6mM34elhfLURwDdX+ACy/MaaQ
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 mlxscore=0 bulkscore=0 malwarescore=0 suspectscore=0
 impostorscore=0 clxscore=1015 phishscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

Inline the _setup_mixer_ops() function, it makes it easier to handle
different conditions involving LM configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c | 24 +++++++++---------------
 1 file changed, 9 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
index 81b56f066519a68c9e72f0b42df12652139ab83a..4f57cfca89bd3962e7e512952809db0300cb9baf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c
@@ -144,20 +144,6 @@ static void dpu_hw_lm_setup_color3(struct dpu_hw_mixer *ctx,
 	DPU_REG_WRITE(c, LM_OP_MODE, op_mode);
 }
 
-static void _setup_mixer_ops(struct dpu_hw_lm_ops *ops,
-		unsigned long features)
-{
-	ops->setup_mixer_out = dpu_hw_lm_setup_out;
-	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &features))
-		ops->setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
-	else
-		ops->setup_blend_config = dpu_hw_lm_setup_blend_config;
-	ops->setup_alpha_out = dpu_hw_lm_setup_color3;
-	ops->setup_border_color = dpu_hw_lm_setup_border_color;
-	ops->setup_misr = dpu_hw_lm_setup_misr;
-	ops->collect_misr = dpu_hw_lm_collect_misr;
-}
-
 /**
  * dpu_hw_lm_init() - Initializes the mixer hw driver object.
  * should be called once before accessing every mixer.
@@ -186,7 +172,15 @@ struct dpu_hw_mixer *dpu_hw_lm_init(struct drm_device *dev,
 	/* Assign ops */
 	c->idx = cfg->id;
 	c->cap = cfg;
-	_setup_mixer_ops(&c->ops, c->cap->features);
+	c->ops.setup_mixer_out = dpu_hw_lm_setup_out;
+	if (test_bit(DPU_MIXER_COMBINED_ALPHA, &c->cap->features))
+		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config_combined_alpha;
+	else
+		c->ops.setup_blend_config = dpu_hw_lm_setup_blend_config;
+	c->ops.setup_alpha_out = dpu_hw_lm_setup_color3;
+	c->ops.setup_border_color = dpu_hw_lm_setup_border_color;
+	c->ops.setup_misr = dpu_hw_lm_setup_misr;
+	c->ops.collect_misr = dpu_hw_lm_collect_misr;
 
 	return c;
 }

-- 
2.39.5

