Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id ECEDDCBCFC8
	for <lists+freedreno@lfdr.de>; Mon, 15 Dec 2025 09:40:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CB36510E3A8;
	Mon, 15 Dec 2025 08:40:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="cdLNK5jD";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hTYnZiSJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AD42810E3A8
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:47 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BF0ALrh2903497
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=AlSWjXvP89D
 8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=; b=cdLNK5jDp8TBB7djLkAZ6HtFZoW
 WTej2mBmm7t8tW9Je6HRuT8zUzvjjl/E1dCsS+jz1SL8gSIVj+LBa2gF/tFSzOnn
 gnKYLsH7/g+1ybTm/TQyHPdboHESWBt3nz+LVX2rh+yJXq9lCscolQxx+Rus6neD
 4GQ/HItzF9rWj+WdhnLzSHXZmyiIfe6vXtpoSmOUR3QQJIX1nPgIk7tmvPTE3SPq
 iBXBCRec+Cr7zO56HMJHb6pBYnHiVh3DYmaDCnDnJkPHS5APwMbzxjGEiarLw3ua
 QCWXir820zTOKa0IHrdXwJKQzq/T3QDgYULHlDUvFaRi6SKCxO3ZuUl68+Q==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b11bcutny-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:46 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4ed74ab4172so73958321cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 00:40:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765788046; x=1766392846;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=AlSWjXvP89D8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=;
 b=hTYnZiSJj0vZdMK6bGyu3A2lnbhfalphlssG0DID5/mYwqThaT6dmSU5gLSHmePQH1
 6nIo6yI+IFMiPguKAsA6MM2A5kvMP7PdE4/UYiMAOlNdscq+Dm2g41Is4i7XtRir8S+O
 jqisplbp5668aFIPM2z+5VYqJ3DcRkh8ot1u+DjZRzmyhyBC7LP/QU3N8K3xFE56+L5D
 ygUOK0C7g2O6VQGuETk/AqrjU/RiweYbjyI/GADUes+uynPBB8dDtNF4ggTEXc7slqBu
 67aDF76OIHHifdwfbmWSUSo33fkvzlUwSwpSCRHUgMIf3RQDzNMt3A7eaLy5BnDcC3P4
 cjfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765788046; x=1766392846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=AlSWjXvP89D8APUnrnCOFRXps/W1frFHw3Bcs+wBdn0=;
 b=Z3KNHqflhzu8G89SB7lzd5YoBbKjKC1qoyiRj0ECXpNG4oNNqCRLjSUh9RBC9D3h5+
 i1E+I0tIZ1jheP1qpF31nomAg069ySfB5dIs0RtKbtj8YZ44x1As+EgmgNVC79yWl/cy
 6/Gq23sxzJ6DqiAFf2u6oXTSWTrQz3GGjAKmy+QFukwX/GZ1oJKesnpyKz2hkniItzY9
 wTq8ItgEzyxnFgJBW+qspIjpbfaiRdSeQj2932TO72dMJl6QNe6kyWQnqW9LjsCtup6d
 4/RMP5WSKt23fBYZgg7+QQJa18wmhswr4auT8NcFr1ppVBFwAwTUb4vIhK648z26LzMU
 HZ7g==
X-Forwarded-Encrypted: i=1;
 AJvYcCWDJ7f0D0Zj2POLVBDIa1Yt+xNRZ3PCPNrH+zLMTFunK0gPj2AD2Gs2htWKQTb2J0Gdk+eLUFv7oOE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyR6ndJfZWl6lp6pDHWb01J+Z7Fz92X7DQoEes0C6cI0noR00nH
 yk/esjIe4TVbGfrHRMSeaMx1FJxNkFAjJzn+9AfV3j88vrsVPAfgnIp993M6eCN1cgbzJGd+oON
 Lhiw0V5x8ps8ow/4FxXRph8lrDmfaf2krRThPhjTvLBsrsNGSN3e+jqub0FvzZgxIJ/7zfKA=
X-Gm-Gg: AY/fxX7STOut9wvdC6EBxRct4/PxIPBnOqYsMK/SzfVjjRTqxj9WFKFOmuFwtVPOCcx
 2ROK6ix87qpHSBh52bKkqHwuo7KBynYz6eSrlqVHzUHu+H0i55zCCa5bsz8nrg/NswUQ5ZZfbMt
 8NXLoWyeYZz+3KWDLuxsZjKkntMXUzrkFmbboCShz9gYJEZUFMGbyZgze1YSCiddDHbja6Y5jaF
 VS+ViHU3iWGXgBy/BQFllik284xV60f0coRMGf8GhpS3AFm/JX+vqsYPyTLw3QrZD/AF7xTwftL
 nH/SF8LOhNqnP41mRAHxsFyrvgzAmww/0K1Q5tWu7h0ewqLrKhZtGYS/j3rnPxshIGW83G5Bf7z
 tdhhQ+gibDyHpJpvHl2F0A4W8U0UQvYlf/JHJCsoZNSfINDpk2a++3zqAL9OFtRC/yoE=
X-Received: by 2002:a05:622a:1791:b0:4e6:ebe3:9403 with SMTP id
 d75a77b69052e-4f1d059d261mr122345691cf.41.1765788045667; 
 Mon, 15 Dec 2025 00:40:45 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGkrFIAQoibBowZ+hZ+Nx8U5gIQEDXi5Q9OFXQj88z4ksCGjc3LaNGlfwA9GNy8uOY0+1Glhg==
X-Received: by 2002:a05:622a:1791:b0:4e6:ebe3:9403 with SMTP id
 d75a77b69052e-4f1d059d261mr122345531cf.41.1765788045177; 
 Mon, 15 Dec 2025 00:40:45 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f1bd6b50afsm90557971cf.21.2025.12.15.00.40.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 00:40:44 -0800 (PST)
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
Subject: [PATCH v3 07/11] drm/msm/dsi: Add support for Kaanapali
Date: Mon, 15 Dec 2025 16:38:50 +0800
Message-Id: <20251215083854.577-8-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 8BrgzEAxtfOALhUILEJZg-zQ2mZ4zcak
X-Authority-Analysis: v=2.4 cv=ebMwvrEH c=1 sm=1 tr=0 ts=693fc98e cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EGddA7oXPexY6v9tJfMA:9 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MiBTYWx0ZWRfX7EfPUHdnvYwL
 cAGInPKWsg4oLGTbXXLOckUT10KK7XBVb1gedM5LGHkH2zo2K/ulbgpA9j9PfL+DqiB2/7eLkHR
 n2vS8ZVKGOg/jrur1D7y3Kfq2ahDesf6ReO/pPg87jh9BabEeMCwFBGW8M3bFVKnqCUrjOOumfC
 yWRukpSUlWz1shfO/pYlO8tYYndElglhH7QCNrPkMLc/KugBYXaeBw0EVZcKeRd39WgzKgnwywb
 rwcDGSpIOeMJf05ooX2PgVfQMzoeBEWO1AJjhWELzO/j6HsXVcVfB7qzPvPMeoC9NjxQ8Em5pNG
 4fFcaowvIDJol1vWYGP3Ed6ttY06djYQKlZk59pnajPV1ug/gEP8o2luQz7RqZOkvGd0i61JQNQ
 N2Q5NYlzvCL1Ua0/ayNqX2NhRV8V4Q==
X-Proofpoint-ORIG-GUID: 8BrgzEAxtfOALhUILEJZg-zQ2mZ4zcak
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 suspectscore=0 phishscore=0
 priorityscore=1501 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2512150072
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

