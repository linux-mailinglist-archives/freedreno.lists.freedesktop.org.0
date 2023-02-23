Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 073F86A06A6
	for <lists+freedreno@lfdr.de>; Thu, 23 Feb 2023 11:52:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA23A10E050;
	Thu, 23 Feb 2023 10:52:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B0D110E07D
 for <freedreno@lists.freedesktop.org>; Thu, 23 Feb 2023 10:52:13 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id f18so13283142lfa.3
 for <freedreno@lists.freedesktop.org>; Thu, 23 Feb 2023 02:52:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=312OV1ExLaf1docfwSJg/DyYHuD2OoIvYCwHKB24HQI=;
 b=Ce/cN8SJNqmnOLGti7C/wIYSkPwOXN+WsO7YJlUi1HVGSsH4IugGMhdMSOArjMUlwz
 AfXqXzfVXH7StipBipyI9C3rVs/AfBEsOlpjoGUJH6oUehAIfEiVTE3C8iOSLzVu/Lym
 /2bcRB2hfvVFzai8oYsySHFBGqcL9QaQK0N/izI0yShx3HtY8Ngi1xEHljGpBafM+oCJ
 SCvH6y3c6LpK5hC/pNqwwIfaGs4EQfZlF7AyG9hek48zBPsI3xMZUy97nqProR/RqSYk
 lJOjp5loyoTQHXMZpg7J2h+5BR/glkMobFjQAxPjq9GGDGwqLeYNFHMwlydmAu+ROLIU
 iwfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=312OV1ExLaf1docfwSJg/DyYHuD2OoIvYCwHKB24HQI=;
 b=G+VFJjjfRiFkyiOVbik39pV3IjQ9bVSNrG+imeHgJxfr/iXMiar8r6Xbyi6QSyU1Sz
 F316Ze0mRVSlEYAkLwCAUozNU7oMP62ct2/XTO8T/jUdP29cG5dO77P3ZejHiPe+iGXp
 YJvrfhWM7c+TGvj4hxG4Z/usatpPL2g1gKeRkbyOIAwYGgp+oRydtz4OfhKwV6U13Cp2
 cnpMZuPsYLDuU+8tCKvbrNC3diuCTBehU80MNQ2f7cvyr5LeIDSceUMJtUdy1YAlaW4r
 GgoByKp9ZjKT2Quc6PpKQOMQU0eyjwUHe/Ziq4+1XXYhSTMr/ZD2fAE2XgbWVZcm3eBn
 bCBg==
X-Gm-Message-State: AO0yUKXZm7ga5C85P9aaq6XLqNA9DPTZYUac34I7wEqnzu3DSLWKOR8X
 KaqOxoOOGQhsm0ZuloxwqMc0vlJe0V1ZWC68
X-Google-Smtp-Source: AK7set8osHC1BKuwQhKilzcKra4Qow5sccaKlgb33WRhd1YaD6tJd1VO+rXTjbpXroqZwNqtZ8dETQ==
X-Received: by 2002:ac2:5225:0:b0:4dc:4bda:c26f with SMTP id
 i5-20020ac25225000000b004dc4bdac26fmr3063427lfl.23.1677149532652; 
 Thu, 23 Feb 2023 02:52:12 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 m25-20020ac24ad9000000b004cf07a0051csm262304lfp.228.2023.02.23.02.52.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:52:12 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 23 Feb 2023 11:52:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-opp-v3-7-5f22163cd1df@linaro.org>
References: <20230223-topic-opp-v3-0-5f22163cd1df@linaro.org>
In-Reply-To: <20230223-topic-opp-v3-0-5f22163cd1df@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677149522; l=828;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Yh6pwT6P3XDwmr1GaQu8MRHxTbI8EpTO/tdF6ItczWk=;
 b=2rrRDrTtljtkMy2NiIvypriRAjz8Zl6PZhh4lLLHUrTd/4LPzZWyfiOavFuEJQnJLGhxCc/L8cSg
 DQgfDp28B0bz+/nmo/25V3K4pnLZVeMgAtqBwOy48QqoAzn8bDYx
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v3 7/7] drm/msm/adreno: Enable optional icc
 voting from OPP tables
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
Cc: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add the dev_pm_opp_of_find_icc_paths() call to let the OPP framework
handle bus voting as part of power level setting.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/adreno_device.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/adreno_device.c b/drivers/gpu/drm/msm/adreno/adreno_device.c
index 36f062c7582f..5142a4c72cfc 100644
--- a/drivers/gpu/drm/msm/adreno/adreno_device.c
+++ b/drivers/gpu/drm/msm/adreno/adreno_device.c
@@ -548,6 +548,10 @@ static int adreno_bind(struct device *dev, struct device *master, void *data)
 		return PTR_ERR(gpu);
 	}
 
+	ret = dev_pm_opp_of_find_icc_paths(dev, NULL);
+	if (ret)
+		return ret;
+
 	return 0;
 }
 

-- 
2.39.2

