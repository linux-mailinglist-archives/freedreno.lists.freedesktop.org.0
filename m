Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 18B1BABC37B
	for <lists+freedreno@lfdr.de>; Mon, 19 May 2025 18:04:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E50B910E413;
	Mon, 19 May 2025 16:04:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zd6WgIJo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2BDAA10E409
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:04:24 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54J989gq020941
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:04:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RzdaiPUhcbOQgcuAO0NcTTKEmE6xihefJV+JUYdXtFU=; b=Zd6WgIJoIshTVbxG
 c6M8aAfAVobAr/YyiW4EB0VDkaib4wzD8JlZzECQZ0wbJ+9Sw9kFF40FsEnlE2Vo
 UZeOH0Am2qGkb4qydNoULdRgGMyViRf5rT/TAnewoEW1RU4htgRoLYaQGSTSBM3s
 jdh40FyDv18IXi0U1IdkZPdpGxbRehr9GMq0g6VIiqpGSUYkJCJRxBP933X/ujm5
 KxQPxxdTzmxeWWi3+ybIfCd22YvUE2FyE6QxuqKFs93MvzYYgConjqjM5wiTS/qG
 aQVSoKYZixjXJDNWpHoHfTn7u3hl7mBBX8CC5O077kWd+/ii85zkXcOq0eTXgpQY
 lTIzkw==
Received: from mail-ot1-f71.google.com (mail-ot1-f71.google.com
 [209.85.210.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pjnymxpj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 16:04:22 +0000 (GMT)
Received: by mail-ot1-f71.google.com with SMTP id
 46e09a7af769-72e1e89b532so2291439a34.3
 for <freedreno@lists.freedesktop.org>; Mon, 19 May 2025 09:04:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747670662; x=1748275462;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RzdaiPUhcbOQgcuAO0NcTTKEmE6xihefJV+JUYdXtFU=;
 b=rOBWf8EturOSdMOQJ32UWR00mWNTKxRoKNSDSMC7V96VtcJFBjjok7oLSIx92w9kgO
 5PCu7fg3v9gu0H29k/6ArAUYTPOHhAmN2p5vVKlIPKr97lg+5A2beXvjwXvKDs8hwohn
 RZHTtQA39GQCs1QiAjzDaKo1hUXnevVShusK8icJDN7Yo+oB4H+Mnf99El7g9Y1SPnIs
 m8ssPpCNESy/2Qu5RERaypWtplZdsNjdYpEuJlFnFfZ6zNh4c3gAZSMNsSD++ub/R6Tl
 2PT7ow7orTrUOFOYnQhAQbNGnoyILzQCBw24hJFTSspQ9sQpSOyf2Kujzzvy7hY2Oq5a
 eN6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCVAGD1fBloKiPcDIV7dxSqgM2LPogfWS8+4nfahYSI8tUD3Eiv44ki3LoLG5XXg+S4EoXFZsMRVmFg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqCC4s5hkOhwRsV6AT9VoFmj6rKqQVjQItAiqXaGnb5nnolGaT
 fyoTmul6hI/7sUe5EnzHrN5dHUxGPlIA6IN9mTJu7413CI32V+9l7pdl2F9iUN72+yNjyh78kwr
 ZRx+bijuG5K7z4/vLFxrGmX9v0N/fPE+6nsMZnZckoR9OcG2jbKxZUL3x65S2maqqAt84Pw4=
X-Gm-Gg: ASbGncvbyTZ8HroKN4wtLP6eBZH5pIu8zFI6GtQESjZ1ok9Qhr/+znkX2Zs+IQrM1kR
 oLlzBE9SapuS8gbA+XEAbDo/NzZpch1jecVtlPBjJasH/864Ch08JrtZVRk8Ecu+3KmgRS8rW9/
 pIYGic1CufQK0r6NThfHZJJzjRzd1u6u3o3RhLtYiuIxi16Pe3/8uRJ4Beo8nLpIn5BSJIWNzhN
 dJ7FRYK2nQSMpS4aH5HYPBbQ0Sssnb42gj5mJh7DYlpvCFmCypK2C7yabVjSpGwXQUHfJf9mslt
 PrE2pCpfN7UDLTYM0UkzgBq1jPjuMtcD/7GBRrolQJoITJkITctr6QO9QjPpITlurJ+XEIQXE7g
 bhNx7KsNKqYXRkRxwyPLFbVYy
X-Received: by 2002:a05:6808:3199:b0:404:e102:f682 with SMTP id
 5614622812f47-404e102fb3dmr8677809b6e.22.1747670661815; 
 Mon, 19 May 2025 09:04:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEjcPOULuCPi9Gz8PeN8WglsKOijdjLwIixJjwa7hlcPWR5Yzy4Y9hE8EuoKimVAyoiC66ylg==
X-Received: by 2002:a05:6808:3199:b0:404:e102:f682 with SMTP id
 5614622812f47-404e102fb3dmr8677760b6e.22.1747670661484; 
 Mon, 19 May 2025 09:04:21 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703f6f1sm1919378e87.248.2025.05.19.09.04.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 May 2025 09:04:20 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 19 May 2025 19:04:06 +0300
Subject: [PATCH v4 04/30] drm/msm/dpu: inline _setup_dsc_ops()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250519-dpu-drop-features-v4-4-6c5e88e31383@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1721;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=MEgX/3vGs0UXxx+RirFKOH324DnVyoFKiMBN/zZL6fQ=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoK1Z56tKPsAsQdY/+ZTk79GYuzcy/HLPDbC+oY
 kuiPoh0z5aJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCtWeQAKCRCLPIo+Aiko
 1R1eB/9VKwfYCQtW1Ktf1qUs2WDo2JIaaBUIheGmLUyxbRm0ENNs1WPoiGkCfxQ5fcVuZDOKdQN
 DqRlBzIcfB5Rh8tGzHuFGAzKQ1kGQcRS/cUC0J5tQzTB3LyFlB8SDg3ieMpkRU5EywhW5jdv+jf
 z9j0+eZ6yDs9TdguOSwZkTSoiYjaZzEOCpghQoYsbuYv4COqWGtTihhCBw2cdQ/Z3c5nJ0yFKfz
 gkJLmpyPdiTojZN+T2mnvOHr/HhGTbysK4AH5cybBTnp+hgASYbMnYFewxyNmf7NZAzx/o37jzT
 ZGB5K6zOh7AoGRTq5aZ4ZkkxkY8sjFyn5i1u1t6iCsCcCnmb
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE5MDE1MCBTYWx0ZWRfX4ngiBJNgr6Z6
 /TX/Ch/e4qo49uVF9hcuI1kJGh4iBB3fqIaOJeYswL8HU+i/BMwZn+WZ9qjQ7T3MQ8Lb9/yMu1U
 5taMZV1lVqYnY6HkEh7hMTZhR2JFwd0LB+Ac4ZqMzePG924siy7LkiPHIv7hXG/qYM+sVGQNjLx
 pfybuX43bORIAETd8GkZOaKATJHMbKAvhq1bbR//l56cjDjNSv4nR6EDKN/xlP9Hx5uEwtIWcQH
 3G2ulglkU/HNYCB58am9wNKMs8QwDVs07CFMBN/qTvw3bCSJ4lPZKNNo9f0NPX3XC1QQte+TZ61
 UQo9nYwOQQ1VrOv7JE3paHRMjgP4224MR+bE47TAYGUeoQe9unicCoNlNP2/sSBbfXXTH4UDcJ6
 mtANVkQkhbYV7QRczkj4efyjt0FJhnApqpXndscV8fG5ZoSXtBP3sDU/4dR7xwlUZiHtlTLb
X-Authority-Analysis: v=2.4 cv=Z9XsHGRA c=1 sm=1 tr=0 ts=682b5686 cx=c_pps
 a=OI0sxtj7PyCX9F1bxD/puw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=aBwJmt2KlYBR8C_sNNsA:9
 a=QEXdDO2ut3YA:10 a=Z1Yy7GAxqfX1iEi80vsk:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: EBWUxR4V81c7RbjqNDH-kfuYmRx4fm9D
X-Proofpoint-ORIG-GUID: EBWUxR4V81c7RbjqNDH-kfuYmRx4fm9D
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-19_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 priorityscore=1501
 adultscore=0 impostorscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 malwarescore=0 spamscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

Inline the _setup_dsc_ops() function, it makes it easier to handle
different conditions involving DSC configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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

