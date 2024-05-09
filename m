Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C468C14E9
	for <lists+freedreno@lfdr.de>; Thu,  9 May 2024 20:41:32 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E69DA10EEBD;
	Thu,  9 May 2024 18:41:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="sqqt5XWU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-f46.google.com (mail-ej1-f46.google.com
 [209.85.218.46])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0C20410EED9
 for <freedreno@lists.freedesktop.org>; Thu,  9 May 2024 18:41:28 +0000 (UTC)
Received: by mail-ej1-f46.google.com with SMTP id
 a640c23a62f3a-a59a934ad50so292592266b.1
 for <freedreno@lists.freedesktop.org>; Thu, 09 May 2024 11:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1715280087; x=1715884887; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=mqPEfUzcM7hu8r9fmVZs+WucUjP6utXCGhcKPrzzj8I=;
 b=sqqt5XWUIQKp09D92F3IyoLxX7/mCyTjEYyjUjn+8XTw9dg8tvAxmOB7rnxFYh3PMm
 bmkEEmBVbpiVDJ84BOIZC+NIRrE4g7AmT6nkQVqz9Ey11+9Pv6uy/9t2WDyaXdKM7VUG
 V8m8LpMKy2vu9LZUP4WTyiBsnjWT3rPf6q3hn2WphnXeqMPXCVKdz7IJl9qrMyE2Xqx9
 r//bVfG6JXOeaDeJcc0vNm2kaeOJ/JeWYHdAy6ih5SejK4obGvVjG5k1g13+LdddumB5
 xFvjOC+nydvLxjPTQ+T2nNOHiLg9k1Emj7Ra/WYJEB+tIapynLSJyvRcCJcpEGJz8312
 MX9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1715280087; x=1715884887;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mqPEfUzcM7hu8r9fmVZs+WucUjP6utXCGhcKPrzzj8I=;
 b=Z6CK3THA1kVJ8zqlimjCl+whp39cfPUYGK69ULEFC8sGlAodBs0Mo55hJ9abYcVJIn
 nkS/FhR8EX0HfdQV/wTom1e0qYgE4Mlp3wZ+h3lcDj18B3AwQohwYVHO0eD6oYNLu+pQ
 jddT3ntEAE5xvd5FQA5USipqKNK1sDwjNH9cqYCDBIWywoOku0YE+8Ia20DWokJNY2GY
 c7Da0T3U6HRYC8bvTVMzVKfgxaZ/hXvmRjHLDC8tb/cgIhwveim9uxjREBQTR9MA7dKA
 GvJ4KjPcCVIPN8a4vGD9ri2TEPTENs2mrlC0khMGLw5gYN/fUx4wq+/UwPAHZy2rb/Gd
 Ec7w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXuoiGkOvI34zNxcGzuIXUJAKbGLy+9+f3Cd5c8Q8G6m1UkLFYgucWUFOnRX2EZ3hj9WSvvfPLC5Bre5vH5NRHpFs+oNLhqcJBySaUcIKpd
X-Gm-Message-State: AOJu0YyyF8F1rS4uO5A+4tG6ZgbLf+vCdp6gasPTFdWB1nb5t7vECkJy
 miffbyZIw3Yti1GcNF96RxJ8xU4SlB8CxEVn8vrayfHg1febc4JWs9XOXiutRy4=
X-Google-Smtp-Source: AGHT+IGhx7HNcYGITxPU9mNn+ku+A6vTT7YBFccM+yXBc7Idaz4Uq4aqT5RpvZSXeN7Mp2i7aNrD6Q==
X-Received: by 2002:a17:906:aad5:b0:a59:a9c0:57e9 with SMTP id
 a640c23a62f3a-a5a2d678775mr26706966b.76.1715280086983; 
 Thu, 09 May 2024 11:41:26 -0700 (PDT)
Received: from [192.168.62.15] (078088045141.garwolin.vectranet.pl.
 [78.88.45.141]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-a5a17b01517sm99929166b.157.2024.05.09.11.41.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 May 2024 11:41:26 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 09 May 2024 20:41:23 +0200
Subject: [PATCH v2] drm/msm/adreno: De-spaghettify the use of memory barriers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240509-topic-adreno-v2-1-b82a9f99b345@linaro.org>
X-B4-Tracking: v=1; b=H4sIANIYPWYC/1XMQQrCMBCF4auUWRtJo5HGlfcQF5Nk0g5oUialC
 KV3N7hS3upbvH+DSsJU4dptILRy5ZIbzKGDMGEeSXFsBqPNWVvt1FJmDgqjUC4KB3dy3pl0MRb
 aZRZK/P7m7o/mJOWllkkIfyPDf2TtVZtHH7UNfe/i7ckZpRyLjLDvH2cr00SjAAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1715280085; l=5092;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=z6XHl5llDJyiHPA78/v4DUNEAeOPZTfmTPQPFm4H3Nk=;
 b=bWXRy6aulY2LTlIiaVEc91Yo7C4I8hLO+xSdtizQpxkFS48xA6mHIfG9nDAHOLmFZvLwxWUvl
 6ts9tcSY/TPC54E2eMJRWZyg7uk7mfqLrJeSHz8/kdeQTuvUHduzFyd
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
Changes in v2:

* Introduce gpu_write_flush() and use it
* Don't accidentally break a630 by trying to write to non-existent GBIF
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  4 +---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 10 ++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 16 ++++------------
 drivers/gpu/drm/msm/msm_gpu.h         | 14 ++++++++++++--
 4 files changed, 27 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 0e3dfd4c2bc8..fb2f8a03da41 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -466,9 +466,7 @@ static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
 	int ret;
 	u32 val;
 
-	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 1 << 1);
-	/* Wait for the register to finish posting */
-	wmb();
+	gmu_write_flush(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, BIT(1));
 
 	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_RSCC_CONTROL_ACK, val,
 		val & (1 << 1), 100, 10000);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index 94b6c5cab6f4..ab7f581f0d24 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -111,6 +111,16 @@ static inline void gmu_write(struct a6xx_gmu *gmu, u32 offset, u32 value)
 	writel(value, gmu->mmio + (offset << 2));
 }
 
+/*
+ * Use for timing-critical writes that must reach the hardware immediately
+ * (to work around write buffering), e.g. for reset registers.
+ */
+static inline void gmu_write_flush(struct a6xx_gmu *gmu, u32 offset, u32 value)
+{
+	gmu_write(gmu, offset, value);
+	gmu_read(gmu, offset);
+}
+
 static inline void
 gmu_write_bulk(struct a6xx_gmu *gmu, u32 offset, const u32 *data, u32 size)
 {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index cf0b1de1c071..ef7eaa6d5e5c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1714,21 +1714,13 @@ static int hw_init(struct msm_gpu *gpu)
 
 	/* Clear GBIF halt in case GX domain was not collapsed */
 	if (adreno_is_a619_holi(adreno_gpu)) {
-		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
-		gpu_write(gpu, REG_A6XX_RBBM_GPR0_CNTL, 0);
-		/* Let's make extra sure that the GPU can access the memory.. */
-		mb();
+		gpu_write_flush(gpu, REG_A6XX_GBIF_HALT, 0);
+		gpu_write_flush(gpu, REG_A6XX_RBBM_GPR0_CNTL, 0);
 	} else if (a6xx_has_gbif(adreno_gpu)) {
-		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
-		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
-		/* Let's make extra sure that the GPU can access the memory.. */
-		mb();
+		gpu_write_flush(gpu, REG_A6XX_GBIF_HALT, 0);
+		gpu_write_flush(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
 	}
 
-	/* Some GPUs are stubborn and take their sweet time to unhalt GBIF! */
-	if (adreno_is_a7xx(adreno_gpu) && a6xx_has_gbif(adreno_gpu))
-		spin_until(!gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK));
-
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
 
 	if (adreno_is_a619_holi(adreno_gpu))
diff --git a/drivers/gpu/drm/msm/msm_gpu.h b/drivers/gpu/drm/msm/msm_gpu.h
index a0c1bd6d1d5b..45d00acd5b1b 100644
--- a/drivers/gpu/drm/msm/msm_gpu.h
+++ b/drivers/gpu/drm/msm/msm_gpu.h
@@ -553,14 +553,24 @@ struct msm_gpu_state {
 	struct msm_gpu_state_bo *bos;
 };
 
+static inline u32 gpu_read(struct msm_gpu *gpu, u32 reg)
+{
+	return readl(gpu->mmio + (reg << 2));
+}
+
 static inline void gpu_write(struct msm_gpu *gpu, u32 reg, u32 data)
 {
 	writel(data, gpu->mmio + (reg << 2));
 }
 
-static inline u32 gpu_read(struct msm_gpu *gpu, u32 reg)
+/*
+ * Use for timing-critical writes that must reach the hardware immediately
+ * (to work around write buffering), e.g. for reset registers.
+ */
+static inline void gpu_write_flush(struct msm_gpu *gpu, u32 reg, u32 data)
 {
-	return readl(gpu->mmio + (reg << 2));
+	gpu_write(gpu, reg, data);
+	gpu_read(gpu, reg);
 }
 
 static inline void gpu_rmw(struct msm_gpu *gpu, u32 reg, u32 mask, u32 or)

---
base-commit: ec2d9beb604a623a9f5308f7abcff3561e08c155
change-id: 20240509-topic-adreno-a8939b92f625

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

