Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BF1526A07FF
	for <lists+freedreno@lfdr.de>; Thu, 23 Feb 2023 13:07:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0228010EB4F;
	Thu, 23 Feb 2023 12:06:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5E1410EB55
 for <freedreno@lists.freedesktop.org>; Thu, 23 Feb 2023 12:06:55 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id a10so10672684ljq.1
 for <freedreno@lists.freedesktop.org>; Thu, 23 Feb 2023 04:06:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=C2DkiOzFvqlB7+TWcEMrrrEcX0lZ3dVU5NgfPePd3XY=;
 b=efFeIEoRxtiwlRt4E84hxWjWFgZ8KMsAJkCidihuG+M3eZe7QV62rT5onTi9rAglPM
 HSxhPLUpgWlsnU/R2rCa452wWwxrWYayL092HzdLdt3653XgJo2wweouLP2L7HAuVUcT
 Cww+HYGkwT/z6qg/+52NeomA9jThkbIxBtzKJJccWGCq0FREgvqohMzFH3wJE+pbsAo/
 jzElWjR6zZ4y8yXBiTvCYJsbMDgPRI+3zHwhVEDpSnQ8tACNh/PuBblokUvHytT2pkEc
 t/hV7lheaBUeGCWz8KRnXT6TnMCB9EKl4y3PI1PCbmXAkjpA/97OK9ulpOByP3wxyCVb
 eirg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=C2DkiOzFvqlB7+TWcEMrrrEcX0lZ3dVU5NgfPePd3XY=;
 b=k+UyIJziy7uWTwMJk3/t+CA6xiwZ08bXK0PEgUOgeLKhcLaO5nhUqQczUo9FIGIvLz
 mpUe2XiA4y+C6lhrcpomymnyKWxqyXW1KeGKs3ktY5F2NEdg1yPUUbru9ab0eB+zxB0U
 YbvJuGj32++/6ikM8wckBstFKKq3e8wd9czHHxrej6OnJwtvXnUY+40dwHn5CEvXT4C/
 BYQagjLEI4AgxOwVsWuE6QGsZTezw+ysuQbkXSH81sgiV46ABI5Srft51Jj6kHUyRUo2
 syhoZRBrRR/9Lm2l2Pi6sRwNoAIUaUOrlgPb49Sxo6QNrQZWCCtISMJK3PeQV7iMn2ZT
 rTYA==
X-Gm-Message-State: AO0yUKU2B1eQc8EaOW1PHwoQg8uLKJE1KicRonNyrjIioabBNJVv8PhL
 MNH6N2zbSdSukk3OnonUVgZAWw==
X-Google-Smtp-Source: AK7set8+aozCdUsK9/A1dkHtq39HEuFqMzrwj0hVRPwFQ8fRu8JTjjYapM8hXr5CoBmrSc5n2EkIvw==
X-Received: by 2002:a2e:a0d7:0:b0:290:6af2:2aac with SMTP id
 f23-20020a2ea0d7000000b002906af22aacmr3936791ljm.28.1677154014119; 
 Thu, 23 Feb 2023 04:06:54 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 h23-20020a2ea497000000b0029599744c02sm414838lji.75.2023.02.23.04.06.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 04:06:53 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 23 Feb 2023 13:06:40 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v3-6-5be55a336819@linaro.org>
References: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
In-Reply-To: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@somainline.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677154003; l=1251;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=rP7wPgzCBRL4O8RjqZW82yCjEqeUwKMvFLJUSz0sk4w=;
 b=t1dDTvbESCNHgHAYmBv6IMnTLBnwneLOTRz1mF8VO3Y2mx1isDo8k3MOwjLqk/aVELjI0UZ5VVbf
 aPLaEhokA/k0s+GpA7f0O2MxMoiZNsGLLyrtJRa30jB5kDjx7zqA
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v3 06/15] drm/msm/a6xx: Remove both GBIF and
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
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Currently we're only deasserting REG_A6XX_RBBM_GBIF_HALT, but we also
need REG_A6XX_GBIF_HALT to be set to 0. For GMU-equipped GPUs this is
done in a6xx_bus_clear_pending_transactions(), but for the GMU-less
ones we have to do it *somewhere*. Unhalting both side by side sounds
like a good plan and it won't cause any issues if it's unnecessary.

Also, add a memory barrier to ensure it's gone through.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index d8e7ef181e39..a8b727b82389 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1029,8 +1029,12 @@ static int hw_init(struct msm_gpu *gpu)
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
2.39.2

