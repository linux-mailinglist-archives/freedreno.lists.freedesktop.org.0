Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A120D23840
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 10:29:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3507910E71E;
	Thu, 15 Jan 2026 09:29:08 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UDTgE2AD";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="FSzSwEwQ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A597910E720
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:29:06 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6fmow3419433
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:29:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=AlSWjXvP89D
 8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=; b=UDTgE2ADHhAYkSlFuJ00p+0Eam9
 NdoLZ9G8OwlM8PJ6BGKIqKLCKKIdA9gFPH4Oh0gfQ+9pgBkfRnJc7mVN98BfDd1X
 L3vUDcUpEz4sBgQrh9qNEeUiUEcz0b6H1VJS+C9x2m7xbDN5KERD9fnjLebgwMyC
 Yfulohv5RYLoQNeOXj5iR3+PEqNB0wTDNyZEla9+k6cVd1+i7xiOBmGO3sX9Ezfz
 QZ0owESgCF7x0XbURD9JXOAGOqdJmmk0NyvoDIjtCa+JKLBcNm7VMTfa3D/0kkFq
 cVT7WwZEZFvPvrChROEBSqAts+rxRAl1rG2jBFTsKRWMpwP+Cueo4zQSGkA==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpjj89x9f-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:29:05 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-50145d24ffcso22815741cf.0
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 01:29:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768469344; x=1769074144;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AlSWjXvP89D8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=;
 b=FSzSwEwQkWHNKjUk4OPnrI1eifaffpjBUDkE/w9qFSft4GCgByeIR2/czg8Ie6Pfi6
 O7/7og4/1YsdYARn/YLxOpILI6bmYK35LZnNFOlspajR5oyK4Yxb8M+4JSgedwnQhmNP
 WhdWSG5RlP3lMev6SwEIB6Qflz9yCho8601GJz1X2XUlmGUOATljhdgLVXv7vbGiGNif
 gr7y/gT04y1FC+AdDSn+tdMjMoCnM8zxTahIO71PFYPcJm8TJAcnSKYsESZpm0CZjeh4
 V5OTVm6+BL9xWwd+Uj4NqokKc6AkDaRFM75mIJ4Huu6E+4i9fpOwcSySLmFOdYmqgd2e
 7YMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768469344; x=1769074144;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AlSWjXvP89D8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=;
 b=QbglfqWy4cmFnw9JOgYCwu5sfBb2pvV6XCG0gHFZvSFlqlbLeN36bcfda/aSq9qu35
 I3QoDGV9SWoqUt7tWgKHvoYKCoWwl5/wA2Xj1usPECTOIye98jsUm2T8lYIz8oeZB0GR
 ZdE8J4UF7A231SjDpl3g9YhRNBVzEYdsMxOvqO1R+qRE59+ia/5LE4BDW4H1RpzLFbc3
 gifj1t4jl3V99fUqRaglE5uJ15N3dicmbuJD+4c7tfdjUHF1dA37Qg0hcmLM8VQPYbKj
 L8zrKynOssXL6KXmkto+WbIAvuEswgH9Ha3Q2wab87eTJ5vjsTVd67UrjcdL6LD8HkUa
 prMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUjO99nUQM1Rx3tTH6IHSBTs6kYYNDAkO13qYbajIOt6NFlk7icpppH4EsGEjLePZRnZCK0ybcbTJU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzltQLd/mAqWPlGjOnSsoeh8iqOcB966ld0xlh+xOqDLSToy1GH
 QN+VZrfOXQt3CyC98DEFkrkA11OuyevcucdAGATRE6fWGvtTkgctcRKNvLVUGNCHRuajtZeQzmq
 XeNfIWVb5qAaHJtGrhR/Nmn79Gilw95XolLCL/QraZb7ZPT3aS83AYf68BuoHOKKCk16vG70=
X-Gm-Gg: AY/fxX4HD5OdzjxK6eC93VRtnScmif6FLnTuoVXbN+NCxkuXZMQZ+zLq5v4WtsQ8g2W
 ocKOMRyAq7aCA1e94O5W0Ft7e3p2y1Wsx26d77qAyElUNSHPnuxgEKlJ4sS1vW+5TUrCTuS37c9
 hbOuStJ4A2yhd0u7BHLTwPbdxKrRRsT5V/E27h/O3FYsh65RUl3TVgiR0SjWdYjcIUwDm+uzb/N
 e4xvTu1VeS6HfXF8+7e548qdmjwrnKO+BiFsO1GzUSllBL6kq2gN1Lg5dHyfgZfLYOLqZJaDAzG
 2IQP/5GktdvSBvprM32ppV6oTgOugI6f4HvkGyDm26WB4YP2ilvtASXz1uYf1U28S6RvP1n0Uau
 IBGsF3mw5G9Akq+r8piaiT2nlLzJXro5CMlA2Kppxt6jld3ptAdkPFHYtShcujzzdd38=
X-Received: by 2002:a05:622a:1993:b0:4ee:bac:e3aa with SMTP id
 d75a77b69052e-5019f906e27mr36433991cf.35.1768469344085; 
 Thu, 15 Jan 2026 01:29:04 -0800 (PST)
X-Received: by 2002:a05:622a:1993:b0:4ee:bac:e3aa with SMTP id
 d75a77b69052e-5019f906e27mr36433651cf.35.1768469343680; 
 Thu, 15 Jan 2026 01:29:03 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-892668a2419sm64388416d6.30.2026.01.15.01.28.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 01:29:03 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v6 07/12] drm/msm/dsi: Add support for Kaanapali
Date: Thu, 15 Jan 2026 17:27:44 +0800
Message-Id: <20260115092749.533-8-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
References: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: UAMPf71dLifONyEVJjBBPbt6IjfM0R-Z
X-Proofpoint-ORIG-GUID: UAMPf71dLifONyEVJjBBPbt6IjfM0R-Z
X-Authority-Analysis: v=2.4 cv=EIELElZC c=1 sm=1 tr=0 ts=6968b361 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EGddA7oXPexY6v9tJfMA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NSBTYWx0ZWRfX7Pw4N4sGwcgi
 W8fjmO6DQdMqap5j1oDYXX9TN+A+rFswlyS8WUXUYD4IEUkvv0tB8zLm2MkmOiUEeDofxc8/ajO
 o7hT0GfMLnKmao+wnKJe5ZI+boOTnk4peDtfVNCxneajjIjgk7eQ3SMxP/kinASqiQ1gPm/WkRT
 km6+27WBkkSuhpXSI4zVtRU/8q3I925P5jE7z8L1pg/5LGtKbq/N/fMJ9ryJCgGnoCj8FAneg4X
 eE0SYybnJQWVey+GMS7SmNPqLMKQ8qwCf5FeNsEwUUc9vYex+FaemcsvhjAmbud0dTVHNxpFSr3
 3FE1MDtstQbg1F7CVeuHtoOlz1GpJU4yGohpUAgCmx4mZkv320Vayip54J2BvdH/NGjJl+h3HjG
 SlHTdhXtF8VVxOSZ8VuBHMi3EmiUqyqf1rKFhobRU6ntgi8Q0abofdO8OOk/2IssjpHFFAUB1Ov
 raOWq+Ux+pWvPqyD6Ag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 clxscore=1015 impostorscore=0 malwarescore=0 suspectscore=0
 phishscore=0 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601150065
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

Add DSI Controller version 2.10.0 support for DSI on Qualcomm
Kaanapali SoC.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 13 +++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index fed8e9b67011..bd3c51c350e7 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -205,6 +205,17 @@ static const struct msm_dsi_config sm8650_dsi_cfg = {
 	},
 };
 
+static const struct msm_dsi_config kaanapali_dsi_cfg = {
+	.io_offset = DSI_6G_REG_SHIFT,
+	.regulator_data = sm8650_dsi_regulators,
+	.num_regulators = ARRAY_SIZE(sm8650_dsi_regulators),
+	.bus_clk_names = dsi_v2_4_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
+	.io_start = {
+		{ 0x9ac0000, 0x9ac3000 },
+	},
+};
+
 static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
 	{ .supply = "vdda", .init_load_uA = 8350 },	/* 1.2 V */
 	{ .supply = "refgen" },
@@ -332,6 +343,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&sm8650_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_9_0,
 		&sm8650_dsi_cfg, &msm_dsi_6g_v2_9_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_10_0,
+		&kaanapali_dsi_cfg, &msm_dsi_6g_v2_9_host_ops},
 };
 
 const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 38f303f2ed04..5dc812028bd5 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -32,6 +32,7 @@
 #define MSM_DSI_6G_VER_MINOR_V2_7_0	0x20070000
 #define MSM_DSI_6G_VER_MINOR_V2_8_0	0x20080000
 #define MSM_DSI_6G_VER_MINOR_V2_9_0	0x20090000
+#define MSM_DSI_6G_VER_MINOR_V2_10_0	0x200a0000
 
 #define MSM_DSI_V2_VER_MINOR_8064	0x0
 
-- 
2.34.1

