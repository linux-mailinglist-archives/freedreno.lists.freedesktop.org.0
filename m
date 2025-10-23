Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 549CEC014B6
	for <lists+freedreno@lfdr.de>; Thu, 23 Oct 2025 15:16:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E5B610E8FA;
	Thu, 23 Oct 2025 13:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="UCqh9su+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE9EF10E8C0
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 07:55:05 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N75wem028844
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 07:55:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=hxn7ShIYBtn
 ywIoj5z7bF8woB+YQ7/3kOpn9agNkuO0=; b=UCqh9su+0S8vwPc2G3kzO6ABdEI
 zGLJGtTbs6TcQjhPdV99Td6N6bWhLg8qCAWg3Jzi2E+eYAf420vl5e8xoQlQnxxJ
 IN0iTZr1SWzsSxjmh1/Ro+7TgiXgng3H0RUag+C34IO8/33lD0dedWxqt8Fk3WjK
 DxvcPZyi6tFE2iilFJ5vPW6IWKt5tsCpXuQ+WVOmD+8prh5Lpp2tHbjfHExuuR1s
 jhBwFrU24+A8em7FaumQVDbcxn5xuqF5C32HGrkPHKwVIF+k/02KnkCekIcOhCfd
 sv1XknS6jGMVIOs+s+QGY96+OHSpHB2U054ncfd3POAiEQysDkr0Ds1DmKQ==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08wd5vh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 07:55:05 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-27eca7298d9so14612055ad.0
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 00:55:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761206104; x=1761810904;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=hxn7ShIYBtnywIoj5z7bF8woB+YQ7/3kOpn9agNkuO0=;
 b=OMgSI5AHx6MiY17tXl2XMHFQUdJd1mW2DMJAPqqO7IbaLQt78FHYgv3K8dt8QaRW8p
 Q46UWj8oZq1asrUkjRONpG6DoKXyXgD771xnEOCdPwzHuW2U3IeAIp/9DzsJC1oiLwcg
 CeO8mmONSxAFwaW1uzvYbR91Nic7TNN08DUMWCjoOQo0ggias83bt0PfcYV04zCXw6Jc
 oF1TaPlmrr/PgN51/VY38pSRdNSHZ13UYYIVuRHzaqIKXaUdD1rQgEjHe8CHNdgUv6dh
 aIT2FKNmxlgXnGROQ9ug2aYlRjhETDoh4VPLVuPtmxBWeg9t35T1gQrtW9BfT/WMUxyl
 xb6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUZh3bcST+dn5Dbh3bXgDqI421sQDWHv/0BJp0dznr/C63K/CXcLLNbGi15Qdj3SRLQudsgnhQOwvY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YynJQNlGF+ka7BBRZFJLTyCoC7aD7eWiCflfhRBYrVvth+okczR
 /RF7a6k7sQ9lCjdc9Jxyu0iOtA1qK7qm2w+IehMYXI3sWN6ZrVqcQd5+9OZ+wNMUcth3r6E4Ea+
 zkjAxhezMSFmSl/jtIAs6xvp/ZEyJqTeOodxiMRrlltnb4FY72yo/pX/PK1JtA8s6gxuwLEQ=
X-Gm-Gg: ASbGnctIuzljyfnCip/Oe9b2qBcZutZw9mBHK6v+9CSg+MohhyBb8XBYm88JeXXvJnd
 fgL9sPzCeFCHtTBN7AUqNAnjF/av6R9eXxLJk9wm2gfb0TIkI2xjaJMgT+mSqhxroihgLoA0r+b
 NWJ+tYQ+I3Dr/+4AM9v+SUppybH4AXQx/RhVdEgREyw7bAAnB7j6Q3j7tXoHh/71PlfT4pW/Jpf
 fYqL50sO2wJJucKp+346CGUdRy8ARk9BU79D0iz0W0CtQL7Bv5r2wrzxXcsdzgxwHPSeBtgAHg8
 XmqgKq95hInHu1iXZEwv6YnFFN6wXUjiMA4nZgErOr4/gXTPC2WT7SvVQj5kifmSUFvSnL1AejG
 8Vy01EK9FMoHAYHSULF0nLoF8YduU2tFPPadK/yIYps7QHHv+Jw==
X-Received: by 2002:a17:903:98f:b0:277:3488:787e with SMTP id
 d9443c01a7336-290c9cf8e7fmr298783635ad.12.1761206104352; 
 Thu, 23 Oct 2025 00:55:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbPua/PqYedRnSX1LyIiA33Ruaseb4k4MVB5/62weZo4u2AYpakMUmfxzI5Qq0e4u2523ZLA==
X-Received: by 2002:a17:903:98f:b0:277:3488:787e with SMTP id
 d9443c01a7336-290c9cf8e7fmr298783445ad.12.1761206103942; 
 Thu, 23 Oct 2025 00:55:03 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2946e1231b0sm14371265ad.97.2025.10.23.00.54.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 00:55:03 -0700 (PDT)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH 01/12] drm/msm/dsi/phy: Add support for Kaanapali
Date: Thu, 23 Oct 2025 15:53:50 +0800
Message-Id: <20251023075401.1148-2-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: xoeBEAuovz1ysjfFxeZKqnUH6po0KM5K
X-Proofpoint-GUID: xoeBEAuovz1ysjfFxeZKqnUH6po0KM5K
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX1aNQgHr5Xw1A
 AU/8+9rVeTURbyz9OV+tE9x+Y0ZGO5+X2kiHZH9w7xvHPwaIhvSpu6rH7m7pgE6XLFaRZYA6rQI
 t3TEX4oX6GlmGZeBVHhXHq6XAhS2f1xcaxv5yL8ILMFIsPyiN7SKmMnrCCW9go0IOfhJ4sRf3L9
 BV0tCYhasUZ9cEeLlcgjIjN1ubRO2vCMe9ocphkA1yQnGw2v+22roWNfC4nLlwtTwU83PCEPyGT
 TTA9HkUjT3G2i8a6GTtr+lJryQnHvQTyeStueZpJNt1xJVycCHVjFuvM9f//ggvaPiHuuPv2QTY
 FmX4YoYwJIUFuF111v2k601Us2neaiQ2H0EjJDvyHeORa74bQz+vBuqKtuT8FYccuYlcS8R+xCC
 Lcomr/kRH2YAJ1Vpc8CpbrFydsAYtg==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f9df59 cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=B1tu1MuE3RNTBmX3WhkA:9 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 malwarescore=0 adultscore=0 priorityscore=1501 lowpriorityscore=0
 spamscore=0 suspectscore=0 clxscore=1015 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510190090
X-Mailman-Approved-At: Thu, 23 Oct 2025 13:16:01 +0000
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

Add DSI PHY support for the Kaanapali platform.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c     |  2 ++
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h     |  1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c | 23 +++++++++++++++++++++++
 3 files changed, 26 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 4ea681130dba..7937266de1d2 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -577,6 +577,8 @@ static const struct of_device_id dsi_phy_dt_match[] = {
 	  .data = &dsi_phy_4nm_8650_cfgs },
 	{ .compatible = "qcom,sm8750-dsi-phy-3nm",
 	  .data = &dsi_phy_3nm_8750_cfgs },
+	{ .compatible = "qcom,kaanapali-dsi-phy-3nm",
+	  .data = &dsi_phy_3nm_kaanapali_cfgs },
 #endif
 	{}
 };
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
index e391505fdaf0..8df37ea50f92 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.h
@@ -64,6 +64,7 @@ extern const struct msm_dsi_phy_cfg dsi_phy_5nm_sar2130p_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8550_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_4nm_8650_cfgs;
 extern const struct msm_dsi_phy_cfg dsi_phy_3nm_8750_cfgs;
+extern const struct msm_dsi_phy_cfg dsi_phy_3nm_kaanapali_cfgs;
 
 struct msm_dsi_dphy_timing {
 	u32 clk_zero;
diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
index 32f06edd21a9..93e53fb8b4fa 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -1518,3 +1518,26 @@ const struct msm_dsi_phy_cfg dsi_phy_3nm_8750_cfgs = {
 	.num_dsi_phy = 2,
 	.quirks = DSI_PHY_7NM_QUIRK_V7_0,
 };
+
+const struct msm_dsi_phy_cfg dsi_phy_3nm_kaanapali_cfgs = {
+	.has_phy_lane = true,
+	.regulator_data = dsi_phy_7nm_98000uA_regulators,
+	.num_regulators = ARRAY_SIZE(dsi_phy_7nm_98000uA_regulators),
+	.ops = {
+		.enable = dsi_7nm_phy_enable,
+		.disable = dsi_7nm_phy_disable,
+		.pll_init = dsi_pll_7nm_init,
+		.save_pll_state = dsi_7nm_pll_save_state,
+		.restore_pll_state = dsi_7nm_pll_restore_state,
+		.set_continuous_clock = dsi_7nm_set_continuous_clock,
+	},
+	.min_pll_rate = 600000000UL,
+#ifdef CONFIG_64BIT
+	.max_pll_rate = 5000000000UL,
+#else
+	.max_pll_rate = ULONG_MAX,
+#endif
+	.io_start = { 0x9ac1000, 0xae97000 },
+	.num_dsi_phy = 2,
+	.quirks = DSI_PHY_7NM_QUIRK_V7_0,
+};
-- 
2.34.1

