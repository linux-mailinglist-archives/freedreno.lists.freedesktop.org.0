Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4AB96A069D
	for <lists+freedreno@lfdr.de>; Thu, 23 Feb 2023 11:52:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B61510E054;
	Thu, 23 Feb 2023 10:52:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 589CC10E053
 for <freedreno@lists.freedesktop.org>; Thu, 23 Feb 2023 10:52:07 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id m6so13350331lfq.5
 for <freedreno@lists.freedesktop.org>; Thu, 23 Feb 2023 02:52:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mCGO18fFeWFx1/oqatAOPTvgztN8ex2StTWWkNQew7c=;
 b=Gr2oUgyKPIbZVCgDw3OjK4657+IOYDWhm+oQKM3odBWpq0XiFp1ojiZuUqSa0VLPcN
 1CsQgfpq83Rf7EikYFfnRxzc4c2iSwxyQ77Sh6FKsqtOKlvH68JfniDMK8ncIy+rX3Wj
 aYphvXLHcHlykfD24pQXNQl9s51sxSebGMPkJ+TMWQLjPHw8GVlv3FNR8j/xRO/8jlCO
 AjT6tJFbq5NekeMccUk3ddZFe22h0KtW6kQURLcWO+4m1/aCDIitML1CGVK755QbAg34
 YNnlJqbDa/Y9t/62rM4AceIhLfWHdrnkEqrSxJEPODLyqbNB+5qlDuCXSOzPQ6x3im6y
 Xv5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mCGO18fFeWFx1/oqatAOPTvgztN8ex2StTWWkNQew7c=;
 b=kjvcryGXvtlGMbozWy1sxNxse5/ptU5JkJAWorkQwjKoxB1+BjjfQOkcBuHDIOVFLR
 oIdBITH69V7PkKjQ4VF1PNr4YiYnNi7c44E/CZkhShw8gPbFxAXGF+Q1xlfk2YbpSNQY
 LiLGp6TEfGQ+xUWHlAAuBc0Dsy6mldwLlBv1mjTW9DhtoHVXnx1q9YbFBlhJnQn+gae1
 3R5ewzaNFBze5oy7zqKmDL1KCgOQaUYgyvmZNrwt4i50fJNjTEn2VasTggZGd5zE7IvB
 zo/Xgz4P8MjtUD+hmiOp8sufCwmrIPvzFUJfyxK1nsLymSQ9vlCM9sKHkRtrSBs6Csq3
 ULQQ==
X-Gm-Message-State: AO0yUKVC7aW17tSKLCXv2BhIuzuSexK52MQBCvp44E2Xg29u1QgaGuG4
 9ZYXi+x+3Qn0gPRTfek3YUqz6GAUNI+iLEqz
X-Google-Smtp-Source: AK7set/fY4xrMOUyr8wCGpG1Mb/jr0YHmW1t/sH2sMdYGbLotN+fJHkCYobA1PzBYnb/aZeqZQkvqQ==
X-Received: by 2002:ac2:5456:0:b0:4c0:91d0:e7ab with SMTP id
 d22-20020ac25456000000b004c091d0e7abmr4169027lfn.28.1677149525281; 
 Thu, 23 Feb 2023 02:52:05 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 m25-20020ac24ad9000000b004cf07a0051csm262304lfp.228.2023.02.23.02.52.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Feb 2023 02:52:04 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 23 Feb 2023 11:51:57 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230223-topic-opp-v3-1-5f22163cd1df@linaro.org>
References: <20230223-topic-opp-v3-0-5f22163cd1df@linaro.org>
In-Reply-To: <20230223-topic-opp-v3-0-5f22163cd1df@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1677149522; l=830;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=mzjSUO+qHIiKaLiyXFVom/GoyNVpw37b+tvLzQHI5RY=;
 b=Brq/xe9nTTlSzXWpTd9q4AEiAPA/i+F2rPcpTI/RHWye8OlGMO/u1xixuJxZpsRGzai7/0/FTHLf
 UJmGc0t/AfG08cffcQLz4JK8ezQYgkxA6VOOcAcN82FMb+GJubR7
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v3 1/7] drm/msm/a2xx: Include perf counter reg
 values in XML
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

This is a partial merge of [1], subject to be dropped if a header
update is executed.

[1] https://gitlab.freedesktop.org/mesa/mesa/-/merge_requests/21480/

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a2xx.xml.h | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/msm/adreno/a2xx.xml.h b/drivers/gpu/drm/msm/adreno/a2xx.xml.h
index afa6023346c4..b85fdc082bc1 100644
--- a/drivers/gpu/drm/msm/adreno/a2xx.xml.h
+++ b/drivers/gpu/drm/msm/adreno/a2xx.xml.h
@@ -1060,6 +1060,12 @@ enum a2xx_mh_perfcnt_select {
 	AXI_TOTAL_READ_REQUEST_DATA_BEATS = 181,
 };
 
+enum perf_mode_cnt {
+	PERF_STATE_RESET = 0,
+	PERF_STATE_ENABLE = 1,
+	PERF_STATE_FREEZE = 2,
+};
+
 enum adreno_mmu_clnt_beh {
 	BEH_NEVR = 0,
 	BEH_TRAN_RNG = 1,

-- 
2.39.2

