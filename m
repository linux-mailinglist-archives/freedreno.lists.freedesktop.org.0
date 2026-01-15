Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B14F4D23834
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 10:29:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 947B710E71F;
	Thu, 15 Jan 2026 09:28:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bSL54IrZ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="E6UgZZ/u";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F91B10E71F
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:28:58 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6foaD1170731
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:28:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=FQG5BqsGnCi
 ZEwc/eMkHo/ya5niea9nDglgo72tq9vo=; b=bSL54IrZ8IjgoL0hDzLC/tsFgeS
 U7Uv1gMuMaWXVV6W+ovoAUDnbTz37wC6Tz17xyxr+wA0NWvNIw6v8nAXthy/VqYy
 RcswOitxtZNMyMSHvm613gwSxYBDT+mBAocM39MR4sqJdLN5/XyYU7TgzEX+GUG4
 J8Hv5xvMBQFf4rMCersSjRosn5rI7TKmQIcqf69DS36Bj4Z13G7NvxerrNXsAZV3
 mvUkUaIHToHAtCEleFa1yDSjxH32lzp65wao3vfshP+KUici1P0qqbdkiJoAacIF
 3RaN0dFkS8BZ3QWzbW+bv8vlUFbHcWJfPFAe1buHuClyFDWZVwSMoi2nlUg==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpg84ac94-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:28:57 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-8804b991a54so27603806d6.2
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 01:28:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768469336; x=1769074136;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FQG5BqsGnCiZEwc/eMkHo/ya5niea9nDglgo72tq9vo=;
 b=E6UgZZ/uQBgh6S8IHXykY1BU6+v/V0AbjVBKdXbGJmE277uTvx3LoTbmqS8RQDx/YO
 cWdZBShGRCrXT8trnbiP2Tuv76d2Azl5aP+0W3t/pdbfIVLS2AftC+f9Qv0CQlk42PgG
 1/64gY/MChO1gzQwQehce5mH7s/dZbMGKy+8ZNeDbgvy1obGcvbPedmH4l7FMJJqOwVu
 2rVe7MyibgDIAOtY6WvEan4vDCxLj6ibYH3HL6Y4izzgShIDHtgD8uvhrvXveQLKOVdv
 /sNKtnNiroKrX5GvWD6maqCziCPdfU51f5cglL5Qd+MEZVXX54DdtlSDFMtVZ8iMqOO+
 V7wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768469336; x=1769074136;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=FQG5BqsGnCiZEwc/eMkHo/ya5niea9nDglgo72tq9vo=;
 b=U2vgBKskOHN8tvxCWUtdjvvTrx5FHd/0c/dkNliJbdd+xTrq5PyG9H71Y3y45WmkK5
 tcdTi+s916jg5bkE8fmDapi9v6MRLdbczBITp17UwXXdXxNHui7WdZg0KFtI0LdNwNTE
 iwpTk4CN6SF2UAx8tJqeqqNEi5RHNeILz9vgRGF2E/1Sxs4tvVsLrC+OSGHfaYUYf3ny
 TKy6AuraP8X+Raebfkl2fYe/9KkwTt6NEVfKbezXkA1QUuSK+K03bw4V6oZDz+MzN9Vf
 JthH7olwx5MvW+CjDzANXgyobuaEcl8iBI4DKpv6G1Su3d1k2NdQyLRA589oMmzuct+c
 YVnA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWvto6/hJCOcQhfI21A33Bh1hn98IpdbPPe1jz+M/zplnO7aH8lXe7M2d1h7h7moPsKpgR2SFVQ/yA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxX4l1flwVfKIzfzXp80ZyV2w1xamUz/Rt8uEODjNSPzNbQ6EvN
 6S9U0pbLIWhBDmG7gglfzD4oepvbYdgYihnxpI48wg8jTx9JXwjBHXxU82sNMrZdoM9Y/exqFB7
 JDywdbW7AoIuWMcaOtAtmtTHzJIAYBWZj0yt1jRtcTAL6+Em6BjyuySe+Wib81+LF3Ww0P2hsso
 lYCq0=
X-Gm-Gg: AY/fxX50K5ZRZ5L3xWWdLBufT35WnJNHJJxnJPRBStlKAsNWo4ohhFakXzQP655tDr8
 0L58NDZiIQGEfqq3GThO46GgdvWdLIqATBacJhKoIoY4RPVp13G7d9Qb/YS7v6eMcz8axkMSChG
 nG7LKp9MIfeYkauv9gOFWMnc9HrcLmg6Bh8Qv7upoYpjx0bn6YCn5Al1HrPWREjcC5hQt0553xV
 fw6yi9bObzUN1saMPAZyuiJLCwilEWdLqWAe70OfVRw00suoGK3JvqL6x01dsRScqtKZVfVPiq9
 SZgWUX7dJqD10/+IsCuNetLgscaEqDA8aX7xCS1GmKhqEgR3QyJMc5kH4rsEgu1gIBkUjINGkQT
 9rY/CJuWTkORpHp1N+1gtOLvROfqZxPmuq4hahwMD1ZptA5Vgm9ouvRjITilUvSQaX4Q=
X-Received: by 2002:a05:6214:1bc6:b0:882:4b1f:a812 with SMTP id
 6a1803df08f44-892744503e1mr88982766d6.51.1768469335831; 
 Thu, 15 Jan 2026 01:28:55 -0800 (PST)
X-Received: by 2002:a05:6214:1bc6:b0:882:4b1f:a812 with SMTP id
 6a1803df08f44-892744503e1mr88982606d6.51.1768469335467; 
 Thu, 15 Jan 2026 01:28:55 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-892668a2419sm64388416d6.30.2026.01.15.01.28.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 01:28:55 -0800 (PST)
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
Subject: [PATCH v6 06/12] drm/msm/dsi/phy: Add support for Kaanapali
Date: Thu, 15 Jan 2026 17:27:43 +0800
Message-Id: <20260115092749.533-7-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
References: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NSBTYWx0ZWRfX+FkmvBDLQLyp
 KzDIov26G0bOoh04HYBZdvbeVOx3YXgFlCndJyDN2i/byj17YIgwmOX2T17PkQIxZeHezsqkMFG
 Am+5RoFFnJcPWq3N/wnhfpD7Wp9ozLP2IoOJS6sCCYnaxEzln6chDV6QcL+lnMEEocqY/psKGaS
 2H6IwcfbFRHzJLSABBCpdDjiOMFmPDFM9UvgHfTnPdGy4RjFgdzRis4Jv6EMQTi6eZ13nH+Xy6q
 IYaUt8iSPa2xzmbqXUNogoy0vlw84dMiNeM6ZD7Ju2wuKJb2fHoQLaCeA2cGVM05JRvWi5oTkiO
 4kN0bi1E28A4yKtdS9BUdwt7A8iarDD6p/rL9FwhkLEO2WnmtttRzrdAtVPPrSHmhjtHkN6O2j8
 TSRZYgZUEg8hlkONf4VV5vG1zWx7uiaEkq4bGm4Qmf5K2uFCIFnb5f4gcNTx+85zBQg31y8ZwO9
 f2k6YD+BvPEa7e+ebOA==
X-Authority-Analysis: v=2.4 cv=IO8PywvG c=1 sm=1 tr=0 ts=6968b359 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ab5uJhi7KCXt4xzmVoQA:9 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-GUID: zNVwhrLVhMfI-mpxH4P5BgCGcynM-RV0
X-Proofpoint-ORIG-GUID: zNVwhrLVhMfI-mpxH4P5BgCGcynM-RV0
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0
 priorityscore=1501 impostorscore=0 adultscore=0 phishscore=0 malwarescore=0
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

