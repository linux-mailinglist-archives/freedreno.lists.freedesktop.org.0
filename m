Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D261FCF0065
	for <lists+freedreno@lfdr.de>; Sat, 03 Jan 2026 14:45:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0718710E35B;
	Sat,  3 Jan 2026 13:45:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="WcKeMJMA";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HJc356+V";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8AE4010E355
 for <freedreno@lists.freedesktop.org>; Sat,  3 Jan 2026 13:45:14 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6037jHbv3161610
 for <freedreno@lists.freedesktop.org>; Sat, 3 Jan 2026 13:45:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +okb/PnzINcJe6bqugF0FwyR3tt0BF1s+IinN85wugk=; b=WcKeMJMApkzPlr7v
 iVzzCGlb1iJYVrVcaZQMPNVhW4YR6WgZHHSPaHtGgXlOX5859YP+blkg3sS+lApK
 s4K7in8TbrEN4pj76lcwNPfrTiCrhKe/UW4XdNburhVfTFf82toKr71zN+JKeghE
 iQ9UlI4YwN3fc5iHlQ3wQwPKpXzB625TO0Kmd6OCkMEjHDpjxwr7nEOp6tJ7h07f
 ooqijswJMZhl4ELKFl7Vy86IHnHCF+sahwfL+50VfqgPJ3SUSplAqv6bD4prEUmr
 ehjMVj2PJ0zJJtkr589djjmdCL0yiw/6BmmEgVJ2RHEd7DeU9qYNheQdjwBNlT/B
 DpIVyg==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com
 [209.85.160.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bertcgu4c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 03 Jan 2026 13:45:14 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id
 d75a77b69052e-4edb6a94873so253999061cf.0
 for <freedreno@lists.freedesktop.org>; Sat, 03 Jan 2026 05:45:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767447913; x=1768052713;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=+okb/PnzINcJe6bqugF0FwyR3tt0BF1s+IinN85wugk=;
 b=HJc356+VO9FrFjirBMI8/cez9Purv7gAfNuPawF4HHl/RO9+r/d0vQyqCFL+tdFzUk
 PvijXUszRSszNasgV+C3RrLtix2Jem/5qxejxlTkBc5oqUR63LRRn2fgxg/5LaIxtrw4
 r3cB8aZFz1lby2dj2lejPlW5YEY+LfFYSFC+GWf1yk+MGMCgVV58mz2gKfsrytW8DRCI
 DVaMqY3SoRehAVQrX3ERKkS5uEEf1IUhHoAMGQ0MHi07MBzruzjUhhF0GNynWFkCHZDl
 XPv6SFBSt70P08BEK8z52bF1anmki99sbFlI6lB4k/H4ruPPxy78vBnvieSpqD9LCuaQ
 pnxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767447913; x=1768052713;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=+okb/PnzINcJe6bqugF0FwyR3tt0BF1s+IinN85wugk=;
 b=WEeCsUhm2TaZcSPcsiV4UcvOAQ+SayD6c0xTg/iAMuReFH7EnF3xUb+LLoxdoAR17Q
 KW9wscfgqxBeVTa67QmjD4Dw9rQFWXekKDasfYoLIOscVs9B/Dq4d0pDwXwBFui1D6E5
 3Uv2LWAxdQjqKjn/KOPYpI1/8IX7it1W+EfvqaQlldm9qjRz6BgSvW31VkSZFALn4Gg9
 J0lS474hO3FuPFpYtz+7fa/sMuZ4/XLz5mouQVdLr2qzIc7pcUhXyPgF83AgHzwM5Tz3
 40OXobXWjIC551CMyGhHmD26gdqBRYTWEtnqFDYPkXWKj77XUjaTP90R6CSo4BmyFkU/
 nb/g==
X-Forwarded-Encrypted: i=1;
 AJvYcCUzZqVbkveBYkfwSK/9LVmocbfkfy44fL59l3WaRrPIs2uoCrnBM7zlTHDZkI78yVjHTSKtVdznloo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBpluggtOfgFilVwxfSbX2veqtO3ejZK+JqowSYkyRsT2suMLD
 PGPN6V1to2RC2TkNU+uoDahTzxJbxh3kLcbuY3NrZ3LF4SSqpyxRWm6F8+vNXL9+DYR7hUYA5lq
 hd3LipDTWsgPwWdTlyDNOCL6e1uxvl/kAe+rgPPkEkj3sS6km/tMSwcizWnrDcksTUjjQCXFi+e
 PAAoU=
X-Gm-Gg: AY/fxX6WAOOlrT0f+dBjPCKkyD55KbZiAO/fTV6qexuz/Kp/fKXi1gln5eghvcDuA4u
 YYxk9/FKjFDd1u/OeDLn9gxKSVodDPf1IN51NgdDui153jPA9JsbWifetrCaW77uVB1/OYErmTD
 WUyji9jrd79qjGoGriCBEp1wJYsC7xZbdGgc/kSwsef5fBcgpY96BqFXSrU57Sb7sqDNUespBwQ
 DUj9bIVuA6BCYO4kjYr/jkqnDommJyEtH30hs4eADFhoBa+VIDgUvP4QUEWnGroD7U0yrn8me7o
 yu+8iqYl/hwM5DoyzdOXZYwIw/hhN1Alx40EIEFtiSU+PqX+XXyy50ObE/sAqOMG1O3ww+LisN9
 sSDInob13PAKGcJ+AltXxMUwDHsqwY/KQcLQjwHdDCRygswNeYAXt28tzPH7mcJy5JHw9uHBOEH
 xXdqSxNPw7p80Qruwflm6WaX4=
X-Received: by 2002:a05:622a:1805:b0:4ee:13d0:d02b with SMTP id
 d75a77b69052e-4f4abd8c65cmr613415141cf.50.1767447912571; 
 Sat, 03 Jan 2026 05:45:12 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFZSGbHF2VuDdnNM12flaXlnvGgxuUvTN0P7AsTyoIrBeUc3fKh2D4CRMayhyTtlHZvQQXVcQ==
X-Received: by 2002:a05:622a:1805:b0:4ee:13d0:d02b with SMTP id
 d75a77b69052e-4f4abd8c65cmr613414691cf.50.1767447912009; 
 Sat, 03 Jan 2026 05:45:12 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a18628422sm12920873e87.101.2026.01.03.05.45.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jan 2026 05:45:10 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 03 Jan 2026 15:45:06 +0200
Subject: [PATCH v2 3/3] drm/msm/dpu: Remove max_mixer_width from catalog
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260103-max-mixer-width-v2-3-ef5d3d246709@oss.qualcomm.com>
References: <20260103-max-mixer-width-v2-0-ef5d3d246709@oss.qualcomm.com>
In-Reply-To: <20260103-max-mixer-width-v2-0-ef5d3d246709@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=19157;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pywTHXadDv1gUEk8XMrSUNAVthz8rQktazX2xZ7ZsfA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpWR1iN5WWDPKAud8LmqfZZmayZtLNlSji4AAL2
 pkAGKuYl6GJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVkdYgAKCRCLPIo+Aiko
 1VWlCACSXFSV/LI3hKH8WJPOy0MQ3MCtWQ0xrJHjXE1PsxScl3P3AiR35MltBcKe3+Vsb+MZbNE
 4LRmE8kPr96ji5fV+euQhSYkR1CekVcjzNPP1nybmJfm9LQpocKRfR3eIU7ayvYCNE1AcnUS+8J
 CDgdcCrMoUBrKJ8STid/DFzrEDyzMOZroUKFiw3CsNVArzJVOh76F8Cn5ReLWsSzbRYqjDx/OAM
 xZZj/KH+JWGrgFRLSopkADlowRIg1wLX5SzzD5XjAFReOVzyKTj7rQoXwW8+1geWs4Al2AXFs6x
 fr/R2NwiY3H2q6sNquP2c2CLA30pcGehXar/pwCJNctTLEfa
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: p2cKAdchgoadjAEy2ePBApnGjIHZu6RU
X-Authority-Analysis: v=2.4 cv=VNbQXtPX c=1 sm=1 tr=0 ts=69591d6a cx=c_pps
 a=EVbN6Ke/fEF3bsl7X48z0g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=gLnN4ju1rVL6YVjt6FAA:9 a=QEXdDO2ut3YA:10
 a=a_PwQJl-kcHnX1M80qC6:22
X-Proofpoint-GUID: p2cKAdchgoadjAEy2ePBApnGjIHZu6RU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAzMDEyNSBTYWx0ZWRfX4um5zaVWG9fU
 29K3VGrN5fPI6zcBxYqkel7UUo7kd6Cl02X0uFSDcyhrarlH8wFWVt8uivq6K0wI8QPMllR4oX/
 G9UkEdDAWx0u3z6BA0gcU9THW1RXHO86CbtsIw7u+cgLdvOgl+jIq1rN016zKQUrUyy66OoYJj+
 +DYBpNoc/6XNXZyMlf/56lCHfxySSTo8rjfQiiL8SnwYTf/Z39WBMmk1MRy21EA5Kgid25suv5B
 EKPlxyAWo+94c4+acwR7208a/9GXGJ2sZ9incX2kG8dZL0SMRng2V/hC7+cV2+qcbmNX6sfCEdK
 6BePCZyAZrg0FqAe5etmGe00CbZe8to5rcW/izf9TVvZrUFq/3v3C8netnJFq3kQ4t5//JrB0a6
 Vx59DUXDLUtQDKK24b7gXDNUzs3qSV/5FFSL4qMyEK2wHy+A4I2np1iJfCqASxN0biOE82mWl45
 RCYqNsErKu5rg3ik9ow==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-03_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 impostorscore=0 priorityscore=1501 adultscore=0
 phishscore=0 bulkscore=0 malwarescore=0 lowpriorityscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601030125
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

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Remove the now-unused max_mixer_width field from the HW catalog

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h   | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h           | 2 --
 31 files changed, 32 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
index 56d3c38c8778..18866ca279df 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h
@@ -8,7 +8,6 @@
 #define _DPU_10_0_SM8650_H
 
 static const struct dpu_caps sm8650_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h
index db8cc2d0112c..13cc84b28058 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h
@@ -9,7 +9,6 @@
 #define _DPU_12_0_SM8750_H
 
 static const struct dpu_caps sm8750_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h
index 13bb43ba67d3..59a4859ce67a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h
@@ -7,7 +7,6 @@
 #define _DPU_12_2_GLYMUR_H
 
 static const struct dpu_caps glymur_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
index 29e0eba91930..c6923e0093cd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h
@@ -7,7 +7,6 @@
 #define _DPU_1_14_MSM8937_H
 
 static const struct dpu_caps msm8937_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.max_linewidth = DEFAULT_DPU_LINE_WIDTH,
 	.pixel_ram_size = 40 * 1024,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
index cb1ee4b63f9f..14d0619c1479 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h
@@ -7,7 +7,6 @@
 #define _DPU_1_14_MSM8917_H
 
 static const struct dpu_caps msm8917_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.max_linewidth = DEFAULT_DPU_LINE_WIDTH,
 	.pixel_ram_size = 16 * 1024,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
index b44d02b48418..17f6d1ee90aa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h
@@ -7,7 +7,6 @@
 #define _DPU_1_16_MSM8953_H
 
 static const struct dpu_caps msm8953_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.max_linewidth = DEFAULT_DPU_LINE_WIDTH,
 	.pixel_ram_size = 40 * 1024,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index 8af63db315b4..1885ea92a808 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -9,7 +9,6 @@
 #define _DPU_1_7_MSM8996_H
 
 static const struct dpu_caps msm8996_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.has_src_split = true,
 	.max_linewidth = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index f91220496082..3fafb10661cf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -8,7 +8,6 @@
 #define _DPU_3_0_MSM8998_H
 
 static const struct dpu_caps msm8998_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index 8f9a097147c0..b2bd87f4af43 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -7,7 +7,6 @@
 #define _DPU_3_2_SDM660_H
 
 static const struct dpu_caps sdm660_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index 0ad18bd273ff..e4304ace8eb9 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -7,7 +7,6 @@
 #define _DPU_3_3_SDM630_H
 
 static const struct dpu_caps sdm630_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 5cc9f55d542b..ee3b78ce6bd1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -8,7 +8,6 @@
 #define _DPU_4_0_SDM845_H
 
 static const struct dpu_caps sdm845_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index ae1b2ed96e9f..02621def12b2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -8,7 +8,6 @@
 #define _DPU_5_0_SM8150_H
 
 static const struct dpu_caps sm8150_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index b572cfa7ed35..04afc22d9fad 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -8,7 +8,6 @@
 #define _DPU_5_1_SC8180X_H
 
 static const struct dpu_caps sc8180x_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index a56c288ac10c..371fcb7f7bef 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -8,7 +8,6 @@
 #define _DPU_5_2_SM7150_H
 
 static const struct dpu_caps sm7150_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
index 26883f6b66b3..a5a3944a5601 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h
@@ -7,7 +7,6 @@
 #define _DPU_5_3_SM6150_H
 
 static const struct dpu_caps sm6150_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x9,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
index fbf50f279e66..42d6d1a6cce4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h
@@ -9,7 +9,6 @@
 #define _DPU_5_4_SM6125_H
 
 static const struct dpu_caps sm6125_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x6,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
index 7b8b7a1c2d76..d39ca9b287d4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h
@@ -8,7 +8,6 @@
 #define _DPU_6_0_SM8250_H
 
 static const struct dpu_caps sm8250_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
index c990ba3b5db0..afe83f5e4349 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h
@@ -8,7 +8,6 @@
 #define _DPU_6_2_SC7180_H
 
 static const struct dpu_caps sc7180_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x9,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
index 343ff5482382..90d696707227 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h
@@ -8,7 +8,6 @@
 #define _DPU_6_3_SM6115_H
 
 static const struct dpu_caps sm6115_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
index 093d16bdc450..d7a94b7c69f1 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h
@@ -9,7 +9,6 @@
 #define _DPU_6_4_SM6350_H
 
 static const struct dpu_caps sm6350_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
index 47053bf9b0a2..fadbfd4f9f95 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h
@@ -8,7 +8,6 @@
 #define _DPU_6_5_QCM2290_H
 
 static const struct dpu_caps qcm2290_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
index 98190ee7ec7a..9427ec024d60 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h
@@ -9,7 +9,6 @@
 #define _DPU_6_9_SM6375_H
 
 static const struct dpu_caps sm6375_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_LINE_WIDTH,
 	.max_mixer_blendstages = 0x4,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
index 85aae40c210f..5fe2673fa8d3 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h
@@ -8,7 +8,6 @@
 #define _DPU_7_0_SM8350_H
 
 static const struct dpu_caps sm8350_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 8f978b9c3452..80233a687f35 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -8,7 +8,6 @@
 #define _DPU_7_2_SC7280_H
 
 static const struct dpu_caps sc7280_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0x7,
 	.has_dim_layer = true,
 	.has_idle_pc = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
index 303d33dc7783..37a539a195df 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h
@@ -8,7 +8,6 @@
 #define _DPU_8_0_SC8280XP_H
 
 static const struct dpu_caps sc8280xp_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 11,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
index b09a6af4c474..bda58b5c48df 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h
@@ -8,7 +8,6 @@
 #define _DPU_8_1_SM8450_H
 
 static const struct dpu_caps sm8450_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
index 0f7b4a224e4c..c5affbb42ecb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h
@@ -7,7 +7,6 @@
 #define _DPU_8_4_SA8775P_H
 
 static const struct dpu_caps sa8775p_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index 465b6460f875..a34d85a82e99 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -8,7 +8,6 @@
 #define _DPU_9_0_SM8550_H
 
 static const struct dpu_caps sm8550_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
index 6caa7d40f368..21e40f098d6e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h
@@ -8,7 +8,6 @@
 #define _DPU_9_1_SAR2130P_H
 
 static const struct dpu_caps sar2130p_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index 7243eebb85f3..6906fb060c19 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -7,7 +7,6 @@
 #define _DPU_9_2_X1E80100_H
 
 static const struct dpu_caps x1e80100_dpu_caps = {
-	.max_mixer_width = DEFAULT_DPU_OUTPUT_LINE_WIDTH,
 	.max_mixer_blendstages = 0xb,
 	.has_src_split = true,
 	.has_dim_layer = true,
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index ee94d0ccb8a3..67a97d62ed54 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -259,7 +259,6 @@ struct dpu_rotation_cfg {
 
 /**
  * struct dpu_caps - define DPU capabilities
- * @max_mixer_width    max layer mixer line width support.
  * @max_mixer_blendstages max layer mixer blend stages or
  *                       supported z order
  * @has_src_split      source split feature status
@@ -272,7 +271,6 @@ struct dpu_rotation_cfg {
  * @max_vdeci_exp      max vertical decimation supported (max is 2^value)
  */
 struct dpu_caps {
-	u32 max_mixer_width;
 	u32 max_mixer_blendstages;
 	bool has_src_split;
 	bool has_dim_layer;

-- 
2.47.3

