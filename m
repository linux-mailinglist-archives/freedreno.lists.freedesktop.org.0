Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77734CBCFD3
	for <lists+freedreno@lfdr.de>; Mon, 15 Dec 2025 09:40:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B7CE10E3AB;
	Mon, 15 Dec 2025 08:40:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ipzbHdt3";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ZRnXts1E";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3997B10E3AC
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:55 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BENakuP3670445
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=ZtV4X5cR6Ur
 U16OtyrxKymwqQ6A4WNFYALAmfpTs2C4=; b=ipzbHdt3Z5lcQmn0jzbJcgXpN8W
 UfprVbrjyX2o7v4dGazqeKJk+z5+z+uEbkqeUyfRq3tdTAqZZeBbAfaylR0r3/J+
 lM+oCBP9415T45FFHQCSYOZrKMNnEf4B8iITcmo41KaIUtgvLutINk1QzFUAciXR
 QURaJOUNHdf9E2q6yV0+vxJzc8IncDdukXeePj8U5oigDWQ6Ixv4TVya4DpuiAeL
 lQg6+g9/0Aa7vdp1rUxSH/xYKMWx1rBRwlwekvDjqrcGPjBjueYOLG6i/Vtboz/e
 VJdvnfzKirxhGtf7OWixKI78Hu/Tr9CPXfB+vVa092DLKnkWJSbqRgv1SXA==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11avkqg8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:54 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ee3dfe072dso86341691cf.2
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 00:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765788054; x=1766392854;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZtV4X5cR6UrU16OtyrxKymwqQ6A4WNFYALAmfpTs2C4=;
 b=ZRnXts1E/C4/y9fa0aFevIXJT3ob8musKninTtUSFukif82/FnAUmPpBkl0I1+xSiU
 h4XSxnQ0/hrRbFnAA+LpbFmDxZDfcVbhwheGEO5Z30YQXEcwPnZggi6tNMpIXTQDD2t3
 mYqRoQwr7YyZ1kU0XX3FGijf5Of0Oah7tmDO4rHhpc5dN4PopoIIXyuzn1WdBNu/9KV+
 iWqm3DkAj+SLHyctuq9KtSQaATq1mrjHGbWUkOAunCtK8KwjM4/dn7cYdCYac8VUS02F
 9vlqKJZP8iVOSs5AlxAne6tqZeZnqocvIGmYbfaNizPsale1LCVZXSI2Di4JKmvXkF3A
 faVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765788054; x=1766392854;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=ZtV4X5cR6UrU16OtyrxKymwqQ6A4WNFYALAmfpTs2C4=;
 b=iqs108eGj3yoZfRhtFxFNCsAAxp6h4xJ5JPM6UEllV5dgrJ0JzhznMcB8IwwwgMIZk
 WzYZ0mqNTiU06bH4qlX0TEZLBrXuVqgvHUmqfAKwgaziQ8sGYx7/0RRWtqpbLApxjQEn
 XBQmJoEG3MbA7/9MY3aWrMpQ248DGHPemFORUUt6UN2OGkE3OhWweRZ4ybtJf8UkhCr8
 XJ25GL5TTtvj9Onde505SqWZTbqZFAr6j5RLfApAEw4GPmPlBFs8bPZ/lSGnSx0k/fRe
 k747Gp+H7Xd2DNgM5xIOQ6IWE+lUZCbFpBp7UW92pn+YF4YlQmoIUEwV+gvCFJF3qXyt
 MIPw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUXfrcdhAZpLypJqRZXUsBrHTEib0fZRRSacQPdaIvRKS83jYeW1hVgjl4yTJyvG1FaekOjL4jrf4M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwURSrJAyXPlGx0z4aCiiS3Wppg/XrjAsSajRXvOXY7oUZb5C+u
 giaiIz5bzK2wl/RSPP7NjkBECrrbU7TVghTAJzrAm+XsUTTXd8/hETbO8rPgTiC5OiCuehEakcX
 3GZzdYEAtBSAh0GP9WXpBCvPNs92ww/exNnePI+wXCJSbekWWfeZm8nqhGfND7JxNr76InPY=
X-Gm-Gg: AY/fxX4lEbAoAVhxrAy+sSVYYDTyfckSAQY0pFKxeczCW629yEpeE5eSTbrpJJtrVh7
 OJtXNTHEPQfnMmJ4wENnh5jvw2OLgUuJxtZRegQksiNDiyHjbAoCdoeHkClD7NOyoZGsufRV9I6
 lKRz+35e8G2qqZE6cxVOyvpVF0eWOAZr1kA8L7rc/LdntiWoGYbblleUT4cuDSaqnljQBOt/3/t
 mqlKp4cmOXD/rJbpYmgagqUoTDDD6MSvIe+eCDZttis9O3j2m5aASAAvBPB/09VYn2zAmSSpWKb
 fFBJ2LgfCL+FFkgQQ/TplVSj3jc9w4WspiqePL3Ro99VgtSKn7Fyt1qJkCgpdlzvn+NTn+1ASxo
 B2JUbDpB5J9NQ2F2n5a7GfZGvSc6SpPyzBbxuuiUCDsrNeiTpC5Tvyy6YWIsitFRfmq8=
X-Received: by 2002:ac8:5794:0:b0:4f1:c6c4:dbcf with SMTP id
 d75a77b69052e-4f1d05e1994mr118120711cf.41.1765788053684; 
 Mon, 15 Dec 2025 00:40:53 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH/1noZeIOiPTqPNhvlgm4f0gFz0fAc6cRFHkHLSAhxls+TIUbS04EGECkvuqYtOB+uQYVx2A==
X-Received: by 2002:ac8:5794:0:b0:4f1:c6c4:dbcf with SMTP id
 d75a77b69052e-4f1d05e1994mr118120621cf.41.1765788053258; 
 Mon, 15 Dec 2025 00:40:53 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f1bd6b50afsm90557971cf.21.2025.12.15.00.40.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 00:40:52 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com
Subject: [PATCH v3 08/11] drm/msm/dpu: Add interrupt registers for DPU 13.0.0
Date: Mon, 15 Dec 2025 16:38:51 +0800
Message-Id: <20251215083854.577-9-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MiBTYWx0ZWRfX+Xv9OLXzrqdY
 KTS/FU//6a2nAynq6T0KC+ksPqXmqkgydUl3B7bHc/GimZmmGLiDx7P1zGdC4RXfLIg2MxN/viG
 a3bfpqrj3jf1mEbYusOURrcYFyLxkPIFih6z58/H139Xi5sYIQvBua1lilOe5+TFbyyePmHdcft
 m6iQ6IB383L6r8q5zkkDyVCQGlphFYbwbxgKhtU0VkIBnHpzaxVNMP7wlK8J7Nb3soX4pI4QmZx
 Y+JO9B3d2eQKfMvYYNL3DoawITZCL2AdousK+oBzpqpTjGNZMQNIDSGEY6bw+TkneHOLcPo5k2p
 CFBLVZM9z0JIY49RBLrt6bzA3XyKXkn7MZN9TsdDm3hAZDFj+UxCFFJlnIR6sio10sxxUqVm4Bu
 Pdp/3LClmhj122FJinN1YrQ03Y0aYg==
X-Proofpoint-GUID: dHX5SITaJoGfVkOqobtUlBUFUMOd8R4u
X-Authority-Analysis: v=2.4 cv=PJQCOPqC c=1 sm=1 tr=0 ts=693fc996 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=RfJNy9JZAWTFlj1jTG0A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: dHX5SITaJoGfVkOqobtUlBUFUMOd8R4u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 spamscore=0 phishscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150072
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

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

DPU version 13.0.0 introduces changes to the interrupt register
layout. Update the driver to support these modifications for
proper interrupt handling.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 89 ++++++++++++++++++-
 1 file changed, 88 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 49bd77a755aa..5b7cd5241f45 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -40,6 +40,15 @@
 #define MDP_INTF_REV_7xxx_INTR_TEAR_STATUS(intf)	(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x004)
 #define MDP_INTF_REV_7xxx_INTR_TEAR_CLEAR(intf)		(MDP_INTF_REV_7xxx_TEAR_OFF(intf) + 0x008)
 
+#define MDP_INTF_REV_13xx_OFF(intf)			(0x18d000 + 0x1000 * (intf))
+#define MDP_INTF_REV_13xx_INTR_EN(intf)			(MDP_INTF_REV_13xx_OFF(intf) + 0x1c0)
+#define MDP_INTF_REV_13xx_INTR_STATUS(intf)		(MDP_INTF_REV_13xx_OFF(intf) + 0x1c4)
+#define MDP_INTF_REV_13xx_INTR_CLEAR(intf)		(MDP_INTF_REV_13xx_OFF(intf) + 0x1c8)
+#define MDP_INTF_REV_13xx_TEAR_OFF(intf)		(0x18d800 + 0x1000 * (intf))
+#define MDP_INTF_REV_13xx_INTR_TEAR_EN(intf)		(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x000)
+#define MDP_INTF_REV_13xx_INTR_TEAR_STATUS(intf)	(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x004)
+#define MDP_INTF_REV_13xx_INTR_TEAR_CLEAR(intf)		(MDP_INTF_REV_13xx_TEAR_OFF(intf) + 0x008)
+
 /**
  * struct dpu_intr_reg - array of DPU register sets
  * @clr_off:	offset to CLEAR reg
@@ -199,6 +208,82 @@ static const struct dpu_intr_reg dpu_intr_set_7xxx[] = {
 	},
 };
 
+/*
+ * dpu_intr_set_13xx -  List of DPU interrupt registers for DPU >= 13.0
+ */
+static const struct dpu_intr_reg dpu_intr_set_13xx[] = {
+	[MDP_SSPP_TOP0_INTR] = {
+		INTR_CLEAR,
+		INTR_EN,
+		INTR_STATUS
+	},
+	[MDP_SSPP_TOP0_INTR2] = {
+		INTR2_CLEAR,
+		INTR2_EN,
+		INTR2_STATUS
+	},
+	[MDP_SSPP_TOP0_HIST_INTR] = {
+		HIST_INTR_CLEAR,
+		HIST_INTR_EN,
+		HIST_INTR_STATUS
+	},
+	[MDP_INTF0_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(0),
+		MDP_INTF_REV_13xx_INTR_EN(0),
+		MDP_INTF_REV_13xx_INTR_STATUS(0)
+	},
+	[MDP_INTF1_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(1),
+		MDP_INTF_REV_13xx_INTR_EN(1),
+		MDP_INTF_REV_13xx_INTR_STATUS(1)
+	},
+	[MDP_INTF1_TEAR_INTR] = {
+		MDP_INTF_REV_13xx_INTR_TEAR_CLEAR(1),
+		MDP_INTF_REV_13xx_INTR_TEAR_EN(1),
+		MDP_INTF_REV_13xx_INTR_TEAR_STATUS(1)
+	},
+	[MDP_INTF2_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(2),
+		MDP_INTF_REV_13xx_INTR_EN(2),
+		MDP_INTF_REV_13xx_INTR_STATUS(2)
+	},
+	[MDP_INTF2_TEAR_INTR] = {
+		MDP_INTF_REV_13xx_INTR_TEAR_CLEAR(2),
+		MDP_INTF_REV_13xx_INTR_TEAR_EN(2),
+		MDP_INTF_REV_13xx_INTR_TEAR_STATUS(2)
+	},
+	[MDP_INTF3_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(3),
+		MDP_INTF_REV_13xx_INTR_EN(3),
+		MDP_INTF_REV_13xx_INTR_STATUS(3)
+	},
+	[MDP_INTF4_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(4),
+		MDP_INTF_REV_13xx_INTR_EN(4),
+		MDP_INTF_REV_13xx_INTR_STATUS(4)
+	},
+	[MDP_INTF5_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(5),
+		MDP_INTF_REV_13xx_INTR_EN(5),
+		MDP_INTF_REV_13xx_INTR_STATUS(5)
+	},
+	[MDP_INTF6_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(6),
+		MDP_INTF_REV_13xx_INTR_EN(6),
+		MDP_INTF_REV_13xx_INTR_STATUS(6)
+	},
+	[MDP_INTF7_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(7),
+		MDP_INTF_REV_13xx_INTR_EN(7),
+		MDP_INTF_REV_13xx_INTR_STATUS(7)
+	},
+	[MDP_INTF8_INTR] = {
+		MDP_INTF_REV_13xx_INTR_CLEAR(8),
+		MDP_INTF_REV_13xx_INTR_EN(8),
+		MDP_INTF_REV_13xx_INTR_STATUS(8)
+	},
+};
+
 #define DPU_IRQ_MASK(irq_idx)	(BIT(DPU_IRQ_BIT(irq_idx)))
 
 static inline bool dpu_core_irq_is_valid(unsigned int irq_idx)
@@ -507,7 +592,9 @@ struct dpu_hw_intr *dpu_hw_intr_init(struct drm_device *dev,
 	if (!intr)
 		return ERR_PTR(-ENOMEM);
 
-	if (m->mdss_ver->core_major_ver >= 7)
+	if (m->mdss_ver->core_major_ver >= 13)
+		intr->intr_set = dpu_intr_set_13xx;
+	else if (m->mdss_ver->core_major_ver >= 7)
 		intr->intr_set = dpu_intr_set_7xxx;
 	else
 		intr->intr_set = dpu_intr_set_legacy;
-- 
2.34.1

