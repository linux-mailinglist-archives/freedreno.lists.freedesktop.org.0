Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 503A6D01B16
	for <lists+freedreno@lfdr.de>; Thu, 08 Jan 2026 09:58:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 36E2110E6A8;
	Thu,  8 Jan 2026 08:58:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GXpqs16A";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="aj8bPYwl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C511810E6B8
 for <freedreno@lists.freedesktop.org>; Thu,  8 Jan 2026 08:58:16 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60819Sad4052247
 for <freedreno@lists.freedesktop.org>; Thu, 8 Jan 2026 08:58:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=FQG5BqsGnCi
 ZEwc/eMkHo/ya5niea9nDglgo72tq9vo=; b=GXpqs16ArlQM6ExhDe7TB9Mow9X
 JzBm1MTIQBIsiJVONT69vJMSgllTdw9dtrrYUuvP37HjXD1IEhcpvArbfKjvY5Kf
 2sq503cV2I9EomIC4Q034KPtWi2lR1DQUdWzLVg+KzY+9mOvvOVMM/5aphfHGJ5s
 BmpX1+ilFKdUGlvHzIvIJ9iGhLAXc/WJ4TF5lxZDMpG9ivvUQYpZsB1OYPEPKRHX
 FlUZKz34x8ChAsWfHqlEemgR+UF7KNwBe0Qo47bno/MaD0esXJAL8An05C/Z9W/m
 +Vi5aI+pEktOax9mT9Y4ZvcquTg40ydIuaTIj/dkRoqCpepfC7OmlRWUx1g==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj2n8hakt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 08:58:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b2e19c8558so692427085a.2
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 00:58:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767862695; x=1768467495;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FQG5BqsGnCiZEwc/eMkHo/ya5niea9nDglgo72tq9vo=;
 b=aj8bPYwlU+T+EEAElix5AcQP+SjzcM2nJ1ujmeQ6B/6JmrQbDIvRgVH9JicasUQDRj
 +XKTkok674Gd+NwOFIVA5C3ffe41ftMHYI+h7f0/7+BaQtk/AUC0o6lA1GvEK3ntoccB
 xyQpt70n/HmNUZDiSrpYyTB5Wh1MT8JpEpy8YO4bhJzt1AJDuTWR9+jIuTqTsx4vVnz0
 R//LHNFBCnRmFswtMsgXcJXCqgkJgwPfM4v7ftiRgDEMGSY7EeJ8we8Ti9YmHnpKuDV2
 9eScpd7En1mUgZAobEaBnNjwr0A1lU15UIRO0Pnjv5MoOkJdQIb/F5Wdl3E9ipvJRP73
 9ToQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767862695; x=1768467495;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FQG5BqsGnCiZEwc/eMkHo/ya5niea9nDglgo72tq9vo=;
 b=t+NTmonokimlzoKgHw3xAc/CTj7NZHAujfvhQgUeqix8CtWTDXXbSLrvD9kzVMszNg
 pGBe8gKxOPaS6wRljWlnpSPCTvR8rgkdECQwRl3jsF9jT53qqPMVUFKLo76fcHqkjZdy
 YK1zD3Ir2L9SUPz7nXKlQ/OdzjLVbIQhx5eau8YY5hA3+fmvUUGlVcLhVt4taxUrwdSi
 EwB+zLsAVslh9VcC/G0NPc7dKfzoX5goyZlJjpYaLXJOmEUw5ut/NA9VvF6aA8SATD2E
 bq1tp27HDY+7Lk3wBeMUoYyJiMJsbxE8yT/xF0njMUf79X789p6RK+oPn84uaLBzpJdL
 5D+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFeuFaseifleVU5Hb+xzF89uBroFfXfWLar5mDmS7r9li2k1L+WUoXdsMXD8kDYY5yLBdJLCHlTgg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz58dfg6mTvCbXI5RQS2DD4ICjyKOuvs1nMWQ8mHtG8abrqW4xL
 8YXvW4TCPTqvG10dN+miE5qjtiXxvi/lcUFYjZ/+0d1THxmPzP2f4bEEq9ulbH6tgVC1Y73qZ61
 QdJU2uYcQ8tCYetrOsNX73vj9wcVC6d/9x1sKqZ6kqXqcafy0NO2a4g7wsLAdAw+BkzKd1GE=
X-Gm-Gg: AY/fxX6zZ0Ag39BR3TbG0nrtrQM6A2pqU5LcDEEwvJfCZ0pZCuKclz0wawx81TsLKOC
 rKRHdjh78bTluk7y9TeN932jXfaLHnZBx28clIYvXxQ5puxLHEEZ4dyMUzvf9SGBtGQU0QQjD55
 oJenKG+cMPll2sUuAd5iMO1WNRL/z7uRLNoFBVYc5T9TFbgvtPtNZLmEKYkUg4P+IfLxDiXQXAX
 DXZS2vL6Ebp2ovthMlMFWeSuZ0WR1SqM+6I4BXMbk5dAKkpdVKZ0Hwq7JizukmPy8TqXMUO87TO
 HNMBE8u1LF21HtHsCPKJHm7kmCmtTtZZLKXFJSQ/pV6/XwuMjKSoDoqO/QZkqdGnNQDrA/Siek3
 xWOjjAhAmwH2Z+heJuBmf0RyZryaEWXCWWz7ReqnS9ssnzSJisJe//jJ/MV71jTshA1I=
X-Received: by 2002:a05:620a:28c4:b0:8be:6592:f823 with SMTP id
 af79cd13be357-8c3893853ffmr707781285a.20.1767862695120; 
 Thu, 08 Jan 2026 00:58:15 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHE1l+9FTOJ+Z9xJMvA2OgwRV2jSHqoYIgGuLFFOfrr4dq2w6v3q/Wl47LjzyQVU7zH3mMFhA==
X-Received: by 2002:a05:620a:28c4:b0:8be:6592:f823 with SMTP id
 af79cd13be357-8c3893853ffmr707778285a.20.1767862694611; 
 Thu, 08 Jan 2026 00:58:14 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-890770cc7eesm49680326d6.2.2026.01.08.00.58.07
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 00:58:14 -0800 (PST)
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
Subject: [PATCH v5 06/12] drm/msm/dsi/phy: Add support for Kaanapali
Date: Thu,  8 Jan 2026 16:56:53 +0800
Message-Id: <20260108085659.790-7-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=d+j4CBjE c=1 sm=1 tr=0 ts=695f71a8 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ab5uJhi7KCXt4xzmVoQA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: wnvpV44ClwOg7JyQchJkPaoy-Y2gaZat
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfX4q793UWNApNP
 n3F+6DKJaoHKgvS1ottqcMxaT1YFfnVM2dTxxskVqCV/cL754iOhAKRtd5DIVn+ZtR0BqNoBCMa
 y732oKQ115Q0Cq3JAuL0c/qp2cDG3eLwnN3uCZaNUOQQfJoIsz1aVpErNhK+A96sSl7uEGh7ZFY
 NO/odVdzBU65mVGA58vb/sqGN8glnrASNhKzWjQsufUyHgIrSrQdTM7J3j1WP+EfbwMQ1WfISve
 W27uWkzRPkCUyAxNsDzRK5+NfHbl48d354sYnF5TJAeK0RX9ZtBwPiD5Xau1i/2zm0J/XRmhs2/
 ONlGo6J4IJFlgLGkoMRxr0pr1xiv/MfV3n7U0kh4yV16ALC+qf65KxZ6LeRcgaKSSp72QpXKYWZ
 Jfsk/KARTPTuKBK9UNAJsk9BT/qM4KiJf9XEbDGB+9Oxyxz9cD9UJHvp+zlC8nePe9oHckB0W0O
 0ajslAQggMmrnwgpIgg==
X-Proofpoint-GUID: wnvpV44ClwOg7JyQchJkPaoy-Y2gaZat
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 malwarescore=0 phishscore=0 clxscore=1015
 priorityscore=1501 adultscore=0 impostorscore=0 lowpriorityscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
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

Add DSI PHY support for the Kaanapali platform, Kaanapali introduce
addition of DSI2/DSI2_phy compared to SM8650. However, based on the
HPG diagram, only DSI0_phy and DSI1_phy works.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
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
index 3cbf08231492..c01784ca38ed 100644
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
index c5e1d2016bcc..8cb0db3a9880 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
@@ -1504,3 +1504,26 @@ const struct msm_dsi_phy_cfg dsi_phy_3nm_8750_cfgs = {
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
+	.io_start = { 0x9ac1000, 0x9ac4000 },
+	.num_dsi_phy = 2,
+	.quirks = DSI_PHY_7NM_QUIRK_V7_0,
+};
-- 
2.34.1

