Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 365D174B743
	for <lists+freedreno@lfdr.de>; Fri,  7 Jul 2023 21:39:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EA04310E5E3;
	Fri,  7 Jul 2023 19:39:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2F14010E5E3
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jul 2023 19:39:46 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fb7769f15aso3702906e87.0
 for <freedreno@lists.freedesktop.org>; Fri, 07 Jul 2023 12:39:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688758784; x=1691350784;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZC0/5bXEsuHujngkcxb69wPizikqv0P8Uq9N9rSIaSc=;
 b=irHyIT5U6hcW3HCfefIjq6zUr7hVHnkb6dPbETKuxXePnm0kYedSBCMGM1hc72sUh7
 3FqmAPxruf3cBN8VsO7Nh2tY3CNec42acK3SPhDe+UPExHeDXWysTpYL/ZoKw8u8h5ra
 KgxxMjKmUlFTESO2vNjj9t0RGa2d32erLdhCKZF9t2RQPqCr0N3WTfoeedn4aKhCcAgm
 Ihw6RTI0/W+ioB2ZpkTj8TmwlAKB6J+03F9VfN+MgLGV9pV46MH88UhjAKXlT0oR1w2r
 HyNxhbyeFqIsF4qseDraSV9hzIQd2Ifi+0ei+03yY7YEjnuZFFhJrGsilrGihLVYSh2P
 VUKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688758784; x=1691350784;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZC0/5bXEsuHujngkcxb69wPizikqv0P8Uq9N9rSIaSc=;
 b=QEbTNCXFCYnTQlE4H+0C1Zk/8ELQ8bV8Vyj4M+5qBXWGCb8WXQk/t0uOukWaDjMYDA
 l5FRIbYJuhkZddpxLMuJ+/pyOT3pZ089MEwFuvUEaM5plBaKAatPGyaRA3RqsuiZClZt
 XbX0ATyopv8Q9e4qw+y42J+5BVCs9k4ENgg1E2A7utrVnqpYu0YyQf4+1NhJOcslbzfh
 YG3kaEhSms1VUvci/5fCdbYa8wDG5aDCRIOs7T6bVADxeHUHu8xvghSHvKo9rZ2lvq89
 NJfFQyEn/LHGVMpygbHmimEvkCGeETTfzOsaqkn+BZNVc0OPU1R0DeRt6bynKhWX+/R/
 ZmKA==
X-Gm-Message-State: ABy/qLackWylaCfl+1YnfWsW1eis2RE0q9BxhII1iYEKqwX3RqAy8TLf
 NGSL6JkytEeFs/xK+AGiXEc6PQ==
X-Google-Smtp-Source: APBJJlGf0tThZBJ0n0VqdJJEEMFaVduUgRRNX9wjXo2ASpXK/RhgQB9SgzN+BTlYPLNTiTS8J9AAeg==
X-Received: by 2002:a05:6512:694:b0:4fb:91c5:fd38 with SMTP id
 t20-20020a056512069400b004fb91c5fd38mr5523040lfe.0.1688758783925; 
 Fri, 07 Jul 2023 12:39:43 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a19a410000000b004fba759bf44sm778995lfc.277.2023.07.07.12.39.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 12:39:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Fri,  7 Jul 2023 22:39:32 +0300
Message-Id: <20230707193942.3806526-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
References: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 01/11] drm/msm/dpu: drop enum
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

