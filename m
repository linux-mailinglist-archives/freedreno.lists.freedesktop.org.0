Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C5929170A1
	for <lists+freedreno@lfdr.de>; Tue, 25 Jun 2024 20:54:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20AF910E24A;
	Tue, 25 Jun 2024 18:54:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="jOfCcxrz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com
 [209.85.208.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E8C5510E714
 for <freedreno@lists.freedesktop.org>; Tue, 25 Jun 2024 18:54:48 +0000 (UTC)
Received: by mail-ed1-f52.google.com with SMTP id
 4fb4d7f45d1cf-57d26a4ee65so5830157a12.2
 for <freedreno@lists.freedesktop.org>; Tue, 25 Jun 2024 11:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1719341687; x=1719946487; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xAeS4mM4aSNcoVf/kotftvMHKTcYgSCvsxfnUxg7P5Y=;
 b=jOfCcxrzLHHP+zo+TfpMs7Li+2wbIt0iKkXQV0H7EudKz0vtj3/RPnToXixGuBlnX/
 SFJiGUGU4v8tOsrrM7wgpGl9jqG/03Ot3cuKJUN6IhO6R1R0rP9Nrmqz4G8PQApqC4GL
 mAfXjs6LRSMorrYntFA/nX/0wm1iHmoO+0ZhvogtNsecVhlZ3b7GZlW65/dgHj/ynth/
 g/6vmyT0MHghMBx6KgwExKyzTwgd6Mr5w4wZB0oRQNg4jDMq1JbkGebx/BFjORAmc2A1
 UY8gD3Hyd3Szz3FPSAeCvfu75INMVrQbUMYXi6A+sxDqBO1DinrBnmD6LVHMeqaERuK+
 85zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1719341687; x=1719946487;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xAeS4mM4aSNcoVf/kotftvMHKTcYgSCvsxfnUxg7P5Y=;
 b=CVba2ew0tjpi8ibzV7Abb0M5+9S6oNfyngwsbMDatKQkIsW6prIIjTK0P7ZHCOwdH+
 porajJzJLHi+tOufiN8jQ9AOZtaqSy+4RmE8VpJqqRb0TOwBJZSCX435pPaxZFig0F52
 fd235f3c1rMeviqOO8P7EmLX1Jx3nFp4AIxzg3QX5lI3g5AO3TlxLOm85HGzbW+21X73
 YgsikDZ52ERT6pz82+IA5qNkdPKtZf2hI6JBhU8/HlZIRVjxJdH+9JYGO2NeOLXV67Br
 eo04RXphpx0HU8ixeMSPw1Qbdwgl0ZRXibdu4c0k+zE7Cglz2DqxZpaC9YN5PHTQ7mEa
 4cDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVSRfIekdyvpy73yheVtY1D1Qm59C8E/eP8sU+jEN55wFo5cWUiA5le4AKNVid0wy7OOdLiaeJPMMnt2zEADbsk3FQ3MOYCE+hddgsUI19g
X-Gm-Message-State: AOJu0YwUskNKY2oyDmuG7YsrpYD+AIhEr8qCh3ZEQ+aGftBArKa73LTK
 hRpriU2o9yZaQNbV6r3O+qcQ6mGrsW6uGs6cxo8V31S5jLafetJRfoSmjFCgjbU=
X-Google-Smtp-Source: AGHT+IEZrJZS1tfhyTZGHs+U9v369kOCPKFuTyDtNvE4wjV/huT/hN7vydHLOuarueDDNPJZbhY6ZA==
X-Received: by 2002:a50:871a:0:b0:57a:1fef:619e with SMTP id
 4fb4d7f45d1cf-57d49cba82dmr6411757a12.18.1719341686936; 
 Tue, 25 Jun 2024 11:54:46 -0700 (PDT)
Received: from [192.168.215.29] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-57d30583e93sm6206332a12.96.2024.06.25.11.54.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 25 Jun 2024 11:54:46 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 25 Jun 2024 20:54:41 +0200
Subject: [PATCH v2 1/2] drm/msm/adreno: De-spaghettify the use of memory
 barriers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240625-adreno_barriers-v2-1-c01f2ef4b62a@linaro.org>
References: <20240625-adreno_barriers-v2-0-c01f2ef4b62a@linaro.org>
In-Reply-To: <20240625-adreno_barriers-v2-0-c01f2ef4b62a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: Marijn Suijten <marijn.suijten@somainline.org>, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.14.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1719341683; l=2477;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=eaij4ky7Aj6Mo/9du9/Ra9OWPq/fZxhy7kMrtRpyFYE=;
 b=Z0KB5jk9AhXcGs1aL3QtNdOPM5K/I4gVZFo+tLfA1o/pzDBDBAHZizVeTI/hoeYeCFn8s3LVE
 WBYMHf66XPSAmUwwriFgo+nFF+A0QD2AX3EK7pq3QNX6nzgBgLH4q7t
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

Replace the barriers with a readback (or drop altogether where possible)
that ensures the previous writes have exited the write buffer (as the CPU
must flush the write to the register it's trying to read back).

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c |  4 +---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 10 ++++++----
 2 files changed, 7 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 0e3dfd4c2bc8..09d640165b18 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -466,9 +466,7 @@ static int a6xx_rpmh_start(struct a6xx_gmu *gmu)
 	int ret;
 	u32 val;
 
-	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, 1 << 1);
-	/* Wait for the register to finish posting */
-	wmb();
+	gmu_write(gmu, REG_A6XX_GMU_RSCC_CONTROL_REQ, BIT(1));
 
 	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_RSCC_CONTROL_ACK, val,
 		val & (1 << 1), 100, 10000);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c98cdb1e9326..4083d0cad782 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -855,14 +855,16 @@ static int hw_init(struct msm_gpu *gpu)
 	/* Clear GBIF halt in case GX domain was not collapsed */
 	if (adreno_is_a619_holi(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
+		gpu_read(gpu, REG_A6XX_GBIF_HALT);
+
 		gpu_write(gpu, REG_A6XX_RBBM_GPR0_CNTL, 0);
-		/* Let's make extra sure that the GPU can access the memory.. */
-		mb();
+		gpu_read(gpu, REG_A6XX_RBBM_GPR0_CNTL);
 	} else if (a6xx_has_gbif(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
+		gpu_read(gpu, REG_A6XX_GBIF_HALT);
+
 		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
-		/* Let's make extra sure that the GPU can access the memory.. */
-		mb();
+		gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT);
 	}
 
 	/* Some GPUs are stubborn and take their sweet time to unhalt GBIF! */

-- 
2.45.2

