Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A25992B5A6
	for <lists+freedreno@lfdr.de>; Tue,  9 Jul 2024 12:46:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7C4B10E4F3;
	Tue,  9 Jul 2024 10:45:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ljkNMmy+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com
 [209.85.218.49])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29B8910E4F3
 for <freedreno@lists.freedesktop.org>; Tue,  9 Jul 2024 10:45:57 +0000 (UTC)
Received: by mail-ej1-f49.google.com with SMTP id
 a640c23a62f3a-a77c9c5d68bso468912366b.2
 for <freedreno@lists.freedesktop.org>; Tue, 09 Jul 2024 03:45:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1720521955; x=1721126755; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=OCdrWwyibH7SidMAd8gXxhcbnOnPffTnyQEY5fVW104=;
 b=ljkNMmy+Fx9bRsxPdGhNbPD/FqrC3dllpldI3xVYt31ggUukvdOyGWrQgPKBGP5VfH
 tej9YV1k2bSd6qsS65U1HvYvTAxjSDvRRrzDsYGVNZHDYFqGo5C0majrmayKPxzKiQkP
 X0cOxZx8Gx1A+o8TO/KGaWpPQKkLqVMKcmo8UfW2uMwzMJc71MWm1JXdKMFw4cKKUKTL
 M7DG88eqU66nXZnCUkYwsmzii91CKffv1WRHf29yK8XUPKdj15E2OMEnRvJIFsYKI/bs
 RJDWOL+EZkrStxrLdgs3Y69eYhrbpirB30YVWKUaxaa8Hs5vtoqIZKQbJXKOaGCdTe+0
 XS+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1720521955; x=1721126755;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OCdrWwyibH7SidMAd8gXxhcbnOnPffTnyQEY5fVW104=;
 b=lkcEumtwGWr2G77vnuseKL27N6Vp89cAxd6CvtYLGxHLMRjPmniDfpw9oNlFNbok0I
 MC26GbaILnZ/uGCFJNIf7bWZqlwz2jRh7wPzKnFjYSnxuKBg8yAS+T9SKmADMj6WxVco
 XVg4FZ4aXnWP0bHUjt9ypEEo+UAZanZ3DmlPiYzIV77T1cqiiXfP4TRt3Z3hJSrBEkPn
 KraaL6rItIfuR2Yq2L6V0Hn2r2/ydiCelWbnFwzWkv/gjvSiRJdyDynwCRN5rmzc+j+Z
 D4ZMElqMBIinZYrpbBlIHm038moEYZYM8R6YAuNpEocThimMCNBrrTB4uQSjTnhOflsz
 zQNw==
X-Forwarded-Encrypted: i=1;
 AJvYcCU0IavzoQhtC1WbBvlvoH7mR/SKKq1toVdnicZ8JQWsxKdRrb9ws+XiBo8RPYhX2pRqd38en81kXsobCCiCAQ5euM4jbCuy/i/nqfZkXGNg
X-Gm-Message-State: AOJu0Yz8b0cGs6xxHHCFTkcThJUfy2yrdTa0McLtHhgmhR/Kx8R8pBLT
 zyxa0+B0B7ULiANjPx/6SIeIB79SB0rYDQgYlOT9UOYhQcWXT/y7ZsN2RH1TRBk=
X-Google-Smtp-Source: AGHT+IEnddeAQttVIjPlE5QwA1Ejq9Sgylm5fg+WQ2PeIGDvlnpy6g/83mPoUVgnq4+Ux2PORfhdCA==
X-Received: by 2002:a17:907:3f20:b0:a72:554d:82af with SMTP id
 a640c23a62f3a-a780df5e5fbmr146263266b.20.1720521938009; 
 Tue, 09 Jul 2024 03:45:38 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a780a7ff038sm66295466b.115.2024.07.09.03.45.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jul 2024 03:45:37 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 09 Jul 2024 12:45:31 +0200
Subject: [PATCH v5 3/5] drm/msm/adreno: Define A530 speed bins explicitly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240709-topic-smem_speedbin-v5-3-e2146be0c96f@linaro.org>
References: <20240709-topic-smem_speedbin-v5-0-e2146be0c96f@linaro.org>
In-Reply-To: <20240709-topic-smem_speedbin-v5-0-e2146be0c96f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1720521930; l=874;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=4D54MBq6zoAcYkfe7iD2ltE1UzYmVaRiFpw+gSQkiFQ=;
 b=WfLMIj4SCvcJlhKnPfLp36Ctyq2d6AHSfVTYR87sgyW+uMP6er36Q2p56z8XMiCz66+azs3NP
 ysIMX7TBRifDWp6wRSAsHAMRBbWj13kMAR33/CyVT8WKhZ6XMnbO7V7
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
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

In preparation for commonizing the speedbin handling code.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_catalog.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_catalog.c b/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
index 633f31539162..105b3d14bd75 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_catalog.c
@@ -129,6 +129,12 @@ static const struct adreno_info a5xx_gpus[] = {
 			ADRENO_QUIRK_FAULT_DETECT_MASK,
 		.init = a5xx_gpu_init,
 		.zapfw = "a530_zap.mdt",
+		.speedbins = ADRENO_SPEEDBINS(
+			{ 0, 0 },
+			{ 1, 1 },
+			{ 2, 2 },
+			{ 3, 3 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x05040001),
 		.family = ADRENO_5XX,

-- 
2.45.2

