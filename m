Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F0A89774C1F
	for <lists+freedreno@lfdr.de>; Tue,  8 Aug 2023 23:03:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5142610E209;
	Tue,  8 Aug 2023 21:03:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 431AE10E21D
 for <freedreno@lists.freedesktop.org>; Tue,  8 Aug 2023 21:03:02 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id
 38308e7fff4ca-2b9c66e2e36so3101851fa.1
 for <freedreno@lists.freedesktop.org>; Tue, 08 Aug 2023 14:03:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1691528580; x=1692133380;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=vyXbhGhn18q2epfu4SWH/aQDrzkgDXaFIhnNbGtGC7U=;
 b=VujgEBjwyScdy4krYp0PsisUqplwWaZEowKlMh+MXClybDubRW1i0x4zIXf+cBxDC8
 DwOo9NWhfAObZdHzDVck9UugL8XOeJkkWzMGhGpk0cQTs605Ww9IhwQjL/xtDd6dxa5k
 y8BfiC2JqDSi1HnrcRRVR9XjKIpUTJb4/wl6ONuWTKDqfAA3WNVRt+iFBLtTJf992jk+
 XTOxtJvZuyVsTc4/8IvcLtOTdiq54fgYZaK2QCLbMZskAoE5V4vY3Tr+hC1g8DjEkuIX
 0M5cQ/tXZgQYD7nC39CcNZN+Mw6Cx90Njg43yHRNmV1918sPXf3M80BbtYb0PNSprQww
 DoFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1691528580; x=1692133380;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=vyXbhGhn18q2epfu4SWH/aQDrzkgDXaFIhnNbGtGC7U=;
 b=J06BrE2bjDVpl0/u1XWRFvuxRzsanqBgwgMfShIadOOn5LKltBIxfMwhAfKunmvPj7
 ZpIWPPFw3oMB+x4Rt8XQoSwdn3du+7YYpj6LoJOTXswjQ1BJ/mfMh+abkppAXSTRY6XP
 hOJ9npap37IwiQK7q2fsa1qRp+qV0ry6ocpWK4bdR+w0+8ZOSXINdW+QJ98JyQpwVtVe
 0Ez4CT/xTC3fzn0pX5IToVy+gho1DFahHcCC1Hc77QRx+mow7NbbxCI63GsJ+LjaxP4r
 i9NQKIAC3cAS2KYLFAFa+B9XVkay5J7BLVlp1lnb40+4eV9DG4ZTO8ryzzWy6d1gLTIM
 vQgg==
X-Gm-Message-State: AOJu0YygnSpp3X2fS/5sFg0l1cqd3MdKR6PuroDFCrHuKF2TzwWfqfzT
 HHENQFcivO5D2xUScwWD64DGZQ==
X-Google-Smtp-Source: AGHT+IHoV1oF15QkBUldmZLMCtLPoUuJyJYtuXzGep5+KTw10AGDZo6lCAtzJhHf8ovdFAPWY8uLkQ==
X-Received: by 2002:a2e:b547:0:b0:2b9:d965:fbf2 with SMTP id
 a7-20020a2eb547000000b002b9d965fbf2mr3284565ljn.22.1691528580533; 
 Tue, 08 Aug 2023 14:03:00 -0700 (PDT)
Received: from [192.168.1.101] (abxi185.neoplus.adsl.tpnet.pl. [83.9.2.185])
 by smtp.gmail.com with ESMTPSA id
 h11-20020a2eb0eb000000b002b6cc17add3sm2431483ljl.25.2023.08.08.14.02.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 08 Aug 2023 14:03:00 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 08 Aug 2023 23:02:45 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230628-topic-a7xx_drmmsm-v2-7-1439e1b2343f@linaro.org>
References: <20230628-topic-a7xx_drmmsm-v2-0-1439e1b2343f@linaro.org>
In-Reply-To: <20230628-topic-a7xx_drmmsm-v2-0-1439e1b2343f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1691528566; l=1076;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=eKaMrn2nEo1t9dG12+njAKjMPE3YGEK2vLhd6tZW2mA=;
 b=oYA7dxokB+2a54oH9Jf1VwY7xcZib3TY3MJ+n+qR5kxnmlSD/8n7GK/svGTU/OhFgcpD4UtZI
 we5G825DbTbCz3tmp2CUl7JV8Ercmly2mfEsQvY2f/8YthWHWlFypQk
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v2 07/14] drm/msm/a6xx: Bail out early if
 setting GPU OOB fails
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

If the GMU can't guarantee the required resources are up, trying to
bring up the GPU is a lost cause. Return early if setting GPU OOB
fails.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Tested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org> # sm8450
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 6dd6d72bcd86..d4e85e24002f 100644
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

