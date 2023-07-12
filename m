Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C95275134B
	for <lists+freedreno@lfdr.de>; Thu, 13 Jul 2023 00:11:54 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8CB410E5E3;
	Wed, 12 Jul 2023 22:11:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC8E010E5D9
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jul 2023 22:11:44 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2b6ff1a637bso122439871fa.3
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jul 2023 15:11:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689199902; x=1689804702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ln26l+vUCSi4edYTgivRAGgTHzh3pendnmUbrCgVtyc=;
 b=eUQJCuEGxoNyAgK0GQU7bsh0VzSVckuvMBafrWEJstVAupgtuOL7xp0UCV8AY/Bvy/
 N3X7xcBUHIMr7x/hwSHsippDRjIZV6TboLIDmIWlVnDlX0Qbsj/q28ydHIVcT6rEVrkQ
 d1jBsCMk7totRPk0u+TsWmUfTut317VYbAypkURiykvzGHNw7EnEueJ2SQJ3n4O7Kp1k
 M/G2TjTWHkyTkeQUtzV0QguF4wm+h3fY1MLeYby8b0mc4IYmrj8scuD+//ehPL/N6V9Z
 v3qBwC7usWB7s3av551I0iJjUhCd8RGSNj6XWOtYLtpX8O7FF4kS7eoYwK9x9i+VLmYf
 xHdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689199902; x=1689804702;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ln26l+vUCSi4edYTgivRAGgTHzh3pendnmUbrCgVtyc=;
 b=Sm55Jm5jyn96qhYHU6CYmdAeSjjmN3XeduaDSqrlZbhkGPQCfH9gr9bXliSQ8TJplh
 nnbcOEZlA0nM9OR3N7ZepVsuSDBGcuBXcvV/kHDJkF3CDnXu7RUoVOd84QJr01sHuqiw
 MDsubeGJo10Rj6ufLb5N3NV3bX3mF8pWtUkL0VD1fRJRboywa4aJdU5R2967GLhQItQr
 KAMcu6jTqGCffy57eKBbkfeRK/By4XHKyUcf1HaTLe/J7kUxr7MRteoF3SRMiUdyFlLX
 mktqtlOmVVRE8gRS7BQ7mJip3XmOdPuDHkEVMy2zzg+QmPv3eLkyWa/1CrgxOsqCVYmG
 aHKw==
X-Gm-Message-State: ABy/qLZITQ01wv8DdX7rK62r4eOsXHAkwYD2P4zVwhVKrBYwYjlTc4dZ
 KtoHmZZY2h97Fr42LGLwjyQrdA==
X-Google-Smtp-Source: APBJJlHAcG8o4Mk5Otmnqxt/jCoQlHMizSXykFGZPee/W038aHNo+Hqo6dCCDHs5kBHu5cGYiOPtAQ==
X-Received: by 2002:a19:6504:0:b0:4fb:8b78:4a93 with SMTP id
 z4-20020a196504000000b004fb8b784a93mr1712790lfb.7.1689199902781; 
 Wed, 12 Jul 2023 15:11:42 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q16-20020ac25290000000b004f62fdf61fdsm856193lfm.204.2023.07.12.15.11.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 15:11:42 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 13 Jul 2023 01:11:31 +0300
Message-Id: <20230712221139.313729-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
References: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 03/11] drm/msm/dpu: core_perf: bail earlier
 if there are no ICC paths
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
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Skip bandwidth aggregation and return early if there are no interconnect
paths defined for the DPU device.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index 333dcfe57800..05d340aa18c5 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -237,11 +237,11 @@ static int _dpu_core_perf_crtc_update_bus(struct dpu_kms *kms,
 	int i, ret = 0;
 	u64 avg_bw;
 
-	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
-
 	if (!kms->num_paths)
 		return 0;
 
+	dpu_core_perf_aggregate(crtc->dev, dpu_crtc_get_client_type(crtc), &perf);
+
 	avg_bw = perf.bw_ctl;
 	do_div(avg_bw, (kms->num_paths * 1000)); /*Bps_to_icc*/
 
-- 
2.39.2

