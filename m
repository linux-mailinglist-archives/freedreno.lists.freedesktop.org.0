Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A04E2CD5902
	for <lists+freedreno@lfdr.de>; Mon, 22 Dec 2025 11:25:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80FFC10E619;
	Mon, 22 Dec 2025 10:25:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eIWJPjhN";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="QfVanzY0";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4982610E621
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 10:25:14 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BM80PbN4078528
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 10:25:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=AlSWjXvP89D
 8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=; b=eIWJPjhNJyZytoREYhgx+ouckqp
 DCHlgmRAZ1SRLAd2ngZ+6zmQEOtKVGk20nPC1bvTfc5IiBqBeIGZnSpLQ0VDzp5m
 5ShQdGAwFXvJchl9lVSlyDmWzVFs0vuof7uymB1AQ/ngIy8EyWyAEMjPwWHDIaUN
 BFT8UiyZ3o17hsTdM6s4j5urSpYwtFuVYgcFfRnbWqUXAZaOZRU/IAyf4Z0g8CbJ
 ktWKy4SHuT/8Frk/m7Dv1QMzxQiCYrxFSeH033NUqEeFlOKfpzhACQyHA3yBKdZy
 w74crMy9fubwxektUlBuoDEHmKcnvD61KwddFL+L9hzI7JCaIskLUeGKZ/g==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mux4nq5-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 10:25:13 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee0488e746so83282701cf.0
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 02:25:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766399113; x=1767003913;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AlSWjXvP89D8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=;
 b=QfVanzY0vcQc2rIrtpsLfu+zFEXa2JEg1TMEIG09EUjFz8DH4/8PlQ06H9F64bokhF
 yJmhoHf9mbEj53HulRViVvotHJRqX47MrNtAbWZqeLnawtpu6aVIngfjwzF5ASxsB0Ac
 ljhkWZ4MrYaP9DNDEayoVoTu1hJgtRKXXXJdGa5NxPTLIMFGEdEYfotmuLmD6lveiucy
 h6VQ5P57txLjbNpaXoSFKNYnlLvOkQ5NoErrZTxRnVlpRZRIlFl7gQ1X//nhzmY7MBb0
 C3IMEf39Pi/MiuSLz4/vI88nlYaC4N5QesVUgtEPKYbOg6t5IsFkmnGDgVJCdojJgzAU
 T2jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766399113; x=1767003913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AlSWjXvP89D8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=;
 b=T4agzEHBudUUh5CpAWQ1PhGemFswJb/YtY1ND8lVF70+PDcAyZ7xg0iweE6jQDJYOd
 vURD6UOlAE8x27La/enoB1H1iAKnMxQQAMQvmgpNJiHOSt5pfEv1EgEBQmg1SvQHdBDS
 Blf238OVpLba5y0JsMvGmOViqTFQGwo57kI+e1FWugfLXEIPC8zF1SiAug1Y2zc4PGft
 eWC0pUH02fkjyhAaNHuUxXER08EoWgr1/1qaUs7Ul2w6aSSYQ4jCbt5W0DGH0/OPhNSC
 wX3oNvqKjMlYPLc1Ptby/AG7C+UpVKYB+2xgBbmmlJRSrAZoLOdXDK7di05c+VyOOEJk
 JjaA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqkqZroqLboU+kWNRmPJ+hmf6cRCMboxZabYs2BtGauWKRq8WCwqIG6gchUyFuOG/jv1kDpOGx4Ak=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzSrTxiaMViEyDpCHdBC+oO2Ra0N2vV6Ewh48ETWVa0EDbnMmDN
 1v3nmAZbnjO0kUDiDhG1/0j+uSVXNHidkHbxKjnZpMEFGBrEn9QyMdZgnx3wRUIskB0AFFJYW+x
 1YZ/OdFgbAzZi5Xzh9FNizp4lDiMB1YxIcW00R0MQNebIUJZ77kjDtv9nexTGDcty7djvjxI=
X-Gm-Gg: AY/fxX4HXKCohMW0CAcKoFD3Fh3DZPuDGA+SNK0GafMn5wDFF2d1vWIl6P1ZbxQejAi
 kLS/dmU0L4mjKUPu3EEzsjNusrzF7T4hpUuQoNpqvJXzXlItQm6oHPhTKEfroSfJEiosWj8uxrt
 eeArSxdKU2V3HMDByoHJoL6r8PeJn/SQ5KBJTlytvPNslmnA+JkojvmhBLRMy5TRWaivXiP9Lz3
 +x9sys7gMS0YQjLgYQh6Y/Z65O2Wm5QToeXh17kF0Eh5b/y00ZZVmB+cgnKUGg3TUPPh95TMLsY
 aTAxLROgOy7Q6E/Ea2ZMz3ivWIVTa02P0rDR/f7ztx2dilxYwp0xrPrx64CrClsE2Y9lOAGLgEp
 kAVsyRiDe+SoWQBvXmP3GYar0H3AbafZQoStqSzyi51h9HcI5f0BCykSVIagvVDIllLU=
X-Received: by 2002:a05:622a:a0f:b0:4ed:ba4c:bda8 with SMTP id
 d75a77b69052e-4f4aacc4a8dmr146465781cf.18.1766399112791; 
 Mon, 22 Dec 2025 02:25:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFuH+UxR760LE2LGBvlVBLqGJgZnX8ihzwwMGi1X2xSzsKDEWstX1Kns6pjYrJIRbxWZp/pCg==
X-Received: by 2002:a05:622a:a0f:b0:4ed:ba4c:bda8 with SMTP id
 d75a77b69052e-4f4aacc4a8dmr146465621cf.18.1766399112402; 
 Mon, 22 Dec 2025 02:25:12 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f4ac66a1aasm72500001cf.33.2025.12.22.02.25.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 02:25:12 -0800 (PST)
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
Subject: [PATCH v4 07/11] drm/msm/dsi: Add support for Kaanapali
Date: Mon, 22 Dec 2025 18:23:56 +0800
Message-Id: <20251222102400.1109-8-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: oZ7PXSoIwu4JKJuUqlOotqrHFx1PIB_s
X-Authority-Analysis: v=2.4 cv=EvnfbCcA c=1 sm=1 tr=0 ts=69491c89 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EGddA7oXPexY6v9tJfMA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-GUID: oZ7PXSoIwu4JKJuUqlOotqrHFx1PIB_s
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5NCBTYWx0ZWRfX8QMvu3FpSUvw
 HTiEBk4BkKYJ/raruhrE2suWASV1sZr+8QEILajtQ3SncyiSHkXQjPAzhnFohDjw0fDykfmGHSR
 ZuaJHZVHiOode0KoU8O2TmJmvmbOWxeUKIJ8DdoLf0tbOGkbflq3iZomrqefMUAYRvbohLr00+N
 dKP2zXmDAiohh7MDStD1OkAwgRV2mSXRUECTLod+wns/5O7ujNS17FXVnDBH/vcSHVF20ojFq8I
 UKmO+IQc6py5N2/gD/GS+vzIF1WQDEwNW3k69FxTBzIG8/Dhf+iZXtM+d/sxuO8nJKo9YIMPr9G
 irIyCr7twUOl3Uf39E+Ao7Ti0eE/VUlgixCLZe1dgiOqcSBsORsTR0P/mEgMoCo0NMP39tKO9w+
 wsE4pxzAQwdkf1Ks8Kq1UX8kZd5uvZsq2v2NXtnDmfX7bTfL8gr40s1jRtNokdMU10rpdhRKP+F
 dIJpVSb1HiPVkrDMwSg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 phishscore=0 adultscore=0 clxscore=1015
 priorityscore=1501 spamscore=0 impostorscore=0 lowpriorityscore=0
 malwarescore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220094
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

