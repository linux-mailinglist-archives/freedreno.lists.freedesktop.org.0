Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EC9E36A07F5
	for <lists+freedreno@lfdr.de>; Thu, 23 Feb 2023 13:06:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B81D10EB3F;
	Thu, 23 Feb 2023 12:06:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BFD3D10EB3F
 for <freedreno@lists.freedesktop.org>; Thu, 23 Feb 2023 12:06:50 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id z5so10623585ljc.8
 for <freedreno@lists.freedesktop.org>; Thu, 23 Feb 2023 04:06:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2SpxHoGUShGB+o0R51zX1h3RUDAwPHpUo8NWuduSFvs=;
 b=CW7Zdf9o3xrK/6ELRsSFvOeXYvGWeCWQUMKUIDEzLj0zJDMC0kZ4Sf+eu+ByhkMTcl
 Es1Q3UTCbueqYr7YOPW1jJHCExdQH+AiXelzjich8/Sdyoag3yS2hAYwdtikL5ZTu7TZ
 GFPAzxjiQa/Ro5lOGHYXCjSbzVUf8JInS2E1uY19uOEVGPeCDAWWTL8BpR6RCr2cXBdN
 tBmH4ZQv3nFju+1g1nLNU8vwunWMSeNAot98NwpTUX8cmpInhOQvpPZiwv2bkk2U4iSJ
 m0wHHMmAbpJ6a+X8bN+fnAqPe1eCTnaTAuydlFLgELu0s9JjugPB9lwPzSmjPq6dfCWR
 Se4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2SpxHoGUShGB+o0R51zX1h3RUDAwPHpUo8NWuduSFvs=;
 b=vz6s5XSuaxY6355QESAr4MRv+tkjXGUeyUyAxW7Ifms0PLy4cBcYSHzZNkNA215D0m
 JIkrx+XkCTBQPbZ/78AoKFb2vym5+Jarbw1QsnM5hELXo1F9knXlGoM6FUwJMIkNuby3
 RFD0a1Y4g7giTarWLdObBKT/++teSjWLEO4y0L4v83yYYIR2+7yYdhfZf5xcTaUf46f0
 3K13kVVtrdgL/seJIAbAmkIYWge2eeF5O/sWgeI+qDKBy4yZxkBKUEpDKQy8OPmP8JqW
 yRNTKvDTDH61GqrMgqIRrb3Ye1r1xShBufykV/a5PQGyPw1ecE2CzDDXxjzqeI57yoXM
 toSA==
X-Gm-Message-State: AO0yUKVJkaq4nJWHoAxhvrghbd62au3bbcVhh+YKGb7zlBQcwXmGfM2N
 GtGfqMX8tsXtJNueKrkS+aWXLw==
X-Google-Smtp-Source: AK7set/JpG09m8v5w6PbHb6UX+etFa7tyJdg/7j183gkfOzET7sdSYidOdMaYu2BevHmxzYmdnvd7g==
X-Received: by 2002:a05:651c:1548:b0:294:6ef3:f53d with SMTP id
 y8-20020a05651c154800b002946ef3f53dmr6137826ljp.23.1677154009124; 
 Thu, 23 Feb 2023 04:06:49 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 h23-20020a2ea497000000b0029599744c02sm414838lji.75.2023.02.23.04.06.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 04:06:48 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 23 Feb 2023 13:06:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-gmuwrapper-v3-3-5be55a336819@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677154003; l=1711;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=ckva7phaYizBiCARarCiXDqf5CCsJebA/ji3HmmQc6g=;
 b=l/shpHg0ffSlNRZs2INQLoUVacJRFfYkF+Cy0e+TxZ1egkncjMzHjycDzxCx+q1+9tccT2zVosvB
 bS8CU6WmA47RpIYvEnMLEb0EPdGByaiQb71p/qQ9pLoAf9bdQsDj
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v3 03/15] drm/msm/a6xx: Remove static keyword
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
2.39.2

