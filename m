Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C805C70A7CC
	for <lists+freedreno@lfdr.de>; Sat, 20 May 2023 14:20:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 636FE10E16B;
	Sat, 20 May 2023 12:20:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E0FD210E16B
 for <freedreno@lists.freedesktop.org>; Sat, 20 May 2023 12:19:57 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2af2d092d7aso5850581fa.2
 for <freedreno@lists.freedesktop.org>; Sat, 20 May 2023 05:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684585195; x=1687177195;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=jU/QRs28WbUWBLa9spUWYgfjKgk/ufPjSJvFjGsZJBw=;
 b=KlRFbqJhTJ0dI/m487PSqv56uAg/oO1UcYMcopPQYcMclLlmzoYNtPlo3El00kvqCQ
 WSsNvYluciV1mI15+f/6U2qcTuHfPm05EnlqUP74WAESlBoK4zLNMKYPqP+WeXJKFcTH
 XBm5tegYbP6fLJMN+2N+TcWB/wEziXUm4IwqHDh+UL+fAESZadvImscaER264WM6TlJ5
 iXQVHV1wkv2uiqlFrSOUbf9EhHYcJK7p/KpvnLk2L9sdY8WnDRRVLZwHOyE0UjyBmJp7
 xRZMJzH2sqKl6t2Q4NAtgd5ropq/+bwkATXiZtbKynq39ZM4MLY3h0Osmhr9AQSGeU8U
 ZzQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684585195; x=1687177195;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jU/QRs28WbUWBLa9spUWYgfjKgk/ufPjSJvFjGsZJBw=;
 b=ZmSS0KvH5K/ynw2ngwzo/y5QhK0vA6OnhBwRNjUXzpqxaFVtzHc3LF+Vb9EZZe5hPa
 1ECnylSq4FIeIN217pRLf2HQRgtgbPnlR61qhunLYmnkFMazyqOoaMsmlt0WYrNYoF6m
 eX3tPrif+2yPZcf+ellNJX3kIF1weI9grG/auU6w3cv/amrxx7NGIZ8XTF7+W53CN2zo
 +05aX0VgkAhyO47KzttY5nzshm9bWrxr1cBnaHzpnCtBSlJgIsNsEbDOuA5xaBtaKLtf
 Wx8FgjtImGtP5ofFNcN/RpZulOV/fh8OxHO4KAXjto336yNya3beWp9kVECxbCjWmnFT
 piwA==
X-Gm-Message-State: AC+VfDyWMmiUkaVX+abq423bWJIFyJ+IN9yeHCL5ZoDYnBLkwsIWh4Dp
 1Ns1lnMqeJj/vzYwwFgcN5u+Qg==
X-Google-Smtp-Source: ACHHUZ5CqKJ9RqawYFd+5/tVkXj6CJnt7KYZuj0CwWYSrNQAtuRAr00xjcAXaI2pnkW5JN2mAoJWrA==
X-Received: by 2002:a19:750f:0:b0:4f2:4bc2:fc35 with SMTP id
 y15-20020a19750f000000b004f24bc2fc35mr1576731lfe.53.1684585195748; 
 Sat, 20 May 2023 05:19:55 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 y6-20020ac24466000000b004f37bd02a89sm244766lfl.287.2023.05.20.05.19.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 05:19:55 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 20 May 2023 14:19:45 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v7-5-ecc7aab83556@linaro.org>
References: <20230223-topic-gmuwrapper-v7-0-ecc7aab83556@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v7-0-ecc7aab83556@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684585186; l=4540;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=zYmgc7iLON/6dS4YTyhHFJni2Xfaf0lKUqQXZ4N48q0=;
 b=NKCdzlZPj4FHQGVrpPj3zPyQa27mr8hNctWUecXu2SUEycjrPy33YbWngiZF5x2cw3PcfXZcz
 S0oMMs9Ag4IAoMI/VyfnOlyoj6sG0rv98EdpIogHwq0jmO84M020325
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v7 05/18] drm/msm/a6xx: Move
 a6xx_bus_clear_pending_transactions to a6xx_gpu
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This function is responsible for telling the GPU to halt transactions
on all of its relevant buses, drain them and leave them in a predictable
state, so that the GPU can be e.g. reset cleanly.

Move the function to a6xx_gpu.c, remove the static keyword and add a
prototype in a6xx_gpu.h to accomodate for the move.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 37 -----------------------------------
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 36 ++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.h |  2 ++
 3 files changed, 38 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 9421716a2fe5..b86be123ecd0 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -868,43 +868,6 @@ static void a6xx_gmu_rpmh_off(struct a6xx_gmu *gmu)
 		(val & 1), 100, 1000);
 }
 
-#define GBIF_CLIENT_HALT_MASK             BIT(0)
-#define GBIF_ARB_HALT_MASK                BIT(1)
-
-static void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu,
-		bool gx_off)
-{
-	struct msm_gpu *gpu = &adreno_gpu->base;
-
-	if (!a6xx_has_gbif(adreno_gpu)) {
-		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0xf);
-		spin_until((gpu_read(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL1) &
-								0xf) == 0xf);
-		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0);
-
-		return;
-	}
-
-	if (gx_off) {
-		/* Halt the gx side of GBIF */
-		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 1);
-		spin_until(gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT_ACK) & 1);
-	}
-
-	/* Halt new client requests on GBIF */
-	gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_CLIENT_HALT_MASK);
-	spin_until((gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK) &
-			(GBIF_CLIENT_HALT_MASK)) == GBIF_CLIENT_HALT_MASK);
-
-	/* Halt all AXI requests on GBIF */
-	gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_ARB_HALT_MASK);
-	spin_until((gpu_read(gpu,  REG_A6XX_GBIF_HALT_ACK) &
-			(GBIF_ARB_HALT_MASK)) == GBIF_ARB_HALT_MASK);
-
-	/* The GBIF halt needs to be explicitly cleared */
-	gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
-}
-
 /* Force the GMU off in case it isn't responsive */
 static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 {
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index e34aa15156a4..6bb4da70f6a6 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1597,6 +1597,42 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
 		a6xx_gpu->llc_mmio = ERR_PTR(-EINVAL);
 }
 
+#define GBIF_CLIENT_HALT_MASK             BIT(0)
+#define GBIF_ARB_HALT_MASK                BIT(1)
+
+void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off)
+{
+	struct msm_gpu *gpu = &adreno_gpu->base;
+
+	if (!a6xx_has_gbif(adreno_gpu)) {
+		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0xf);
+		spin_until((gpu_read(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL1) &
+								0xf) == 0xf);
+		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0);
+
+		return;
+	}
+
+	if (gx_off) {
+		/* Halt the gx side of GBIF */
+		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 1);
+		spin_until(gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT_ACK) & 1);
+	}
+
+	/* Halt new client requests on GBIF */
+	gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_CLIENT_HALT_MASK);
+	spin_until((gpu_read(gpu, REG_A6XX_GBIF_HALT_ACK) &
+			(GBIF_CLIENT_HALT_MASK)) == GBIF_CLIENT_HALT_MASK);
+
+	/* Halt all AXI requests on GBIF */
+	gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_ARB_HALT_MASK);
+	spin_until((gpu_read(gpu,  REG_A6XX_GBIF_HALT_ACK) &
+			(GBIF_ARB_HALT_MASK)) == GBIF_ARB_HALT_MASK);
+
+	/* The GBIF halt needs to be explicitly cleared */
+	gpu_write(gpu, REG_A6XX_GBIF_HALT, 0x0);
+}
+
 static int a6xx_pm_resume(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
index eea2e60ce3b7..9580def06d45 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.h
@@ -88,4 +88,6 @@ void a6xx_show(struct msm_gpu *gpu, struct msm_gpu_state *state,
 struct msm_gpu_state *a6xx_gpu_state_get(struct msm_gpu *gpu);
 int a6xx_gpu_state_put(struct msm_gpu_state *state);
 
+void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off);
+
 #endif /* __A6XX_GPU_H__ */

-- 
2.40.1

