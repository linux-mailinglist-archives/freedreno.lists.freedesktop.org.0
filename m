Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DAF50350C37
	for <lists+freedreno@lfdr.de>; Thu,  1 Apr 2021 04:05:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A675B6EC08;
	Thu,  1 Apr 2021 02:05:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 587A66EC07
 for <freedreno@lists.freedesktop.org>; Thu,  1 Apr 2021 02:05:36 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id u10so505850lju.7
 for <freedreno@lists.freedesktop.org>; Wed, 31 Mar 2021 19:05:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EZtsCVis+vCjte+rmZOhgHYRoursgoalpacTDNYwKSU=;
 b=AuhdP2R2Moo+S96ZpsVcPCs4in4KziUI94OX/i/z7/t5DFG3QhrEepUOwZ80rrUyaO
 EYk5rvKxitPK34AlnjIgX0TKVdyOQHjrogBSfKEY+PBYmJQQ9US/UZo0YikARYf16uzS
 0f89SpLDx/9bYN94C6kZS3Raqlt2rgkM7MVOebFWCvHp/bMnKUqJYPdeKIa2RKwvu/Wt
 uX6GBeeFWYAVep5kkc4eekuDzAMLs2uPaiare1adk9jp7vyUhpGaPV9xRQ3LXOUFrKXf
 VhX8mLEHppg/5cjYWowUlJ3HZryGPNA7ySpGoEruV5Jf8wVlRVT92ZBPzyiP6bEF7r+N
 pIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=EZtsCVis+vCjte+rmZOhgHYRoursgoalpacTDNYwKSU=;
 b=ekthkCFOZ7xq8KjQFcpzXKs2+AsZlNwyb3b9wJYkh1ostOVUh+lf4nU82Kp3lfxE+o
 VJ/I1sQfLTxhk1Dts15nhRyUXLNdQsKeMIcneBmBI2yjad2pIfRkj3bgwJ1Ck2+FPKdL
 nrcIaTNIQ071oPXI0EsA4lCWg+v5TwOAiBSBSnohSgq6RH0PzSZRMUfb/JrPZKHxq0MO
 C6WnEJ35wh01gAcF8W+ol12Ki3vGPvZtsrEQA3m1owfNwPvifTojS49ecJS7epQpZpXO
 PeKwqiff+my8OZPW9cpUwQUES+j7o43svNw467SrKkt/Op+DIYM4Igl+P3Vq8WMn13KA
 hPHQ==
X-Gm-Message-State: AOAM532xRov+r/RLX1NprsvZcCb/T+XFHGS4BboNn1xGC9YGv9M2KAJ6
 ye5g48bZ1eY7TezPUN3OYxkKrg==
X-Google-Smtp-Source: ABdhPJy5PxNWydH7fLY0kC7t95rY7/ayVoIh7aNdXILLjXm5rycoMMusE+DLpId/b39dzleHQ7+Hrw==
X-Received: by 2002:a05:651c:211e:: with SMTP id
 a30mr4141129ljq.18.1617242734705; 
 Wed, 31 Mar 2021 19:05:34 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id l4sm383635lfg.123.2021.03.31.19.05.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 31 Mar 2021 19:05:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Date: Thu,  1 Apr 2021 05:05:32 +0300
Message-Id: <20210401020533.3956787-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 1/2] drm/msm/dpu: fill missing details in hw
 catalog for sdm845 and sm8[12]50
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Fill clk_inefficiency_factor, bw_inefficiency_factor and
min_prefill_lines in hw catalog data for sdm845 and sm8[12]50.

Efficiency factors are blindly copied from sc7180 data, while
min_prefill_lines is based on downstream display driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 189f3533525c..a9f74c1177dd 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -817,6 +817,8 @@ static const struct dpu_perf_cfg sdm845_perf_data = {
 		{.rd_enable = 1, .wr_enable = 1},
 		{.rd_enable = 1, .wr_enable = 0}
 	},
+	.clk_inefficiency_factor = 105,
+	.bw_inefficiency_factor = 120,
 };
 
 static const struct dpu_perf_cfg sc7180_perf_data = {
@@ -852,6 +854,7 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
 	.min_core_ib = 2400000,
 	.min_llcc_ib = 800000,
 	.min_dram_ib = 800000,
+	.min_prefill_lines = 24,
 	.danger_lut_tbl = {0xf, 0xffff, 0x0},
 	.qos_lut_tbl = {
 		{.nentry = ARRAY_SIZE(sm8150_qos_linear),
@@ -869,6 +872,8 @@ static const struct dpu_perf_cfg sm8150_perf_data = {
 		{.rd_enable = 1, .wr_enable = 1},
 		{.rd_enable = 1, .wr_enable = 0}
 	},
+	.clk_inefficiency_factor = 105,
+	.bw_inefficiency_factor = 120,
 };
 
 static const struct dpu_perf_cfg sm8250_perf_data = {
@@ -877,6 +882,7 @@ static const struct dpu_perf_cfg sm8250_perf_data = {
 	.min_core_ib = 4800000,
 	.min_llcc_ib = 0,
 	.min_dram_ib = 800000,
+	.min_prefill_lines = 35,
 	.danger_lut_tbl = {0xf, 0xffff, 0x0},
 	.qos_lut_tbl = {
 		{.nentry = ARRAY_SIZE(sc7180_qos_linear),
@@ -894,6 +900,8 @@ static const struct dpu_perf_cfg sm8250_perf_data = {
 		{.rd_enable = 1, .wr_enable = 1},
 		{.rd_enable = 1, .wr_enable = 0}
 	},
+	.clk_inefficiency_factor = 105,
+	.bw_inefficiency_factor = 120,
 };
 
 /*************************************************************
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
