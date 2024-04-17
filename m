Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E95F8A8C82
	for <lists+freedreno@lfdr.de>; Wed, 17 Apr 2024 22:03:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D92871137C0;
	Wed, 17 Apr 2024 20:03:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="wA4Vke+w";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com
 [209.85.208.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E8991137C0
 for <freedreno@lists.freedesktop.org>; Wed, 17 Apr 2024 20:03:15 +0000 (UTC)
Received: by mail-ed1-f47.google.com with SMTP id
 4fb4d7f45d1cf-56e69888a36so92628a12.3
 for <freedreno@lists.freedesktop.org>; Wed, 17 Apr 2024 13:03:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1713384194; x=1713988994; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Ug4Rbf1oUs+Ggz/DgrdHVTQ5VxhiXHJ5sy7PE+JibXc=;
 b=wA4Vke+wPcklcjmz7jX2qca7CkESBWgJXJM1bdI06btGVyWcYHpT6+qJHTj2jnYI7L
 mjoltDRj2wPw5QOOcBrippml1KItZPTMMpKbeLyVhjEhnclxJBbQhtvvSwRgBn7Mdu3M
 uaejXjL5FPto1MKE0ARzroNfekhSOJgLXu3Z/VGmK/LmnIujThMdKTYcocYwjoJPn+2A
 W8i+prb9oUflrPiquALqfFdBYYDs3a5nlrzOh9liGECRNGLvOrF1826EheF/9hccM+1e
 ckQeE2vf1xD36/5MhpodzIs/yOyVs0m5pAGBGIImvu2FWmfdLgHnZyggHGQrciHlcwYL
 op0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1713384194; x=1713988994;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ug4Rbf1oUs+Ggz/DgrdHVTQ5VxhiXHJ5sy7PE+JibXc=;
 b=NglsA3vmyk1xjvqDaIXMMgbeIgnsY/clr79h6KIC3YMIAuaa+lLfH+wZclPbOWA6w1
 CZb5tPVdOhxv4dWD+UcFMRQPWUAnW2yaIP3pOLXkRzfNGnm6kK9C//nfdMCuHElz86/h
 5aRfW+8uyDiH47RgguyfIErycug7BvfM50hnr6NXGPmMBriTDmhlHsIElkyijOWdAOJ7
 ROH078qgfPxxucl1O82mccxWwspbimwtzfCCzNjGC4zPHDovCfDmisNWGGgbWQoFW8a8
 W13Gi4+lLSmHojmZ86MygQXkChvZpb6tRfk00oiIbAmf8XNM+o92e2L5/oJpOIbOQC6j
 lPhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXn6nhR4/brKVWQREr1oFtvF7EPh1lHo/IWDO0ux1m4Xwb7FySsVM4ovyWN7hRULaA7ys1yC3JYFyasP0lVIxmF/rzI0824aqIAQclTlnl6
X-Gm-Message-State: AOJu0YwUmLlw1F4Q2qz41HBktlcq3T93DxHzXU/mplqLxBy8OY0Ksc5r
 ol2po0ostdj7aS1PzuEZZVccjW/LsqQlypVehmOopJNSxJ5uSgfU+rl0GGqNYgI=
X-Google-Smtp-Source: AGHT+IHAyZr9H6TbxvORNTWmvyh+uqcRd5+zUK9vvdjV7xAkunQuJVY/6yEPaz70LpbJ+kjQSWci8w==
X-Received: by 2002:a17:906:4f8b:b0:a52:613c:e41d with SMTP id
 o11-20020a1709064f8b00b00a52613ce41dmr308193eju.60.1713384193603; 
 Wed, 17 Apr 2024 13:03:13 -0700 (PDT)
Received: from [192.168.45.55] (078088045141.garwolin.vectranet.pl.
 [78.88.45.141]) by smtp.gmail.com with ESMTPSA id
 xa4-20020a170906fd8400b00a5252e69c7dsm5905590ejb.160.2024.04.17.13.03.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 17 Apr 2024 13:03:13 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 17 Apr 2024 22:02:57 +0200
Subject: [PATCH v2 5/7] drm/msm/adreno: Define A530 speed bins explicitly
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240404-topic-smem_speedbin-v2-5-c84f820b7e5b@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1713384181; l=816;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=7hn9yWc0x+ZGVLx5RkT997HsicwrF9htKGIWH4IlDYk=;
 b=upTendAZvVn04hs77lbaX9iwU13uA6OdwVPVHomF4WSNuRbSnxxNQ1VbFLsXhTSlGKv7MNqC7
 HQN2Vlx8QvcClRxHnEl2kd0FCEeFyV/7u/F1K1YX5Tfvmb7mMOtuxN3
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

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 3b631445c541..53302995fc81 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -258,6 +258,12 @@ static const struct adreno_info gpulist[] = {
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
2.44.0

