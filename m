Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EBDDA735C4D
	for <lists+freedreno@lfdr.de>; Mon, 19 Jun 2023 18:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6D7210E22E;
	Mon, 19 Jun 2023 16:44:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72CD010E226
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jun 2023 16:44:32 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f76a0a19d4so4725680e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jun 2023 09:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687193070; x=1689785070;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=pwTI7UHTcKqCvzBNFhABN4+E8WkvXM5Y1T6fiTPNJV4=;
 b=uWDRPGlkpBeSI/LuJhTMqC5Wp8EXBY00FHSn2a24QSiOQoPU8ZnRorKuroEvCfkisY
 qWglo6EE2TJmz74pSs/ARvKryOuN8tpbcJy80admJkQHB6332oLgu5DbFsqTT8vZTbzO
 F0JQxiqRYe1B/sxTSwjZnXyA0JzISYja8qI1LRwXOvdIYx960lThXyAP/tr+bN72pnbA
 TA1GxSwLily75nHtK/oLVzhdKQIXsbksz6rMOHHy9fDDo/p71xuhPsDcJ4ZWY8RP61HO
 mzWnR/qExMY8g96Nd/G/7dmLM0qr/WFvKjn24Tp73ZKisN8is//SseIooGRyco2k0znB
 MLtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687193070; x=1689785070;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=pwTI7UHTcKqCvzBNFhABN4+E8WkvXM5Y1T6fiTPNJV4=;
 b=cgce9DeRPrxCq2jnOTl4lK9gdc5jhMU1hvlGKGxCuyGhepbvwxiMQYvwZ+14uNujlQ
 ez5j+K/l4FInGiPnIZ8T7Vj0veyeEu2dmRhsa916hgWB8kGdyETJywHGzjUp9uL/Qm6y
 ZUb1Q/DRW2g9tOGGF3AnNnfHIprCCANu0/YlFoOoFyfzdPGNSJjT580pA2sGLfn+Fd+3
 sqWTBJ3KTED4Ni5MNba1En1cipK20PsNVJ1ZZdgZkIvllJqoaAhQk7t37bzuak+4QD+P
 gisLx47oQWAsqQKTLtmHYp8Q+Nglh7G68IftMulWRA6NliRRWB9f3se+5PZCiAxdTdGk
 Js4Q==
X-Gm-Message-State: AC+VfDyO2fZMapF1FkI8+4dlvL3JG8gfcwyCteGTS/KeDrEcZG/RTWSD
 x7I/sBTTyGB5/5mq5+S+YhWA6Q==
X-Google-Smtp-Source: ACHHUZ7SRbzXFs0RGMnWFB2M1GxJlqWegDELs/Dq5WMZwUldNGIIGp5oDE4bf4UMQtMh1o/PIwi8nA==
X-Received: by 2002:a19:9209:0:b0:4f8:6fe9:3c9c with SMTP id
 u9-20020a199209000000b004f86fe93c9cmr2010394lfd.49.1687193070620; 
 Mon, 19 Jun 2023 09:44:30 -0700 (PDT)
Received: from [192.168.1.101] (abyl242.neoplus.adsl.tpnet.pl. [83.9.31.242])
 by smtp.gmail.com with ESMTPSA id
 d9-20020ac24c89000000b004f849605be7sm1774293lfl.292.2023.06.19.09.44.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 09:44:30 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 19 Jun 2023 18:44:26 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-topic-a7xx_prep-v3-6-a3ce3725385b@linaro.org>
References: <20230517-topic-a7xx_prep-v3-0-a3ce3725385b@linaro.org>
In-Reply-To: <20230517-topic-a7xx_prep-v3-0-a3ce3725385b@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687193061; l=1342;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=yg0CsUYst1MC0yCvcYjryDQIsWMdtt76iHZrZNL17WI=;
 b=FknMc43zmZwkUD5y3nuDtPowX+jeCuLzVQmv1m9TogJq9v7mkOYVQ635wLUZM4nLlk2KbeTs6
 AGZUKNJMwB2AHrgQwtbdu4Lzhm1KoBpZLUs9z8Px3BMlBD5HzvZt6f4
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v3 6/6] drm/msm/a6xx: Fix up GMU region
 reservations
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
Cc: Jonathan Marek <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Change the order of region allocations to make the addresses match
downstream. This shouldn't matter very much, but helps eliminate one
more difference when comparing register accesses.

Also, make the log region 16K long. That's what it is, unconditionally
on A6xx and A7xx.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index 55b12a8066ee..d682c1ed48db 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1640,13 +1640,13 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
 			goto err_memory;
 	}
 
-	/* Allocate memory for for the HFI queues */
-	ret = a6xx_gmu_memory_alloc(gmu, &gmu->hfi, SZ_16K, 0, "hfi");
+	/* Allocate memory for the GMU log region */
+	ret = a6xx_gmu_memory_alloc(gmu, &gmu->log, SZ_16K, 0, "log");
 	if (ret)
 		goto err_memory;
 
-	/* Allocate memory for the GMU log region */
-	ret = a6xx_gmu_memory_alloc(gmu, &gmu->log, SZ_4K, 0, "log");
+	/* Allocate memory for for the HFI queues */
+	ret = a6xx_gmu_memory_alloc(gmu, &gmu->hfi, SZ_16K, 0, "hfi");
 	if (ret)
 		goto err_memory;
 

-- 
2.41.0

