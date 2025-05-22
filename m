Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8A5D0AC140B
	for <lists+freedreno@lfdr.de>; Thu, 22 May 2025 21:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56DB710E7FB;
	Thu, 22 May 2025 19:04:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fVgc0Cbl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1243510E81D
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:04:40 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MFTfTm013410
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:04:39 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 7HsiO9nvlxXdFJJDBzSKNq1D7dmn27MSBINb3D3hdKI=; b=fVgc0CbluQwyKtgN
 RYN1D6CdZ+5qOyJDwLFHfyO0gSnodZAbQxuBqnUGjhhdlurt9290Z+AbdH9TeLLW
 fiqnArIR85NI+z7D2wKx8MYqYfvUiyIcqd7UPxWfeRfYtDtl9HFCpph5AOYISFG9
 W0U00KIanxja2ef2Z4clloY9SwlilxjAznS9c9LPfL2eZdAh/1VtIN7li+grMxHp
 27nGkCdcyb1fk/fRUe04gHU9sXpLxOpwhoQBMlOmr4aPyNTKVsL3n82WOt2ntiVZ
 3eJTaXMzaB0/CNshXNHjAxW6qcjCTLfcolzIGmXCgAa8CUM3V5g0phWjvh35SvSM
 +bg0Wg==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwh5fns6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:04:35 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-7c5e2872e57so1482880485a.0
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 12:04:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747940674; x=1748545474;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7HsiO9nvlxXdFJJDBzSKNq1D7dmn27MSBINb3D3hdKI=;
 b=EZR48+Wpyx5X52w2pWljYVUjOZlLgEufaQ03rOohwlPe6J0pCF8DDTB92jA2QsE9xE
 SB/m64NAqLC0nwp/TuWR8IkNrB6yfjc+Uz6fUzaDxJqMmMxRgh/nCaVu50/pagaysVVM
 6QEzfhjX7CJwegUJ2KN8bvvIOKJt9XC7/3AnXeuuUPThbytFv7C5A4D+s4aYBGsGwtz8
 zLQL7usTh4A37xCN4aItrg7FLEL0HiYS8Cj7c49MZ0TQXllRHvqYCQg69VIDE8Rgyzt/
 ba9YkOJmI88v/4UwMWi7vhzd8owus+VwEFonJNsrSYT3KB+m7zOhIeAaRUBu/9QVbcRe
 djNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCW+Wz/G+ZI7LdNxzRlxzIxt0zMDabp5mVgY8MApeZ81GM1HKJcW683127cZvuhZR0fG4L/tvDm8wQI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxil+AcgltPZxXGnjFSphIXeuIC2oZTqbfVEcSmSjFToB0gzFab
 /Wwa/ge7aL6GPVjB4PK/KvNYshlZe9yFt4DPBMLIi2+w0djLElSs100/9jFP9HpgclitZ2E17zh
 GMD0OERNgX/YM2Zp8n8sc+eSD4yyUjGOL5K7UpJVcve6ZV+kIdXEmHOubVRBz7dQnEOKQ8sA=
X-Gm-Gg: ASbGnctmnUlsGGa2oMmFr1iaD7+tnWw5KxB4idIQH4jpr0Qo6s5PkKcTAZs07fGA5h3
 KkoP/rdz0JWpYpdrNITR2rTAy+FMSDRC3WMUUC8jG8SRXS6SzA7XRn+XWhi1bxeDIr+Lchm00Bj
 7+Kpmns6W7cZKs5EAS3a9Dray/rqfleMKqxdSCYMLSV/Yn9pU/Kxl3o0Bnu6thM8jaTOMpSEB+a
 u21jLDSO59Kua97pAcArlaXgX9TTkbXk3pauGr5Mft3BV4KzeMOAN7JkuqmhOcaCthiwCv5mSeL
 l52j1iS0doEjpBXs1m83hvebjJ8EE7h+8/pq+jNKs7KKu00EZ04/lzBjxcbxYh7r780Kkh8G1Wi
 kljrXM3h0qa3LrZmlfDWv3PTS
X-Received: by 2002:a05:620a:4411:b0:7c5:61b2:b95 with SMTP id
 af79cd13be357-7cee3230016mr7528785a.30.1747940673685; 
 Thu, 22 May 2025 12:04:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHJcXEgTURECrguAMGCJITwpfPIaiuRByyUvFM42DipuZogyzdEEtK6OQENBI8j1ynmBL8qgg==
X-Received: by 2002:a05:620a:4411:b0:7c5:61b2:b95 with SMTP id
 af79cd13be357-7cee3230016mr7526085a.30.1747940673287; 
 Thu, 22 May 2025 12:04:33 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.04.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 12:04:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 22 May 2025 22:03:39 +0300
Subject: [PATCH v5 20/30] drm/msm/dpu: get rid of DPU_MDP_AUDIO_SELECT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250522-dpu-drop-features-v5-20-3b2085a07884@oss.qualcomm.com>
References: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
In-Reply-To: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=5361;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=az28wfky32U5SgMhpoF+tYvjM19a/MptsxvGvB1wCoU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T+kgJRh0VJUkdpLWj7JpjFCqi/7X4kuLv9k
 r/eo2ZnnG2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90/gAKCRCLPIo+Aiko
 1WWjB/4rL52zxUufz7e12/e0wnxgWgUeafsbWvO7tRUXuNgJ72N3GPODg+viUKOLpSrhYK/nPR0
 7/i211xrp36st9uOaoYZspT8qWY2SwuWkD+SA1beG3gELAbOCtjMcfdrmNLC8Iv++q8cCIQfhqM
 FZEjPHeOUQ/2Kzxq39BpW3GlzfFqc6dfBlbypKA6Ta5UwMWO0/ETLg4ybJdLsTvsgDG6/FJxCDB
 igMRCIHxhcCjwNuYN8DTm7EGEnu8vC+T3bQOAUCKA8NmcvUxj/nVbL65RSBX0KzqQYBKNDntIpi
 v4sgwJbkDbkIokLx2JuPLCq6S9nysueBD8GUVVSRJZr3p67Q
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MiBTYWx0ZWRfX80GlKThBW9z5
 ECsudvdAvr2B9k6hVVkeOpNxldOVkc4PiLCoTycCzfzpgwnEwhTr8E7+H/ogMhstSGkCMgfHQrp
 vLUZ6eLSUuDG+bNVty7F5cEXdlU69yRkwRoHaKTOM50/nFRC1oS8ISs2RaXc6Gpt/5Ar7zo22AV
 3BlLhVNQypceIL3AvzJuKef+ckBhkGTXDLqhaayUWZvritzncRltwS1WNmGwhyVkM3t+f4lAB+l
 b+qiV/LT7VIN7aPRhy5Ev0Zx4ARj38JhGZpVCZpNzOxjZ/wJzr8YLV/7Wtg+1i4NzWNvz2WAtiW
 aUrfhFbWp+VxOyv45KUhmnQkN3o3RUnX832ayfSZbLZaT6vbX26IlRwCTNMxXKPh/q3oC+sod3Q
 mlPw/BTmlkYMJRr5dc5aPYnn+/qUum+hLxAZYsgyQU8RIy8x6B6zo4I2V/5v+jR/zavSWjh5
X-Authority-Analysis: v=2.4 cv=XeWJzJ55 c=1 sm=1 tr=0 ts=682f7543 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8 a=H1s5W502GRu5WLOynKcA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: k7IgoDr06w0VtBvjnf3b6k9joitpCATh
X-Proofpoint-ORIG-GUID: k7IgoDr06w0VtBvjnf3b6k9joitpCATh
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 mlxlogscore=999 mlxscore=0 bulkscore=0 spamscore=0
 suspectscore=0 impostorscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505220192
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

Continue migration to the MDSS-revision based checks and replace
DPU_MDP_AUDIO_SELECT feature bit with the core_major_ver == 4 ||
core_major_ver == 5 check.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h | 1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h  | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c              | 3 ++-
 7 files changed, 2 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 3e66feb3e18dcc1d9ed5403a42989d97f84a8edc..72a7257b4d7ba5bfe89ec76bac19550e023a2b50 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -23,7 +23,6 @@ static const struct dpu_caps sdm845_dpu_caps = {
 static const struct dpu_mdp_cfg sdm845_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
index 3a60432a758a942eb1541f143018bd466b2bdf20..ce169a610e195cbb6f0fee1362bcaaf05df777cb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h
@@ -11,7 +11,6 @@
 static const struct dpu_mdp_cfg sdm670_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index e07c2cc4188bb12e2253068ca8666ce9364c69c1..23a3a458dd5c260399a42e5f4d4361b3c4e82c4f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -23,7 +23,6 @@ static const struct dpu_caps sm8150_dpu_caps = {
 static const struct dpu_mdp_cfg sm8150_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
index b350dba28caed77e542d6a41ceac191a93e165a7..75f8f69123a4a6afe8234a9de21ce68b23c11605 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h
@@ -23,7 +23,6 @@ static const struct dpu_caps sc8180x_dpu_caps = {
 static const struct dpu_mdp_cfg sc8180x_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
index 27c71a8a1f31921e5e1f4b6b15e0efc25fb63537..6b895eca2fac53505f7a1d857d30bb8a5d23d4c8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h
@@ -23,7 +23,6 @@ static const struct dpu_caps sm7150_dpu_caps = {
 static const struct dpu_mdp_cfg sm7150_mdp = {
 	.name = "top_0",
 	.base = 0x0, .len = 0x45c,
-	.features = BIT(DPU_MDP_AUDIO_SELECT),
 	.clk_ctrls = {
 		[DPU_CLK_CTRL_VIG0] = { .reg_off = 0x2ac, .bit_off = 0 },
 		[DPU_CLK_CTRL_VIG1] = { .reg_off = 0x2b4, .bit_off = 0 },
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index d3a7f46488a21e81a24a9af5071a9a7f5f48cdac..9ba9e273f81ab1966db1865b4ce28f8c18f750b8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -38,7 +38,6 @@
 enum {
 	DPU_MDP_PANIC_PER_PIPE = 0x1,
 	DPU_MDP_10BIT_SUPPORT,
-	DPU_MDP_AUDIO_SELECT,
 	DPU_MDP_MAX
 };
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index c49a67da86b0d46d12c32466981be7f00519974c..5c811f0142d5e2a012d7e9b3a918818f22ec11cf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -280,7 +280,8 @@ static void _setup_mdp_ops(struct dpu_hw_mdp_ops *ops,
 	if (mdss_rev->core_major_ver >= 5)
 		ops->dp_phy_intf_sel = dpu_hw_dp_phy_intf_sel;
 
-	if (cap & BIT(DPU_MDP_AUDIO_SELECT))
+	if (mdss_rev->core_major_ver == 4 ||
+	    mdss_rev->core_major_ver == 5)
 		ops->intf_audio_select = dpu_hw_intf_audio_select;
 }
 

-- 
2.39.5

