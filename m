Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 401C56B9929
	for <lists+freedreno@lfdr.de>; Tue, 14 Mar 2023 16:29:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4AA0110EA85;
	Tue, 14 Mar 2023 15:29:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F127710E839
 for <freedreno@lists.freedesktop.org>; Tue, 14 Mar 2023 15:28:51 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id a32so16412950ljr.9
 for <freedreno@lists.freedesktop.org>; Tue, 14 Mar 2023 08:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678807731;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=0QBfkwBASk6EqehMpj5iBWVthwGOhEMOaMUH5eoHlaw=;
 b=UepBCxqmyQ8a7htSDlTFI0ShFtEB7diji/pbqGjwg56DIr/pGL1FMQG23Kn4gVFUIH
 NWU7NEQOg6QEPw+QBNKkfk0e3g7KdwuL54ChUUC95zetLCTFMuNkWeytTRsZmOoAlBPh
 6oKBWQ+Zrt2mvYnaj1zpDOe5mfV6hGiVgV8S4nFnuK92cLLCnctMeMoH5uimRkorSjJC
 hi7HBB16Btn0M0sTQJkP9rlv0qMBsA6gH2fdDc36OWvkMN9RwmYFYtyGhAjMCcaOXdv7
 Iu3w3ma+ue36QNvHTEAvVstExQCK4oYWWSW8+plHHOxbDvNQ+AjF0T3Vli78h9Ec6XHk
 l0BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678807731;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=0QBfkwBASk6EqehMpj5iBWVthwGOhEMOaMUH5eoHlaw=;
 b=R6haXr36it+SB5X7lmqOyTmH1ntof/t6rM2IIUu26Z1Z/tK99en6MEYayUdmSE2i+4
 grppnLlRQij3wV66gxx04TFWj0/8qbdF0oipjDg319gdpZ6F3htxjugQFFMVahwqV3/h
 I/jQVFvB1HW6Ie9IkcW5/w2y7X56ML50GlM2Wjzp2kYwPa5ej8I9IrjUnErUb2liFY8u
 MVx+IlJ28+zQpIF6uHgX7cVWJlkJ5KLNgKn/ST/ButfoKaFU+/AmBLPgb4c2vwupEl7w
 rBGctSG9sKGUsBfpsfAYT+6s3ODRoOArBpRU4LS1VVVCq6PldOk32QC9lvzFlnHRZTFc
 Ac8A==
X-Gm-Message-State: AO0yUKX/Y6+zLdbBmk4aAXmDPV9TFSH1HreTxAzpQLLN7an5AoImyAKw
 2CCWhrdUxsHIkIQFlD/zJRJrNA==
X-Google-Smtp-Source: AK7set9319x6pXFA2ZB5oQB5t6Vlb6uh1fRGtzfQAmcsGR0/P2fXfUFxvI6C2W5JvKGej6l20vdP9Q==
X-Received: by 2002:a2e:909a:0:b0:295:a829:1c57 with SMTP id
 l26-20020a2e909a000000b00295a8291c57mr12082944ljg.20.1678807731546; 
 Tue, 14 Mar 2023 08:28:51 -0700 (PDT)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 27-20020a2e165b000000b002986a977bf2sm491529ljw.90.2023.03.14.08.28.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Mar 2023 08:28:51 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 14 Mar 2023 16:28:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v4-8-e987eb79d03f@linaro.org>
References: <20230223-topic-gmuwrapper-v4-0-e987eb79d03f@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v4-0-e987eb79d03f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678807716; l=4940;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=RIb1PwuaJxl26QOFy9hE9BbhqyB0PIh+V+WoOWu9KIo=;
 b=h7jUht1chOrWGuBBXbU8DzuW6yjeui4Q0sDTGbH6GAeYwsfIT23zHYJDwYLDz3LenakP9X/KTBJ5
 izASb5SjDlR6KxM03YuJv1h7kgCC7iusu/S20201Ob3fWj/jky89
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v4 08/14] drm/msm/a6xx: Add support for A619_holi
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

A619_holi is a GMU-less variant of the already-supported A619 GPU.
It's present on at least SM4350 (holi) and SM6375 (blair). No mesa
changes are required. Add the required kernel-side support for it.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c   | 42 ++++++++++++++++++++++++++-------
 drivers/gpu/drm/msm/adreno/adreno_gpu.h |  5 ++++
 2 files changed, 39 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 70e9bd21ba3b..1c0e5e1df89c 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -614,14 +614,16 @@ static void a6xx_set_hwcg(struct msm_gpu *gpu, bool state)
 		return;
 
 	/* Disable SP clock before programming HWCG registers */
-	if (!adreno_has_gmu_wrapper(adreno_gpu))
+	if (!adreno_has_gmu_wrapper(adreno_gpu) ||
+	     adreno_is_a619_holi(adreno_gpu))
 		gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 1, 0);
 
 	for (i = 0; (reg = &adreno_gpu->info->hwcg[i], reg->offset); i++)
 		gpu_write(gpu, reg->offset, state ? reg->value : 0);
 
 	/* Enable SP clock */
-	if (!adreno_has_gmu_wrapper(adreno_gpu))
+	if (!adreno_has_gmu_wrapper(adreno_gpu) ||
+	     adreno_is_a619_holi(adreno_gpu))
 		gmu_rmw(gmu, REG_A6XX_GPU_GMU_GX_SPTPRAC_CLOCK_CONTROL, 0, 1);
 
 	gpu_write(gpu, REG_A6XX_RBBM_CLOCK_CNTL, state ? clock_cntl_on : 0);
@@ -814,6 +816,9 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	if (adreno_is_a618(adreno_gpu))
 		return;
 
+	if (adreno_is_a619_holi(gpu))
+		hbb_lo = 0;
+
 	if (adreno_is_a640_family(adreno_gpu))
 		amsbc = 1;
 
@@ -1015,7 +1020,12 @@ static int hw_init(struct msm_gpu *gpu)
 	}
 
 	/* Clear GBIF halt in case GX domain was not collapsed */
-	if (a6xx_has_gbif(adreno_gpu)) {
+	if (adreno_is_a619_holi(adreno_gpu)) {
+		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
+		gpu_write(gpu, 0x18, 0);
+		/* Let's make extra sure that the GPU can access the memory.. */
+		mb();
+	} else if (a6xx_has_gbif(adreno_gpu)) {
 		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
 		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
 		/* Let's make extra sure that the GPU can access the memory.. */
@@ -1024,6 +1034,9 @@ static int hw_init(struct msm_gpu *gpu)
 
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
 
+	if (adreno_is_a619_holi(adreno_gpu))
+		a6xx_sptprac_enable(gmu);
+
 	/*
 	 * Disable the trusted memory range - we don't actually supported secure
 	 * memory rendering at this point in time and we don't want to block off
@@ -1301,7 +1314,8 @@ static void a6xx_dump(struct msm_gpu *gpu)
 #define GBIF_CLIENT_HALT_MASK	BIT(0)
 #define GBIF_ARB_HALT_MASK	BIT(1)
 #define VBIF_RESET_ACK_TIMEOUT	100
-#define VBIF_RESET_ACK_MASK	0x00f0
+#define VBIF_RESET_ACK_MASK	0xF0
+#define GPR0_GBIF_HALT_REQUEST	0x1E0
 
 static void a6xx_recover(struct msm_gpu *gpu)
 {
@@ -1358,10 +1372,16 @@ static void a6xx_recover(struct msm_gpu *gpu)
 
 	/* Software-reset the GPU */
 	if (adreno_has_gmu_wrapper(adreno_gpu)) {
-		/* Halt the GX side of GBIF */
-		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, GBIF_GX_HALT_MASK);
-		spin_until(gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT_ACK) &
-			   GBIF_GX_HALT_MASK);
+		if (adreno_is_a619_holi(adreno_gpu)) {
+			gpu_write(gpu, 0x18, GPR0_GBIF_HALT_REQUEST);
+			spin_until((gpu_read(gpu, REG_A6XX_RBBM_VBIF_GX_RESET_STATUS) &
+				   (VBIF_RESET_ACK_MASK)) == VBIF_RESET_ACK_MASK);
+		} else {
+			/* Halt the GX side of GBIF */
+			gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, GBIF_GX_HALT_MASK);
+			spin_until(gpu_read(gpu, REG_A6XX_RBBM_GBIF_HALT_ACK) &
+				   GBIF_GX_HALT_MASK);
+		}
 
 		/* Halt new client requests on GBIF */
 		gpu_write(gpu, REG_A6XX_GBIF_HALT, GBIF_CLIENT_HALT_MASK);
@@ -1783,6 +1803,9 @@ static int a6xx_pm_resume(struct msm_gpu *gpu)
 	if (ret)
 		goto err;
 
+	if (adreno_is_a619_holi(adreno_gpu))
+		a6xx_sptprac_enable(gmu);
+
 err:
 	mutex_unlock(&a6xx_gpu->gmu.lock);
 
@@ -1837,6 +1860,9 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 
 	mutex_lock(&a6xx_gpu->gmu.lock);
 
+	if (adreno_is_a619_holi(adreno_gpu))
+		a6xx_sptprac_disable(gmu);
+
 	clk_disable_unprepare(gpu->ebi1_clk);
 
 	clk_bulk_disable_unprepare(gpu->nr_clocks, gpu->grp_clks);
diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 2c0f0ef094cb..92ece15ec7d8 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -252,6 +252,11 @@ static inline int adreno_is_a619(struct adreno_gpu *gpu)
 	return gpu->revn == 619;
 }
 
+static inline int adreno_is_a619_holi(struct adreno_gpu *gpu)
+{
+	return adreno_is_a619(gpu) && adreno_has_gmu_wrapper(gpu);
+}
+
 static inline int adreno_is_a630(struct adreno_gpu *gpu)
 {
 	return gpu->revn == 630;

-- 
2.39.2

