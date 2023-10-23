Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B7867D394E
	for <lists+freedreno@lfdr.de>; Mon, 23 Oct 2023 16:29:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23B3810E1F0;
	Mon, 23 Oct 2023 14:29:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F20D10E1E2
 for <freedreno@lists.freedesktop.org>; Mon, 23 Oct 2023 14:29:40 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2c503da4fd6so49029121fa.1
 for <freedreno@lists.freedesktop.org>; Mon, 23 Oct 2023 07:29:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698071379; x=1698676179; darn=lists.freedesktop.org;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:from:to:cc:subject:date:message-id:reply-to;
 bh=59STP8IG3xhkl1R+OwWbm4nT/u7IRLl4iyf5Y7WczEY=;
 b=IxmWmB5ca50rUvQvdgQ1PD7658U5lFscnNjfgRv5LKlGJHB9u2SYH/WQzVYSS7dUBr
 h1/ccD5xx+tDLu1y2Euz9Ruf+bRNlXW49EcvP4rOwjDMY+UWH/BFNY2PmPWnTjfHfese
 2Drz5jJkPqPj4p2jJsI+R833Pj6P3z8CJdOMo/qRlcv0u1JU2NH/CiLM3u5TeVlRF8Jp
 EYeAH30nUqaOhzlwVmdPdcJr2G4tSyYrNpCTC8nsxanxbPdpdQFiquqSfR7C4k6WV2Em
 WG5zGqEp68oELiDyGVNA/e9o3liVxMpd46auIGYvoKXFxi4jqMUUb4jXQI7YZse26MC7
 HENA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698071379; x=1698676179;
 h=cc:to:message-id:content-transfer-encoding:mime-version:subject
 :date:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=59STP8IG3xhkl1R+OwWbm4nT/u7IRLl4iyf5Y7WczEY=;
 b=C1tJe050JHESxYivgTPZ5VtMwSvFLLijyZ+G1KOmc+0GMMqV7LFr+n7Tr4tKeT4n+l
 eS3wQQCjsevXwAqp9JJi7vWbo3h0Bwo48Q6U788yWk8Cn65OSio2hvGA12LkwizuANxn
 LiKGzhEeVQY+SZTQAFiWFr9vMngOdx4LMATLVO1gl+N8fEsUXs3JVMpcwARXYOkKVIbj
 DZGOK/f/bQLjfO7NiBVpm8CaB8EydEsQbuZ/W1T5A6HxhFrnfwPCDIvBsumlZxZvo7zW
 Gx9sr2CgrTb6ruGi2vBsrTN9E8Ta2ObPAFWlWE8kJMMB3Co0ukq4U8ShJa3YgtXGeH5q
 iWQA==
X-Gm-Message-State: AOJu0YxKANjDdoVYSE87R8cbTEl5/ysF2GQE9XVIsuJjUUPzIk40Sh3q
 O2NVzmais2zzdYkud+moH5TTUw==
X-Google-Smtp-Source: AGHT+IH5WFoFfyNzJgl4CLmejLA/ZgHuJygZLcv0FelZqLu9BJ1k+mLHsMaN3Mm0ni7tH5Yu0rnSiQ==
X-Received: by 2002:a2e:a7c7:0:b0:2c1:5645:a2c0 with SMTP id
 x7-20020a2ea7c7000000b002c15645a2c0mr5768343ljp.35.1698071378607; 
 Mon, 23 Oct 2023 07:29:38 -0700 (PDT)
Received: from [10.167.154.1]
 (178235177080.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.80])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a2e8e6d000000b002c4faf47378sm1616655ljk.28.2023.10.23.07.29.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Oct 2023 07:29:38 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 23 Oct 2023 16:29:31 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231023-topic-adreno_warn-v1-1-bb1ee9391aa2@linaro.org>
X-B4-Tracking: v=1; b=H4sIAEqDNmUC/x2NywrCQAxFf6VkbaAdB0F/RUSSaWoDJVMyvqD03
 w0u7uJcOJwNmrhKg0u3gctbm1YLGA4dlJnsIahjMKQ+HYcYPuuqBWl0sXr/kBvmRP2ZOfN0yhA
 eUxNkJytzmPZaljhXl0m//9D1tu8/hqsr1XgAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1698071376; l=1189;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=CI9uW4HFCd+sT4l3B8ani/4HRFmQfbbgjJhTrM3t/ig=;
 b=SCcIvz1UzYt8XexR/pBOz+V+i46dV2cDA1630eMo2ve5CMi9C6GzQ58HdfRNOoV17ffhl+axh
 GqYKdlDyyY/DwK9zWKbyUnlzLfk2p9kjX0+mVT5IVcj8WRb7GEdWRi7
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH] drm/msm/adreno: Drop WARN_ON from patchid
 lookup for new GPUs
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
 Abel Vesa <abel.vesa@linaro.org>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

New GPUs still use the lower 2 bytes of the chip id (in whatever form
it comes) to signify silicon revision. Drop the warning that makes it
sound as if that was unintended.

Fixes: 90b593ce1c9e ("drm/msm/adreno: Switch to chip-id for identifying GPU")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index 80b3f6312116..9a1ec42155fd 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -203,11 +203,6 @@ struct adreno_platform_config {
 
 static inline uint8_t adreno_patchid(const struct adreno_gpu *gpu)
 {
-	/* It is probably ok to assume legacy "adreno_rev" format
-	 * for all a6xx devices, but probably best to limit this
-	 * to older things.
-	 */
-	WARN_ON_ONCE(gpu->info->family >= ADRENO_6XX_GEN1);
 	return gpu->chip_id & 0xff;
 }
 

---
base-commit: e8361b005d7c92997d12f2b85a9e4a525738bd9d
change-id: 20231023-topic-adreno_warn-42a09bb4bf64

Best regards,
-- 
Konrad Dybcio <konrad.dybcio@linaro.org>

