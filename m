Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E855D9F2BCF
	for <lists+freedreno@lfdr.de>; Mon, 16 Dec 2024 09:27:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B1B3810E52E;
	Mon, 16 Dec 2024 08:27:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tXOf2m+2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F3C10E52E
 for <freedreno@lists.freedesktop.org>; Mon, 16 Dec 2024 08:27:44 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-3003c82c95cso31943551fa.3
 for <freedreno@lists.freedesktop.org>; Mon, 16 Dec 2024 00:27:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734337663; x=1734942463; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=w6iaR4XhdKUYvlNFXFyoX/pNn4cHsyDnjyLqjwDAVN4=;
 b=tXOf2m+2bn/833rKjlhgpB5rICXvWP+BF+Ui1UugKyns776FIw0Z4ihB/QIWHSR/HR
 cDuDQ+0xgpnJTPpKSI0wAEwfm5Fx+LVdYxZrtVaJBkGjel2k2uCJlyGtclR9lLmkrjC+
 2kDp8ahlpBXFtwh7EFZ0Vjnig0y28tsa0eIi8B1B7VBsIE1y7DrkEw6A/dBL5M7VT5sN
 /nGOCV8Tu5cmF4FnorFjQXWiggAavREa0r46d6xWRcVim/Dq/wJKUDaUCAiBzTcMmzhx
 HfHTWodLZDLpJqHUxlRpP+GglWTmok2tvBXe6w8FKnFWslKaCmycn0Xgo9ptbwbzus3i
 cxmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734337663; x=1734942463;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w6iaR4XhdKUYvlNFXFyoX/pNn4cHsyDnjyLqjwDAVN4=;
 b=EHlPJqcXSxbiRmfClcjFJPWf6+qxmGa9DGqbfLwSrtmF/qXyjt37zTmweqz9GiEI88
 PyyODHPZFhZb2giAfTsUmcsfFkDfCmzOyRc3T5yxbhxG9Sfa7+4ENQ0N0z32sZCNlF4F
 o4v115xWhG3SJAUfkhqz7WUL4w4voZheEqT4AqaXDQfqlPc2yCsRjkfTcZxKZIZ1UxB4
 e86a3p8vqAPaNVbdKo1V3rej86omB2Ybwet8uf5jZFbcxp5ImHPw0+afwIUsG13k0d0x
 ANL9mLNnPqVH9CZsKypy+r644i33S11moSM4/gXMO54vfXz1i+pV+JWOKTpx8Xek1hdN
 3CqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGXjXQoIB3NBOBoT6HNnbG+0uwOO7s+4GA5PsPMvmrs/mkzogHPMsZ4wP2Ad5kJvphMdTcrIAQ7Fc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxOyhWhhDi1+gNqL2WiCa8samEnAiu20uiTbTeEBOBtk0gvLxpk
 u/8rBELs0Jm8MJ/FdcJHRfDDxl7LJpq8ZwWum5SDHy6DHBD7kLiIDIEZclMAkENi5KnBZWJRJBN
 X
X-Gm-Gg: ASbGncuRVfS9BlDYA897tN/oBHzRtS05GlI/V/M7DZ88xlkOKX/Om30gknnWPgJm3t/
 pCiz2N3ozfFNZR0PV2l7/0qm/McIi101SXU/YnfkR5gglm04mh0eASst3w2d+a9/VwCGwVfPfFz
 U7y5WNmNH1us990rlmDkpDwAbjzU8vBywFypo7MxrTQQe/W/oJlQIi6ZlFGjmTIGkJrYPdLWQnv
 kwU4QFcU6mtRwhAGK3d2F1fQq1F/As+oiosJ9bk6pb+dVUJz4LzF8o4H/ZIc6QQ
X-Google-Smtp-Source: AGHT+IEy+x7o2Lt7ybsRZe8ZBGCz8wMHfuQe/9Ykj81HF+ZPyzLz0xLLyDsY3vkjOuNJg6AH3N2zDg==
X-Received: by 2002:a2e:a9a8:0:b0:2ff:8e69:77ef with SMTP id
 38308e7fff4ca-302544230e1mr42812991fa.1.1734337663008; 
 Mon, 16 Dec 2024 00:27:43 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-30344045342sm8543371fa.33.2024.12.16.00.27.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Dec 2024 00:27:41 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 16 Dec 2024 10:27:28 +0200
Subject: [PATCH 7/8] drm/msm/dpu: link DSPP_2/_3 blocks on X1E80100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241216-dpu-fix-catalog-v1-7-15bf0807dba1@linaro.org>
References: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
In-Reply-To: <20241216-dpu-fix-catalog-v1-0-15bf0807dba1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Foss <rfoss@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Richard Acayan <mailingradian@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1149;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0d6Vl9uKHPMWNXj1THwSQ8KfCjRZZOIXlKFBufG6ric=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnX+RsCE00L5+s73vnKOb6ulTZZZO35mal3hBlU
 0p3uqpReEmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1/kbAAKCRCLPIo+Aiko
 1V5+B/9pAJg0ZCTSwEwVzazpw8iop9xUL9QAUMhs88Vnbw7eF+Ky0nqKgZQOPcnp9duJ2KZd6ui
 Gy5oSC8vg5ghOaf6MZeZO4c56G2GEH7P5mrLyc0NWGhX7oetzAUeTeGbmicgRLBMrzpynqDEGu/
 eDOJlyhNHdK94yeSjnwIEcve+5ZfFJZmaR/XywGLfDAoXizxGb5vLBwyfRnnnnfdk8qau3JNXUB
 HdcxyIvCCQg1HyU94uG0rGw5r/qUo+xYWM4BQzWu3xF1K6g4EKe0QTptys5QOkzJNzJ/MGSUzbR
 9+xDb3ElV4sLX0QpcniZNzoD55SwhZzlv5M4vizm1nlTCp09
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

Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks.

Fixes: e3b1f369db5a ("drm/msm/dpu: Add X1E80100 support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
index d61895bb396fb4287e9b41807a3bb0cdb25d4e25..4f110be6b750d30e158d517aaa507c7b4eda0af4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h
@@ -159,6 +159,7 @@ static const struct dpu_lm_cfg x1e80100_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
@@ -166,6 +167,7 @@ static const struct dpu_lm_cfg x1e80100_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,

-- 
2.39.5

