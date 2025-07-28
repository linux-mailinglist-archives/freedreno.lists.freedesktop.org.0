Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69B2BB13B2E
	for <lists+freedreno@lfdr.de>; Mon, 28 Jul 2025 15:15:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434BC10E50B;
	Mon, 28 Jul 2025 13:15:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="qvlWicAh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com
 [209.85.210.172])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD8F510E51A
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 13:15:34 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id
 d2e1a72fcca58-748e63d4b05so2671351b3a.2
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 06:15:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1753708534; x=1754313334; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ILXciEgW0I//qoLe7GzIdmNaMHGieJ0bsFVXKGQw/3Y=;
 b=qvlWicAhiv/0VQkqyKAm0lhiLwvc2CcHhXVlkRy0GP7FRHJ+IbkInKL+xPGaCsd6Ex
 Zml/ExrXR87DUd/lbn9rR/XGPkTZZhQpL2KzCV3X0e88wU+PnVmxIw86pu1FmuV5jGJ/
 vI14Rlf29dA60+DFJY08fOP+sFcCo+YwTcH2rHYk873riRVd804cm+f+53zZVhCX+4Uc
 mLnO2xLDDzUHWB5wYAAluVqTai24jadixQl1Q+YnUbL4k+7H/87U5gN/5fNaPotU9zn4
 Dk1/uueKzAz4sPmYhp0/cLAiPjS7CY4vDD33JZkX3dq6ahra31EvcpPR8dfyr91IFjcj
 /TBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753708534; x=1754313334;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ILXciEgW0I//qoLe7GzIdmNaMHGieJ0bsFVXKGQw/3Y=;
 b=eZ8cEyJ+tvBj0BDLBldnkpvZZpULE6OHR/XKEf5U86qUgV91FjNP9ShJaN/eJPzGBV
 aYtiqooUwM6MgRechpCnKrCPqMl2iNC3PG8MS2nJ1KAQ5YkVXw8uDr5DS9kki38AciTl
 dnu83q2LaSXpx1n0CNMLGoR0DGFxQkguqvLoPB4w5yKzrxEX3scKd6dsvDb1wOnfn6p6
 ek7KLZokUSM4xsV/MgO8pRDtQvPW0pm0XnI8g3crLv4EsQM7WQAcnPE290Ea6jDcyzRH
 HwmWG9EhhBF1y37tAn4W3wKUpL9EvKlIihw29HmeoiWY9sG7/awnBJl56wslpljGXu1K
 kkMw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0xNRVHmjVHdXN0tzWbHI0Q0NfZTTipWgH1IkbQgfe5laJZFm39gwEA7mQ3DzJ3X9imMeZedPANps=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx8EcCAEF6X1FDYL7ckk7WHTAC/+gccqPwup2roxWTYniQQL/KP
 JSWDTdO0Yc3fnwgoy6GaJEwOfWy818QNbNvC/M5nrwPOf70d/dDREaDA6tizDWfhbcJWK9PbPLc
 hi8KoXOlpqw==
X-Gm-Gg: ASbGncs5zN89cEGgBDFH9KG1vKkAP9/+7b/Sg4xt7Wez9cFnb8JrlHfE38QBrop0hgm
 btk9o0G0LPDca/wRRwlWQVKLGFA0E4NY+69H2q0YlRL+5WQ3eil+9NRnSMVpfCda61dVrXSf3NR
 ZUil2wA0lJkl9seLXJeECLaBhi/Ti6e2O7xkI8EYBbLTfdydXrOyct+FAgHPpSZZ9eO17b7szvU
 bMzk5NkBCi8RP92zo05MWQULBc18ys6LpUMgLQ0sOgjZjtFJReZWeZnD5/I2GiDQZS+U5G+AX6L
 Jl/3s6qtklV2TzsoFU1Q0l5Tl9rjpG2DDmVgYv/f8DwfRQ5uo3o1P4zW1rb1jlnvXGir9JdsRtp
 0fsLAcp0v6gPqUnYniw==
X-Google-Smtp-Source: AGHT+IElrHLNSRkpp4TakILrjVkGR3hmg5svUQ09qVc4AkdHMg4ce49+EeLlHcIrX1twXM5xf+MZYQ==
X-Received: by 2002:a05:6a00:84d:b0:74c:efae:ffae with SMTP id
 d2e1a72fcca58-763345c684cmr16447602b3a.5.1753708532589; 
 Mon, 28 Jul 2025 06:15:32 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76408c0287fsm5590318b3a.47.2025.07.28.06.15.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 06:15:32 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 28 Jul 2025 21:14:32 +0800
Subject: [PATCH v13 08/12] drm/msm/dpu: Use dedicated WB number definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250728-v6-16-rc2-quad-pipe-upstream-v13-8-954e4917fe4f@linaro.org>
References: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
In-Reply-To: <20250728-v6-16-rc2-quad-pipe-upstream-v13-0-954e4917fe4f@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1753708472; l=1716;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=EMexKmSgbyJrNm4fgVgmbAaex5tIopqSAoqfoqK2ahU=;
 b=xe1ZNuk2g1U5vK3Ph3VfwdF2b6l7drvSd2mIRWLMeIWDq2L02tMs0TBCIuNmzVK6YMSZ5DLJG
 4/13SEi/vvUB+fEMRFsAovtZCSEuvCFTCsIGTdwHQXd/zYCgDuRsLG8
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

