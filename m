Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C7748C038F
	for <lists+freedreno@lfdr.de>; Wed,  8 May 2024 19:46:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CCF7F11291D;
	Wed,  8 May 2024 17:46:41 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="rSf/6E85";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com
 [209.85.167.54])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 886E2112920
 for <freedreno@lists.freedesktop.org>; Wed,  8 May 2024 17:46:40 +0000 (UTC)
Received: by mail-lf1-f54.google.com with SMTP id
 2adb3069b0e04-51f60817e34so5566754e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 08 May 2024 10:46:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715190398; x=1715795198; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=tBqc0otO/1vZytz7RpFsktZzqG8V8CralOjrOLBef2c=;
 b=rSf/6E851JaYzCP58k7Xwxujiy6Xqpgprc59R17lLw9cDQRHQuzNY6+MGj0+WqApGn
 W+tpSjXFk41M30cMWteMJxdUr+ONiRw0mBJxapQa9x7OO2K4vsWmWNiK6v/6EihkyMmU
 xy5+JxqxXT7wYDI4kg9kknjJ5ge+eD+SNcaXe1tCu5/jm4pvO2C10hW7QGBddWLt3MkR
 VpbmMTaV+RB0jQetUTvH/vEaClu8HDdFwxib6z/0C8VruK6rtDHSsJ0QXLsoCwJW6mqV
 A4HASsO2BNfL5iwVuK/+GRNYjKVjlJUDrALhH0lJeCGAfGNDCibPPNftuEh4ZwQjgLG/
 o5ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715190398; x=1715795198;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=tBqc0otO/1vZytz7RpFsktZzqG8V8CralOjrOLBef2c=;
 b=pJ/LjUOoZWkfvNre3tQqmusHA7cBzPEi3GKIZxUN2tdB4Gu6XTROVxT6f+WeI0TvTj
 ljZo5O7Ndk8epFKOJZCITH/sFePz9feiIpF192u8uomMEdNxRqzdUntm9YlwveZn5CIm
 fZ2rrxKDCkwJZEzria8XMh4e4VbpHBVe2bQ9lJRr4w5PegvoUZI0D9vvW5PNZN2MoGUZ
 NuBGVn4hW1lWbW9Sa01S98pkGD6Potply9ahd2E3UyGTbYBZvvTlSJa4dKFZNZMKTPj5
 bNAxMarVb4PhVFj2CtKBalZu5HBy5GFirUIEvz60idqXBKfFz1R/IMY7trSuKwLjBQhq
 zgqg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWrAWxpvsJUkIIG/f2eNR5WZAyAluov0m+6FvGe8l2fEBoobmflaIgO60jn/b7W6y4Xxw3YPjlgPa5OloTMZsreDYSbbFvaCTu/KG3GzH6g
X-Gm-Message-State: AOJu0YyxGeAtXvmnAoVzCKFoseTI44mGvG/s/FJV7sGPUxr1IHWvTV89
 Lg9L2d0QpYQvcnrTjRYHbpt8JkqaTN6PS0n0eDOFxoSyF47LAj+PmZkPjVy6iwo=
X-Google-Smtp-Source: AGHT+IG+Rmny74VZr2L+E6k80Nq9iEIJnnTkrW4sDMxKn1aUHIiF+KJWt9jPP/boB01r67V0blTUSw==
X-Received: by 2002:a05:6512:3a89:b0:521:b333:6f02 with SMTP id
 2adb3069b0e04-521b3336f3cmr1623400e87.14.1715190398393; 
 Wed, 08 May 2024 10:46:38 -0700 (PDT)
Received: from [127.0.1.1] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 z19-20020a195e53000000b0051b6f060248sm2635543lfi.134.2024.05.08.10.46.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 May 2024 10:46:38 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 08 May 2024 19:46:31 +0200
Subject: [PATCH] drm/msm/adreno: De-spaghettify the use of memory barriers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240508-topic-adreno-v1-1-1babd05c119d@linaro.org>
X-B4-Tracking: v=1; b=H4sIAHa6O2YC/x3MQQqAIBBA0avIrBN0UMiuEi1Ep5qNikYE4d2Tl
 m/x/wuNKlODRbxQ6ebGOQ3oSUA4fTpIchwGVGiUVbO8cuEgfayUsvQYtXMhGm0RRlIq7fz8u3X
 r/QNAVpdUXgAAAA==
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14-dev
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

Memory barriers help ensure instruction ordering, NOT time and order
of actual write arrival at other observers (e.g. memory-mapped IP).
On architectures employing weak memory ordering, the latter can be a
giant pain point, and it has been as part of this driver.

Moreover, the gpu_/gmu_ accessors already use non-relaxed versions of
readl/writel, which include r/w (respectively) barriers.

Replace the barriers with a readback that ensures the previous writes
have exited the write buffer (as the CPU must flush the write to the
register it's trying to read back) and subsequently remove the hack
introduced in commit b77532803d11 ("drm/msm/a6xx: Poll for GBIF unhalt
status in hw_init").

Fixes: b77532803d11 ("drm/msm/a6xx: Poll for GBIF unhalt status in hw_init")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  5 ++---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 14 ++++----------
 2 files changed, 6 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 0e3dfd4c2bc8..4135a53b55a7 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -466,9 +466,8 @@ static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
 	int ret;
 	u32 val;
 
-	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 1 << 1);
-	/* Wait for the register to finish posting */
-	wmb();
+	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, BIT(1));
+	gmu_read(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ);
 
 	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_RSCC_CONTROL_ACK, val,
 		val & (1 << 1), 100, 10000);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 973872ad0474..0acbc38b8e70 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1713,22 +1713,16 @@ static int hw_init(struct msm_gpu *gpu)
 	}
 
 	/* Clear GBIF halt in case GX domain was not collapsed */
+	gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
+	gpu_read(gpu, REG_A6XX_GBIF_HALT);
 	if (adreno_is_a619_holi(adreno_gpu)) {
-		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
 		gpu_write(gpu, REG_A6XX_RBBM_GPR0_CNTL, 0);
-		/* Let's make extra sure that the GPU can access the memory.. */
-		mb();
+		gpu_read(gpu, REG_A6XX_RBBM_GPR0_CNTL);
 	} else if (a6xx_has_gbif(adreno_gpu)) {
-		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
 		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
-		/* Let's make extra sure that the GPU can access the memory.. */
-		mb();
+		gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT);
 	}
 
-	/* Some GPUs are stubborn and take their sweet time to unhalt GBIF! */
-	if (adreno_is_a7xx(adreno_gpu) && a6xx_has_gbif(adreno_gpu))
-		spin_until(!gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK));
-
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
 
 	if (adreno_is_a619_holi(adreno_gpu))

---
base-commit: 93a39e4766083050ca0ecd6a3548093a3b9eb60c
change-id: 20240508-topic-adreno-a2d199cd4152

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

