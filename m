Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B67C49F897C
	for <lists+freedreno@lfdr.de>; Fri, 20 Dec 2024 02:28:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82C5810EE2E;
	Fri, 20 Dec 2024 01:28:56 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="viTYzHgp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B677510EE33
 for <freedreno@lists.freedesktop.org>; Fri, 20 Dec 2024 01:28:50 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-53e3a90336eso1457866e87.3
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2024 17:28:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734658129; x=1735262929; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=g+UxLeMEKZ0drgg5vIKf6D6FbqGDQrxrvZvv2J0cYAE=;
 b=viTYzHgpStXVqI17dPHkeoGVuxt1vhJabrZeo3mNxEz5X1rJ1ZrdFdwfNZWXH/OT/a
 Kk8HsFVqALaDpu52Pq0azF9ILGjPp3WC+Ab/BSa7HJceuKrh2f8d4wwLmlkrrJJYHsJ9
 Jb2NrQkEo3DhWJzM1lpJx46Jpra2oWUEqFuWYNUTQQSdc5vipSyGu+LpdNNArJPY96Cp
 Whpus/iRJi7ha3/NMx7zQfkgKXNlJFDmXfkC1cIsjHVK4vCTs6NG4tt4WMoAj2DF5xe3
 Cyh0RbCh/2J7O5OB29jitbNvhy4OUOVJrtRWoTzwr913DZWcPB3yFAhrZw2u5vESfe0u
 8gvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734658129; x=1735262929;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=g+UxLeMEKZ0drgg5vIKf6D6FbqGDQrxrvZvv2J0cYAE=;
 b=oKnOTV3CPZL30RbnYm0JsGF630Q3DQHBozsrpDYMUviqXjjGCPFH1eAYik0ya2i6/U
 I72YPesfp+naSh/g2Gv60IpUoMbSbNuBhc0ZjNe5y+YcmGZWn2RHIesLsEvMjLdiMjkt
 nuzmYeNyjqF81uZeNSML/XZnBLuOkKQLIiErIfgHx1nAXMSxUUQpdKwDUSU/pij7Fia/
 6EdQZl41TKpJlIMiMi4CfM4ezWLR1DXbcY/6x0e79nfkEhCjyM67gbv5JpZIdJMtq9Ns
 dd8ekBEblEruyU+AePZIjBorJDQTP3g8NnOSHUHeql27G2kb1YBV3qftgMM6zPeLEfyh
 iBlQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVrNc8buLZnfYD5bwacWakiu7QBs/xs97YmskDzikPQwfQc5qVzi0v/qjE/2QqIraIgfbQNaKyjXj8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoeZ5aq+hiE3zdAt5bqiEmrfM/rr1/DtznaM/dGqwOiV0zw9Z8
 85a8p5QNpQIPol3flvEqTvGEkeFknViVM26Eaath2ccTC8zyUk5WoeSEYSL9tNI=
X-Gm-Gg: ASbGncvSc8nr42z8XTQ1sW1/o0NYOgueiczdJ4XzgOTAr72AEQfhB1lFSr2JEOCiddr
 /5zMtVElsNuGfMBF/Q2OpVro5PlGdj60z3185PdGAx+rRcynNjTdzh+4TVl6eHkG0EoQi+W9ZFZ
 QZgNg2kjVR0Rce5j5DFLHw6c+kEACBiigEQv6ftnv+C9T5oCtvAxs7MGuFMHfyeeAVYzAS4QlSF
 +bFZcYIakSDq9uDtFaVZnq1xGoIUPYBwXoFAxK0rGDKA6njIlbhhPeyp+CJ5W/2
X-Google-Smtp-Source: AGHT+IH5Icut19CrQRKgtDSzCRG8qNy2m4CTSKGxVWKKTUEhiYw6FKBa1WmLIGAIiUsb9ae8mcxHFQ==
X-Received: by 2002:a05:6512:1055:b0:53e:39e6:a1c1 with SMTP id
 2adb3069b0e04-54229560360mr232733e87.43.1734658129064; 
 Thu, 19 Dec 2024 17:28:49 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54227a89c2csm170540e87.71.2024.12.19.17.28.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 17:28:47 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 03:28:36 +0200
Subject: [PATCH v2 8/8] drm/msm/dpu: link DSPP_2/_3 blocks on X1E80100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-dpu-fix-catalog-v2-8-38fa961ea992@linaro.org>
References: <20241220-dpu-fix-catalog-v2-0-38fa961ea992@linaro.org>
In-Reply-To: <20241220-dpu-fix-catalog-v2-0-38fa961ea992@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Robert Foss <rfoss@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
 Abel Vesa <abel.vesa@linaro.org>, Richard Acayan <mailingradian@gmail.com>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Johan Hovold <johan@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1307;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=5058CHEvuHi6y1shjj/7LSsaLqFOGpH0zSafsGTeHak=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZMg/RB+Fi7NOIgUKpxxiaLrBsE7s80wm6VMMl
 UTR4BMn15uJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2TIPwAKCRCLPIo+Aiko
 1QbaB/9MRXkpbzcxPF0Rcp5LR396dEkAkPli7KvHNg1toaDhWPRd5C5qR8G8fog0tXC0vQP8SLm
 zqaHgaRd+nheWQRf69qtmv5FXJoNt0oiyjgtNcxeokyocr3GYy07Y3hR592MYN5EJwu6aE9X+5+
 HCHKAZDNf2apKR+GPHPXPoZZ1UVJLScMigOzkAX72Sq5+kUzu2XB3OvlVhrXMQPBb0BTbvEtPCp
 rkHncfnva1A2cFkxmw5imydwNGwSq4yiGLKiiaW+cOf/jdDMnCs9KdR7a/28KDRO1a4ZxiD+oEp
 pAcUn1XMmvDK83Iy5U4XmQGl8eaE4EtvxRff50IJWybEfSH3
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

Link DSPP_2 to the LM_2 and DSPP_3 to the LM_3 mixer blocks. This allows
using colour transformation matrix (aka night mode) with more outputs at
the same time.

Fixes: e3b1f369db5a ("drm/msm/dpu: Add X1E80100 support")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
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

