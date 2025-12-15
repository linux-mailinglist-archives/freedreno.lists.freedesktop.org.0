Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37EE9CBCFC1
	for <lists+freedreno@lfdr.de>; Mon, 15 Dec 2025 09:40:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1008B10E24E;
	Mon, 15 Dec 2025 08:40:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="IHi/ZNsR";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YaqNi1Pn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C71510E3A6
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:38 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BEMPwSJ3102798
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=2OMfokriNEm
 V3L9dGBSJIm9fOYQLSe+dw4pSj/NNaNk=; b=IHi/ZNsRuNRV6uzb5NbGEGoGzEI
 Z5ixEVnBTRJ2k2xyiFMbAv/5ZK8n1wFRWq/anDqcZGTq8axSCDYdG7uvv2GlDC/I
 2Bi3zwEWtc0MTzq5r1BKJgtjQmDqa9kyONYLdZntkhtobj41g9d/TMAWWtZ66LQI
 b1A267gEouKQ9tXnAsypiKtqTYU9Got30OAUMucCpp253PJqVeUYQG7PlG9Qp7mP
 7KjiYMTMGHLoRG5okShcokgSgdQ7K8jmCmdGnvbouOFfo5JfVuFeuKkSV9V+1XkC
 CDZA4iA1s5D7ImrzS09HAqjEYWvBygY8dafZYkdI098ACZN8imva/3Kb+Dg==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b119akths-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:37 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4edad69b4e8so64155431cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 00:40:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765788037; x=1766392837;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2OMfokriNEmV3L9dGBSJIm9fOYQLSe+dw4pSj/NNaNk=;
 b=YaqNi1PnT6pAdln5mvMQYwFmIqJdMxJyEOSzVv4fAM2c/m+SrjQ3HnrU2IMPowkkNv
 UK3qT7JveWbDBWfEoccim+Pea9h8WyX13TNjG0dG8IS2Ja/izI8adbXzG0xKzmy2J3V4
 +Eu2BQzdWD30EmorDU7Q9rhmQWM6RgOBIK8FTnN6ENdYe+dmAaM44imjgWWY4mxwMaPr
 ApY4FwXm7+3hEOakff5jrA6v2PABtCIY+ElED7ELEk8Rz+a6Ezt6CexA7VkGlbXlFHjl
 dRcEjRDQ8eMwcQq9NscoB9Wr7imbM2XXjZkTlwLTaqRr1cvNnFEgZOAgJoRJfTvkPEgj
 4dZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765788037; x=1766392837;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=2OMfokriNEmV3L9dGBSJIm9fOYQLSe+dw4pSj/NNaNk=;
 b=KUgdJA/Kjz3ghRXnhiFie1pEwrshALLkDOLvrJJcGqPlV+RbPmk8TnP3K4eNyumKoW
 p6HrbopTmqHRTzAty3mHl6/Kw6Vm70bPnZMvWxLda1AQmGNHqq2HpvGL5Kiv+tdWlTSE
 HdOqosEELDPPc6pgQ5cB401qFhfhAwqOssOsRA3xHHP8llHyWgUr2V3Op53pj0MNwce8
 dhPdHxnLzC76ijtNHYAZvG7KleJSG6QlruLmEWuRj/oKaU2oWPNTkzlDHEz5WtAiqpbC
 4AtgEe3oLkQ++7Gjhz+qbNEMke5WafX9Ujh4NBCyBQHX215mXWDNVwZ/zLyxPljdiE8A
 l0Wg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUYqohjrHJK6XobhiioRzEwB6UIDdTwMw1rPLcU4YnHmCBvWaMptmlhKWbkOXvFoK5+Zlq6OfN5z2w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzI+P6JoemKr5bfB6EUK3xKP8EOiBo3O0Zw9SBymvk1taTxecBH
 fVmxNsHTJOGSyKK2TFeKuvIXfAyG8wSF/p9WndnryH/fwRw7IZqbsURSuqc3vp0ATq6OzmnaknD
 pJYioKL6UbmfhXE5R8Uyny50AiBzgkSYrxROoI3yFMG9L97EdidCfs2i8cUhsoXAn92jWQbJgSm
 ntH6Q=
X-Gm-Gg: AY/fxX6w0HtDKZEDGLQtDfRx8gtmNlsQsd4mAr5X7MG9VM7EkYbgKN7BrVsvbb7rwHF
 4zXbVAg3cWvQddCRr4jeDIvR8+2i/D8tnJ5Up3DLtfb8Q5SztEx3o22tx7xFtJh2Hq73xv2rrO2
 2nGiM7O1oDYsvkjXrwSMLLksA73uHGmJF/0A82xFRxRHmScaOKX1/r+owxcPGTzSK44tqQHUg1C
 RDi2xwzYOy6vCVTc1LhWz6Ncimzrv2ep7HNhgYp+fbXM+ENsUkibcsVL6lvPe7M8Tde0//IVa9x
 Qm7QdSlX0a7//N6ueRi9q4D23lJwRFeUq9PNJErug50KSJiLhNxXTzQofwIuWYQPqqySZQQzfc8
 4bkJHwkIDvFYAmYVZSL4qIlfQq6xo6tl9A5XRuzVaKMgKuTAKuvjVUhG7wWzMijbpSAc=
X-Received: by 2002:ac8:5a49:0:b0:4f1:8bfd:bdc0 with SMTP id
 d75a77b69052e-4f1bfe6f7fbmr194668361cf.39.1765788036877; 
 Mon, 15 Dec 2025 00:40:36 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFquCbinPDhAbYXnGkJ0wvZmDim1bIk7PfXYefiaPKtBfDyxhsk5phSVASo5dAYZ5Kl8RU5Tw==
X-Received: by 2002:ac8:5a49:0:b0:4f1:8bfd:bdc0 with SMTP id
 d75a77b69052e-4f1bfe6f7fbmr194668261cf.39.1765788036482; 
 Mon, 15 Dec 2025 00:40:36 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f1bd6b50afsm90557971cf.21.2025.12.15.00.40.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 00:40:36 -0800 (PST)
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
 aiqun.yu@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 06/11] drm/msm/dsi/phy: Add support for Kaanapali
Date: Mon, 15 Dec 2025 16:38:49 +0800
Message-Id: <20251215083854.577-7-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MiBTYWx0ZWRfXxGtDyBank3l9
 e78SZ3ADW3dUlhO5LEHSsentPVdSFxg23L2EwSwppbd9ho3oTxZO3Xa3hx8UPIpi/tQP1YB3bT5
 V/Hij2+wMHlh2S4xGDuR1BqhNlsLSoL7DFFjHTVFIzTY/8efX1O5JZ5ZKS8KDBuFKd96ktRVhLe
 10bn2yyRdcQHb+yp+ngrpuDBrgnJUe3+Ox3RmXxyh68fmkwXmyqSuc5x7dtiVCAWayulWb/mrAj
 /ATTpBaUpYq2X8TJhyaGZg3kt2JhHJnugZGtYiRxJJfoCBEezUcCKgI3cRQks7eIMDw3aU2M9nq
 riVBHG/a09qyiuzAP4WBqqrAAmRw8oN5R6c7U5DcqNgy8XbZXXmzVq5Vc3B8UViqOZqXnDHbYvj
 xH+mX2CX8pB8CSFSGEo168Y2N9/3Tg==
X-Authority-Analysis: v=2.4 cv=LNFrgZW9 c=1 sm=1 tr=0 ts=693fc985 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ab5uJhi7KCXt4xzmVoQA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: RYt8YNSbe4zgXH3uArMLr6KdAgl-NXvp
X-Proofpoint-ORIG-GUID: RYt8YNSbe4zgXH3uArMLr6KdAgl-NXvp
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015 impostorscore=0
 phishscore=0 malwarescore=0 spamscore=0 priorityscore=1501 lowpriorityscore=0
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

Add DSI PHY support for the Kaanapali platform, kaanapali introduce
addition of DSI2/DSI2_phy compared to SM8650, However, based on the
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

