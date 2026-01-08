Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6587BD01B1C
	for <lists+freedreno@lfdr.de>; Thu, 08 Jan 2026 09:58:30 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34E8D10E6B3;
	Thu,  8 Jan 2026 08:58:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cr+cDKz/";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dpOqXij4";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E34E910E6B3
 for <freedreno@lists.freedesktop.org>; Thu,  8 Jan 2026 08:58:24 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6084euhg2593277
 for <freedreno@lists.freedesktop.org>; Thu, 8 Jan 2026 08:58:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=AlSWjXvP89D
 8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=; b=cr+cDKz/xSZUWk6B06N+mmY220k
 I2lAAwjoK/uUXw+OQdofauEx2KHJHLu2Ts2WBb5bRLTC1fFG0gZz4hZB4WkDReOR
 D8x+tCTnwpWVWH+gYuRC43tuxo5CT+zM12+z0+LipTab+0vGlxRd1zvVWmnhUi0z
 rWWRMMuME88sXlMuePPDaKVDUhcVGaHfAjMGWC1wf0YQWshm/nE8x8k7T9/PFW1V
 LQ2I51KG7tlQU3d9LQ+k3pM4hNf4baKJsQbqM5wtYX51QxFDSCZpN84Q8His4zbd
 ziVL1uQv+eWtSz4Btaj4e1MRtbZUzX5tzTGAkfjAYJuoe5QCKRI2h/95tnQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bhn294173-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 08:58:24 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b2de6600c0so758641285a.1
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 00:58:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767862703; x=1768467503;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AlSWjXvP89D8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=;
 b=dpOqXij4d1n2FrzV1Oi24Fb0Z/k3mSUuC26azR1YfLuQs6hHDhxBakBlD1s7GCEHk+
 j8QavRVhJt1TICvPZuL+0zaQpS4lKjNerrpoesdf+YVLa77j6XPUwvlSgT6PZ7m7qg8Y
 /NEZwv6rEulNw2mfVtTZfIbWmBRxAyiReUamTvhiLglzyD9Q1exQw+oPcYz7R+PmdGa4
 xnVcBksuXQFngl9Q9+UJPoPBu+pkt0o8MnaA9x2bx4YRBodVGmYrz8s3SxNiIX1IQ+aI
 99nrw3nDtAfDo8yr8KEFbWgo+thPyRGioHJH2TIuImBsW+D74rIUmDvdp8bcrPhqrz4C
 JX5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767862703; x=1768467503;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AlSWjXvP89D8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=;
 b=GFbOxquAsLE0wV0KdSr9DNy1TZ1ay6BMhwmflbDFuY7kAfpbSnXPu8z5GaItsAL/fh
 PWVm9fVPo3IIa5X2ntlV0P2FuhxNGcS7FmE42O3pXs6a5VL4xlWfB6piVHwYhsqa39m0
 zew6uTH6qzph7B3qe0hqOlmgrDcQVq73yBjYElKtPRDfg8ycBjmM0qf3iflTxGPE+Dk9
 jMAr3k7gaHjJZHXvHzLSvdiiUrxG6FhpFkPBbCmYNrouHR5ToICtDEXG9nJd7JgK0UZ6
 KZDZfIk2UQMPVEvV03I4vT73ooVBKQrlqqzRvc/UO7txxmrm8pNbw4ty62JNM1JXRuva
 k0PA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVUHM/6sA3w+RbMeSyoYaLkXa5+6XyGRopjM+i+BPRj2bmZZVwNXWwsQP3GKjaLk3nLIIidD3u5NRE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz72isH20yrnM92vA/iNZ6A9hdjehvf+/SoSIJymSMvFAikiivP
 u091UvXnlV27z4Xlevhh2B7xZrWeJ+6LkI59w4Jv+qtwMws7QzcS9B/KRTNBqXnH0rPDrq0um2Y
 ww9wog2FPRyVkbogD5Oq0kDctPDDsjl6eaQWF7ecP1gGT5mcW70fzCWLaePZmt7OcsIZlrsE=
X-Gm-Gg: AY/fxX7Zt48Eesm36xa5qRLKzb1qM+oqW72YwLEIGrO3SAJTEzpLndMSGehTikg/ebK
 gQFOAP+4Agdv3SYkUpOs7DVqXeCjrDzu3eait6JvSpQ1RemDSExDAptCR420RSMlI0gn2Qk3s75
 EMXX6zyWTU1VqYLBiJuOc3g+pKuC6Dwj/QsLjzapBLqOc6yHLGkduL8Ribirwndu7evcMe1ikFy
 LnFnTsS+yhm+3EvJYVA/nEPCaqTygc6HL5Zx1v1hLCgrhQp1bL7hsCE2zZhWrP89eCJO3HSQODj
 GCCCS5ytk0CFLhWbEE7TPSB5bNdX1cDbfOgrD17jvBX9TAn3i6U7fX4sxhCjRAnME6x2zb0StrP
 lFisEdMkxIKA4owRToEjCruyTtIbQVTLVVbYBDu8vKkJJxsyHwQoysx7kxKMYT/cymsE=
X-Received: by 2002:a05:620a:1aa8:b0:8b2:664a:309b with SMTP id
 af79cd13be357-8c38941c034mr652184785a.84.1767862703433; 
 Thu, 08 Jan 2026 00:58:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFd2KU0rDWQ/R3b6xYRGG3myKrYnDS3p+KmuStEdvZ5CG3nEDqVpppZIpNi/G/SxwTUg47LCQ==
X-Received: by 2002:a05:620a:1aa8:b0:8b2:664a:309b with SMTP id
 af79cd13be357-8c38941c034mr652181685a.84.1767862703011; 
 Thu, 08 Jan 2026 00:58:23 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-890770cc7eesm49680326d6.2.2026.01.08.00.58.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 00:58:22 -0800 (PST)
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
Subject: [PATCH v5 07/12] drm/msm/dsi: Add support for Kaanapali
Date: Thu,  8 Jan 2026 16:56:54 +0800
Message-Id: <20260108085659.790-8-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: OagfMrrBiYrelQof95hgXF0-0uN883IB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfX62QyCRbv/gXD
 /X/JlkS+Vi26dQnWf3Mf+hE5q7Dgp5IQX7C82x7LWZ06S+Y/dw8B+Yyvd4SA3baeAgnei3D4i49
 U1mrE/dYZ1qBfI/nJOChLW64jmWDAqL+3ZgqGqoA8Ih4f8s3bl/2bIIVkBvViLx01ZTyq06pa5Y
 8UwgPiGdpsRlz4QJl/MPzsHf/LMfZ/vr0sEHLcZYVh3uCQlVGUT1ixmyBpJYW+IFfTpJmm/NlIL
 5/ZMAjs6oawuCEeEqehThVzYg/a4Fuop9kQ+/Qufp5IokVN15z7/AuI4N77GofU3w9wMHQjx+7S
 jzn4NwKYxK7na2W0AGnJB88v6u3XqLU+sYZwpE81iBkygZmlIieIgiXpU4mQXh63+YEW1waFKIk
 tCan/7lTC3kkmK7uxczIM0pkIlrAobxZV8M4pk7AsStYk7OSNsicVVMJCUPMmlnBQBnY3dqhVGF
 olhDQdjroTz/HtwucEQ==
X-Authority-Analysis: v=2.4 cv=P7k3RyAu c=1 sm=1 tr=0 ts=695f71b0 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EGddA7oXPexY6v9tJfMA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-GUID: OagfMrrBiYrelQof95hgXF0-0uN883IB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 spamscore=0 phishscore=0 clxscore=1015 malwarescore=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601080059
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

