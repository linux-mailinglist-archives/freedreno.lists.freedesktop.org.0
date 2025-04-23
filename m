Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4ECF5A99A39
	for <lists+freedreno@lfdr.de>; Wed, 23 Apr 2025 23:11:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11E7310E2CA;
	Wed, 23 Apr 2025 21:11:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FU98TDO9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FA4710E6EF
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:25 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAq8X9003734
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 WrNtkZH+H2Vic+NyXDzxkBmQFFTYEFIIb43Hc+6ZEJc=; b=FU98TDO9NfzCSINF
 h8UOecwQXmOxIO5r5DzzTswUsOCi65LPZHm7pmo3cafXg9JFnMeKd9N3ZGZwYCQo
 l9XBhNfInmTCcBJVxomKEvsfft75GLvGOiDdR5UNdEQSWnYpphWiUdQ0ZsR66Ed9
 BQ5gRElF0lWmbwCUwyXrlSQnKiaks5vl5l1MDd8K9VoCDgATCMv0ad/qBJtGMCcr
 7cZcFcOkXFr4Bx0cOvh/YASp6QwWo/JxB9wQR3qtzqC8dtkaz0z/zbF/Hoyo4aup
 zfsrOs4pdyIBdXelcoN8JHpIc6fT+FIQthT5ATNc0PLgSv8W2Lzuczs8IPFMMe9/
 p6Id5Q==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jgy3dkw-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:11:24 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c5d9d8890fso270952085a.1
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 14:11:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745442684; x=1746047484;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=WrNtkZH+H2Vic+NyXDzxkBmQFFTYEFIIb43Hc+6ZEJc=;
 b=sZW65mcqk/GEpRdIPWLN05+ydPKj6bNgLvCdO5rZ3yAJ7oYx22GND1K2fPYjJChFzE
 JO7M6ROQBvkzTYFoMg/e5XOALL4ywPVpYYIOJcfqTza/odshJjkx+FY5/70R+e4VWe+8
 eVi5aPHJ8wAJfLwmUVzECyb4f9E3cAzCWsVDB1Cdj+YCK8JgJlWctwrr/8lyrBkBYRsa
 0Z749Wqw84Hz3/GQVxeNrTbOK3gFJIPy0mK9UbZXyJUjsfwkgy4TGyLxjB/dAivzhlSg
 +1GlpneICF9vXPcmMjpTaXSdgH1T02hd7jFtimhFd/tyKUwDJqG7XcIAKaprUNYpKVk6
 ++Aw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWM95XaosWtNZBWxu1ZVYb5qxdvjBR6k2HZNrcOvEXSO11XZi+XL9KWoyp0+83W1SgGnc0/3w7an0s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxmL7s+j89Qw18J8tv9Om5EeAmh3Z23RytNc//kjmCqJTPy6Rrf
 pkAaFir2XFLz9GxEu60C9BJT61Aw9U+zky00PDVdsL+T23ij2JWrN1tJGAY3DrtLNsQjHZzU48Q
 onzzcNFye26wHzauo1GJtTQuWIHKKswymoFG4dMniwci9wLs5huQstHmmCS4KN7y4UyU=
X-Gm-Gg: ASbGnctdM9BR2NEZSkMounkk+QbxA0iWyIKsG/fFxvnxDkOgPPjaU4jI+M+Hq/LRB9k
 9NTy3bQ4qnPylpJeRGQVCIFD1LeDUJL0XL0EkfUrRmEvZg7+z7SrbCJx1A8JUY26pNLdWi9hqcH
 eWqvZI3aj3wQxqz7l4pFTZfc6+y0tul6LULLoW21srckFVSycY92cOXJkt5cp0cdAz0EuwBqWw1
 8yz09WtA4gdg0U47onftiguQa6w4egJSMgDE6wa57E7bFMpDZkhDRieT8/2xepaju8p+R7t2j5B
 1H29nX5ExFY9wPsyw4nk4A81LnQB5320Y79uRu5RHk+ribnZs5vBuFYM94mKU6fCd99DRtVqBDg
 1tFbZxkwDWfsGaKBrDAlIVW/b
X-Received: by 2002:a05:620a:1912:b0:7c5:3b8d:9f2f with SMTP id
 af79cd13be357-7c957854052mr11855885a.17.1745442683681; 
 Wed, 23 Apr 2025 14:11:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbEJvNAoP2/UxaJGavz+cKgjLPAcAoimjNe/UsaIMkbpMhagGwiYJ/zs3p1tSQw61czn09yg==
X-Received: by 2002:a05:620a:1912:b0:7c5:3b8d:9f2f with SMTP id
 af79cd13be357-7c957854052mr11850585a.17.1745442683161; 
 Wed, 23 Apr 2025 14:11:23 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.11.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 14:11:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:24 +0300
Subject: [PATCH v2 28/33] drm/msm/dpu: drop ununused PINGPONG features
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-28-0a9a66a7b3a2@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6066;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=0Xucrl9p3RVanutrsrXG/AILscg4MPlsZPdz9DRUTfA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoCVcu3InOIzon+HTk/sVfvnvpQ0BT6uQ12sZlM
 J2l+5MvrQGJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaAlXLgAKCRCLPIo+Aiko
 1W2JB/9q7xY2GLIB0nQ+zYlua/+2UHgruY7PGWRW1j3dNlJIYsawhn49BuqQ4pykaDQsqXu6HqT
 D+T9ZVQfl4oEwMrmMoT+DpH34kYnGKEGvDHugYScQj6xXEn5ON8JhdRo/A48FAW2qhvezacGKoV
 At3vRuI8s/Z0xuTtoct1dYgMr4v1BH3i1ek4bZlURgSty9Tz5fIXEWBfY88LhkbpzCgNLP6+Ax9
 DF3D8ytfVLthNBJsBY/EnyHZPIgDucVhqFM+OkL1Hj8IXGsl//j0MIYvBUnFa5St31f7nVZfvRh
 /Inmc0zljN84uW4NgEkVO0vCL6y+xHZ3uoe+bbo339WD+L4n
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0NCBTYWx0ZWRfXybtNeiEdLIKi
 v6NSkKC9kFb8pjeUgHBTVSTDiYGdkUp1aul28VyqFU818ggkkYkbGD3facmCeJR+5JQroTrCEGX
 e+FzoQuKtZSl7z89SBhEvO8EhvV+yaHdL1QVQmtPR+vTHy7j04iThs8oZXkUWHSUXFIdaSwW3FM
 zMqtH1fOXjeFAW4Ln15W2YvusJbqRvIA3KCc+eu7f0l2K+/8LfY6Nv2xiEJIBKYraEoTctX9Ntr
 BY7wianfHWYVgCIuf0ljCTE5/aOcuh/Rye26U+k72qz5mAgHnVv++i/d0yGrn/R+wKNeBgDz5wW
 A9WonhvIte4WIMBPJD6QhXdrJixnMz/Ln0r6Ep06+23+upglvi+Nvc1kK18B4mORH+GrH9W+aB4
 g4RJCKpaWYOoE+l1VdjwSc1lkl4K/bfP7//hI7b9JJQFnvG7UQlLHJZFlNi4eb/Abksx+GZj
X-Proofpoint-GUID: HI8WFBGLPlz0PE6HldxVdJAbtW4s7Yuv
X-Proofpoint-ORIG-GUID: HI8WFBGLPlz0PE6HldxVdJAbtW4s7Yuv
X-Authority-Analysis: v=2.4 cv=M5VNKzws c=1 sm=1 tr=0 ts=6809577c cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=BKnecdA5F2l9gEOK9gkA:9
 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 priorityscore=1501 mlxscore=0
 mlxlogscore=785 malwarescore=0 impostorscore=0 clxscore=1015
 suspectscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230144
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

From: Dmitry Baryshkov <lumag@kernel.org>

The DPU_PINGPONG_TE2 is unused by the current code (and can further be
replaced by the checking for the te2 sblk presense). Other feature bits
are completely unused. Drop them from the current codebase.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h  |  2 --
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h  |  1 -
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h  |  2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h          | 14 --------------
 6 files changed, 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
index 436fa56e2ba2d867b58b59ec6b02d1d0f396c23b..7f606be1f79fe83568b467c47e7280537f1ce091 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h
@@ -180,14 +180,12 @@ static const struct dpu_pingpong_cfg msm8996_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &msm8996_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &msm8996_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
index 38cdea019bf2b1391c242953e4c67d9dc4c2274c..a10ca16d2d63d8b6e2e2165dcd4bf0cf915f8e3d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h
@@ -169,14 +169,12 @@ static const struct dpu_pingpong_cfg msm8998_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
index 176640bff1214e89606286ce572f74300f6f343f..c1fc91b3f6f85af18cf6a6c1690ec69074fc3545 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h
@@ -140,14 +140,12 @@ static const struct dpu_pingpong_cfg sdm660_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index e6eb95173cfef2a52f5dc606ca41a2f1f5650c2c..65975e7ebd9ba1970b48d8753a87835677d58df7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -114,7 +114,6 @@ static const struct dpu_pingpong_cfg sdm630_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
index 21264184566493ab4e356a4e0c032ee7780cabff..8d5b7033f12f740fe7b9226e93fcece8ed54b890 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h
@@ -189,14 +189,12 @@ static const struct dpu_pingpong_cfg sdm845_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
 		.base = 0x70800, .len = 0xd4,
-		.features = BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 9),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 13),
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
index 4b6af58429361c49b71f6067dce8ca1daa6493fa..5eeb693f0e282da2aa0e5a729aed1bc8573639dd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h
@@ -87,20 +87,6 @@ enum {
 	DPU_DSPP_MAX
 };
 
-/**
- * PINGPONG sub-blocks
- * @DPU_PINGPONG_TE2        Additional tear check block for split pipes
- * @DPU_PINGPONG_SPLIT      PP block supports split fifo
- * @DPU_PINGPONG_SLAVE      PP block is a suitable slave for split fifo
- * @DPU_PINGPONG_MAX
- */
-enum {
-	DPU_PINGPONG_TE2 = 0x1,
-	DPU_PINGPONG_SPLIT,
-	DPU_PINGPONG_SLAVE,
-	DPU_PINGPONG_MAX
-};
-
 /**
  * CTL sub-blocks
  * @DPU_CTL_SPLIT_DISPLAY:	CTL supports video mode split display

-- 
2.39.5

