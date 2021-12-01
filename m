Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5BF06465988
	for <lists+freedreno@lfdr.de>; Wed,  1 Dec 2021 23:51:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1C38F6E8FA;
	Wed,  1 Dec 2021 22:51:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B0B56E89D
 for <freedreno@lists.freedesktop.org>; Wed,  1 Dec 2021 22:51:49 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id z8so51197626ljz.9
 for <freedreno@lists.freedesktop.org>; Wed, 01 Dec 2021 14:51:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=svPKLKMKhZhnd91WRdbWbN+/qKS4HH/Q2LMWNF7ijvo=;
 b=azAFpU2VsQiCYtuKQEZfC1N6Err8B2Dzcvtjr8apntyKIeymxCyYhhvArjY7UJ62Gr
 OIDw4pexNa0sPhceWhUiMGFGOt/99tvmXORF0OfoNpIZPbGGAiDRjq04Asc+exEyvzqm
 HESUZpXUnu3ml1gM/BuVJFhN5im+EBDqmoKitBGeRvcoPEXYB+fguDdBpovFFjvKSUh2
 Da1imXp8g1KR3bUnY+NjaK3MJTe2YTOOEHZMHvKGI5EY7YEUjkV0ex36K7QWctWofs4u
 34RCZVGHyae6pw9Wyu8ccjuV05c2bSP/A+0gRHaOOj8e0P7MoqcTKhc1xV06Uw83DD4r
 3koA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=svPKLKMKhZhnd91WRdbWbN+/qKS4HH/Q2LMWNF7ijvo=;
 b=7F/YvdDAZ8QvRCD0gEDpunRkkcKactDkS4U1+2znATi6ygYDefNjotIDRk5B/Q1tOs
 aqGEIIvEzMsvLWLbqTKbVQurTG6w2hTFxr6ONZFcd9/f70bZmc387hndlFsvla7LNHWZ
 yzzOzfc4NvdYPWEMFHIPX2v9SMTPiwcbkjaH+PejbzeNNT/RFiD/q9yIIb5VFAWNukSN
 HoZWw+Dy9eyb0nY509igkTTcj+UVVRSwejvcvRYfM4DGpfzRrQcernunz8Lp4pHRBZhK
 i9spu7i/rkbkkkfnzuAJ8hPM+wxj/tBFL6sgUoqTOLhFnLwk7HyDM2FR5M/7dEeV8KUh
 0F8A==
X-Gm-Message-State: AOAM531obtTmqXXxcFY33Orj5JeBFte6puH8KtPnihnGorzkfdLRBAum
 n5bzrqOPDBq61MVbcYqTRJYWEQ==
X-Google-Smtp-Source: ABdhPJxSqroReUidD0yfVnJtB8QUTTYy2P0BgDTyj+4bcfKprRVwJCSxjy4xYuELtIvXRq5Ys6fvXA==
X-Received: by 2002:a05:651c:1257:: with SMTP id
 h23mr8148188ljh.17.1638399107596; 
 Wed, 01 Dec 2021 14:51:47 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u7sm124819ljh.49.2021.12.01.14.51.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 14:51:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Thu,  2 Dec 2021 01:51:39 +0300
Message-Id: <20211201225140.2481577-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211201225140.2481577-1-dmitry.baryshkov@linaro.org>
References: <20211201225140.2481577-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 3/4] drm/msm/dpu: simplify DPU_SSPP features
 checks
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add DPU_SSPP_CSC_ANY denoting any CSC block. As we are at it, rewrite
DPU_SSPP_SCALER (any scaler) to use BIT(x) instead of hand-coded
bitshifts.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 16 +++++++++++-----
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   |  3 +--
 2 files changed, 12 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index ad2002d75739..3c53bd03bdeb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -25,11 +25,17 @@ struct dpu_hw_pipe;
 /**
  * Define all scaler feature bits in catalog
  */
-#define DPU_SSPP_SCALER ((1UL << DPU_SSPP_SCALER_RGB) | \
-	(1UL << DPU_SSPP_SCALER_QSEED2) | \
-	 (1UL << DPU_SSPP_SCALER_QSEED3) | \
-	 (1UL << DPU_SSPP_SCALER_QSEED3LITE) | \
-	  (1UL << DPU_SSPP_SCALER_QSEED4))
+#define DPU_SSPP_SCALER (BIT(DPU_SSPP_SCALER_RGB) | \
+			 BIT(DPU_SSPP_SCALER_QSEED2) | \
+			 BIT(DPU_SSPP_SCALER_QSEED3) | \
+			 BIT(DPU_SSPP_SCALER_QSEED3LITE) | \
+			 BIT(DPU_SSPP_SCALER_QSEED4))
+
+/*
+ * Define all CSC feature bits in catalog
+ */
+#define DPU_SSPP_CSC_ANY (BIT(DPU_SSPP_CSC) | \
+			  BIT(DPU_SSPP_CSC_10BIT))
 
 /**
  * Component indices
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index c7b065b14c5c..911f5f0b41d8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1010,8 +1010,7 @@ static int dpu_plane_atomic_check(struct drm_plane *plane,
 
 	if (DPU_FORMAT_IS_YUV(fmt) &&
 		(!(pdpu->pipe_hw->cap->features & DPU_SSPP_SCALER) ||
-		 !(pdpu->pipe_hw->cap->features & (BIT(DPU_SSPP_CSC)
-		 | BIT(DPU_SSPP_CSC_10BIT))))) {
+		 !(pdpu->pipe_hw->cap->features & DPU_SSPP_CSC_ANY))) {
 		DPU_DEBUG_PLANE(pdpu,
 				"plane doesn't have scaler/csc for yuv\n");
 		return -EINVAL;
-- 
2.33.0

