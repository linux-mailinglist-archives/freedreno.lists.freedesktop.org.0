Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8EAEC9F896A
	for <lists+freedreno@lfdr.de>; Fri, 20 Dec 2024 02:28:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F39010EE26;
	Fri, 20 Dec 2024 01:28:39 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="yZebCi0f";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22E3710EE22
 for <freedreno@lists.freedesktop.org>; Fri, 20 Dec 2024 01:28:37 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-54021daa6cbso1414643e87.0
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2024 17:28:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734658115; x=1735262915; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=w4ndfZOZJO1jxo/ZES5BqsNFMwpzqaVZfLDHYM6sZiI=;
 b=yZebCi0f723QejFz5ddesZlV2YTLV/nqFF3Eajiny7PLWjF85WWEN1PanlT9kVFEmC
 hKuF71B4A8V6qXHuwOd3IMzT6EH6cXB3m7PfGpG2IsvJHPCBKOVGl8dHcC9gAtLIK7+M
 hKqZkEu3i25VF6mfYgyMKaD68xZyytUDrsTpS4VM6X52JUHz/4W2L4kNfTePrqy1otSp
 Ioo0YMfAVsv2cUB6UB7RwiCWabs31DV6itdP1xf0Lq97vNU1vS0JAR4z9mcaKLANSJbc
 sRHax4hyb7+9RhixEe3bZWw3bQFCmnGo9n34aQ7JUK6Pn2CLwg7xGpyNjVSBeeMGDhqY
 EHdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734658115; x=1735262915;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=w4ndfZOZJO1jxo/ZES5BqsNFMwpzqaVZfLDHYM6sZiI=;
 b=B5bUjSlcd7BWJ+8V5166W2i1e9dxfyKIMSteWebevOymi3f9FqjhilJYxke2NFWfOg
 PhWqhgwrjremh1b1DXxyjHaIw5PYHVUqplIitD+6lmL9iCrx/wGlrGaC5JlkLn5Y9FKP
 1xlEdmBnVp71iO2Mlm+S3luT/u9F0fx+E+KInUqS+BQDUyw+7MX6JyV70ifahbyIOIQm
 GNl2anZPQUJTYSwievA+2ZSUIsYyK+Y50OSigZunhtG3kTs8O4TfZf4eXZEE1DTruGM5
 pKxR0eocfrI+6Ic7PfyRRHeRVWTcooueMFYZjjW9MWXuhqr2vwpsUij7zL8DevOn1W/R
 VOzw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVKDb+vJvB5s2AS+z59KGIbFD28TefV7FybHLCe1f0K8NSPS+o/WcAa4AxxKHbrfBkXPqY8blqFtP4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwyKUJEPKDCL0HnMBezCbl9yfckw1l9kc5p7ciJeEebqajIaeHX
 nMO3i0fNIL9JhPMLlkA20+gWM4V0Gb3v3o74vERPYOuZ4M6AwbC+kFBgHhgsse4=
X-Gm-Gg: ASbGnct2r1VYHHjMiMgPeMP7bBRRudB3/FIKJYB11ausF6R3xgsfWcpmxSZ9DjlFJ6U
 VT4Sw65XD03/gAEyDG2DueXLrQ2bixHO6riLiYtUqpOtGaIasiB6RgZO2LNq/uur6Vzeqw4vxVK
 M9T599jdHV1SCeeNCdwdtuPnaIDCqViZQ+E+so8E5Rf6d1xV967KRSPe+BOujDTElXikxQugTIP
 J+8KMChkRXuaqxNfr8eLxRv3E3dkYAOJXYX9IdZnuaz9o2V+ME37OmEcxFXqeau
X-Google-Smtp-Source: AGHT+IHs8K/VbvXTO8Xz4iZdDagLPpBuaGlYHTDPeiDhViakq0c6cSmYpXdTleF1r+SIikPOF9knag==
X-Received: by 2002:a05:6512:2308:b0:53e:2f9d:6a81 with SMTP id
 2adb3069b0e04-54229560339mr177427e87.39.1734658115428; 
 Thu, 19 Dec 2024 17:28:35 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54227a89c2csm170540e87.71.2024.12.19.17.28.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Dec 2024 17:28:35 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 20 Dec 2024 03:28:30 +0200
Subject: [PATCH v2 2/8] drm/msm/dpu: link DSPP_2/_3 blocks on SM8150
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241220-dpu-fix-catalog-v2-2-38fa961ea992@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1305;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=0nHV+KsFnBOLA7ZxxfDPuxSHN3vDdgnluGgG9s77asY=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnZMg+cUL3mr5ppuT98cOi+fVsGwppbZmBA/cXY
 T6tI8w+2GOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ2TIPgAKCRCLPIo+Aiko
 1d8ZB/0YSHJHTNMquXkcsraZdDPc40CYd7yWi8YA/3S2WD+87CVaoICq8y56B8NmuLoeaq+eBGK
 +Ju8Le/3jUsJlwb2kHtL7vGpEnux9+b8ozLGdL0xs19S37/SkWOO3N5eIKrQXygVIN9kpEaJijD
 yh2Sidt+1WbR7/x43yLNs0T4kQK/9Y75INqPBRRq3xm4PEBsB5SFG2yK62owBF6kAJJs8mwE16X
 +nStEKtF2sMuZNvPkRZ7a9wkLNx5Edr4QMeXFsU/KQTDbh+Hgb1lbRsls+LnnRc4/jpeZfPgWyX
 kmdbILxAjDIHpvSQdHUN3I72Y6Uxeu+Vhr+jVwV+C2LMv5cI
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

Fixes: 05ae91d960fd ("drm/msm/dpu: enable DSPP support on SM8[12]50")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
index 6ccfde82fecdb4e3612df161814b16f7af40ca5f..421afacb7248039abd9fb66bcb73b756ae0d640a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h
@@ -164,6 +164,7 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_3,
 		.pingpong = PINGPONG_2,
+		.dspp = DSPP_2,
 	}, {
 		.name = "lm_3", .id = LM_3,
 		.base = 0x47000, .len = 0x320,
@@ -171,6 +172,7 @@ static const struct dpu_lm_cfg sm8150_lm[] = {
 		.sblk = &sdm845_lm_sblk,
 		.lm_pair = LM_2,
 		.pingpong = PINGPONG_3,
+		.dspp = DSPP_3,
 	}, {
 		.name = "lm_4", .id = LM_4,
 		.base = 0x48000, .len = 0x320,

-- 
2.39.5

