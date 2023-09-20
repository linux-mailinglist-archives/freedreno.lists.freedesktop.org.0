Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A55B7A8F97
	for <lists+freedreno@lfdr.de>; Thu, 21 Sep 2023 00:46:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DECB010E54C;
	Wed, 20 Sep 2023 22:46:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62a.google.com (mail-ej1-x62a.google.com
 [IPv6:2a00:1450:4864:20::62a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5DD210E545
 for <freedreno@lists.freedesktop.org>; Wed, 20 Sep 2023 22:46:10 +0000 (UTC)
Received: by mail-ej1-x62a.google.com with SMTP id
 a640c23a62f3a-99c93638322so55636566b.1
 for <freedreno@lists.freedesktop.org>; Wed, 20 Sep 2023 15:46:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695249969; x=1695854769; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fEG5QbTle/wsryhp0cJXy9R4gVUkkTUcGpE6xI5qCmE=;
 b=Y5ZKV/7O5xzf7ASNj4uF7F2zqoqix9Mk1ZDlFXcwh6ASHM32tmD3/0ONV3RJn9gi4m
 TcVmcobxrSTJ76LG6s/24LxnmyLSY9f7bhmH5lyIHIVZZZNBLMBaWyU5mJ8ewxhCCutD
 x5XOrBw/uKSj5spwR2cfvsLYgxfJ8+2bb8QYfZfp94RhmM6yiO54LVRDC4+9yitfai5d
 osxmpoT5cQ2UPrP/ceAJkUtpknEnjNJvg9CUyCkkPsL69T0/4ixgQx/lPRVsEj7vJM0M
 4OZvGUbd/guv/fMm6HjpS2dGM5ujEzwYdMNT4KTqFe9o05mwXGuCNuSsuLuoQZgtSIn3
 EoGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695249969; x=1695854769;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fEG5QbTle/wsryhp0cJXy9R4gVUkkTUcGpE6xI5qCmE=;
 b=XL0bDi7exwsi9ErThJWYoDpBw+aym4mmqdp4te6/dR8/1Wy7k5CmeSEVfSCFDjzprU
 m+WHrjWT3PGF1xdUyFqeJFvA/kzoXZpRA2LaCX2bVZnBRWvpFUwpwfG30lDNVKZ0KVvo
 cNEHrO+B7yHSMPlVgyawACepAzd6FpIQALkl078h9ouRmPJkJA9ppzHdsDUUvLFn+sbd
 tDEDx1khS2elsYqfSf5F3ZqQ3UWcIcN7x1iVUt8/atQIi42zObYvHOGkD7m5yMacj+02
 pcfGfFCvwgQNM1lkZYQWVVQdoGBDdf372H8rRAhKoyWshRS8Fo/oRXsmSY/ibSq71mOh
 Wzbw==
X-Gm-Message-State: AOJu0YxwITE7rxInyhbp3G43QfaBdC/2pkSudYgYRGjuH4+Oae0Bgg1d
 wtHDZEO+dpRdRW6qtFzF0Eb0yw==
X-Google-Smtp-Source: AGHT+IHA8VMEhO4O0eEpANFMtvmSJUNJ62SQx1MRheCQmJMRfCP3X2rdlzItwdFMdHhxB9Yv2ZNubQ==
X-Received: by 2002:a17:906:739a:b0:9ae:37d9:8043 with SMTP id
 f26-20020a170906739a00b009ae37d98043mr5990977ejl.31.1695249969069; 
 Wed, 20 Sep 2023 15:46:09 -0700 (PDT)
Received: from [127.0.1.1] ([217.67.225.27]) by smtp.gmail.com with ESMTPSA id
 z23-20020a170906435700b00992f309cfe8sm118285ejm.178.2023.09.20.15.46.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Sep 2023 15:46:08 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Thu, 21 Sep 2023 00:46:06 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230921-topic-7280_dpu-v1-1-6912a97183d5@linaro.org>
References: <20230921-topic-7280_dpu-v1-0-6912a97183d5@linaro.org>
In-Reply-To: <20230921-topic-7280_dpu-v1-0-6912a97183d5@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Kuogee Hsieh <quic_khsieh@quicinc.com>
X-Mailer: b4 0.13-dev-0438c
Subject: [Freedreno] [PATCH 1/3] drm/msm/dpu: Fix SC7280 PP length
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

Commit 194347df5844 ("drm/msm/dpu: inline DSC_BLK and DSC_BLK_1_2
macros") unrolled a macro incorrectly. Fix that.

Fixes: 194347df5844 ("drm/msm/dpu: inline DSC_BLK and DSC_BLK_1_2 macros")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
index 3b5061c4402a..dc3198335164 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h
@@ -126,7 +126,7 @@ static const struct dpu_dspp_cfg sc7280_dspp[] = {
 static const struct dpu_pingpong_cfg sc7280_pp[] = {
 	{
 		.name = "pingpong_0", .id = PINGPONG_0,
-		.base = 0x69000, .len = 0,
+		.base = 0x69000, .len = 0xd4,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = 0,
@@ -134,7 +134,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_1", .id = PINGPONG_1,
-		.base = 0x6a000, .len = 0,
+		.base = 0x6a000, .len = 0xd4,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = 0,
@@ -142,7 +142,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_2", .id = PINGPONG_2,
-		.base = 0x6b000, .len = 0,
+		.base = 0x6b000, .len = 0xd4,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = 0,
@@ -150,7 +150,7 @@ static const struct dpu_pingpong_cfg sc7280_pp[] = {
 		.intr_rdptr = -1,
 	}, {
 		.name = "pingpong_3", .id = PINGPONG_3,
-		.base = 0x6c000, .len = 0,
+		.base = 0x6c000, .len = 0xd4,
 		.features = BIT(DPU_PINGPONG_DITHER),
 		.sblk = &sc7280_pp_sblk,
 		.merge_3d = 0,

-- 
2.39.2

