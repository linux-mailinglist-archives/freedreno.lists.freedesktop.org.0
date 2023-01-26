Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CAFC567CFCF
	for <lists+freedreno@lfdr.de>; Thu, 26 Jan 2023 16:18:00 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6BD5110E14B;
	Thu, 26 Jan 2023 15:17:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52f.google.com (mail-ed1-x52f.google.com
 [IPv6:2a00:1450:4864:20::52f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7739710E939
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 15:17:51 +0000 (UTC)
Received: by mail-ed1-x52f.google.com with SMTP id v13so2122455eda.11
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 07:17:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6J6qSh0efJGQC1MdRpa8Z3puyGuNa/niO8IpMDoxAfU=;
 b=pgynMWONfLhM61AbGHvi2BqAJ5J1Xt0lJIRNd/X3V5KTx68IDG7Ky0q4fF0pnxAirZ
 ZTn+DfEhyoj5Nv7pPRd/QmSIXXVWI3tBLs5M4n3pvP2noMVNbxKRcSKtSx/htcVx57Ad
 6KX+ZcodRD05XU+bzH12czdbGOINh3lSYD5jhNLIodffWAwKURvSHuyDc8NFcIDa7Fi1
 vz0mskAVszXseJHgNPHTN8bGBobsQKl2i++0IFFaEjTrsjsr9To2Ikc264uNXbECE7o4
 JNATj6hWF0r+x2S86y+2rADvINXibz9y+84Wz3yZ8yuoqJkL5M3w/LjyRK+q5FfDSONf
 M4eA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6J6qSh0efJGQC1MdRpa8Z3puyGuNa/niO8IpMDoxAfU=;
 b=c9NskOdrAiDVHHNeOYZTif6WPlgtnT7dnVjNzygpxiZOSScqKQjFfoT8pk1P/6OTzw
 cedYg1JbYeeIIuLLW4L7yI8uTzzaMM/t8PvxzzzDQUjvIO8CqdwHhJVa5EUgtM5YGYWu
 3YH3opbY2li+U0pVznG/fUxMF8RerJmFjRSVYKdDSLmagi1OFjTEKGmW5K3C7Aw70M6n
 wK7RXmUMH7wZ8iQXQfgbktqfHJM/EyBQ6xEQn9KmhgG8GwX7DtwVFo/b0F2yFxsTSPbP
 Aeo7JmhLGf6nHF+zl25zgRe1Xn5XMaudvHsLWjsTN+EOHMO/dIu8rwCP72xy6+G8c4UU
 w1mA==
X-Gm-Message-State: AFqh2kror1VuqsUoG7hM93p5YSmhVBXGwK2wfLFoEUJb7fE0n05HQBh/
 AztARk4EQjT+ttccnal0EKQUZA==
X-Google-Smtp-Source: AMrXdXtDsZVGSrVLYoAVLMYnDBYZRSw+ViON3LaOdYRhs80oYnWCOTOQHlrNOkOo7kP/6sPNcnM/Ew==
X-Received: by 2002:a05:6402:27cf:b0:488:e7ae:5cc4 with SMTP id
 c15-20020a05640227cf00b00488e7ae5cc4mr45916885ede.41.1674746271060; 
 Thu, 26 Jan 2023 07:17:51 -0800 (PST)
Received: from localhost.localdomain (abyk108.neoplus.adsl.tpnet.pl.
 [83.9.30.108]) by smtp.gmail.com with ESMTPSA id
 a16-20020aa7d910000000b00463bc1ddc76sm842808edr.28.2023.01.26.07.17.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 07:17:50 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Date: Thu, 26 Jan 2023 16:16:14 +0100
Message-Id: <20230126151618.225127-11-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126151618.225127-1-konrad.dybcio@linaro.org>
References: <20230126151618.225127-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 10/14] drm/msm/a6xx: Fix up A6XX protected
 registers
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 Akhil P Oommen <quic_akhilpo@quicinc.com>, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, Chia-I Wu <olvaffe@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

One of the protected ranges was too small (compared to the data we
have downstream). Fix it.

Fixes: 408434036958 ("drm/msm/a6xx: update/fix CP_PROTECT initialization")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index f34ab3f39f09..62f504ed7ef5 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -690,7 +690,7 @@ static const u32 a6xx_protect[] = {
 	A6XX_PROTECT_NORDWR(0x00800, 0x0082),
 	A6XX_PROTECT_NORDWR(0x008a0, 0x0008),
 	A6XX_PROTECT_NORDWR(0x008ab, 0x0024),
-	A6XX_PROTECT_RDONLY(0x008de, 0x00ae),
+	A6XX_PROTECT_RDONLY(0x008d0, 0x00bc),
 	A6XX_PROTECT_NORDWR(0x00900, 0x004d),
 	A6XX_PROTECT_NORDWR(0x0098d, 0x0272),
 	A6XX_PROTECT_NORDWR(0x00e00, 0x0001),
-- 
2.39.1

