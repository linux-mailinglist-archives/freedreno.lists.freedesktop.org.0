Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D8C4973233C
	for <lists+freedreno@lfdr.de>; Fri, 16 Jun 2023 01:21:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 83C9B10E572;
	Thu, 15 Jun 2023 23:21:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BD57F10E571
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jun 2023 23:21:27 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4f76a0a19d4so3316101e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jun 2023 16:21:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1686871286; x=1689463286;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=BuB9Tj3lhLuLPP+OSus2KoxyF5MNAI7rxRyrL+OaBKk=;
 b=GDx3/ylhlFGa+u4e1N3K/H12cWZd+STzURGDfpkc6kaomxVp4hEY+L/MuM3/S7+4jR
 a5H/GootRG2UGQ/8SqE8aETxYZWmQ4ylO1fp2MLlkHu0UTF/RNcSHlTzTtAoSCZG3172
 Gj3SOfT9AX9nGPl1/eoufZfvQzsE+LB4dm7hf4bjk6upU+GnVnTUrdWTkiihBubFcoyE
 qFPXjqf7bXkf00jx6hf27nZ5WdIEQHJdRBRxig/iFiLW/IGH1YTYpQVCSXoLtV+5sH0U
 8zI665p+7BHWqa0hdqY1NpURj9oK+bPMZdts8jXuURgLQxkO7xmgC/rk2eSbtmgugpzp
 zJ6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1686871286; x=1689463286;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=BuB9Tj3lhLuLPP+OSus2KoxyF5MNAI7rxRyrL+OaBKk=;
 b=DO43W5JlUnyjzOq+6vyBe6G9HZcGaoSWynFDJ4zuGR1YgDQRtABCAkHv7oStJ+WI0o
 CBWytx/sigX6a3z3ejmW0rsouYtpAPHdVyHpY+CS2BVgyv1+ukrHHsbcbRulbGU0Q8ZL
 oGl+3HfB4v2OHpn7jtcYPi0/TVkmHAUYZCM6vCOgSVz9HgldVVRg6+j3+3STaIkBI8sU
 X/qxBS3vCR6kHD1tbLGxm2gMdkqTfomJX6ZvM2be0fhFEaJFNMPE5TBIZAzSY4JAUobt
 pqtvZtNon3eC22N385866PixZj7am0rVWyc/WciXugwJyyLl0Ffsl5pvw08y+3wI2RsS
 U5CQ==
X-Gm-Message-State: AC+VfDyqoBr0bBJN8h6LpqWnQ0Yx8wPeN7Hnn6A4NeBbvQ9uXwU6L52W
 bSUW/jDOR9XNQCTXIir2VaGKig==
X-Google-Smtp-Source: ACHHUZ6qqy7E6+dgcsRnv7PEHpaoEppzdnx/yQvZi5dMEO8auG//UfDcm1ESF0ZrJklWWvabJvsqXg==
X-Received: by 2002:a19:6446:0:b0:4e9:bafc:88d0 with SMTP id
 b6-20020a196446000000b004e9bafc88d0mr89551lfj.23.1686871286122; 
 Thu, 15 Jun 2023 16:21:26 -0700 (PDT)
Received: from [192.168.1.101] (abyj190.neoplus.adsl.tpnet.pl. [83.9.29.190])
 by smtp.gmail.com with ESMTPSA id
 u25-20020a056512041900b004f24ee39661sm2744852lfk.137.2023.06.15.16.21.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jun 2023 16:21:25 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 16 Jun 2023 01:20:46 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v9-5-890d8f470c8b@linaro.org>
References: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v9-0-890d8f470c8b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1686871276; l=2130;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=9KH8lCaBgwLdxlAk0sWl81+4/n3YOG4pQpo7CFNSD30=;
 b=9I90MQDfdyQD1tgytuAf4T635fSPxOaRHR0iUUkSaqqzxaiqMM/ikfVBEXm8Z/0e5DP5NI2Uv
 ng1kN10ljNYBrzxRTEqkpvE2NsWqcNDJU79yMENtfElLz6VGwn47jr6
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v9 05/20] drm/msm/a6xx: Move force keepalive
 vote removal to a6xx_gmu_force_off()
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

As pointed out by Akhil during the review process of GMU wrapper
introduction [1], it makes sense to move this write into the function
that's responsible for forcibly shutting the GMU off.

It is also very convenient to move this to GMU-specific code, so that
it does not have to be guarded by an if-condition to avoid calling it
on GMU wrapper targets.

Move the write to the aforementioned a6xx_gmu_force_off() to achieve
that. No effective functional change.

[1] https://lore.kernel.org/linux-arm-msm/20230501194022.GA18382@akhilpo-linux.qualcomm.com/

Reviewed-by: Akhil P Oommen <quic_akhilpo@quicinc.com>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 6 ++++++
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 ------
 2 files changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index a6fa273d700e..32852c161aab 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -912,6 +912,12 @@ static void a6xx_gmu_force_off(struct a6xx_gmu *gmu)
 	struct adreno_gpu *adreno_gpu = &a6xx_gpu->base;
 	struct msm_gpu *gpu = &adreno_gpu->base;
 
+	/*
+	 * Turn off keep alive that might have been enabled by the hang
+	 * interrupt
+	 */
+	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
+
 	/* Flush all the queues */
 	a6xx_hfi_stop(gmu);
 
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index ab5c446e4409..eebb4bc7c0f9 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1382,12 +1382,6 @@ static void a6xx_recover(struct msm_gpu *gpu)
 	/* Halt SQE first */
 	gpu_write(gpu, REG_A6XX_CP_SQE_CNTL, 3);
 
-	/*
-	 * Turn off keep alive that might have been enabled by the hang
-	 * interrupt
-	 */
-	gmu_write(&a6xx_gpu->gmu, REG_A6XX_GMU_GMU_PWR_COL_KEEPALIVE, 0);
-
 	pm_runtime_dont_use_autosuspend(&gpu->pdev->dev);
 
 	/* active_submit won't change until we make a submission */

-- 
2.41.0

