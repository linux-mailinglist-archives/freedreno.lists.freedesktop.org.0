Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 152C76D3060
	for <lists+freedreno@lfdr.de>; Sat,  1 Apr 2023 13:55:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 725FA10E26C;
	Sat,  1 Apr 2023 11:55:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 22D1C10E24F
 for <freedreno@lists.freedesktop.org>; Sat,  1 Apr 2023 11:55:02 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id h11so25261502lfu.8
 for <freedreno@lists.freedesktop.org>; Sat, 01 Apr 2023 04:55:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1680350100;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TbK2MVc1rKgyfPXfQElwY/6uPFFij3UrjXWyfn1dhPY=;
 b=fjL75dISZSV4H+8N12RUuLPgkvtiebKr+6ASoAkWxwfNiElc7/ojpiwwM3yQ/36c3I
 vWOXBYewl/m36ml0HT2/EnizqK63B9YCoSQR3Kavg8o42p7YH/4eRrbrgz91hpA6uuUk
 HYesEBGnCLJbbBdCmh9RDfmpPYX7LdT0dEH7vJdDF8brce3qbgqiClPB1Ld2JlKYNVsB
 GCBaziPE/grDFbX/NVENrq3jFeW6tqRDdlOkW0SGUiB3oVuMWVIcG4thFbLKAP6Sr7mh
 3QiAlOsUfwAv06pIxXMAgIz+lnbnd+KQ6gVDFzqSJaWl5wpvDSzBZTUGDf65sbOlEOYh
 7+sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1680350100;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TbK2MVc1rKgyfPXfQElwY/6uPFFij3UrjXWyfn1dhPY=;
 b=QFk0OR+99BdrjSkkMkA1gU9pSNixKSC3QbKdm2CILEzBbMKvOEWu5yJxKOiu3KiUgC
 6z7O8jjNhClY1X2h2TAZYErjBXSjrriJmdniY2XfaPt+Nb7fxl1KSleel5t6OmsXtm/n
 aCRWBUY8N/I0FTCPI+Lbk5a9+sMtFD82dusJB4MbEV6Y1n9D352PbDXGoHUk3t0Fog0p
 SIe8kBGJk0W9nU5Kigiu0EBmjF08rkEYRH6Esj7EMEGVkOD9PUQNqJZdI6bONwW63D8x
 UBsFkx7/K6KG4viqxEkRsrg8+rOxvkt+nYqaItnxKZGY29eXVlcWMfrkvu4BQW6UvzjL
 YFIg==
X-Gm-Message-State: AAQBX9f5GMzB/KAeW6N7YjV/OGfP17czTpCohTZFr43ufWIMVgrwdi2f
 OkZAVlwSmABXCPzq/JOsqKJ6ig==
X-Google-Smtp-Source: AKy350ZikYFxTM1MU3eUgc0PKcoDOOnyTT4LYLXu9S8Wq3YzPlUdOjbCAo75MJyxQB8wUCG3Wxdftw==
X-Received: by 2002:a19:5510:0:b0:4ea:f9d4:93a0 with SMTP id
 n16-20020a195510000000b004eaf9d493a0mr5593306lfe.34.1680350100305; 
 Sat, 01 Apr 2023 04:55:00 -0700 (PDT)
Received: from [192.168.1.101] (abxj225.neoplus.adsl.tpnet.pl. [83.9.3.225])
 by smtp.gmail.com with ESMTPSA id
 w8-20020ac254a8000000b004e83f386878sm786737lfk.153.2023.04.01.04.54.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 01 Apr 2023 04:55:00 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Sat, 01 Apr 2023 13:54:41 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v6-4-2034115bb60c@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1680350084; l=1711;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=WpExda3PhDQwvsN/3DDBnvG0Z5wUKLMO4vx8OFJgLF8=;
 b=75IfQDAr9WDnfiDmZMmGzjEjaJNUGRJAMt23AHzSA5NWTjC9aPCa0S1vDW95VzrXJKrvjMNy/KHm
 ZelYSLzJDnopySv+ciDpRcmx/KPYBt9AILvfACq9ERo1s71ICFme
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v6 04/15] drm/msm/a6xx: Remove static keyword
 from sptprac en/disable functions
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

These two will be reused by at least A619_holi in the non-gmu
paths. Turn them non-static them to make it possible.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 4 ++--
 drivers/gpu/drm/msm/adreno/a6xx_gmu.h | 2 ++
 2 files changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index e16b4b3f8535..87babbb2a19f 100644
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
index 0bc3eb443fec..7ee5b606bc47 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.h
@@ -193,5 +193,7 @@ int a6xx_hfi_set_freq(struct a6xx_gmu *gmu, int index);
 
 bool a6xx_gmu_gx_is_on(struct a6xx_gmu *gmu);
 bool a6xx_gmu_sptprac_is_on(struct a6xx_gmu *gmu);
+void a6xx_sptprac_disable(struct a6xx_gmu *gmu);
+int a6xx_sptprac_enable(struct a6xx_gmu *gmu);
 
 #endif

-- 
2.40.0

