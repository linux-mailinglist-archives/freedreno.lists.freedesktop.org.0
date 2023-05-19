Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A2D5709846
	for <lists+freedreno@lfdr.de>; Fri, 19 May 2023 15:29:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 05C1A10E280;
	Fri, 19 May 2023 13:29:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB7B610E21C
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 13:29:26 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id
 38308e7fff4ca-2af177f12d1so22163541fa.0
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 06:29:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684502964; x=1687094964;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CoLKDA4nls3CGbrXvxh61SjvP4v8d9SGkB682PI8Y9w=;
 b=Z2m27kLSE1/hw4iXIE43fi41wpKcFGxK0Xnz1w3T0lvfvcVk7Le/dEr+zi+NGu1tJf
 /OKfe10DfnNwtrOoIjkKfQVAUfzj1PZRmT8MEw6tANJx9t9XoxSvsB/Go/dOwGpkfSvi
 Lb0vcRU1NXSqRbpzFuwYtJQ0M5MkGiPzGD+GpyLJGC+1otOlmpnKQzFzuijUnp610wRL
 f93k4HuHiZM1WfeSuOYffIrpdKQ6KwV4WkxxgEcPK/WPFMC9Qm6xJp2wwXU0SCVvOeZv
 yfA8zWafiXtaFx0IQYXhtZPOS1COVU+JOV6hYDyHf6fqP6pkl/A7YrypOO69nsxDmsXw
 PWbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684502964; x=1687094964;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CoLKDA4nls3CGbrXvxh61SjvP4v8d9SGkB682PI8Y9w=;
 b=MOFvHBdmrI7cS7p3ih2FXcBPYb/VERiIWtfNkqgGhFuqFiCynepMtZV3ZjQUW8797W
 XiSs7G0oor3Jkwjek183IoY3uiAQ1DxlF6COBtgtCN6nsxr0m4NMC4JL624SOGfk6uMF
 0opXw21EOUsjAIRIh6VQ6HBgqSxStTEWd+GizciIXh7vO+aKH50qt80AOMbFc2qrDVmO
 vn0/MH1r8rv/lD5puRBptRrOJCAN9GzZ7JAN0O9YOgXULRO7N69L5S8HcPDTDS3BABU5
 h8AYyV+iYWDWjtX+TNOtmYdFozaBlhIs9DsdiSuLfwcIbMIb9NZOqEZQKwfN7RBQ71Hp
 tD4A==
X-Gm-Message-State: AC+VfDyzluid/U+Uoe+ZLlXrXXX6ViZpT6alxwIJRkFgIOP7QoTUQFJA
 BWaYHHenpUIqtRnBkbEk4vKwyg==
X-Google-Smtp-Source: ACHHUZ6CxGFLDlfvrAV3JkY97oQkX8w9GTUFMc0/kvtZwEgddKmd2D5f8xSBKXHwb9BO5aK9+azW7Q==
X-Received: by 2002:a2e:8091:0:b0:2ad:fef4:94f8 with SMTP id
 i17-20020a2e8091000000b002adfef494f8mr797526ljg.6.1684502964590; 
 Fri, 19 May 2023 06:29:24 -0700 (PDT)
Received: from [192.168.1.101] (abxi58.neoplus.adsl.tpnet.pl. [83.9.2.58])
 by smtp.gmail.com with ESMTPSA id
 q24-20020a2e9698000000b002ad92dff470sm821384lji.134.2023.05.19.06.29.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 May 2023 06:29:24 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Fri, 19 May 2023 15:29:11 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230517-topic-a7xx_prep-v2-6-5b9daa2b2cf0@linaro.org>
References: <20230517-topic-a7xx_prep-v2-0-5b9daa2b2cf0@linaro.org>
In-Reply-To: <20230517-topic-a7xx_prep-v2-0-5b9daa2b2cf0@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684502955; l=1342;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=btUFgb1HmX4JzaeMKMcU2R1/tETWRJTF/5M21P54ufE=;
 b=uge7jhsa+6TMgVnbDiql/KjRMCa2Zb0JOe9R2GsPOzeoMYLsykOQCCB6qAuMi5PGNRRC++0uR
 dFwe/8HcIVVBFtJho3vrH41g3hspVEGRLxiuZX69M1/8Ix2IBah+mWC
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v2 6/6] drm/msm/a6xx: Fix up GMU region
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
index 8004b582e45f..386c81e1a2f3 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -1614,13 +1614,13 @@ int a6xx_gmu_init(struct a6xx_gpu *a6xx_gpu, struct device_node *node)
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
2.40.1

