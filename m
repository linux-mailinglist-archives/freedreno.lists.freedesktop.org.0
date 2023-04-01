Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CE1F46D307B
	for <lists+freedreno@lfdr.de>; Sat,  1 Apr 2023 13:55:57 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C6B9C89135;
	Sat,  1 Apr 2023 11:55:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 459F510E24F
 for <freedreno@lists.freedesktop.org>; Sat,  1 Apr 2023 11:55:09 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id c9so21809359lfb.1
 for <freedreno@lists.freedesktop.org>; Sat, 01 Apr 2023 04:55:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680350109;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TqvvserEEXfM7bfoSIgCSJ4UIeQQqPEniXobIbd6OmA=;
 b=MfjdIHHRqsbWEVlfHK0yGymcYsI7duJyM63jJzDNNQPTU0pcfN9iep6PvHm3ABq5dj
 F/dtRF4FNAA086+KXdcWwmyDia1xv8k+i+kr2LOmzkTMltgWxJJcUedkQApqV1qh27R7
 X2/8+VksnkZ2CuSP+WPcBRMwX0Wsh54fhS/j30VEZwJf2UQI6Z5HCi8JEHZ7NJ74s2VH
 w7m6t20chxaDnJhIptbRR8sc5YK9KdXqiZl0OsD+isjFwI5F7KuK1tXja3JPNPjbYEXS
 3aPLmix353GOLFIfD+oTKaZuiZTgZ75+9+XM1Qi8A2GWJBE6URjPzNLYfA/VTJl4/W6S
 MAfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680350109;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TqvvserEEXfM7bfoSIgCSJ4UIeQQqPEniXobIbd6OmA=;
 b=mh3S/umKHewer6BVWqPYXQOytMjXcBxV1dA2/0rV2QUjXSRociREEw2qg6f/2BJ+8c
 E6EOzm730hFb5oYS/15NKfjMuswDH2ya9YFdHLT/BLJ1qXMv9XuOpTMommjVme7sgoF8
 Kkql4u1JtOpptaPYY/VurQSqr0zL5AbXktcvPDYxooBgHMEu6aIuT3KrRDhPZLFIPqy2
 SYXxqtZCHDJCMEcA1OjK0vnlNaGI8wS2TVV3TE0atZ81bMAD8CxVZX+VFBOQr28NDC3R
 xpdVLlosLRDF1bMvk3lLnm8Pc7OybcEMrZcNt2/eEbeGHb0SHT5euemD+l0acqb7bsKZ
 7Fow==
X-Gm-Message-State: AAQBX9cNDm+f4BZIQTZx1dbGuvvhmG/XKDN6VcC1m2cQ3YeKpJ/MIzEw
 wsQ1jo+DW+LKC3pzJEzt+tffww==
X-Google-Smtp-Source: AKy350ZKsnq/mrUrLvubE5qPEGQ/Cxi2AShVFNWxCEZi7DwG0jehzrqC/mrcfTHsYp8T63gYlCU9lA==
X-Received: by 2002:a19:c51a:0:b0:4de:3c94:da15 with SMTP id
 w26-20020a19c51a000000b004de3c94da15mr9296547lfe.4.1680350108727; 
 Sat, 01 Apr 2023 04:55:08 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 w8-20020ac254a8000000b004e83f386878sm786737lfk.153.2023.04.01.04.55.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Apr 2023 04:55:08 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 01 Apr 2023 13:54:44 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v6-7-2034115bb60c@linaro.org>
References: <20230223-topic-gmuwrapper-v6-0-2034115bb60c@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v6-0-2034115bb60c@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680350084; l=1312;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=LfJKI18ku3LCGvhXVjTfawfZ9xevg/d8d9jIr1dnQAM=;
 b=CV/tjUnURsDiZN4KzTdlbV/FyDcpzvhj9HHJ4JsESoZynabtlFtD5aJ2O1Zi5t0SpVVptHxNEgVF
 xPBV/dlRBEBxymgIl8ldYKixPvQxBkelTh8mkZowc9zhAnRmgELD
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v6 07/15] drm/msm/a6xx: Remove both GBIF and
 RBBM GBIF halt on hw init
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

Currently we're only deasserting REG_A6XX_RBBM_GBIF_HALT, but we also
need REG_A6XX_GBIF_HALT to be set to 0. For GMU-equipped GPUs this is
done in a6xx_bus_clear_pending_transactions(), but for the GMU-less
ones we have to do it *somewhere*. Unhalting both side by side sounds
like a good plan and it won't cause any issues if it's unnecessary.

Also, add a memory barrier to ensure it's gone through.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 8e0345ffab81..17e314a745c3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1031,8 +1031,12 @@ static int hw_init(struct msm_gpu *gpu)
 	}
 
 	/* Clear GBIF halt in case GX domain was not collapsed */
-	if (a6xx_has_gbif(adreno_gpu))
+	if (a6xx_has_gbif(adreno_gpu)) {
+		gpu_write(gpu, REG_A6XX_GBIF_HALT, 0);
 		gpu_write(gpu, REG_A6XX_RBBM_GBIF_HALT, 0);
+		/* Let's make extra sure that the GPU can access the memory.. */
+		mb();
+	}
 
 	gpu_write(gpu, REG_A6XX_RBBM_SECVID_TSB_CNTL, 0);
 

-- 
2.40.0

