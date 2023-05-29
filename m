Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 93FE0714AD7
	for <lists+freedreno@lfdr.de>; Mon, 29 May 2023 15:52:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 032EB10E2AB;
	Mon, 29 May 2023 13:52:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E2B510E2AE
 for <freedreno@lists.freedesktop.org>; Mon, 29 May 2023 13:52:47 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4f505aace48so685049e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 29 May 2023 06:52:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685368366; x=1687960366;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=X0LrHIoKMzpMSQj7S94ysxSa7kN4w0dJYmcCGd0sdww=;
 b=hnuJWAIwsEFc7/YYazlsDTw8xEguC4sKCwdzkX3AA99I6ocdoXqokdoYbP2tZzIgeT
 PBYv318NxcVlsIiRmoEKgenazmmLK0BayPCbuebaIs3VGp0bEd+NWLY4E3iHwJEQgb4B
 I9+1Z7cSowxPtha8RXsSDNyLdIVd3qmtcit4qqNKxpFwFt4D58ByfgbDdmjCYomzA9KJ
 FZZW2lh+1xA2V4ueX/WdDLig/rOKulre8i8lrl+IxGbJc47SKmkrcu9YIHPeFmmo25mf
 FR44e5Vc9L7KtZsKW1PvR7pMPMl5qwtfawnM9su8o7nK9KywQ5GlG7ytMSZYDo9Kmiiv
 wtfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685368366; x=1687960366;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=X0LrHIoKMzpMSQj7S94ysxSa7kN4w0dJYmcCGd0sdww=;
 b=RdjmQB12lZE0d6GGp4tsa+1n7acJzNGW3NxBDb+t7C14uNXdpWi7/o0brpIEJINuXW
 Em/DJddP8XFiaIWuQiKDgdjTJr2I1B8yfxsaj38BAI4KWGpfPfciYpYMXvI9IIMLCcfV
 tr4bhAyzmQvwyzI8yeK3+cKR2SbXx4vgFHY4VuwaKRjEfSWtQUF8UCG3bBQhCBXv3p/f
 U0cggBgozaRGUsnJvy/uu3ShyUyOPhnhnJsJC3tkw39VS2lwsjOAF4OdXSzHCZEIxKOw
 kzCv5DDrdhN9l9ssNteoY+/QBpdZ1YBbRABqVqPespOwayIkRUdGJNF8ywPgGB40CzbL
 YPXA==
X-Gm-Message-State: AC+VfDxdfJxm4eZtoFw3jhtY9VLd55l2f7qOdCHtQfwljdDrBbkSWB2X
 Z/sHsaCAwI4oKsMRNtcUFsYYCg==
X-Google-Smtp-Source: ACHHUZ5exnJXX1LXjlZtk0l0vmA9ygM6CcJE4FFpnnIm1x+2dMBQtIhRP5pJHWpYe2wyW7MFSpGq4w==
X-Received: by 2002:a19:f719:0:b0:4ef:ec6a:198c with SMTP id
 z25-20020a19f719000000b004efec6a198cmr3110552lfe.26.1685368365835; 
 Mon, 29 May 2023 06:52:45 -0700 (PDT)
Received: from [192.168.1.101] (abyj77.neoplus.adsl.tpnet.pl. [83.9.29.77])
 by smtp.gmail.com with ESMTPSA id
 c16-20020ac25310000000b004f2532cfbc1sm4700lfh.81.2023.05.29.06.52.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 29 May 2023 06:52:45 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 29 May 2023 15:52:33 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v8-14-69c68206609e@linaro.org>
References: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v8-0-69c68206609e@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1685368343; l=1537;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Y8lqQEXvfobjnxymY2ZJobXRHcQDq3saaResmTzrax8=;
 b=0l/msX5u1fAAB673veV9WhNa4MyJFgZY6bsag3fnS7Fm/CnUW1L2vIG2JTbgaW4yY9HZjwMuX
 nu7LjYRRRUqDMwPrsLqOl4IXGxUyjAD45jIblCiAtXZTdtePHkgY++d
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v8 14/18] drm/msm/a6xx: Fix some A619 tunables
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

Adreno 619 expects some tunables to be set differently. Make up for it.

Fixes: b7616b5c69e6 ("drm/msm/adreno: Add A619 support")
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c0d5973320d9..1a29e7dd9975 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1198,6 +1198,8 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
 	else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
+	else if (adreno_is_a619(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00018000);
 	else if (adreno_is_a610(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00080000);
 	else
@@ -1215,7 +1217,9 @@ static int hw_init(struct msm_gpu *gpu)
 	a6xx_set_ubwc_config(gpu);
 
 	/* Enable fault detection */
-	if (adreno_is_a610(adreno_gpu))
+	if (adreno_is_a619(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3fffff);
+	else if (adreno_is_a610(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3ffff);
 	else
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x1fffff);

-- 
2.40.1

