Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6FCDE658B98
	for <lists+freedreno@lfdr.de>; Thu, 29 Dec 2022 11:18:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98D4810E259;
	Thu, 29 Dec 2022 10:18:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 546BE10E25C
 for <freedreno@lists.freedesktop.org>; Thu, 29 Dec 2022 10:18:51 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id y25so26934688lfa.9
 for <freedreno@lists.freedesktop.org>; Thu, 29 Dec 2022 02:18:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ucgqquCovQOcSuajKJPtQVfMmU0XBO42PG2kCTctk5M=;
 b=TbZugUpEkLxAfOyP5+EeaNu0hxlMrj25oKmLbJ8aucvMgIrR4dj5LnZivExVcEeuOy
 fby8y3gGuhWyWH1GxaoLiY8DTC3QNTISKwiQz86VKG92WBNk6vcOGAjGy9xW3CbpkIyI
 6e91hXgdqLRQifyK2O7Ut1IlRGPm0HFnpJL7QCrBM3kOXFTHJEPZIoEZYS8zraePEMuN
 3G/H3JkHmBXlA1uqqzycNTCRyUmTZsCFIiaJbTuO9vAJAQwRqlmWrScx0mXYSSaT+nff
 UaJ8ge6FtF59eROruuVDvugw0py6+PTnUBUGv0P+yv5wzWc2gFGdwuaztFgR0RqaM4vB
 h2mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ucgqquCovQOcSuajKJPtQVfMmU0XBO42PG2kCTctk5M=;
 b=jsdfJN8TJtN3A3i9Z1vAzbKfEPztNmNfnac0bLjHaymUPm8+/aaooUgDqHUv2oAPc6
 CWw278fo+uSQIdFKe/9+aAaDDDItE2GMeUj+0rPCNn5jf4g/fYfEevw7ACHODVDA5L3p
 5cGFgaezwQ5MbZJIWrjnuoxEaXDGmUB9OhfBZvAazRuChThTkMJRsgblmcCqjEUX7Gal
 10KIr3RhFOOAgMJ+MYMW0n2miEvTEuX/zAFqminAHBlJ/u3kzX7IJc9RWSC6v20oA94Y
 nEfUZq1++71jk1CJrAGAl+LeubTevt9T0PUZLEPmADNkDVvgsu6tKDyBUxORqFPOJOQ9
 OIkw==
X-Gm-Message-State: AFqh2kpJ+KpynkSKClwKLLk3w57iDgBzhmmS9CJflxrxeUoW3LF2kjPh
 dwdyitf/+DAUD186AiHOwjQqtg==
X-Google-Smtp-Source: AMrXdXsLyx6ZbcjsygWtSNi8M6/Y+8+EahJS3C0JFdhbUJ0XUuGJE7bRXOQagTHU/MybUoJNsQ9ppw==
X-Received: by 2002:ac2:43cf:0:b0:4b5:8298:5867 with SMTP id
 u15-20020ac243cf000000b004b582985867mr9082838lfl.66.1672309129698; 
 Thu, 29 Dec 2022 02:18:49 -0800 (PST)
Received: from localhost.localdomain (abyl184.neoplus.adsl.tpnet.pl.
 [83.9.31.184]) by smtp.gmail.com with ESMTPSA id
 j18-20020a056512109200b00498f67cbfa9sm3028632lfg.22.2022.12.29.02.18.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 02:18:49 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Date: Thu, 29 Dec 2022 11:18:45 +0100
Message-Id: <20221229101846.981223-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/adreno: Make adreno quirks not
 overwrite each other
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
Cc: freedreno@lists.freedesktop.org, Emma Anholt <emma@anholt.net>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

So far the adreno quirks have all been assigned with an OR operator,
which is problematic, because they were assigned consecutive integer
values, which makes checking them with an AND operator kind of no bueno..

Switch to using BIT(n) so that only the quirks that the programmer chose
are taken into account when evaluating info->quirks & ADRENO_QUIRK_...

Fixes: b5f103ab98c7 ("drm/msm: gpu: Add A5XX target support")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_gpu.h | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_gpu.h b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
index c85857c0a228..5eb254c9832a 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_gpu.h
+++ b/drivers/gpu/drm/msm/adreno/adreno_gpu.h
@@ -29,11 +29,9 @@ enum {
 	ADRENO_FW_MAX,
 };
 
-enum adreno_quirks {
-	ADRENO_QUIRK_TWO_PASS_USE_WFI = 1,
-	ADRENO_QUIRK_FAULT_DETECT_MASK = 2,
-	ADRENO_QUIRK_LMLOADKILL_DISABLE = 3,
-};
+#define ADRENO_QUIRK_TWO_PASS_USE_WFI		BIT(0)
+#define ADRENO_QUIRK_FAULT_DETECT_MASK		BIT(1)
+#define ADRENO_QUIRK_LMLOADKILL_DISABLE		BIT(2)
 
 struct adreno_rev {
 	uint8_t  core;
@@ -65,7 +63,7 @@ struct adreno_info {
 	const char *name;
 	const char *fw[ADRENO_FW_MAX];
 	uint32_t gmem;
-	enum adreno_quirks quirks;
+	u64 quirks;
 	struct msm_gpu *(*init)(struct drm_device *dev);
 	const char *zapfw;
 	u32 inactive_period;
-- 
2.39.0

