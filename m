Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9612270A7CE
	for <lists+freedreno@lfdr.de>; Sat, 20 May 2023 14:20:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BD56810E17C;
	Sat, 20 May 2023 12:20:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7566010E16F
 for <freedreno@lists.freedesktop.org>; Sat, 20 May 2023 12:19:59 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2af2b74d258so9221181fa.3
 for <freedreno@lists.freedesktop.org>; Sat, 20 May 2023 05:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684585197; x=1687177197;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=4I8zZOOwyp4NjNuH+/dpM0ZZysjD7tVsNkFj0zmZXZM=;
 b=nk4zdqKlFxX7F0KMhGeWcCgCaiSPfvMXn2tWuJHmBdosnNHZbBZ9w7313U+2xgaVXe
 hk4yOZkbE48J0s8soS1edkRzcMgCcefctWaAE/Cg4firg2ieDZAhOtwULLpifUGaZNSO
 jMddUbybCM9nsRkZreJD3mP4uOnrmfHFHHhuAl4Z0QWDGI+c+MAvjn1HGC4DoYKJx6v6
 3qHpZcfHN8ZOb/CuYgzX7/pHXkPMd//6lDfUi9T9z5LfUiVfR2BB6zuWZmyqI24AxWN9
 l+NHFFR1Xw2JvmHdT2kAuhlL3LkNUa0JVucIGvwAh6E/Pmcviusl2e+zMIxNf7Rffwv6
 OvuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684585197; x=1687177197;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4I8zZOOwyp4NjNuH+/dpM0ZZysjD7tVsNkFj0zmZXZM=;
 b=OJjYVdV0QNcp02Wy0cEWgjrOcCznYTtpCvjw0u9eoF2VLMCPGQv21CsTxMSdNumGnv
 KqSVQsy1PjhJrpBDzVUmy+aVxGMq2U/z9K7SzsmghSoMLxsGjGAIl2Vgy1RE8YtAhhdh
 VJED7iciAKPfCWll/y2ugQYccx9m0GDc/cmA46btm5174xA8j1gLVkjqgyjZpTGmKo+K
 A4SiHjrgDIxLDuaJ0gYj/I5wgmdEL9nlAH8+Ndo+srYuP/SQsMR6AyzbAoiQgLekeNh6
 BLPZeXdIfNv3wsOF/1Ypl9l/4cEBwPoXUZalDlrCQFoMy4qjKWNrPi4VxPB61TJYvLJr
 aM1g==
X-Gm-Message-State: AC+VfDx39USuMc8JfHoiqtRt5X68ILAUEtgi1gQF+pSWKEiHDAH6gZV5
 i7FumL0/I6395EzO72E8iO4rIA==
X-Google-Smtp-Source: ACHHUZ51hG+JmSsrNKuf5YXCX8jBRP5D3lSMeoSzgnSnTnMVPUBsthospWsP0TZi9BaoMuXcx6rKOw==
X-Received: by 2002:a05:6512:38d1:b0:4f2:5d38:2c37 with SMTP id
 p17-20020a05651238d100b004f25d382c37mr1944173lft.15.1684585197324; 
 Sat, 20 May 2023 05:19:57 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 y6-20020ac24466000000b004f37bd02a89sm244766lfl.287.2023.05.20.05.19.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 20 May 2023 05:19:57 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 20 May 2023 14:19:46 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v7-6-ecc7aab83556@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684585186; l=1359;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=WRWN4WVkGFPt0it/wZ2I1vdoI21A135Lfips/fNYpFI=;
 b=Gi0m2HFVbxwh+3WxAQQKWsZ2bEexESiQtZXHyoxAJ3J1fU/yWJAkWpWsg83RD5lkF4K7o63Ea
 Fvwnieq1qqRBXNOpOSPgP3knVhe2IViNm6pPCAsEsY/GxRxto59ttOr
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v7 06/18] drm/msm/a6xx: Improve
 a6xx_bus_clear_pending_transactions()
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

Unify the indentation and explain the cryptic 0xF value.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 9 +++++----
 1 file changed, 5 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 6bb4da70f6a6..e3ac3f045665 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1597,17 +1597,18 @@ static void a6xx_llc_slices_init(struct platform_device *pdev,
 		a6xx_gpu->llc_mmio = ERR_PTR(-EINVAL);
 }
 
-#define GBIF_CLIENT_HALT_MASK             BIT(0)
-#define GBIF_ARB_HALT_MASK                BIT(1)
+#define GBIF_CLIENT_HALT_MASK		BIT(0)
+#define GBIF_ARB_HALT_MASK		BIT(1)
+#define VBIF_XIN_HALT_CTRL0_MASK	GENMASK(3, 0)
 
 void a6xx_bus_clear_pending_transactions(struct adreno_gpu *adreno_gpu, bool gx_off)
 {
 	struct msm_gpu *gpu = &adreno_gpu->base;
 
 	if (!a6xx_has_gbif(adreno_gpu)) {
-		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0xf);
+		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, VBIF_XIN_HALT_CTRL0_MASK);
 		spin_until((gpu_read(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL1) &
-								0xf) == 0xf);
+				(VBIF_XIN_HALT_CTRL0_MASK)) == VBIF_XIN_HALT_CTRL0_MASK);
 		gpu_write(gpu, REG_A6XX_VBIF_XIN_HALT_CTRL0, 0);
 
 		return;

-- 
2.40.1

