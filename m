Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6DDBDD01B3A
	for <lists+freedreno@lfdr.de>; Thu, 08 Jan 2026 09:59:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A0B110E6B7;
	Thu,  8 Jan 2026 08:59:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="lakzr7BG";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gaHRhBHO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D9AAA10E6BE
 for <freedreno@lists.freedesktop.org>; Thu,  8 Jan 2026 08:58:59 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6087VODK1837907
 for <freedreno@lists.freedesktop.org>; Thu, 8 Jan 2026 08:58:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=54GDJZyJzbH
 Wm0MrtQpD7VyvgqcpHZYlLhoVJwL7bN4=; b=lakzr7BGXoXaqnX93ruFWQq4iMw
 3FynUPGHYsM9mVzpgDdFf5pLpddwJ7GenZpP+ltZ4R8/3yzsRn+W308uFf1+qDTi
 qo+f6bO2jmO98DR5VNctGhIURJEQIxjvZjlQGFOcOASOz6Rv8RwfzFVz94b9H9hy
 4Biz/48eNGIECrYhhtgWjlv1zYYhkbe72412DBdoF3izvTHyNFunpb0vdfl2s75K
 bHPP+QRzKaWkOgS2/q/NsTgjIxdlUbmfbIirV0p6aBTyPxgxYOsm7pyvcz/e5rQ4
 m0/FF2eU3sdpFLG+Bm0RsOTpW82r83AAo454CTVFAMZOKIAPaR9pTRxHyCw==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj8920831-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 08:58:59 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b22d590227so390455485a.1
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 00:58:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767862738; x=1768467538;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=54GDJZyJzbHWm0MrtQpD7VyvgqcpHZYlLhoVJwL7bN4=;
 b=gaHRhBHOMdsVPtRL8epOX6VaLmFI2uHvfFQ2BJebWZu4ibDBkBH19RcdBsGdLQBn/C
 m7IY/GMDor64skcxhZ14IiBbFp4J16QSM1yZLgjsagFy5iTj6JGM5Nie/28k0I0QiUG0
 7g9XbeaOiHpsgCOU8Wy0UGBH+67WL5u6nt355YThOsvZ4dv93/LQx8IwQ7dQOHULJHH3
 961wIOFiDJ7C4RUwGU9290HAysXfyTjE2b+wWkdF3Yu4mbpWErGZPDcFcWgGnewEKyg4
 Sgu/ePNhsI2JsJ6kKvDuOv6O4eH3L0G84Irmhl6HTV2hJOH72KD0hwlVsK6Ay42z5/dn
 RsmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767862738; x=1768467538;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=54GDJZyJzbHWm0MrtQpD7VyvgqcpHZYlLhoVJwL7bN4=;
 b=SAJ0nfiK1Uef+YG3klzeKx3JRNtKXJzKRhrc9zmomZIowHENy+rZp1lK11zD5XSAf2
 QEfff7Hbz59G4Qrd5YBFXqaQb3km6Xi8HDseNYb+bth9gAmnTIyUrljMd6DwMI9yeNMr
 aSqDF4S8hDmqQONxQ0tf+l/XPOaihomaSp12issB3t0ibFQ4SghA0I0B6Q45C9xd+KAg
 oEhRzIG2c3J1HYsXf4uYWDsKgcUIWNYPXa3pd92MDXEqigS/lQ2QzMjJPd+suHhseujc
 IyIEEffhVEzGfyHWBwCvxV+fpfnEHtRP2stwBEDWbWaZFKq15AL1l4J4oJqrfzvqAO6B
 WgiA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVNuRhxIP72skgiqKNkkdg0bkvdMUpo8FxMp9FSB8czSUk30H2f3zpCfORSY6wkbMz4l5//EVLJkLY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwNjR2GDwhF6tobSNGZKeM4Cnut4rwsw2fCJbyKFYOwBsMiZ/2t
 tIGKfx5+ih+m4qRLJgNUsYHx9ivHziat0xpTAiL1lqqRH5x13lHx9WX+tLDErBXKa2Q3DSyYHX6
 xT4p8wXCGZL+jcDjsSZu7oCWMyiiIM6gh00ut7QZoXg/iHq+oRDkzlzYo1VarHmsDHIjbtwA=
X-Gm-Gg: AY/fxX4E3Hin1gECZYyLm0m0172OgsCNn1+e5DNS6U4WrycrAb+PtT+jWLrhbhoE14j
 1+wX4olDiTiM6pzpfGigbH84VAgy0C48TqOwy/4zti9LuiZbQdjej2F1zmUvhl/NEknnZs5YMK3
 m5x4XfpZzmWOMsCvzwQ5WXXdnoKnxk6tZCAhx4DYEtnA9kkmf8nHsememCCihiF12UTmQHeemhc
 VG3QBSiub/gLQpQ1cnaLwyRTNUd3lnUWL89w5b7GYms4wiPK7kS5EPtK0brqmL/6763s5P1zEDt
 kYWeXXMX+UQxHz5mbiEht+ZAxexy8KyzDbo/RR04kTakidiS12MlBxenG9jnFBrnTO4DWFBJTfh
 t5lJ9EdLSx2fuUSfwH4gxD+lGKMbof1a8UAkrdA49zfjvbXQe6B3JCZSGqbhM4559uiw=
X-Received: by 2002:a05:620a:f0c:b0:8a9:ef98:6b34 with SMTP id
 af79cd13be357-8c3893cd9e6mr665635485a.56.1767862738347; 
 Thu, 08 Jan 2026 00:58:58 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFDPTpg2nfUyWmprD2xyTpkUnn0XmXeqUYRDeQUfDgMTzG3+mwfDEmQ/DqJk3PymsQw8p4x6g==
X-Received: by 2002:a05:620a:f0c:b0:8a9:ef98:6b34 with SMTP id
 af79cd13be357-8c3893cd9e6mr665631685a.56.1767862737861; 
 Thu, 08 Jan 2026 00:58:57 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-890770cc7eesm49680326d6.2.2026.01.08.00.58.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 00:58:57 -0800 (PST)
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
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH v5 11/12] drm/msm/dpu: Add Kaanapali WB support
Date: Thu,  8 Jan 2026 16:56:58 +0800
Message-Id: <20260108085659.790-12-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=M45A6iws c=1 sm=1 tr=0 ts=695f71d3 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=kCfvZJGldO2mi53t-5YA:9 a=NFOGd7dJGGMPyQGDc5-O:22
X-Proofpoint-ORIG-GUID: DXDN5FdohzHuHK2ik6k1aqT8R_cSJQ6G
X-Proofpoint-GUID: DXDN5FdohzHuHK2ik6k1aqT8R_cSJQ6G
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfX0E9MlCzEJI4d
 ChKeTG0BulLZ06rkUUn4DIOMu92i7nU1iR5eSg4AFsnrIX6G41xN3hHa28ZH+hz4TWw85ybJCME
 I1VZEJ08ybNCO1BeqzL7DBv3qdxijqV7w0NbEu/VGEIyKQGoINcstBkPDt75geH2NHUIfnTOfnE
 JSUUOD6FDXFRbXSfzAzWeh2g58svPKH+6+g3mf/M3Gjw+cwtETGejepdu6L7S1BIg+Nsg+TEpvu
 5mcPM3l4D/mWJP9pZV0wJYnrbq9llbD+tEq//9n1v8OZxp9tRw2usAlQQJ+fJraCiNcZKw0tAIW
 c6jriaD8SNvuQg9k0/x6hpiLCBr40nzke3RUAMJcv9Jorf7G/RLsjr8yEbBv1O6T97v3HeOWEa/
 AWV5yUhAYqsLI+bheTNkLJE2Xb7ZSf2UYbxcS4stMXlIKCHT2FvXw85Ab4BMMtTyCfQYJVEUTWS
 xWHa2gTS8rnkuuppfEw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 lowpriorityscore=0 bulkscore=0
 phishscore=0 suspectscore=0 clxscore=1015 spamscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
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

Add support for Kaanapali WB, which introduce register
relocations, use the updated registeri definition to ensure
compatibility.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c | 17 +++++++++++++++--
 1 file changed, 15 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
index 478a091aeccf..006dcc4a0dcc 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c
@@ -148,6 +148,15 @@ static void dpu_hw_wb_setup_qos_lut(struct dpu_hw_wb *ctx,
 			      cfg);
 }
 
+static void dpu_hw_wb_setup_qos_lut_v13(struct dpu_hw_wb *ctx,
+					struct dpu_hw_qos_cfg *cfg)
+{
+	if (!ctx || !cfg)
+		return;
+
+	_dpu_hw_setup_qos_lut_v13(&ctx->hw, cfg);
+}
+
 static void dpu_hw_wb_setup_cdp(struct dpu_hw_wb *ctx,
 				const struct msm_format *fmt,
 				bool enable)
@@ -202,8 +211,12 @@ static void _setup_wb_ops(struct dpu_hw_wb_ops *ops,
 	if (test_bit(DPU_WB_XY_ROI_OFFSET, &features))
 		ops->setup_roi = dpu_hw_wb_roi;
 
-	if (test_bit(DPU_WB_QOS, &features))
-		ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut;
+	if (test_bit(DPU_WB_QOS, &features)) {
+		if (mdss_rev->core_major_ver >= 13)
+			ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut_v13;
+		else
+			ops->setup_qos_lut = dpu_hw_wb_setup_qos_lut;
+	}
 
 	if (test_bit(DPU_WB_CDP, &features))
 		ops->setup_cdp = dpu_hw_wb_setup_cdp;
-- 
2.34.1

