Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 29A947474B9
	for <lists+freedreno@lfdr.de>; Tue,  4 Jul 2023 17:04:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7FB0A10E2CD;
	Tue,  4 Jul 2023 15:03:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4E0810E1B0
 for <freedreno@lists.freedesktop.org>; Tue,  4 Jul 2023 15:03:57 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id
 38308e7fff4ca-2b6a0e36d42so69379561fa.0
 for <freedreno@lists.freedesktop.org>; Tue, 04 Jul 2023 08:03:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688483036; x=1691075036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZC0/5bXEsuHujngkcxb69wPizikqv0P8Uq9N9rSIaSc=;
 b=rrDHjT1XdohbcAEb7K/I45P6WCTri8lRvdqh3U1QdxZ/OUDMVh/obCczQoyxUHIxhm
 C4Ww9VKXvnn4H4JfqMi+mUBaYbvvemW7181yFoUzLMHW8SIk3MT7zla3qY8zpgF7MAa4
 lUGL+5Y3JfcpTJbsoHAZO5eS9QKDA6oB0n2bU5+MWA2uYZq+uwtJxx9zo5bUSKSKnvdD
 7VUs5FoyCQDWEGESI5puZ8yDV1UpLbwUodPjp6igqx06YqMaMYN/B51Rx/59I+Yf9oHV
 6O9Jo68S7N4P/eQafgYzjlrW5B/gmWIYfRZH8PP7HzzZFNTnux+y7hkI6/+aVJ8WQPkT
 72nA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688483036; x=1691075036;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZC0/5bXEsuHujngkcxb69wPizikqv0P8Uq9N9rSIaSc=;
 b=TikDReFiun+RtfwiTuZk/lGIMWGtZBI+OpuWX28w3b71eXEWnsaibTc4ovNW/qZohH
 Hq5r6CXkh8Gx/TYctg7MAJuZQ+9xMT48vW8T7WL/wub8HqOtFdS2q838TlR7SGNpquF6
 TC1x5oFHmLorhiCtBi5xMV5crA2QrnIAtMVhTM0WGri6BTsNBrOzGVWbnkqVEPiCqzsG
 VJKpXnD6Rfa/J3VFgY0LWXmpF4irQHzGbNIg64v+AX9qZyH+Iz7gv6Z798qd9uCn0xp6
 Ju7P0++Dgypg/PG1mx+Ba2XOW6lLyhVNu9RsqgwknIiSFH0A37k9RTBzqwp5d7xYyReA
 ZjJA==
X-Gm-Message-State: AC+VfDzclAfyc/wP01FfVLDbLpsTIkXrcC+fc4bUD9iBcqOEQlQDCf6i
 p45BujAkhBpe8/BNrzfhBwDtgw==
X-Google-Smtp-Source: ACHHUZ6Z6+YzUGt6Z0XsYxLyOrcysDN2d2wGK/OHEBQBcN1Z6cxNKGbIrIhPPmdtll8oMChE0BI+tw==
X-Received: by 2002:a05:651c:1309:b0:2b6:9f54:af9a with SMTP id
 u9-20020a05651c130900b002b69f54af9amr6875576lja.8.1688483036141; 
 Tue, 04 Jul 2023 08:03:56 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j10-20020a2e850a000000b002b6ca539d92sm3337354lji.138.2023.07.04.08.03.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 04 Jul 2023 08:03:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Tue,  4 Jul 2023 18:03:41 +0300
Message-Id: <20230704150354.159882-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
References: <20230704150354.159882-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 01/14] drm/msm/dpu: drop enum
 dpu_core_perf_data_bus_id
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Drop the leftover of bus-client -> interconnect conversion, the enum
dpu_core_perf_data_bus_id.

Fixes: cb88482e2570 ("drm/msm/dpu: clean up references of DPU custom bus scaling")
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h | 13 -------------
 1 file changed, 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
index e3795995e145..29bb8ee2bc26 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.h
@@ -14,19 +14,6 @@
 
 #define	DPU_PERF_DEFAULT_MAX_CORE_CLK_RATE	412500000
 
-/**
- * enum dpu_core_perf_data_bus_id - data bus identifier
- * @DPU_CORE_PERF_DATA_BUS_ID_MNOC: DPU/MNOC data bus
- * @DPU_CORE_PERF_DATA_BUS_ID_LLCC: MNOC/LLCC data bus
- * @DPU_CORE_PERF_DATA_BUS_ID_EBI: LLCC/EBI data bus
- */
-enum dpu_core_perf_data_bus_id {
-	DPU_CORE_PERF_DATA_BUS_ID_MNOC,
-	DPU_CORE_PERF_DATA_BUS_ID_LLCC,
-	DPU_CORE_PERF_DATA_BUS_ID_EBI,
-	DPU_CORE_PERF_DATA_BUS_ID_MAX,
-};
-
 /**
  * struct dpu_core_perf_params - definition of performance parameters
  * @max_per_pipe_ib: maximum instantaneous bandwidth request
-- 
2.39.2

