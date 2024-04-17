Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CE26F8A8C84
	for <lists+freedreno@lfdr.de>; Wed, 17 Apr 2024 22:03:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E95E1137C2;
	Wed, 17 Apr 2024 20:03:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="uQXikzo+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com
 [209.85.218.41])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 946E21137BB
 for <freedreno@lists.freedesktop.org>; Wed, 17 Apr 2024 20:03:13 +0000 (UTC)
Received: by mail-ej1-f41.google.com with SMTP id
 a640c23a62f3a-a5200202c1bso4494466b.0
 for <freedreno@lists.freedesktop.org>; Wed, 17 Apr 2024 13:03:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713384192; x=1713988992; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=eu1lCQsHeKnio7sOaXuXrZB9Uomc0EWGgn8cJ3gmGiI=;
 b=uQXikzo+drmEdtQcLH2bYDD7Tner6Bitljlwb3FpfPTmlNw16H8ZjaI/F7Z3pjjSvc
 EFgquddkVA0W2ik8F16Bu0KCFPKCgD21f16CLyHqhaCTTgRZK2F0Ytxd+sh9aCYxF+k4
 O3IpeW8wJzu4FWyHsElC8fJA0IbNXNIsN6naaoH6ZYpQHQ1wi36UecPQVpfBjoc16oux
 4biw3iQAQSHRQrGxdQpWtpwxXN6KDd+dLKAXIxNs2ODAK3cI0y0q6gj2b8Tx0qcHsTk+
 khxEp1ogQ3ikZVj2ZdPF0zy2ZUwUV8UVOAKytr0EIa3NTQqFBlAdY9HlydS9V2hV3wa4
 T3SA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713384192; x=1713988992;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eu1lCQsHeKnio7sOaXuXrZB9Uomc0EWGgn8cJ3gmGiI=;
 b=qe/raHC1TAP2K/mgjrNyUjf4A7GvY+qepaFaJUYj5lnXEadPjZkncedEZXZH2lTkH5
 VTduakZBiOtRzsrv2rZPxF+kIqyzJTODz5cVI9M+ebVbuSDCO3vouismjZG09nn8UicA
 YD/gmJJ5tA/mE3DXYbep3U7QL8zSjjH2DSMi1NEfS5lyNWC3iPO+G+mWV6sLRfF9Hz7r
 LC/uvhjjJuoe+s7S7NSL9ZdsEmnIleMtAGKsVwUUvvF66Fvz2NZh3tR9tFd1CmtIxk32
 WTtQHF+ARP3OJpdaC41m1FsvxAl+LGvWXDRFGNBjZw8ENVW46Yz7HNlIavlCL5DQy9tQ
 UmIg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXc6nZ4XJvGhEhFPIfks01qmkh1Wam9xWSejhXzZRWoMGlKQwKrRCztJgep8VgvSHRDM/gvBqZpJfnL27xEwYN9TmZA2l4oyPXPGRb5bKF/
X-Gm-Message-State: AOJu0Yxwy6tEUFe7ieKnAT3mipnJZyMHhvJaJH2VtRCW0B39SQRQdBJq
 T8VGOvWgxfBLAXSlypf7vtPwjmEkMULvx8wnyQwfkOSDoy4iBpXE2LbK979ORT8=
X-Google-Smtp-Source: AGHT+IFIvDRiJ31s+hSlsYhn+Py3IPiDyVX7dHDZl0RdvShwTlsDWXxLhY8Sx9+RMVQJq2r7fm14cw==
X-Received: by 2002:a17:906:f0c8:b0:a52:617d:d77f with SMTP id
 dk8-20020a170906f0c800b00a52617dd77fmr367738ejb.56.1713384191895; 
 Wed, 17 Apr 2024 13:03:11 -0700 (PDT)
Received: from [192.168.45.55] (078088045141.garwolin.vectranet.pl.
 [78.88.45.141]) by smtp.gmail.com with ESMTPSA id
 xa4-20020a170906fd8400b00a5252e69c7dsm5905590ejb.160.2024.04.17.13.03.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 13:03:11 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 17 Apr 2024 22:02:56 +0200
Subject: [PATCH v2 4/7] drm/msm/adreno: Add speedbin data for SM8550 / A740
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240404-topic-smem_speedbin-v2-4-c84f820b7e5b@linaro.org>
References: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
In-Reply-To: <20240404-topic-smem_speedbin-v2-0-c84f820b7e5b@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713384181; l=902;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=npBgux6bk5AO5WT4DCEsUOpTuW4/rkHnMNv0Oi6y770=;
 b=ts7z6ZIKK7AXNNK+04lsJTke6GzCYGY4YjqPBzvs+E2Q9SC1gprs3T172vQ2M9MvAq5v0QKoP
 40+y85UeVa6A+N71RkbN+f5uOrO831Eks8B8s+dyoqIMjDrvAsTCffT
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

Add speebin data for A740, as found on SM8550 and derivative SoCs.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 901ef767e491..3b631445c541 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -570,6 +570,11 @@ static const struct adreno_info gpulist[] = {
 		.zapfw = "a740_zap.mdt",
 		.hwcg = a740_hwcg,
 		.address_space_size = SZ_16G,
+		.speedbins = ADRENO_SPEEDBINS(
+			{ ADRENO_SKU_ID(SOCINFO_FC_AB), 1 },
+			{ ADRENO_SKU_ID(SOCINFO_FC_AC), 0 },
+			{ ADRENO_SKU_ID(SOCINFO_FC_AF), 0 },
+		),
 	}, {
 		.chip_ids = ADRENO_CHIP_IDS(0x43051401), /* "C520v2" */
 		.family = ADRENO_7XX_GEN3,

-- 
2.44.0

