Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEEB7C014C4
	for <lists+freedreno@lfdr.de>; Thu, 23 Oct 2025 15:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C485510E901;
	Thu, 23 Oct 2025 13:16:02 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WXHjepf5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F0EC910E8C8
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 07:55:38 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59N6qMk7029135
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 07:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=w2fC93DLUlG
 GbUXGQjHhV8DdpBbQi0xLHsTL8o67LJ4=; b=WXHjepf5MYu5cijtLVVBVnTLOW0
 byGMo+foJtSjR30FlSqtQli1zp9opvPqeV2Y4E4KXpRvOdiuB05i6KenLguS3Aam
 xdK8BY5Worl/S4qTrfpd56v3PzLukhHL++qUa+DMs8+uayfUwbcsCb2SOnymMHFo
 1+rGKCfp8+ofdFf8uGZXvrCFtvoA65Gt5sf7V172DEF3WWQGzwud9eoBgxJ4GfNJ
 5wM1mBfikEc6m70E5vFUvemDiGRxH/7BVMVD8FHcTeBasz2WEVoHZisveWNSHxv1
 CLIoTAtAp7aY4gCA9b4WDkD2lzC6tBMAdtzfDRVU6F3g3ao2ZDTHmdyrhXw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49w08wd5xx-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 07:55:38 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-27c62320f16so5723995ad.1
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 00:55:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761206137; x=1761810937;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w2fC93DLUlGGbUXGQjHhV8DdpBbQi0xLHsTL8o67LJ4=;
 b=NBadEvZ2wf/yoF3wsYkhAMzvONmL13VpIQg0+zo8K4ztcZKux57fE20fx2pHTjweUO
 4+ybGwD0Mjt3eOLCLFYdHxTaBEkDEGOQphEZLvd6Wt8xshy5jEGCeizb6GunHJ8mkfzZ
 PHOKsfNQS9bSrsGxk8vjTYJSgGaYX+cebSy+myKAHykBWbHU4TXHZRDxzquwAaK2MHuG
 1ScyxumpyChJBP8NDagDAzgNBpnmzHchEU/ClrCUQhNGCR1yBiTAYhRCK5Ni8+GjfNPQ
 ModCuijJxTFB0wKKafdDeOmBT4HiU+SXqEPBvC+4JCEreSOsZLxoUSlf47aTMVLjrkKJ
 0BxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUffA49Hn+GZcYEoWGfSzeNT/UlotsDAJaBtoPd3TC1A3b6rFCOnAjlOvopFkID/Zxe1EQB3hXjums=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqQiilFYolPbMeu7hcZ4bBXrqw8TWtTF6byGDBOcJha19Ej11p
 wmw7Z0mUsMOPDO0Z1sHoUDhTv+CIYvMZGWI2yGf1GNVBPt1dNAxuQEgXiOLhB15E2uHCM7twAdr
 XNNbU/p8tzmv49N/Q1i/U7DX+c6bKv0RKgBm+dhVBOtoZvS1sb3uhqWWzkxD1Z+Rl7LFfW5w=
X-Gm-Gg: ASbGncuQVV6DdGlk8fOT7JVw8BO41qH0adtn0aYYFr4Iyem8vLADERR0LXjTKktDunJ
 Tjyc+TUZ8hvJdC4esERxilOp0c3TPXS+qIeLv8+fgLFrkdq8ELdV1f0/LVxk9gRPeMkNOVdkQu0
 BFa0BFzKxKM7rFdbt5t+xPEaDmpMhq1sSC+kOxit+W0Jnv42UWBiGIOBE75+M2x8pFKp/HEcy6v
 KZRlZ2WWfe9oPvtNJUqzzqcnrauAov8ODTBoQD0VJZLjajk7Crgto9AT+zaBqUg1Peme+Y8OJlm
 mDqLO9d/pAWb5tCsM8dBQ4pp012EsHPKMs1dm88I2Emu3q7dGBhPRHJK1963KP6+BNtIrG6NCNL
 UwiA1Eb7RsM5OOiGfhR5jeOdpEwFP5j2usrenK2QzA+9O9+44DA==
X-Received: by 2002:a17:903:2310:b0:28e:7841:d437 with SMTP id
 d9443c01a7336-290ca121206mr291270455ad.38.1761206137432; 
 Thu, 23 Oct 2025 00:55:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH682hkGWt3dvBEItqoe9UCqS26mzJjNqbQjGPbVOBXOGQ063Q1XYvwVWIAZvw9Ki9Hjwp2hA==
X-Received: by 2002:a17:903:2310:b0:28e:7841:d437 with SMTP id
 d9443c01a7336-290ca121206mr291270225ad.38.1761206136943; 
 Thu, 23 Oct 2025 00:55:36 -0700 (PDT)
Received: from yuanjiey.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2946e1231b0sm14371265ad.97.2025.10.23.00.55.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Oct 2025 00:55:36 -0700 (PDT)
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
Subject: [PATCH 05/12] drm/msm/dsi: Add support for Kaanapali
Date: Thu, 23 Oct 2025 15:53:54 +0800
Message-Id: <20251023075401.1148-6-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
References: <20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: zHdMzY6Y4mqJ4dNIXAoTV_yqncubISa4
X-Proofpoint-GUID: zHdMzY6Y4mqJ4dNIXAoTV_yqncubISa4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE5MDA5MCBTYWx0ZWRfX+FAPf6gGKrOr
 PyPThrc7W1RPEL1UgJb0WtzRRzDOQO8G7DSZ8GT+Esb5/VlmQGn8hsBsFjmc1UkBIqWW7hUylG/
 ezy3zF0j2n95iP/Fd2braKgD4hHziMP1hS/l5Sn02T7x1g3g0OEkiLG2m54RgcnbkRxDOkD5Ck4
 gEyksRFc3eLO9UBWO/2NImsaMEd47kZl7+vFCM7VrpCQoQL5aMxNSTXUQ2nicS87I/oZJR0jGu5
 qbPU9wE40pIyqBYYnHR5FGgjxbzVNY4+8wsH2GiYC3voS9Wpov84w6EOZ664IdO06VSCROfNKgf
 1GhjtLAm5eatRzNkmCh1aNPp0magfqs4DWqcd+/PEZPSwq48L50ZPCYuO+WqRbxn46hPA48FiC/
 oq0Td3H717e6XydQ+4vH9qrPA6zx1w==
X-Authority-Analysis: v=2.4 cv=V5NwEOni c=1 sm=1 tr=0 ts=68f9df7a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8
 a=EGddA7oXPexY6v9tJfMA:9 a=uG9DUKGECoFWVXl0Dc02:22
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

Add DSI Controller version 2.10.0 support for DSI on Qualcomm
Kaanapali SoC.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
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

