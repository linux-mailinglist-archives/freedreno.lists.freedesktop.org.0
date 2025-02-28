Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D5DA8A48EC2
	for <lists+freedreno@lfdr.de>; Fri, 28 Feb 2025 03:41:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B481E10EBE5;
	Fri, 28 Feb 2025 02:41:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="o3QhBtTo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com
 [209.85.208.175])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EF77E10EBDE
 for <freedreno@lists.freedesktop.org>; Fri, 28 Feb 2025 02:40:54 +0000 (UTC)
Received: by mail-lj1-f175.google.com with SMTP id
 38308e7fff4ca-30a303a656aso17361461fa.0
 for <freedreno@lists.freedesktop.org>; Thu, 27 Feb 2025 18:40:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1740710453; x=1741315253; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=C0drAA2PvbJ4hUCTdzmpW/pfB1rIMSFKchoim7lWctY=;
 b=o3QhBtToUs6+JdVwvC7dsNTqCh39JdQAWmK2obJuIwZ1Cosi1mSePiNw6qLbCdcMnk
 e1Lc46eiZnM+fg6itKCJNgFyrHOOE/jPF8umcV9785cUKPXpzhSyTC9dvGrwpdUKjFKS
 c/xWtXgA9V3vzZ7qE7ocj6F4Iszu41R+yEeKIXhmw/CY6Pw6qVXike9Z6zAJ5QzxySAJ
 L0Mn93rdok57YL69Tgs7u74OobSS0rTX3BUpscv8p4RxN7rJR6rzm2cwvN1CfS+TLANh
 Uq4TY67vCfTgFEcXtK/UsOlNB+JbpgZNtI48U5tn9seGYbvamxNjPCMr20k3qZy7G6ya
 lSkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1740710453; x=1741315253;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C0drAA2PvbJ4hUCTdzmpW/pfB1rIMSFKchoim7lWctY=;
 b=Bf5E+47p9LtlyqhnaSe1cBvNLmo1Zb837W6nJce/iqZTN5zsWqd8OH1uiSFRWCnoik
 B7j6SC0MU71Y4fi5+dqp9DqFTAmfvKXkvNLO9BW7TCJySIIzyAvny5w7hWt7XTU1NKod
 PAXOl7t7+YnTzNg578Jz3RlhKcvZ387qBFZEFIYk7nnqxTMLuOjpluP7HKMZJvYTKR1K
 bsc89nzzxgbZRrS/yOc7+RRnlsojbGz+9/hHshL+HfWnD5HnLrxppV+rhNwkwUJFvI/d
 bl6YOQQyKv2fwdYOn2Ld5t3EhCQoE6yDuVGIMWgNOkTqlVQH1me6tPNCaOAGPNXkFSxL
 fvcw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWeTidvDZJTzmhvb2TA2LmHTeicyer595KWhMvciBTxZEaLCD0xQYDv5/WbjZurjDQjyPObO19PZCk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxjTtv5os7xt1awb63iMaPGErOGk8xcBWE8Bo3z66vnPKtjig2k
 Q7/w7E30qgsKygh2OdRatAqu5MvUhva7O/qkCMml8vwtj+0LOGMnlaUeJOv6fbM=
X-Gm-Gg: ASbGnctBuDBwu7XOhXoxKmEY1X9woav2xn1bBFDFlbEc05+/9FwYUrOveRmzA43ey11
 kxN4sDpD26u/3hIfm/zx0xFZlIUBw8UYQap7YuisHvwgCd/qnv1JOt+sgl595LYQWKXeAjp+zr5
 4JQ53+jqegPGr0zJlVXlFzag5nK3ALOWIA/x6XBVBv0scuKwnYRoEiL+wzf90yI65y6ccMQOMOf
 zle/rv/NIimlt1zQMEuDcFAXdEckp9Y1LnJbCX6322Wk9Iv6MQ/uTKU9pFvA9gsz7BSycfFfYnS
 xzB1UNA1o+XqfB/0ycbRcVUWeX7BhyxLAQ==
X-Google-Smtp-Source: AGHT+IEyA6OYswRzZk6KES4gyk4YksuY5o9aOh5bM9ecrpKh5LG64AXf+j9DZx4ELbV5JDnuU1skDA==
X-Received: by 2002:a05:651c:b0d:b0:30b:8de7:c877 with SMTP id
 38308e7fff4ca-30b932f27f5mr3782391fa.29.1740710452656; 
 Thu, 27 Feb 2025 18:40:52 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30b867a7403sm3493881fa.17.2025.02.27.18.40.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Feb 2025 18:40:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 28 Feb 2025 04:40:41 +0200
Subject: [PATCH 4/4] drm/msm/dpu: remove DSC feature bit for PINGPONG on SDM630
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250228-dpu-fix-catalog-v1-4-b05d22fbc2b4@linaro.org>
References: <20250228-dpu-fix-catalog-v1-0-b05d22fbc2b4@linaro.org>
In-Reply-To: <20250228-dpu-fix-catalog-v1-0-b05d22fbc2b4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 =?utf-8?q?Barnab=C3=A1s_Cz=C3=A9m=C3=A1n?= <barnabas.czeman@mainlining.org>, 
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1666;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=5ERbWujSiKto3U+OO7RC5nldxvAV3Xb1FsVd/34DI+E=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnwSIppBKKZZWahn5Gl8puGu+J1APz0T7Ew7c91
 NvB4zUOR9WJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ8EiKQAKCRCLPIo+Aiko
 1eomB/kBscyXJstvxO1FfWarKxnLaj7+/cQqdJ7b2BZA4oKjEbWHt2gFNgSYoHv7kOWYpUX11BW
 GOEP2C05FVnfyF6dAFFx0mebAYSL3KQGKruZ5UmU/fXl3oAMzp5l3/H8Wav17TR+3S6eREXFEUX
 P6EYdVUAY+SIMsvoVXjsm+MEfBEe6hrDo6xtWeHDslnkniKMMZ8W6mfbNjXmaYMRafQtpOPTg+9
 EzqgYx/i//5cMR3KYNmfD8xzFYv6b1AjfzxcKEYahT3njHxlN0xubMbY9xyrNbULC769joFbum5
 2HMO77CtKfK4Aaxm3utxQUGoihOPJq58CCHDcD12f+w5MiYE
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The MSM8937 platform doesn't have DSC blocks nor does have it DSC
registers in the PINGPONG block. Drop the DPU_PINGPONG_DSC feature bit
from the PINGPONG's feature mask, replacing PINGPONG_SDM845_MASK and
PINGPONG_SDM845_TE2_MASK with proper bitmasks.

Fixes: 7204df5e7e68 ("drm/msm/dpu: add support for SDM660 and SDM630 platforms")
Reported-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
index df01227fc36468f4945c03e767e1409ea4fc0896..4fdc9c19a74a0c52ae502b77fb8697a53bef0f97 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h
@@ -115,14 +115,15 @@ static const struct dpu_pingpong_cfg sdm630_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
 		.base = 0x70000, .len = 0xd4,
-		.features = PINGPONG_SDM845_TE2_MASK,
+		.features = BIT(DPU_PINGPONG_DITHER) |
+			    BIT(DPU_PINGPONG_TE2),
 		.sblk = &sdm845_pp_sblk_te,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 8),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 12),
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
 		.base = 0x71000, .len = 0xd4,
-		.features = PINGPONG_SDM845_MASK,
+		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sdm845_pp_sblk,
 		.intr_done = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 10),
 		.intr_rdptr = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 14),

-- 
2.39.5

