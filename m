Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A3288789031
	for <lists+freedreno@lfdr.de>; Fri, 25 Aug 2023 23:11:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E220910E182;
	Fri, 25 Aug 2023 21:11:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76A8E10E182
 for <freedreno@lists.freedesktop.org>; Fri, 25 Aug 2023 21:11:23 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-4fe1b00fce2so2081706e87.3
 for <freedreno@lists.freedesktop.org>; Fri, 25 Aug 2023 14:11:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1692997881; x=1693602681;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=kya4VCOyGVlh2JiHxWE9QAp8dwJuU5ZWnBug4TSNcmc=;
 b=rUshhZIsDiBo7WCfwqNHWQsr1qW1f+nm7pBGYXNACMHqnRCANX6kz9d/0PDcrGwBBh
 HaTa+xgMW0xEMMcNCcly+PlLMX/GUkfDn+dQ4+NIclI765ieTygGxQDoN9vwNeaay8sT
 g8ZC5Dh4C7YHMv8AwjM31Viq4x0dnu2ICZkvvIljkteBcJwlHGdrNW31R7vC9dLVEeW5
 2EMxPASS96KLCda+WjGTkSIxaGR1RjjMG4XpL0g6ZG0qObCKr7vfJRH5ON+zPSOQBNoC
 4vVWcpWflHap26Nw8FIR5FOzfYLHdA7Bru+HpZINh4xTPWKuwadBZPhgJpZtIfz1P4e+
 M2DQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1692997881; x=1693602681;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=kya4VCOyGVlh2JiHxWE9QAp8dwJuU5ZWnBug4TSNcmc=;
 b=FMCqEdTMo3aQ+OzJjhtJEuL87Il7g1sQ4+OtjXTgeYU/4zCyyIPl3UHXKWWO45SG5t
 M2Do96w+LnxJUOrh+tf2IdHvn6WbtSGBhfLBCw81REhIzWuD3LD5knr3NGyAXvly9k7c
 yNFsuV7ZUqPVtGqZeUKHXYKz9PEvJafpL09yIxTt+3OmcSPBtaT+r0UVouwLGzvpY4jG
 zCMxotEDW7ckoCHHGDEcdrldZPViwZ0z3XPiefrG06dcEu41rkjnh6Y0Uefs/OAYVzbU
 JUqRcHTUoHWdxgUq8h+wCJgHcFNSaFRetXHa0dHhlq81a4q1Oz6oxEKKDMLaxYxpcYTw
 0tow==
X-Gm-Message-State: AOJu0Yw03enB7YRDWXNOYmPMOJxh8ToyK3fHhyLKpEmIWsyk4cWsz7aA
 vyP1xn0/D/ngCVrHlNC7KXXPaA==
X-Google-Smtp-Source: AGHT+IFCHIc2JcxoyfDle7JrH6QpkCqTl6D+tQn/CBxZH9wBJ8SwrNvY6pRv0pSZWS3KOnX9Yjq7lg==
X-Received: by 2002:a05:6512:2395:b0:4fb:73ce:8e7d with SMTP id
 c21-20020a056512239500b004fb73ce8e7dmr18072250lfv.15.1692997881664; 
 Fri, 25 Aug 2023 14:11:21 -0700 (PDT)
Received: from [192.168.1.101] (abxh59.neoplus.adsl.tpnet.pl. [83.9.1.59])
 by smtp.gmail.com with ESMTPSA id
 a9-20020ac25209000000b004fba077e654sm419947lfl.194.2023.08.25.14.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 25 Aug 2023 14:11:21 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 25 Aug 2023 23:11:19 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230825-topic-6375_gpu_id-v1-1-e24f46d7f139@linaro.org>
X-B4-Tracking: v=1; b=H4sIAPYY6WQC/x2NQQqDMBAAvyJ7dsFEo61fKUWSuOqCxJDUIoh/d
 /E4A8OckCkxZeiLExL9OfMWBFRZgF9smAl5FAZd6bp6aYO/LbLHtu7MMMd94BH9pMy7Je1U04F
 0zmZCl2zwi5RhX1eRMdHExzP6fK/rBtiaTD54AAAA
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1692997880; l=998;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=a6ePufxP5h1WTj5TbQcKiSyADMI68Z8zNnOB43e2WE0=;
 b=dwUoiS3miQJ8RFJu8BQ2LZjqZuPBTyXEv3x93TNYv38hpwzXFKGCWybgzrkRoG11fbheSogbw
 c23YzyPOeqsBUEECLSnh3lRscEBvWd0Yhh9fjcapUO0IcoJNkEaIQuO
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH] drm/msm/adreno: Fix SM6375 GPU ID
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
Cc: Rob Clark <robdclark@chromium.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

SM6375 comes with a patchlevel=1. Fix the chipid up to reflect that.

Fixes: 90b593ce1c9e ("drm/msm/adreno: Switch to chip-id for identifying GPU")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 575e7c56219f..f2d9d34ed50f 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -331,7 +331,7 @@ static const struct adreno_info gpulist[] = {
 		),
 	}, {
 		.machine = "qcom,sm6375",
-		.chip_ids = ADRENO_CHIP_IDS(0x06010900),
+		.chip_ids = ADRENO_CHIP_IDS(0x06010901),
 		.family = ADRENO_6XX_GEN1,
 		.revn = 619,
 		.fw = {

---
base-commit: 6269320850097903b30be8f07a5c61d9f7592393
change-id: 20230825-topic-6375_gpu_id-cf1596e2b147

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

