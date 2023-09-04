Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id F2439790FD8
	for <lists+freedreno@lfdr.de>; Mon,  4 Sep 2023 04:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3D9BA10E27B;
	Mon,  4 Sep 2023 02:06:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1E3EB10E273
 for <freedreno@lists.freedesktop.org>; Mon,  4 Sep 2023 02:04:57 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2b9d07a8d84so12512331fa.3
 for <freedreno@lists.freedesktop.org>; Sun, 03 Sep 2023 19:04:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693793096; x=1694397896; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VHLsmawO8YJUbD7foYhvrS8ZuNZpxIJ9tps5XjxyA5M=;
 b=Rw+XsBbrADs9a9uCvRetxwmTnOHEudTLkndRGPAVepByoVqXt6XFZcbzspOPLU9OTp
 KOhrO19Hh9VqCqp8Rube3STpyq34qkwA6JhzrLyzxO2y3Oulxmecqq5g1IRrVMg99XyM
 GcTwtgpfnuoQvdCPbZGv9L28eeppWWgQ9gsX6qjOyXfNCayEESCK3zYyXpKDKAaKIGZe
 MtsjpktwJr6YpQjM+AGAj7clfTbor7ti3F17wC4/zy51aQVLkRC9ygRo0HVPl/OmeNYS
 Slck/tR1uWGwb7PuNCsQ7oHOCbD8w2icjiCSDQ1NBdAbw4wmvVbIzXEEyjCLI/dKZlpr
 R2Hg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693793096; x=1694397896;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VHLsmawO8YJUbD7foYhvrS8ZuNZpxIJ9tps5XjxyA5M=;
 b=jXjrUUkj+kYWRcHyZcmSew1RjWs+Ccrx4tvlQUv9hRWzZ76Yk3klLKhyJEf+loS1QR
 eaxn8N+W/wiaK/QX7ES2NyNdp/8KQ57xWeEGIn5pc1l/pY3SQkabcCVXiRXzQP5/9C3S
 KStGFAG8LWhQ3vP+rbLDW80Hu5FzfcJa31A1GLQs5FToC5TFnpnyaMFFbcMT+cgwfcAI
 LOZFqkQw3rLpU//TTFpKWpH9znW/iAhqkdEiWHbl0tr9HTmQj8dyfaunBdj0NH43c4Y/
 hhqPir4k7FHBQJBxCwMlDqGergovFiDM3l9Zu8/hAh+ONojr8jEr7QkfTA4z4vKxfsh5
 g9Vw==
X-Gm-Message-State: AOJu0YyCVpEgU7Lzx/E09ktIFEPsLnPAQv/2k5buxMWSjsuBf02MF/vw
 uKenWncnUPfTSAYJyEiVR5MhPQ==
X-Google-Smtp-Source: AGHT+IE+2Yfq4u0kqraestEWo6xIjCVBQAPimXZVSpTk8IG0P/wMEfJmC/oNd+wc9c9gApNKbSJjTg==
X-Received: by 2002:a2e:888f:0:b0:2b6:de52:357 with SMTP id
 k15-20020a2e888f000000b002b6de520357mr6156564lji.40.1693793095982; 
 Sun, 03 Sep 2023 19:04:55 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a2e9c4d000000b002bce0e9385asm1818237ljj.9.2023.09.03.19.04.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 19:04:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  4 Sep 2023 05:04:47 +0300
Message-Id: <20230904020454.2945667-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 1/8] drm/msm/dpu: inline _setup_pingpong_ops()
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

Inline the _setup_pingpong_ops() function, it makes it easier to handle
different conditions involving PINGPONG configuration.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c   | 39 ++++++++-----------
 1 file changed, 17 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 437d9e62a841..9298c166b213 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -281,27 +281,6 @@ static int dpu_hw_pp_setup_dsc(struct dpu_hw_pingpong *pp)
 	return 0;
 }
 
-static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
-				unsigned long features)
-{
-	if (test_bit(DPU_PINGPONG_TE, &features)) {
-		c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
-		c->ops.disable_tearcheck = dpu_hw_pp_disable_te;
-		c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
-		c->ops.get_line_count = dpu_hw_pp_get_line_count;
-		c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
-	}
-
-	if (test_bit(DPU_PINGPONG_DSC, &features)) {
-		c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
-		c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
-		c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
-	}
-
-	if (test_bit(DPU_PINGPONG_DITHER, &features))
-		c->ops.setup_dither = dpu_hw_pp_setup_dither;
-};
-
 struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
 		void __iomem *addr)
 {
@@ -316,7 +295,23 @@ struct dpu_hw_pingpong *dpu_hw_pingpong_init(const struct dpu_pingpong_cfg *cfg,
 
 	c->idx = cfg->id;
 	c->caps = cfg;
-	_setup_pingpong_ops(c, c->caps->features);
+
+	if (test_bit(DPU_PINGPONG_TE, &cfg->features)) {
+		c->ops.enable_tearcheck = dpu_hw_pp_enable_te;
+		c->ops.disable_tearcheck = dpu_hw_pp_disable_te;
+		c->ops.connect_external_te = dpu_hw_pp_connect_external_te;
+		c->ops.get_line_count = dpu_hw_pp_get_line_count;
+		c->ops.disable_autorefresh = dpu_hw_pp_disable_autorefresh;
+	}
+
+	if (test_bit(DPU_PINGPONG_DSC, &cfg->features)) {
+		c->ops.setup_dsc = dpu_hw_pp_setup_dsc;
+		c->ops.enable_dsc = dpu_hw_pp_dsc_enable;
+		c->ops.disable_dsc = dpu_hw_pp_dsc_disable;
+	}
+
+	if (test_bit(DPU_PINGPONG_DITHER, &cfg->features))
+		c->ops.setup_dither = dpu_hw_pp_setup_dither;
 
 	return c;
 }
-- 
2.39.2

