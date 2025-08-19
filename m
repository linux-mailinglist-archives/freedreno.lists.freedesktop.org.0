Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0CA03B2B617
	for <lists+freedreno@lfdr.de>; Tue, 19 Aug 2025 03:31:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DAB8610E50E;
	Tue, 19 Aug 2025 01:31:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Yg9l+hNn";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com
 [209.85.216.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 141A310E50D
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 01:31:54 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id
 98e67ed59e1d1-32326e5a623so3885202a91.3
 for <freedreno@lists.freedesktop.org>; Mon, 18 Aug 2025 18:31:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1755567113; x=1756171913; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ILXciEgW0I//qoLe7GzIdmNaMHGieJ0bsFVXKGQw/3Y=;
 b=Yg9l+hNnpBaiQU8dUfsjZnxN2XpjQZWuGUiHXciJZUv2qqwvgCcARwWSIhO0LPMYVY
 8CfxN9i7bREAQxxvUZLd255okBKvy/+F1FQ91YvGQBxyQNeaqkTDvn5jglbI2BBm3sn4
 HZmlGuOOtzkaYhOonFH8cbAQovTxQsEc6qvkZPORo1F66o+v/o8twrirK6ITzBVopS4y
 FHSa8+9RqPtex3+sGjN2Fysi9NgDjc1CB5/Pm4gGGSQqVyDhXt7z4HZYtFGhhTDdOyk6
 FMzuK4PGskEPMtaMCCTODK6TlA4I8OecJojsMw1imjBDRx+2NSc0OC1zIrM5BewnvWmt
 4bMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755567113; x=1756171913;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ILXciEgW0I//qoLe7GzIdmNaMHGieJ0bsFVXKGQw/3Y=;
 b=IZtRzWEh0CxpYRfulsB0inzaSuClsWwq25eI3MJNS3lo81WxDs9BwYPVV/LCk8cvls
 7D1pRKP7ICP7T0DuUNxabrIixQLllws5XJjULEPOjttd5BHR2hlWKf5nDamYvvZs8jgM
 RaiUnhHo9Eo3o5IlAME3yU0XpHrjX2fEjfyhi/4qZY49UsecPgvd1j4yYf1o3LnK37Y3
 J2KA6RHoQu1QGJG5C9GOHcunR6F7cnupXSXzt08e3RECE6oNuprBK6VPMFrSSt9r2/B8
 22bDHydxKdtdrVQv7Zv+zm1Xo6tbAB4GyhJFl2qp4TZ+UldUe3m9iCflI9jgBejkgTe/
 r8jg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcMYYcwSHPwo2b8lw7WM7KFCcZZ9Rz6n7vupWHJNtAwA5Mzs/qAR3WRzFyio0rmCpyDu+xRtplqTM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwseTbm4wWd09z6slkGZ/gNfSDfKNpFyswWzuqsGMLjXI7zOZGo
 FDewDLEXiaNyu9tC6vM7lQRa2p+KkP+8XpL2UpTNz3nCFcWjMNlUWFtS9KZMzYu8FWg=
X-Gm-Gg: ASbGncuAS2R9nwctchIb8GSUFFQEAua2KQ+rBzLVz/PhSEYbjQFYqDOXp3r0ampTLBi
 jQsRLihQGUuesdO1oo7YO6opWEJHyFxLHBkuAO9ARBEpVOwVWztZhfKQrgQyDbms3foPgpJLsK/
 NPap4IsNjYQdv42sP4vgEAoCEoqdCS8rx0oKGE/lSMx/cQbg7S0baKmvTELI/M4VJoOfQlImVv/
 no6tbnkqpM6v2wQamYN9bk9+a6Eo8TF8HAcTSxXKAOZq4soAzOW4N8FlyUM2Xy1/J65xUZmE/Na
 h10tNpTG/d9KsYMp7umQ+CMla5KzDC6vibQF4IBW7JWtRAST13fy/4m4kjEgG5LIFPROmy4Bluu
 cCLoIB8B/F8dxlj6v06qvTdUpDaGO
X-Google-Smtp-Source: AGHT+IH2kVjberDRpSlxOjehMswhobbGekKigcmkVDPGGJC58B2H5j6Wr2QGX4eK/xZiHfjmYspfrQ==
X-Received: by 2002:a17:90b:3c12:b0:31e:3f7f:d4b1 with SMTP id
 98e67ed59e1d1-32476affe90mr1293364a91.24.1755567113520; 
 Mon, 18 Aug 2025 18:31:53 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3245e4faf80sm248637a91.5.2025.08.18.18.31.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 18 Aug 2025 18:31:53 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 19 Aug 2025 09:31:03 +0800
Subject: [PATCH v15 09/13] drm/msm/dpu: Use dedicated WB number definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250819-v6-16-rc2-quad-pipe-upstream-v15-9-2c7a85089db8@linaro.org>
References: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
In-Reply-To: <20250819-v6-16-rc2-quad-pipe-upstream-v15-0-2c7a85089db8@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755567061; l=1716;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=EMexKmSgbyJrNm4fgVgmbAaex5tIopqSAoqfoqK2ahU=;
 b=Et/gGQXTneD5OZkXn8Pgl1NkEtAaawb54PFekqSi7POOha9fmpe+nFaGtNIyJt9uu4hbBiQ3H
 CuZXEeVVGbjBgyAnBLxvaJyamAe58n+gzvGpQsipqZzjf2adMJgCTVr
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

Currently MAX_CHANNELS_PER_ENC is defined as 2, because 2 channels are
supported at most in one encoder. The case of 4 channels per encoder is
to be added. To avoid breaking current WB usage case, use dedicated WB
definition before 4 WB usage case is supported in future.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 2d88d9129ec787df6dac70e6f4488ab77c6aeeed..4616b360812491afbe63f8ffd4a57bc9604382e7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -56,6 +56,7 @@
 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
 
 #define MAX_CHANNELS_PER_ENC 2
+#define MAX_CWB_PER_ENC 2
 
 #define IDLE_SHORT_TIMEOUT	1
 
@@ -182,7 +183,7 @@ struct dpu_encoder_virt {
 	struct dpu_encoder_phys *cur_master;
 	struct dpu_encoder_phys *cur_slave;
 	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
-	struct dpu_hw_cwb *hw_cwb[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_cwb *hw_cwb[MAX_CWB_PER_ENC];
 	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
 
 	unsigned int dsc_mask;
@@ -2387,7 +2388,7 @@ void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys *phys_enc,
 	 */
 	cwb_cfg.input = INPUT_MODE_LM_OUT;
 
-	for (int i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+	for (int i = 0; i < MAX_CWB_PER_ENC; i++) {
 		hw_cwb = dpu_enc->hw_cwb[i];
 		if (!hw_cwb)
 			continue;

-- 
2.34.1

