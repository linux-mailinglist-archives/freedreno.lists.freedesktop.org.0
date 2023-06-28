Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BDB21741999
	for <lists+freedreno@lfdr.de>; Wed, 28 Jun 2023 22:36:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2C2CE10E3AF;
	Wed, 28 Jun 2023 20:36:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9DD0710E394
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jun 2023 20:35:46 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id
 2adb3069b0e04-4fb96e2b573so77782e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 28 Jun 2023 13:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687984545; x=1690576545;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=voWmkq5A/4H6lrc7bXc4yRtm7lr6RklCvSbF7Hr43HQ=;
 b=bvwPX9iP1u0B4dVVrwoOKjAjYT9LWVkOzmGvgfrcnHnX8XfIw1kbxsUXjuS4u3dNdt
 +nc29D4mb2pNHv519QJhDSkS79ZC15A9UVGqlWZ6lPIk/C5+kvdra+ikO9sZIFoLd7Xa
 bWN1SolzqXnjhKPtjqkVFBsvlchU2UIeGNF1HEbhbaMXyAhqi3K0tJW1Z31w2zVKbf7S
 g6B14ODlxsgbHZ4UPE4uQRKynZmFJMgtkOmYx4HDPWS1ZNRj2NIM0UJ2gH05d7DtYmGH
 rektJN9Ujyob5dY0eWrXdWl5asVDrnteqpv7zplar0cE0hF9PKVbLk1B2tF4w3gZ0Rpz
 f5jg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687984545; x=1690576545;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=voWmkq5A/4H6lrc7bXc4yRtm7lr6RklCvSbF7Hr43HQ=;
 b=TuoV62L21z82RJkOAnlsY+2dQ+E/uHQ1PxwYpF8U/W0jaHD+Dql0veQELqTXwNIfA8
 6mjnLmng6fQKbWTXGClqYUyxcywgPBhZX/fK8sdV/mmzXbHk0vZZQC3qqhPR7+4YmTTQ
 o6YHOeedFtT5i0urst8RAnBaWr1RP3n1jRe3lAW545vv25MBIUMiqNGtidpeYqqX8gwU
 Xzda2QbU3qK7INBQYZmLvS8cRkB1IrQ1Rv90fgqbitnyLgRBzFQa1ns8cNkw+ledBqcj
 PQMtpo9nBvaUiJgy0U1cVOQJ+haGhROBv4Cttv8mG3qWU1PdQfBaJkAubD0172xr1Fer
 fH9Q==
X-Gm-Message-State: AC+VfDwg2WTHDTwGVMng6TuY2kxzMcLO/Q2lujaCNIswR4HULTLPsx/S
 wrqvxoFE1N61E6prU/rX1MXWia56CiR+qZCiP9s=
X-Google-Smtp-Source: ACHHUZ7yYY5xB5BOCg57Wk9P4RZ0TASg4RnHuydH+NJKXLhpuzizJhVfp+DTy6qJqYFjwlPt095a1g==
X-Received: by 2002:a19:5e48:0:b0:4f6:29cf:c0dd with SMTP id
 z8-20020a195e48000000b004f629cfc0ddmr19592853lfi.8.1687984544935; 
 Wed, 28 Jun 2023 13:35:44 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a056512015900b004fb86c89fa1sm753363lfo.135.2023.06.28.13.35.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 28 Jun 2023 13:35:44 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 28 Jun 2023 22:35:13 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v1-13-a7f4496e0c12@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687984524; l=863;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=dEgcZTxCoSPqEO7GO/0ZL2tns6GDxdULpb4qFZADjmk=;
 b=/Mfvry5SQ0m/wK5vDp3W2W1GiurV0+qd9uxCmsN576pkyGMTxvesfqdFzY18kxMFp33X4ZnGe
 KT9o55q1KbuDNDwjmDjPN2PnwmAd933Lox8wZjXypTcxnhdXg3wqymD
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH 13/14] drm/msm/a6xx: Vastly increase HFI timeout
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

A7xx GMUs can be slow as molasses at times.
Increase the timeout to 1 second to match the vendor driver.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_hfi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
index cdb3f6e74d3e..e25ddb82a087 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_hfi.c
@@ -108,7 +108,7 @@ static int a6xx_hfi_wait_for_ack(struct a6xx_gmu *gmu, u32 id, u32 seqnum,
 
 	/* Wait for a response */
 	ret = gmu_poll_timeout(gmu, REG_A6XX_GMU_GMU2HOST_INTR_INFO, val,
-		val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 5000);
+		val & A6XX_GMU_GMU2HOST_INTR_INFO_MSGQ, 100, 1000000);
 
 	if (ret) {
 		DRM_DEV_ERROR(gmu->dev,

-- 
2.41.0

