Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9DDECC7AC5B
	for <lists+freedreno@lfdr.de>; Fri, 21 Nov 2025 17:14:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 671A210E8E5;
	Fri, 21 Nov 2025 16:14:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SkiyalIQ";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bVlZ0tov";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBEEF10E8E5
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 16:14:03 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ALG3LTE3675801
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 16:14:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /jj4l4aFX3SWxUZKTjWnaJm5Qi54yPoZShI+8E7Jh7k=; b=SkiyalIQG+hp6ImX
 fwpl1meDno6UhtCuASPEZImZA2kBEoGJGLZXcnE4/489oH5LbbOpB3cz/XO9zU+h
 2i06C8SJSzkSsmDaFi1AkpfPq6BOTsDdkIZ8xfmWdXUUlYMEGwdm/Mvr0LGIblbU
 b6Ym+PVh2qvB2/QpxUcKA9WDncLeK2FWaWfnvoBJJWFolO8U66Okx4eKBXQfnWmf
 1HgTkAZ0zfEBzemDrGHbXVwE4vHXKPtQYZijUogAvZUfXdKI+63rS5YcZqF8VwIC
 Bs8Q6Wjc8qFmCa8Fcnwvvaxaia4JK4uEoW4Fifq/NuS5N+OgPtRd2eqz2y+bIIWO
 a9LjcA==
Received: from mail-vk1-f197.google.com (mail-vk1-f197.google.com
 [209.85.221.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ajmyj9e7a-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 16:14:02 +0000 (GMT)
Received: by mail-vk1-f197.google.com with SMTP id
 71dfb90a1353d-559597c717dso3834169e0c.1
 for <freedreno@lists.freedesktop.org>; Fri, 21 Nov 2025 08:14:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763741642; x=1764346442;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=/jj4l4aFX3SWxUZKTjWnaJm5Qi54yPoZShI+8E7Jh7k=;
 b=bVlZ0tov2fuA5GEwxqyJvkLpYN0HowhyXxOL6Q7YGnNYjIRm1otw4zgPDlWRudjBeI
 SE0ubjmUklh4XYcwX7WVqaGOzSPZt6LVufSWVd+fPuAdKUgxJkwP28cSOruusOFaye7Z
 fQRfYLMOj7guPaaKHvx7A0eBB+Ar/xGE6EYkKSxrtdf4iKGzFi0hkL5VNzO4NwY5syfK
 znFQ3p9sVrPFmlaSdqz70DXJ3WjOe5rw0lEjDpoPFP+dn0vaTT2K2b0Tm6rJeA2lmUNw
 1+71BAQ2uOZyqT+vrbDWOl9RHC0wJegJWw+0E+4jSKmYGNYQaXTh+B/Fo4U4IlwIfDpy
 O3jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763741642; x=1764346442;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=/jj4l4aFX3SWxUZKTjWnaJm5Qi54yPoZShI+8E7Jh7k=;
 b=ot1WhOY8KgXylWwLoM3Z0yRBB8Pecc5Pd5KZZed9BfEzCq2Vxr3c1CZB/RdxqakLAN
 R/YtHOeNPLUJotjfQ3xPiGZkbcSsMdboFnogr91uZCVGZUnC1pYUj8Fa02KdCMMfU1i+
 r6GPmOhpiOWH3VfTGmP29JVFE9o8UAsgH57XTGTfO0eDNaK2ROddvuaHPRPCNdtTv0+v
 LmRi+DfaGAS8Eywh49vCJ+Rx0y11nmkzHcEdu0LOeArjIancRQI48DNZPtFMdWMtfuxG
 Ap2XdNRlbgtdbeCXn4F22fSgMJe5VRrHdbcdpyNJCedcf4mKBQS66xasAtZIeu6pxO7k
 Jacg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXUhHzNoCOd5KesWD0mYx+EQUn0dK1la3/MtLk7xmT3BTSw5WJ24X5sIRtxRQKpdyaH/loSFLfxPnw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxGiy8pg3VaHBlN2WW8P4uK5nQkKOYnKQgWfcI62LxzRTwMHJiD
 hjCtsdLZlSkSVITsAjyti+LX64/0wIFSxmhuHraazIVHIXl9rXjQCewyQUGuf//oMUotiAfEbdU
 KNZmuj33AFET2ma4u89fC8CxZFGRG0nOCa5htFGi3yV4sIgqQQAlnFWwSDg0yVLbzPD+0px0=
X-Gm-Gg: ASbGncscD0MaJLNpR6OY7vcInOu2Eb6Zs8ptDSOpbBAJDmL+/tA50rPOnifuCn2+m36
 6OZyhTjpmvfYQtX1xhuraNXUXVKf3yfIU+rrI5kPk1+PNpsWhNvIJG65EZGdeRK9hr2mavFywrd
 pBjBtg13VXXziKOX94We43GKcO+g/KYbjOKxeEQiIQLkHcQjGB4pNMhzWSkENqEnZhCB8zhLoBu
 PNC/rK9hDx26Mp8gyhbQxRWX5+jLT2BCcioljJdGCvEo7ZGIalqe8eM7mUPt9zTAxhdF029Ocrf
 WJ5yP3RTHw5z+b3yi/ipIN/BOJWnUiq9UzJjoRxMJj96uK2lpeZWaPqpfqqIpFyDmCtCzpwVWP/
 t5TIXRdUiAzH8QAxwkuJL9C0ZP1M3j5EKfsO3SHQu10HUBTOXZOWyXZxo+3PShEGa/qlIea5Jbi
 9Lr4lvc5PoYYkIwaVi4PGfs9Y=
X-Received: by 2002:a05:6122:7d4:b0:559:6960:be0d with SMTP id
 71dfb90a1353d-55b8eff05d5mr852234e0c.13.1763741642338; 
 Fri, 21 Nov 2025 08:14:02 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFnM/0HJsNeT25iNtTu/Q3YjDCZtGtx9Z+NralVtjRltw4ot5OynRvAetYDwgNqKSPGw7aNpg==
X-Received: by 2002:a05:6122:7d4:b0:559:6960:be0d with SMTP id
 71dfb90a1353d-55b8eff05d5mr852211e0c.13.1763741641942; 
 Fri, 21 Nov 2025 08:14:01 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5969db756d3sm1752185e87.14.2025.11.21.08.14.00
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 21 Nov 2025 08:14:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 21 Nov 2025 18:13:04 +0200
Subject: [PATCH 2/2] drm/msm/a2xx: add A225 entry to catalog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251121-a225-v1-2-a1bab651d186@oss.qualcomm.com>
References: <20251121-a225-v1-0-a1bab651d186@oss.qualcomm.com>
In-Reply-To: <20251121-a225-v1-0-a1bab651d186@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1281;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=4mjjExWwAmG8isEitOAb68AjLdD1g2ziYxcCmOY4EAU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpII/EjMk8w8VwPXYnUwkk8izbyavLfLvdeEmM3
 9IGrsgnHQuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaSCPxAAKCRCLPIo+Aiko
 1ScvB/4xN5d9jbwFWqji8MhwVlGwK7iGKNh4cm7keJiLglhu2c4dhRnZWZmbP2BhqlrnIjeffa6
 lOlp3Zrf8aQOfCLhHMtdayiZQZxtfFnTOiu0V8pPMvaLkWd3epKP2uHOsQ01wAgFvihv51vQXWD
 rqUDoQCPbwD1LZmXj7GgDFqMym1CU2tbcGE276lgkfqRarq+r1/isjjv5/McYPhasINjHqTNb2u
 WLt/ONhI2vDFwnPZmkZsX/2XP8WKf7raaBTHQKAJA388CWiju1cSBA7vm58gI7x/XUC/7qOd7KV
 fm9GMx6kkg07unEICogNTLrNHlspotLcoEWK008ggaEjteVY
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=ELgLElZC c=1 sm=1 tr=0 ts=69208fca cx=c_pps
 a=JIY1xp/sjQ9K5JH4t62bdg==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tn2a2yLXBXweI1urhwwA:9 a=QEXdDO2ut3YA:10
 a=tNoRWFLymzeba-QzToBc:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIxMDExOSBTYWx0ZWRfXzkiGRFcQofMq
 TzkM/U4rvHQO944BQQ+kw4Uq9MGFz4ykLlKpASLh6QaHrEXt0GxgPpY9sWnDT4oio5XLiztM2fZ
 /YN3Vd6cG8+aWLRai6wfb4GI5S1xH7+vYS2V0Nz9dCawPYHgNU4jjH7cTTCmarxugrbxfmLTl5A
 bwyZnWwnWCLmHqTxGqbdvax/yKOJUIl0wwbHPkyqH5/+efnSLAC5gBsxqTnQDlp6RT72w+mQZYi
 yLRmUWaKptZaBi+ZL9TYlbEqHi3KpmtZ+FT1SoJf/ItjipJOKX97enXqTxMaGL0EDsxe03O2uGj
 k1iZLEROgvZvl/GEKBe44NMg3FnxPRY7/nX+85X/mymnpO8zq6K/ZUuffE/mAqfZb1DJDhzGu1B
 oK061CGT2NP4HZ0xSmpo89WJ19tHoA==
X-Proofpoint-GUID: jpWybWT_VeXbes_Kpvpq8Z3n5yetrCj-
X-Proofpoint-ORIG-GUID: jpWybWT_VeXbes_Kpvpq8Z3n5yetrCj-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-21_04,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 bulkscore=0
 phishscore=0 spamscore=0 impostorscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511210119
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

Add catalog entry for Adreno A225.6 as present on MSM8960v3. Most of the
pieces were already contributed by Jonathan Marek in commit 21af872cd8c6
("drm/msm/adreno: add a2xx"), but weren't enabled because there was no
GPU entry.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/adreno/a2xx_catalog.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx_catalog.c b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
index 5ddd015f930d9a7dd04e2d2035daa0b2f5ff3f27..9ee4c9c4dcf7575a4fdfe24a14cd6acc99f5de1c 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a2xx_catalog.c
@@ -42,6 +42,18 @@ static const struct adreno_info a2xx_gpus[] = {
 		.gmem  = SZ_512K,
 		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
 		.init  = a2xx_gpu_init,
+	}, {
+		/* Only for msm8960v3, v2 required a special firmware */
+		.chip_ids = ADRENO_CHIP_IDS(0x02020506),
+		.family = ADRENO_2XX_GEN2,
+		.revn  = 225,
+		.fw = {
+			[ADRENO_FW_PM4] = "a225_pm4.fw",
+			[ADRENO_FW_PFP] = "a225_pfp.fw",
+		},
+		.gmem  = SZ_512K,
+		.inactive_period = DRM_MSM_INACTIVE_PERIOD,
+		.init  = a2xx_gpu_init,
 	}
 };
 DECLARE_ADRENO_GPULIST(a2xx);

-- 
2.47.3

