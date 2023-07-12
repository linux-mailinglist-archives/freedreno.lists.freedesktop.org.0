Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6E64F751347
	for <lists+freedreno@lfdr.de>; Thu, 13 Jul 2023 00:11:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF05C10E5DB;
	Wed, 12 Jul 2023 22:11:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 001AF10E051
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jul 2023 22:11:42 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id
 38308e7fff4ca-2b6f943383eso122669651fa.2
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jul 2023 15:11:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689199901; x=1689804701;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZC0/5bXEsuHujngkcxb69wPizikqv0P8Uq9N9rSIaSc=;
 b=y6Aij3ypLT4DY9P0gTIiefxjzrnk6WuPzUxvlbcdt+U4RtC1LqcbZGMzhbYFc4UOjX
 OoU+VtQU4PzKzjdVinPZMePXPcapuODlz+6nGnAYdnmpOt6c7dMEkF0ZGkGmCABZ09Jt
 lzyqGvXLYmLQ+CTkiRxUKy7/rJ+dD9Lhw+M0SjawUldB280OvLZza21FCYmsOSRBpWOy
 eXWOk3f2uAzwV9odfEpOIMbGfVduRyJOCoaMFAOw3naC/lZVlzWI8Z6MjFCUXIsf0oT8
 /UsBC3TnZLC7yu3Iw0O9e8Ky4gJH9WdMfqDLtqdxFJPCEd1G91Wy/IhmDJS3MMnrs2af
 nSXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689199901; x=1689804701;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZC0/5bXEsuHujngkcxb69wPizikqv0P8Uq9N9rSIaSc=;
 b=QRzo1sgaZPj+Bv4OvzlcRouvkEmIyrutniwvrzXWdAvd4zgFbf7L0vkxxvRLtMBeSi
 72eK1GK8/tcfFweq1x3K8DEFgQhNuKWvGPo4CRYbCxEk7i/Me+XSxfnJiA+vB/d4L72O
 tQN9E7fWndldxClfnw+6q44G9QvoBvgmqlFGxl9ojwKMXEkkqDEEOz3mOkM1E/JvOSRQ
 c8DXv4mWhoIYZdJe6RaqOltV/cM9dkyiOxL3Klo9Htl7EJUkm7uDTaI9Rh9kPX0Xf8kZ
 Gk8z9dnUuEq+XYeJdvUNHSduAElFBcYBbfMFZB9bA4BG0JnaHXxMtONYTQZPHYWmi3qN
 EHQw==
X-Gm-Message-State: ABy/qLam4h/GH4pYZEIDBxbR66BqxsDk0WD+fCSo99mupA39V3RDOW2o
 Fzk2pjuClb6V5Ffvq2TgzNE3Sg==
X-Google-Smtp-Source: APBJJlFaw9K1LJyJZUnlJHZ0Fh4QWBPwE6TMCr//rkPpnfoKf4qUL3Ik4q3HAJhInGPAMO0PUEq3QA==
X-Received: by 2002:a05:6512:2351:b0:4fb:99c6:8533 with SMTP id
 p17-20020a056512235100b004fb99c68533mr20924345lfu.33.1689199901060; 
 Wed, 12 Jul 2023 15:11:41 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q16-20020ac25290000000b004f62fdf61fdsm856193lfm.204.2023.07.12.15.11.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 15:11:40 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 13 Jul 2023 01:11:29 +0300
Message-Id: <20230712221139.313729-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
References: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 01/11] drm/msm/dpu: drop enum
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

