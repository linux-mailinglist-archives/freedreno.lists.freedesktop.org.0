Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9F89C87B59C
	for <lists+freedreno@lfdr.de>; Thu, 14 Mar 2024 01:02:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D10310E9A9;
	Thu, 14 Mar 2024 00:02:32 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eLig0BNf";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f47.google.com (mail-lf1-f47.google.com
 [209.85.167.47])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CBB410EBF1
 for <freedreno@lists.freedesktop.org>; Thu, 14 Mar 2024 00:02:31 +0000 (UTC)
Received: by mail-lf1-f47.google.com with SMTP id
 2adb3069b0e04-51331634948so1367300e87.0
 for <freedreno@lists.freedesktop.org>; Wed, 13 Mar 2024 17:02:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1710374549; x=1710979349; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PAS0pluJVyXsp6jVYhZTGdSQ3udV3IrTqeal2WShYuU=;
 b=eLig0BNfPlO7U36ESS2NzbaZ+nm1FDAOujTApnP555CYqholE+gdSEZkfRTMAQDqK+
 cF3cAKvz18H3WVGIFOa0kyrc1jDN5whzkX9i0z/hwoDRMNUqep1jha7LKkamuckYTM7w
 GBHl01GFpjfW6BrRU2yGVcARa1ZxDKKq6I95uIQ/g5Oa9Dv9vLgOGZMU3ctq9/MUD1hd
 vV4aDYPeypqu7VqgNTh8JT6ImgArwQ3d4Wnrco+94oCHAyu9aWZ19KHkXU9WtgaPvkSk
 geaC3SkJBhIOVC/sQW2E+kqtuv61L2BlzgPHfNr/n96zn4VvZ6yJXpY4XJXiluHSiemS
 b+tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1710374549; x=1710979349;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PAS0pluJVyXsp6jVYhZTGdSQ3udV3IrTqeal2WShYuU=;
 b=rrs40hjz3SmE062H2aEzxMxwyP4KkYUAuwkHpCJklwOwFTvyrKB97KUReQP5AzsKy4
 g2UddR0ci+h+oPQdfiDx2nz3+wguAeIYXevwnchEyn1OqUsGfiHMVmcwMP8gyAQIk91n
 0pnWcfoZeQk47d1gXxPsJvTpiAQCLvBdW7v8zxD4RqjmoHyUaFpUDiNTfwDNbQV6Ttog
 GppHkT+8yHhrfvQyHBJT/jQdOGjm5Bh5EdSknT2G+PnIiZb34R6amhOydl2XpzoVBN0z
 WJ7VHyOxi41HlWwrpia4IT8UTL2snscYANZdVB2hhnSgYxzruscxYQdyatdzfUyE0RXE
 3Elw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXqUCx/j2lBd1HRzlG/BU2hBSMCLiAtKETf+S5nPLsMc37Z8nIbt2VVGltPhG3weIekNrJ8n384My4w6ujYROIRF2HSpKRNJaQ9Hb4wJyTT
X-Gm-Message-State: AOJu0YwU/rouv1yTl+NuTrgGF9fPr+eG+qQdPtrZftjMn+iwL2T1V7XI
 mvyhJE5uMkwKuW8gD5SxHaNcf7LyH7GYAERk+zAvG9BvehEcAzfBaiRwFYL19i8=
X-Google-Smtp-Source: AGHT+IEdie8MACkhAj7NV2jIC3MvktUrsBN4mHTmfGXCaNUNwtX842uUnkuTTJA+Vg3GTr7xjJ8Yfg==
X-Received: by 2002:a19:9109:0:b0:513:cdde:2f6 with SMTP id
 t9-20020a199109000000b00513cdde02f6mr308457lfd.32.1710374549755; 
 Wed, 13 Mar 2024 17:02:29 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x5-20020a19e005000000b00513360ebd22sm46111lfg.118.2024.03.13.17.02.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 13 Mar 2024 17:02:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Cc: Stephen Boyd <swboyd@chromium.org>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Bjorn Andersson <andersson@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
Subject: [PATCH v4 13/13] drm/msm/dpu: include SSPP allocation state into the
 dumped state
Date: Thu, 14 Mar 2024 02:02:16 +0200
Message-Id: <20240314000216.392549-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
References: <20240314000216.392549-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Make dpu_rm_print_state() also output the SSPP allocation state.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 7264a4d44a14..7997df340f72 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -890,4 +890,11 @@ void dpu_rm_print_state(struct drm_printer *p,
 	dpu_rm_print_state_helper(p, rm->cdm_blk,
 				  global_state->cdm_to_enc_id);
 	drm_puts(p, "\n");
+
+	drm_puts(p, "\tsspp=");
+	/* skip SSPP_NONE and start from the next index */
+	for (i = SSPP_NONE + 1; i < ARRAY_SIZE(global_state->sspp_to_crtc_id); i++)
+		dpu_rm_print_state_helper(p, rm->hw_sspp[i] ? &rm->hw_sspp[i]->base : NULL,
+					  global_state->sspp_to_crtc_id[i]);
+	drm_puts(p, "\n");
 }
-- 
2.39.2

