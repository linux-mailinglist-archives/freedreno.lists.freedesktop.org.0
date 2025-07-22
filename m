Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35E2DB0D2B7
	for <lists+freedreno@lfdr.de>; Tue, 22 Jul 2025 09:23:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C0BB10E5FA;
	Tue, 22 Jul 2025 07:23:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="icgi/h3C";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55B5510E5FD
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 07:23:48 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56LNcuXT012535
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 07:23:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 X7rTNTg/49ZHhf8B4W0jhkieUw+2aiMDE3XH+NwjhvM=; b=icgi/h3C+GjuGd1J
 WvE5bc0YhbTS3weKVinY83yE2zIwuULFNxarVzRuWMS67JuShghgGELWPRNUHqj1
 yBwgyvMiL/onk5YAAHQZ5InCCmZOtQ5jrqK4YT0xUdRQLS9jmWs1kbfSGizXNNlX
 b3OQzNfHFfLcG+MdRuCQ+EVQQh4LXumlX7jwj6YeaqFKP+1RV+F6GzC5ej4FbvM/
 eInGX8gJWEXS/4sYUhIUzPgQf1F1AZRy+OenETcTzhkAQmsQOTl7ODaVQqtq/gt/
 AjpQTOgJZ84wClAgsrLVeckFwR9KdM2znRFEFigg8+8ldq6O31Z/A1D0Vh74cP7R
 lGX0Aw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 481qh6jsdw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 07:23:47 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-23e1f9f2010so16215135ad.2
 for <freedreno@lists.freedesktop.org>; Tue, 22 Jul 2025 00:23:47 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753169026; x=1753773826;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X7rTNTg/49ZHhf8B4W0jhkieUw+2aiMDE3XH+NwjhvM=;
 b=xKJklSu0ex9UiDNsZPKzEZXyaxgP2fcvkozIzwOIfXyeG/evO3li6vOBkwzSZOlfKA
 IE7KnKQdkw5awmAhaIQlqNVcNiu4Y7w1lTJzBBPdwP1lkXblWEx/7kiPQD0KeS215wRu
 pllYSJ4B11gw4lOBTVXG+vW//zz6KzMCF6kxgsvkzwMBo3/46L47GjfmjI3R90jx24Ny
 yTtbbfijJAvfEABeup+2Y/28h2QAxeQWOllxGMTQ4u45+17XvEab4WEutNYHi1YqNRly
 BPyFnfDCOP1HpVCliRnXmyd/NEYHio4KBaFP1i1r305SJwi3J+k79N6k61AYDe1bkwUb
 H2XQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFzZ9gKyo13cv7v43tDSjgH8Uyeu5FVGcvh/2o9HNLkx8y9nsCaDn7mTCWyBrgOdEqCphZrpvANYk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz7GMV9ssnP3mWzac6Ss3E5SoKrai1x7N9dNWuFaOMKUJudVL8+
 kuB6M4n4/YGrsIkeTa2jhEhOgMpEKKzVBr0apX4v4o6Cjdj4F/47Kqlm/iMWVRZEwHBGta3z6YP
 bNd7mzRvWG3e6zB/Jb7q6cHuhjAHpaorxIm5z05EIO7hxy9rc4Ce0vnZBUnT2BZLHQa0rMUd1u4
 Sp9S0=
X-Gm-Gg: ASbGncvlysXMGKziZ08M65piUO3C8/8+HeGFqEPOcpYQeHdgTsZVXNXagagRc6HNIM6
 uEWrwLwP7v6bJdsaynWRL/gHnr9sViEwjxirisjj/FRAiSA4hZzLqQOV6/eWYDAijmXNJaQMPWq
 KdTq1zzydrJDH34x2TLgUD08PHxh9rA9xlIyHlpTs7E24WrEJ5N6Jii7RXav1xYgaIcr4PUUS0H
 rSksreFxb1I98W0kbRBiIUvQLD8hp5gp3TowLB1fBDaLR9Fq6OsXSuwerkes4yiZlghA2H4ChZI
 a7IgYKrRKeF+Dy/Acz3mr1ZS8j09VDLAIO0Yob46gZvrxJvXWDW1MOit1MaJBGG8INDaykKbxdU
 10D++IqKQNfi8KPOaPofpL64/yyP3io5bujDOwvDKr2zeYUjPLFHCoSkk
X-Received: by 2002:a17:903:1a68:b0:234:d7b2:2abe with SMTP id
 d9443c01a7336-23e24ef7922mr141277175ad.7.1753169025678; 
 Tue, 22 Jul 2025 00:23:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHZi2sVWjlvxIefJwnEAsJbibA0RoEFuNEkqwkL4eJL/Th6uYnt2AV1OJZwiVCrhQBLPZSpSg==
X-Received: by 2002:a17:903:1a68:b0:234:d7b2:2abe with SMTP id
 d9443c01a7336-23e24ef7922mr141277025ad.7.1753169025225; 
 Tue, 22 Jul 2025 00:23:45 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31cc3e45e6csm7490753a91.3.2025.07.22.00.23.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Jul 2025 00:23:44 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Date: Tue, 22 Jul 2025 15:22:13 +0800
Subject: [PATCH v2 12/13] drm/msm/dp: Add DisplayPort support for QCS615
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250722-add-displayport-support-for-qcs615-platform-v2-12-42b4037171f8@oss.qualcomm.com>
References: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
In-Reply-To: <20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 dmitry.baryshkov@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com,
 fange.zhang@oss.qualcomm.com, quic_lliu6@quicinc.com,
 quic_yongmou@quicinc.com, Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753168938; l=1195;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=ciyqoCYFS3+/i08fo7/Fy7G1mvvHDXj3yVN7GeS3ZyA=;
 b=FFmdwXZ8slTdA0DVE9pvzO1FYYEDAJMGMU1mJ7YxSnMqTiMvS9E6ow/3xLAHL6dB1Cr+/Lm96
 yucXBPSLDRWCQ54WzwHwXgwV6uLy40ZWzhspxwW2naZqPRAuu5M8Fc3
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=CZ4I5Krl c=1 sm=1 tr=0 ts=687f3c83 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=f-sKLqVA4YZL9HvktjMA:9 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 8YtwJv_pb5-ulR9OjfPjN3cxIEQXbuRD
X-Proofpoint-GUID: 8YtwJv_pb5-ulR9OjfPjN3cxIEQXbuRD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIyMDA1OSBTYWx0ZWRfXzGYe3PANjqGG
 8/J/kkOgDeb364YlFR0GchtFkopdiMmYYXTRQQNuY/Vlu3VxybEt+tzBDseLR7VTTVLChW7jQ5K
 pNw/ntnhq7yNeA/+fcGJW3jvfNQS5tgCoPmPswHAQcmnHyhsrat0YkmYHwn4Rs0rpnjxNC/LL2E
 Ps8u08BHkWfNHYyq5VxOTWCKuibHAzEjoXgfEG1jB7OP5tRBpz51TOEO+/w7IXDgGV2NPOqNmNv
 SBdaXgN0OkMLfiHTA7CLVX7YEFv+/aTVjIvhl7U4EK41fpl2Ar+oPjWWi8MRM53lKWg1jk6RK6N
 5HH6vGQPJBGNWQAa+H/oG0MktouesNqa/w4y7wInr4vGj76LCEY1Itt9YQEB1neGhiEdi8eXTry
 HQWhV5r9ULqXGENrbQmmrtAYcVL3pnb98MNhiEPGh21Gd7+YKxDqq+/FL6ec3vyMEtZQgjof
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-22_01,2025-07-21_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 mlxlogscore=999 impostorscore=0
 clxscore=1015 mlxscore=0 lowpriorityscore=0 phishscore=0 adultscore=0
 bulkscore=0 spamscore=0 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507220059
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

The Qualcomm QCS615 platform comes with a DisplayPort controller use the
same base offset as sc7180. add support for this in DP driver.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d87d47cc7ec3eb757ac192c411000bc50b824c59..ddb22b50490035779904d4cab20e2fee7e0f9657 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -196,6 +196,7 @@ static const struct of_device_id msm_dp_dt_match[] = {
 	{ .compatible = "qcom,sc8280xp-dp", .data = &msm_dp_desc_sc8280xp },
 	{ .compatible = "qcom,sc8280xp-edp", .data = &msm_dp_desc_sc8280xp },
 	{ .compatible = "qcom,sdm845-dp", .data = &msm_dp_desc_sdm845 },
+	{ .compatible = "qcom,sm6150-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sm8350-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sm8650-dp", .data = &msm_dp_desc_sm8650 },
 	{ .compatible = "qcom,x1e80100-dp", .data = &msm_dp_desc_x1e80100 },

-- 
2.34.1

