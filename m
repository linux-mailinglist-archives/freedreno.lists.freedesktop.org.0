Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2F6267CFBB
	for <lists+freedreno@lfdr.de>; Thu, 26 Jan 2023 16:17:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A098410E14B;
	Thu, 26 Jan 2023 15:17:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com
 [IPv6:2a00:1450:4864:20::535])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9B9610E14B
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 15:17:10 +0000 (UTC)
Received: by mail-ed1-x535.google.com with SMTP id m12so2150742edq.5
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 07:17:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5ZAfO7IxAr14EAlhNtiFp5Qcd0YjV1Wu3mwyrUUlhD8=;
 b=WycDfuOeAMXNIrCnI7mqkfBVYLAdUHyfVKbzu+0R3Kls1cp1yXX0ookuee148acXZN
 9m7ALcUa2MEv5z7jmcZf9NYELk4j5FfiFt6ZG7fJJr6ve2Vov4gvdB1UtgfS04zZPQ7M
 DKnp/WP5UqyhDW6K8I81+MDRt0SXvD557NoNOHkoxAsgQVpng4Iso5kYm8itzDed4jup
 pGmP/XudT9/YV2uY6pIk68JFGbkLl3n7Ww387RBMl72Cm3oghYPhTktQUDg9pkudR4ma
 cdoTfIouJrC0NhnmAD7IBMSEILCU8YCPS29b3YhQRIbxvGBUIzYqWVe8qY6CXkdLAypB
 BUSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5ZAfO7IxAr14EAlhNtiFp5Qcd0YjV1Wu3mwyrUUlhD8=;
 b=PtCp0g2aPo4ehpIli4lf8sPPOfWk2RZNwyFcle9MAf39RBfQ5EUllPBLHKmb7vLPxG
 ksyisoMrso5dld1i8VH1fTJB/7kERPIJPa+AJRLXyPqlmIbwZHGIalvjSYqLKab9Exwb
 5DxDriw7wmu3YPov/iyncebCGYiAC1EGZqt2wIGo/P5ZhvlWHyN6Q33G73VYNQS7z+Ga
 pX6N8+Cuf+7rjskTJEHQSNb+Bs0ujZ312wWV4cKUXWo/P1Mnjvcb/r6D7V1QZhgSZGev
 S2uTjH9eSjRUPYIRBczoPQ8TgpW9yDUFCn37sx4V07JG8pmqtfq9fsbSF5sWGXT5oPDv
 XJpg==
X-Gm-Message-State: AFqh2kqYxv3Iy++0YPSMffhvkYQ5QASij4TAKFF2wp1sNGTu3ANo6BZh
 E0IRScCbX/nvxzLBBxkxSlozlw==
X-Google-Smtp-Source: AMrXdXtYw8AIVUi0iCcQsXJSz4GqxpS6e3+ueaMfAGJ7o2t91Civs5gXDDQXTo9MmSbmEMnio0pmiA==
X-Received: by 2002:a05:6402:524f:b0:490:47c3:3d7f with SMTP id
 t15-20020a056402524f00b0049047c33d7fmr52370898edd.2.1674746229163; 
 Thu, 26 Jan 2023 07:17:09 -0800 (PST)
Received: from localhost.localdomain (abyk108.neoplus.adsl.tpnet.pl.
 [83.9.30.108]) by smtp.gmail.com with ESMTPSA id
 a16-20020aa7d910000000b00463bc1ddc76sm842808edr.28.2023.01.26.07.17.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 07:17:08 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Date: Thu, 26 Jan 2023 16:16:05 +0100
Message-Id: <20230126151618.225127-2-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126151618.225127-1-konrad.dybcio@linaro.org>
References: <20230126151618.225127-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 01/14] drm/msm/a6xx: De-staticize sptprac
 en/disable functions
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
Cc: freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Geert Uytterhoeven <geert@linux-m68k.org>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, Guenter Roeck <linux@roeck-us.net>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

These two will be reused by at least A619_holi in the non-gmu
paths. De-staticize them to make it possible.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 4 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index f3c9600221d4..90e636dcdd5b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -354,7 +354,7 @@ void a6xx_gmu_clear_oob(struct a6xx_gmu *gmu, enum a6xx_gmu_oob_state state)
 }
 
 /* Enable CPU control of SPTP power power collapse */
-static int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
+int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
 {
 	int ret;
 	u32 val;
@@ -376,7 +376,7 @@ static int a6xx_sptprac_enable(struct a6xx_gmu *gmu)
 }
 
 /* Disable CPU control of SPTP power power collapse */
-static void a6xx_sptprac_disable(struct a6xx_gmu *gmu)
+void a6xx_sptprac_disable(struct a6xx_gmu *gmu)
 {
 	u32 val;
 	int ret;
diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
index e034935b3986..ec28abdd327b 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -186,5 +186,7 @@ int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index);
 
 bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu);
 bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu);
+void a6xx_sptprac_disable(struct a6xx_gmu *gmu);
+int a6xx_sptprac_enable(struct a6xx_gmu *gmu);
 
 #endif
-- 
2.39.1

