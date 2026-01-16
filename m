Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B3241D2D29F
	for <lists+freedreno@lfdr.de>; Fri, 16 Jan 2026 08:27:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B25A10E80C;
	Fri, 16 Jan 2026 07:27:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GGZEXB9B";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hUfxtoPQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5768010E80B
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:46 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60FMcuFm4101350
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:46 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 9XKxSV3npugqCr5qKJ+/bMzEPofZPWIgN1+iQGbZA4s=; b=GGZEXB9BsJS4YR1q
 GnMo0rSPqCuU8Q5EyQrs0btXMall62kDALqebtciHeKdkwepXXXEbiNNREK1OPNs
 wz2JfiMAObgpNCcXUk8t1aoQ+6pxsOQhFlScJGXkvnvE16R9+zAxBq+E1dL27j6S
 n+rbd3ODrZUioKpVz3j3Eg2H0lGLEkQt0rWguKQWLL1XiPGSDeJA+34+sL9P6IVg
 x5Yn9qPYYszKqDz/gM/1d+63oRt3uuL526GaWXnALtpE/gJaf9kjxnnJDFuTqD/Z
 ZJnAkM37LS6Vm8xf36nmGmmSw6S3bxuPUllr8j90lk8QPkzUz7GHiBdxemORLUhH
 8HtMhA==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bq97517eb-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 16 Jan 2026 07:27:45 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8c52dcf85b2so678644085a.0
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 23:27:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768548465; x=1769153265;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=9XKxSV3npugqCr5qKJ+/bMzEPofZPWIgN1+iQGbZA4s=;
 b=hUfxtoPQX9MuCIfMlhsOSdNuTLEdzfPwDONeXzFf87Rm/VggLG27CbCL1VcUlX+Uf8
 UnZdmQYlwfWJ35X3Kbe3oCLxoR50ftdPusDE2KBaT1SnQ89PD3iLQn4SxZbiXyMjlVfq
 Tx2N+d+wJdvWpDp91b+leq4ay9IFLLkEG1el5XM85hOaSPRM8mMvwgkoHVJtcWVOVwMa
 BXfTT38yUQ2pGJ6gOGY08clJxW84tpW0YuOMRK4TCfUCfckQgW2gnGul+orYzg2v+w/c
 IK+iQWPpiyv4ePHhPneL2X8nDMQbliysqMLMRKRpKpdSWoTxcmvwmXurVJ7viy2D7JfU
 B8cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768548465; x=1769153265;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=9XKxSV3npugqCr5qKJ+/bMzEPofZPWIgN1+iQGbZA4s=;
 b=Z8R43tfzN2db/YnFBj/ZTEYDQId+kCev5JJIO5LVbDjmJNsCVn0WBOnizgY69A7OHU
 yoSxwEwiA21CsXDUH2xg4RuxYGesQb3oBchN2q6K0EMxi+MQzPgnVVH2TpM9bWND2zho
 1UKrH/Yd4Yd8XMSy5osahXs4BTYbT6mtgqYckBBX7K37FEKLFUVCrOEN2FvTo+/vI3Bj
 bLiRZQ9u1kmff44POq7O4oiUfzNJlX+8CL4vhrVYUoeR2yQEDvJ+Er7t6D5CC7Q8DNIh
 6ErMIUpLgq/HfLlshCqPA/TFbdJ0KbOH4P4WCvV8H9gMB5+nto6lJ8VregGfLprhO55b
 +d5w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUmJia3Y+xqaUU4/Z4h4ev67NqNxyz7FM3ckyMi/bJ/kEVjco7wNVx0MB4C5mnKYW1cBUNmqkeBiuQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6aT4wuSX7BOWn/Yf7h1q5/ulHljTHqyyT1SNOwh89+W8iFfUt
 7/9e0eyMSZVRftdFE7VxvQVKPk/H0sguccScwFNkFkAzU1R6BL6YV/cRD6VMiSUczkSLM088PbX
 vNuuJscYKfA3FiYLZXCuZrI5ksg5JkUqj/fN1Qf0I5mP/PzRsZg9kkt9PhT4pMSFa1vX2QSs=
X-Gm-Gg: AY/fxX4sD/ljNfISmyQkGSz1ymbnIKbhi8yo0eqevVlI2oSdzDyH1dIRK3YWj62/WCR
 wDfd2oFEMu9m0iu2oLB5Y1GmlLVOR7UMC9aZGRmlAgofwAnHr/JvGvC9yltxK2oPUsoZ3qEZOYh
 QWsk7ti/K2rBRZViCei6Rhg0yUDVyRo9D14l3tc3qSZWQat11Re+8gUAHwF8eNjhn4+RU7j9koE
 jP6BCtzH6Zi8kXvQFtY6Cq07PoaWLL97aU+AAXw0ND/gxg2NX7MJnodwOf98WGRfr3YaolfVn+2
 MQSjAgHpSh9QU0Tla6R9G+bAR/UyylQBvYH1F1FAaRU2Nf4UmiH/X6+qcqmYsPnBDMY+KHLauZy
 pHvXIyikhZYAmGLnKSG/VN6K60MH9pLX9Zu5GJNdHGppSH+Eei7KfbJ21XYgUS3UM/3CuCGfvMN
 UJbi3AJYUwvh8MY2/DYqrtGUo=
X-Received: by 2002:a05:620a:480c:b0:82e:ef43:38f0 with SMTP id
 af79cd13be357-8c6a680c591mr276449185a.0.1768548464912; 
 Thu, 15 Jan 2026 23:27:44 -0800 (PST)
X-Received: by 2002:a05:620a:480c:b0:82e:ef43:38f0 with SMTP id
 af79cd13be357-8c6a680c591mr276446785a.0.1768548464351; 
 Thu, 15 Jan 2026 23:27:44 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59baf3976dbsm516941e87.66.2026.01.15.23.27.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 23:27:42 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 16 Jan 2026 09:27:37 +0200
Subject: [PATCH v3 3/9] media: iris: retrieve UBWC platform configuration
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260116-iris-ubwc-v3-3-662ac0e0761f@oss.qualcomm.com>
References: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
In-Reply-To: <20260116-iris-ubwc-v3-0-662ac0e0761f@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Vikash Garodia <vikash.garodia@oss.qualcomm.com>,
 Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>,
 Bryan O'Donoghue <bod@kernel.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-media@vger.kernel.org, Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3276;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=NJlond/l+pvaPzxG2+3Rh8GZXYyqIPyIRMdtfABwyGA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaehpSLK7eOuMmp9/+kNLG1ooHmenK9K3vg4xt
 jzmr6bz2tiJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWnoaQAKCRCLPIo+Aiko
 1dThB/wKfxVwqr2XC5pORtSw1x3vtVL2Rn5Xauf2HTownr4jUtpxhFHFEG+8gh6dgZl1VQz/cA6
 mi92iIz8/PSP0oHvNMPpENoQi5RU8GwE4gdeVvCMcVcZqQEe4B2PTYOdLzoZJ5HhV9TiGcWyGQ1
 nhoMse1XdTg6+Qp9C7VKoQF6WbtrpicZMXpL4o3YO2LO9dIJYFxokCgs9ac0wg7oI404iK3j2ne
 Rm5pIPj/Xv3heMl5ooTMOGWCHnghyBeJTltAu4nK06CSKPBkAIPzaYRi1Z186TWcDzQh/G/hU/G
 zRx7tgHbbXEE2ckLyWH33YKnzu86ZGI23xhBwyGcO5OWuyfo
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE2MDA1NyBTYWx0ZWRfX5fEePydEA520
 dWGAZUyIs8tCPo1y3ybGHDrNEziTbcbvcZ9orI2/TDuAKaUbiBTIOjq4AC6XU5SQy1DWs9kqKJg
 UE7EHxJfH4Q4mqtwLCxELxh31S1xcVCZ/QNP/dXOR24ZbR5VMSc89MoQhvBqZhlOMOAh1SKOjv3
 oUgqRCALq1BDmsb2Opt7CiUjYXf7977BhqzHsxxzM0e6GD2T2ZnGwi6sSPAnwQAmEG6vU9938y/
 bOlwqihKY7dAiSCbWQjxqD3VU35+xMhFbrMuTkwAvIMad+ihUwqgNXhx6qHwNCTZ5dEuAXFvpnX
 CkWTWxxt57EiGAo5mHlo+JhmBlwTtuCNbUrgEkJmDrTnsRTqlg7+vQkRepAH6neMCZUhRgJ8dTs
 BnZAdei8RqvtkybAmchisL+mojjeoUT5+sdaP+/3WK1JgXwtrF63KFgIkkdOZ2ZouCqg2QW7ROV
 x+Z0uHcZprxDj7r/PVw==
X-Authority-Analysis: v=2.4 cv=Sv6dKfO0 c=1 sm=1 tr=0 ts=6969e871 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=KZIT3C-7-F78qrtZtU8A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: LRYC1cKzGAmw2EdqAFxt2M-4smEfWPT7
X-Proofpoint-ORIG-GUID: LRYC1cKzGAmw2EdqAFxt2M-4smEfWPT7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-16_02,2026-01-15_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0 adultscore=0
 phishscore=0 spamscore=0 suspectscore=0 lowpriorityscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601160057
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

Specifying UBWC data in each driver doesn't scale and is prone to
errors. Request UBWC data from the central database in preparation to
using it through the rest of the driver.

Reviewed-by: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Reviewed-by: Dikshita Agarwal <dikshita.agarwal@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/media/platform/qcom/iris/Kconfig      | 1 +
 drivers/media/platform/qcom/iris/iris_core.h  | 4 ++++
 drivers/media/platform/qcom/iris/iris_probe.c | 5 +++++
 3 files changed, 10 insertions(+)

diff --git a/drivers/media/platform/qcom/iris/Kconfig b/drivers/media/platform/qcom/iris/Kconfig
index 3c803a05305a..39b06de6c3e6 100644
--- a/drivers/media/platform/qcom/iris/Kconfig
+++ b/drivers/media/platform/qcom/iris/Kconfig
@@ -5,6 +5,7 @@ config VIDEO_QCOM_IRIS
         select V4L2_MEM2MEM_DEV
         select QCOM_MDT_LOADER if ARCH_QCOM
         select QCOM_SCM
+        select QCOM_UBWC_CONFIG
         select VIDEOBUF2_DMA_CONTIG
         help
           This is a V4L2 driver for Qualcomm iris video accelerator
diff --git a/drivers/media/platform/qcom/iris/iris_core.h b/drivers/media/platform/qcom/iris/iris_core.h
index fb194c967ad4..d10a03aa5685 100644
--- a/drivers/media/platform/qcom/iris/iris_core.h
+++ b/drivers/media/platform/qcom/iris/iris_core.h
@@ -30,6 +30,8 @@ enum domain_type {
 	DECODER	= BIT(1),
 };
 
+struct qcom_ubwc_cfg_data;
+
 /**
  * struct iris_core - holds core parameters valid for all instances
  *
@@ -52,6 +54,7 @@ enum domain_type {
  * @resets: table of iris reset clocks
  * @controller_resets: table of controller reset clocks
  * @iris_platform_data: a structure for platform data
+ * @ubwc_cfg: UBWC configuration for the platform
  * @state: current state of core
  * @iface_q_table_daddr: device address for interface queue table memory
  * @sfr_daddr: device address for SFR (Sub System Failure Reason) register memory
@@ -95,6 +98,7 @@ struct iris_core {
 	struct reset_control_bulk_data		*resets;
 	struct reset_control_bulk_data		*controller_resets;
 	const struct iris_platform_data		*iris_platform_data;
+	const struct qcom_ubwc_cfg_data		*ubwc_cfg;
 	enum iris_core_state			state;
 	dma_addr_t				iface_q_table_daddr;
 	dma_addr_t				sfr_daddr;
diff --git a/drivers/media/platform/qcom/iris/iris_probe.c b/drivers/media/platform/qcom/iris/iris_probe.c
index 9bc9b34c2576..85e531b35ecf 100644
--- a/drivers/media/platform/qcom/iris/iris_probe.c
+++ b/drivers/media/platform/qcom/iris/iris_probe.c
@@ -10,6 +10,7 @@
 #include <linux/pm_opp.h>
 #include <linux/pm_runtime.h>
 #include <linux/reset.h>
+#include <linux/soc/qcom/ubwc.h>
 
 #include "iris_core.h"
 #include "iris_ctrls.h"
@@ -248,6 +249,10 @@ static int iris_probe(struct platform_device *pdev)
 
 	core->iris_platform_data = of_device_get_match_data(core->dev);
 
+	core->ubwc_cfg = qcom_ubwc_config_get_data();
+	if (IS_ERR(core->ubwc_cfg))
+		return PTR_ERR(core->ubwc_cfg);
+
 	ret = devm_request_threaded_irq(core->dev, core->irq, iris_hfi_isr,
 					iris_hfi_isr_handler, IRQF_TRIGGER_HIGH, "iris", core);
 	if (ret)

-- 
2.47.3

