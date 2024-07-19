Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3147493765D
	for <lists+freedreno@lfdr.de>; Fri, 19 Jul 2024 12:03:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08CE710EBA7;
	Fri, 19 Jul 2024 10:03:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="bapM21T/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f176.google.com (mail-lj1-f176.google.com
 [209.85.208.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8159F10EBA0
 for <freedreno@lists.freedesktop.org>; Fri, 19 Jul 2024 10:03:53 +0000 (UTC)
Received: by mail-lj1-f176.google.com with SMTP id
 38308e7fff4ca-2eec7e431d9so27306161fa.2
 for <freedreno@lists.freedesktop.org>; Fri, 19 Jul 2024 03:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1721383432; x=1721988232; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=sJ7jGok25wqCohKFmjM2Uxuf4408Pvnq3D5lzo9Msgk=;
 b=bapM21T/XcSeuS4rogYHeIqznf5+EUR+NSicHdiwfbHF01AbWjbV4hS2xaJgNzBP8X
 vPaD3rR5myF+jpTd1YAUI9mCSdskAl89ldEunitViXyPHiuLY0K9a/6+DbRFDVR6WZsk
 3SqDI06g/WqrAPHPmNPv+drufClc03pr0xAmN0lv26ZiaFPC3MoH0dBFJ1s8CX3VXbEs
 /8I5te6pvxjDExBlcuOf21QxR+gvEaIuuu/9dlIjMcFHOEPlHJlL22Cn5Juq7VeU3ua+
 AcXkws9oGTE3HlMQPLI7mqHXvIkoD2H87r/8Zazu6JYD6AZzGvz3PU6GQ4nhf7nczluA
 pqfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1721383432; x=1721988232;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=sJ7jGok25wqCohKFmjM2Uxuf4408Pvnq3D5lzo9Msgk=;
 b=d8vsVEbk4B+ZFy8Cjx5zou2sdbX7O/HoJZ8gu4/M2f6BWSrhEOGsUoTtKAmn/LaFTi
 q5dWg/cwVcQ8uJU90FaJIQdBCqIDMFyXjkO7fnPC3gP9hmQ/CcKD++exq8MaXxx5TDAi
 c8hlLP7ObuDhucrQqC6jIhlabpndrIpMtM5080JInT42eHlp/wEIRu11ivyhAw5eMXVG
 BukDjf3D+nt9DgngU88an4ChSTFoiJ0Tqrx3aCrtvhFhJMPqp1dzs1GaV7Fj5Th6NLRK
 ff7UbC8x/t1vXOmXZJHEyUFVArFZFS4EWNNvh3e8cqoq9zw5r5HaxIsilObM8chYfsAY
 dEVA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXl7GZXHGXwsu8bKK8oHpy3uvrcn/ugZohpdf/TAqu7LBc7VvB0gIu7QLEajHnyvIAX92rafV/i229DLrhNrqRvLqgia+8EmiBKJaueURF/
X-Gm-Message-State: AOJu0YyYgPOywS+Ydj+Vb1jzN9fyje4AMSme6K/pTSekxh6oaMUoUJNx
 fPkMTHNJHDv/ROLSITYfODw/FnXCNDlPNjD4lN0zs8SiCsd1sZDEmnhH2kfbg+k=
X-Google-Smtp-Source: AGHT+IH8l/ppqpwuc0EDxTBACl80JK0PwE7h+5Db4+LmrW0cD8ffIzSXVpqM8mNVlc5/xi2veXyoUg==
X-Received: by 2002:a2e:998c:0:b0:2ec:1dfc:45bf with SMTP id
 38308e7fff4ca-2ef05d4d44emr31816751fa.42.1721383431508; 
 Fri, 19 Jul 2024 03:03:51 -0700 (PDT)
Received: from [192.168.105.194] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-5a30aaa31e0sm919984a12.27.2024.07.19.03.03.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Jul 2024 03:03:51 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 19 Jul 2024 12:03:29 +0200
Subject: [PATCH 4/5] drm/msm/a6xx: Set GMU CGC properties on a6xx too
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240719-topic-a621-v1-4-850ae5307cf4@linaro.org>
References: <20240719-topic-a621-v1-0-850ae5307cf4@linaro.org>
In-Reply-To: <20240719-topic-a621-v1-0-850ae5307cf4@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721383413; l=2625;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=O84FzyjB2Eyhi66LD4wz7IxJGuAWHj3uy6YrALAP+Mg=;
 b=1ZwfQLvOrlfwRBd+kJWRxJFSJphLbrCDE9sDQrNr9Pk9pBIzAo4MOlf4BGjKxEgYSadu2S5x+
 iofpPsoNnDKDt7pGAdtbcK9zW/BCkGXokeSNHg9Vz7b2NjnoJqlClAz
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

This was apparently never done before.. Program the expected values.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 18 ++++++++++--------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  8 +++++++-
 2 files changed, 17 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 871452daa189..33a319f7d200 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -402,6 +402,7 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	struct a6xx_gmu *gmu = &a6xx_gpu->gmu;
 	const struct adreno_reglist *reg;
 	unsigned int i;
+	u32 cgc_delay, cgc_hyst;
 	u32 val, clock_cntl_on;
 
 	if (!(adreno_gpu->info->a6xx->hwcg || adreno_is_a7xx(adreno_gpu)))
@@ -416,14 +417,15 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 	else
 		clock_cntl_on = 0x8aa8aa82;
 
-	if (adreno_is_a7xx(adreno_gpu)) {
-		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL,
-			  state ? adreno_gpu->info->a6xx->gmu_cgc_mode : 0);
-		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL,
-			  state ? 0x10111 : 0);
-		gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL,
-			  state ? 0x5555 : 0);
-	}
+	cgc_delay = adreno_is_a615_family(adreno_gpu) ? 0x111 : 0x10111;
+	cgc_hyst = adreno_is_a615_family(adreno_gpu) ? 0x555 : 0x5555;
+
+	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_MODE_CNTL,
+			state ? adreno_gpu->info->a6xx->gmu_cgc_mode : 0);
+	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_DELAY_CNTL,
+			state ? cgc_delay : 0);
+	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GPU_GMU_AO_GMU_CGC_HYST_CNTL,
+			state ? cgc_hyst : 0);
 
 	if (!adreno_gpu->info->a6xx->hwcg) {
 		gpu_write(gpu, REG_A7XX_RBBM_CLOCK_CNTL_GLOBAL, 1);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 1ab523a163a0..26972b2cc896 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -433,7 +433,13 @@ static inline int adreno_is_a610_family(const struct adreno_gpu *gpu)
 	return adreno_is_a610(gpu) || adreno_is_a702(gpu);
 }
 
-/* check for a615, a616, a618, a619 or any a630 derivatives */
+/* TODO: 615/616 */
+static inline int adreno_is_a615_family(const struct adreno_gpu *gpu)
+{
+	return adreno_is_a618(gpu) ||
+	       adreno_is_a619(gpu);
+}
+
 static inline int adreno_is_a630_family(const struct adreno_gpu *gpu)
 {
 	if (WARN_ON_ONCE(!gpu->info))

-- 
2.45.2

