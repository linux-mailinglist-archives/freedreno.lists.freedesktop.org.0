Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 70298741989
	for <lists+freedreno@lfdr.de>; Wed, 28 Jun 2023 22:35:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 406FD10E068;
	Wed, 28 Jun 2023 20:35:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8614210E39A
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jun 2023 20:35:37 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b6a0e36d42so18172161fa.0
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jun 2023 13:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687984535; x=1690576535;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=DkM6eACK+l7KK09aC4iRvpEN0T6pFUWvLy8n57wVeSY=;
 b=Wk87rACLpnAT+qXyvw65l5SaJkF7pt8Q2vfYNiidfMn/ez+0hqT4ECXI4GXSY4YEzn
 pbIus18/SVFGIoizV7WukfwTK+rZcf+IO9dGfzl/ajO2NyB9m8Vcced6Yyuk9/CRU2hz
 9DYQEgsFIMKEFGvkvQfu9PMYu8+97CuRODHAYACzu/Xai9W1EAuw/yRuWTUrf92a7QfE
 bsOxTFamvXGjBPKiamdrrv76NFLZvEfyZ7/67o+JBPu8KfvrpKZjy6nsD1oCV6nDc6cG
 W7ZgZum4RcrCCK1NQuRUTq0LY+AM0Gx1GR/zEPDWffQwXI5T1jizrUjMGEV/HC3kHsPy
 sYOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687984535; x=1690576535;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DkM6eACK+l7KK09aC4iRvpEN0T6pFUWvLy8n57wVeSY=;
 b=PMMjaD1wKdmn1i0Cx+Tsit+WbB6oUdBJJh8xfHvr1M9mhb+srMN7O4Xa26IxOyx02D
 pXDm1QnM+X7w4qSzckvDeafpFzsmk4sL5utruoFl4+jNtrvgcjTh4ttK11MqHWE8ehyx
 QoYIOJtczSkgS/80fIJ2uSCJ0YRgkWLtRCFR5zWlE9hQiaXx3v9V1BhqR1N+f98GeU23
 7t9LDN6ktJuGEMCAPs//hD9BfIT0fmbp+a6FCVYabom28CaL4W14jcscJ704S8DwkzAi
 MwUC5MYs4gEI6fd8Za5NHaFnU3xT0venyy1ZzqfMntH22pZ4eDcnnMPhF3Oq7knkv38H
 KL1w==
X-Gm-Message-State: AC+VfDxdNBZ32KK7+pGM84VzQhhVvjSr0qE4CGNufDLDsxUiMp07xGi4
 uZpjL11uroxl7x04WvyPlblAVg==
X-Google-Smtp-Source: ACHHUZ5yuPrDceywU3WbC6OFqainhsthjjiGoMq5J/QDVEMJF3IKLcjx+7vdLigOv6OeD1rpweVziQ==
X-Received: by 2002:a05:6512:239a:b0:4f8:6ac4:1aa9 with SMTP id
 c26-20020a056512239a00b004f86ac41aa9mr1045562lfv.21.1687984535651; 
 Wed, 28 Jun 2023 13:35:35 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a056512015900b004fb86c89fa1sm753363lfo.135.2023.06.28.13.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 13:35:35 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 28 Jun 2023 22:35:07 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v1-7-a7f4496e0c12@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v1-0-a7f4496e0c12@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687984524; l=937;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=9J73aF30PI34nc92bobMmRBFeW3h6sk6+9cqWlv0aIs=;
 b=zmnxv1qkjjq2p1yEjeUi56tWX0E0Ek0pCy6wtN2JzIoG/ilSwtPl8RZ6guWx36wWuEwoXknCU
 FGScjwrujijAbVyqz0v4cw90pj4jSl6z7zz5YuNJkRicoA68Kcs0n7N
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH 07/14] drm/msm/a6xx: Bail out early if setting
 GPU OOB fails
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

If the GMU can't guarantee the required resources are up, trying to
bring up the GPU is a lost cause. Return early if setting GPU OOB
fails.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c1c76fe288b2..7c8345ae1a30 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1201,7 +1201,9 @@ static int hw_init(struct msm_gpu *gpu)
 
 	if (!adreno_has_gmu_wrapper(adreno_gpu)) {
 		/* Make sure the GMU keeps the GPU on while we set it up */
-		a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
+		ret = a6xx_gmu_set_oob(&a6xx_gpu->gmu, GMU_OOB_GPU_SET);
+		if (ret)
+			return ret;
 	}
 
 	/* Clear GBIF halt in case GX domain was not collapsed */

-- 
2.41.0

