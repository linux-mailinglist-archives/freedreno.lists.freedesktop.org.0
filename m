Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D0863696B8A
	for <lists+freedreno@lfdr.de>; Tue, 14 Feb 2023 18:32:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9ADAB10E0ED;
	Tue, 14 Feb 2023 17:32:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 969B710E0ED
 for <freedreno@lists.freedesktop.org>; Tue, 14 Feb 2023 17:31:59 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id bt8so12676658edb.12
 for <freedreno@lists.freedesktop.org>; Tue, 14 Feb 2023 09:31:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NtwSHEkotufMeTG5DbRKqbem2u4ITIQrgm1+z8QXytg=;
 b=dudwPRcx9NWJxqh2WdbBeETUJCwf5veKvmG4eZVchC9vAVm37Ifs7wbC5kEH1f5aWJ
 8Ai2vSiSqC3wlxDmJB9k155jsoaUX/c3jfT+LnFoegMR73rY05zHBC5/+z8kv+NJWJ+C
 G36TY/dqZ5ze55PSyvYQBPyaPqZxTEcd4degUgHLhl4oFGZ2W76x47HN0GTCga+GJdPT
 2ZFFA96BDrvB2VCI2Qt55oA2DXBBBJxn2NCedmKFpSwY3zV2V3rVaAjphoZkDaWUuoar
 k/ajkp1xaU8sjjmS6n5CK6BdWpEFJSs0+QL/j9qPKAwaW1kaYyNcGCcMkmofvyw/rIvW
 yJ8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NtwSHEkotufMeTG5DbRKqbem2u4ITIQrgm1+z8QXytg=;
 b=sD2QGQis1Zltf4hq19Ec/OQkx0AY29LoTdAyxgVECGwLoD0kBawyhYkw4W3R8NZwz2
 Gp2p4yLxlvKPakEHYSAiMY6adLBGXFiPpKknjrMvBaSUsEXVlplS9tBCLjPq4a28cbu7
 jB+KZbXtfXUYPKX7JPpmNOPCoyWLbCx/VonYZe8qNF/oB71LXAIGuepeEZWBEczVMaxg
 XPlsr5JqrZi5bYPimT9Fxsq64L0FPAtLaSgSjJBM+O5QOElNuYqtZw7c+9Vv4vr/zLBG
 qvkyRSzQgP5eZwHdGnLxgP6+meuFciFu5XescEJWxlfNNgXqYNyFxAJxnfMg6aT+34uK
 nysw==
X-Gm-Message-State: AO0yUKX8T4tVlhl+oMdKiJDU6tcnPi1pX3YzMWJF3VK1oNiy6C7tB7+u
 ZxKgOSlcSDXJrxjrNdd38wukUg==
X-Google-Smtp-Source: AK7set/+N7w1aYgI3Wl60vD5XAtpbT/GpSI4RIgCIKOAmMKYpmjMPrAUH20T6uuXF7ivxMar4Q7nNA==
X-Received: by 2002:a50:d694:0:b0:4ac:b858:37b1 with SMTP id
 r20-20020a50d694000000b004acb85837b1mr3740065edi.7.1676395917889; 
 Tue, 14 Feb 2023 09:31:57 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 w8-20020a50c448000000b0049668426aa6sm8325787edf.24.2023.02.14.09.31.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 14 Feb 2023 09:31:57 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	agross@kernel.org
Date: Tue, 14 Feb 2023 18:31:33 +0100
Message-Id: <20230214173145.2482651-3-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
References: <20230214173145.2482651-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 02/14] drm/msm/a6xx: Extend UBWC config
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 David Airlie <airlied@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, Chia-I Wu <olvaffe@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Port setting min_access_length, ubwc_mode and upper_bit from downstream.
Values were validated using downstream device trees for SM8[123]50 and
left default (as per downstream) elsewhere.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 29 +++++++++++++++++++--------
 1 file changed, 21 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c5f5d0bb3fdc..8855d798bbb3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -786,17 +786,25 @@ static void a6xx_set_cp_protect(struct msm_gpu *gpu)
 static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 {
 	struct adreno_gpu *adreno_gpu = to_adreno_gpu(gpu);
-	u32 lower_bit = 2;
+	u32 lower_bit = 1;
+	u32 upper_bit = 0;
 	u32 amsbc = 0;
 	u32 rgb565_predicator = 0;
 	u32 uavflagprd_inv = 0;
+	u32 min_acc_len = 0;
+	u32 ubwc_mode = 0;
 
 	/* a618 is using the hw default values */
 	if (adreno_is_a618(adreno_gpu))
 		return;
 
-	if (adreno_is_a640_family(adreno_gpu))
+	if (adreno_is_a630(adreno_gpu))
+		lower_bit = 2;
+
+	if (adreno_is_a640_family(adreno_gpu)) {
 		amsbc = 1;
+		lower_bit = 2;
+	}
 
 	if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu)) {
 		/* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
@@ -807,18 +815,23 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
 	}
 
 	if (adreno_is_7c3(adreno_gpu)) {
-		lower_bit = 1;
 		amsbc = 1;
 		rgb565_predicator = 1;
 		uavflagprd_inv = 2;
 	}
 
 	gpu_write(gpu, REG_A6XX_RB_NC_MODE_CNTL,
-		rgb565_predicator << 11 | amsbc << 4 | lower_bit << 1);
-	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, lower_bit << 1);
-	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL,
-		uavflagprd_inv << 4 | lower_bit << 1);
-	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, lower_bit << 21);
+		  rgb565_predicator << 11 | upper_bit << 10 | amsbc << 4 |
+		  min_acc_len << 3 | lower_bit << 1 | ubwc_mode);
+
+	gpu_write(gpu, REG_A6XX_TPL1_NC_MODE_CNTL, upper_bit << 4 |
+		  min_acc_len << 3 | lower_bit << 1 | ubwc_mode);
+
+	gpu_write(gpu, REG_A6XX_SP_NC_MODE_CNTL, upper_bit << 10 |
+		  uavflagprd_inv << 4 | min_acc_len << 3 |
+		  lower_bit << 1 | ubwc_mode);
+
+	gpu_write(gpu, REG_A6XX_UCHE_MODE_CNTL, min_acc_len << 23 | lower_bit << 21);
 }
 
 static int a6xx_cp_init(struct msm_gpu *gpu)
-- 
2.39.1

