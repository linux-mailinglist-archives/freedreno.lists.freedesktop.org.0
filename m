Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E650F708DF0
	for <lists+freedreno@lfdr.de>; Fri, 19 May 2023 04:39:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CC6710E5AC;
	Fri, 19 May 2023 02:39:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 069F210E5A6
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 02:39:03 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2ac785015d7so28936291fa.1
 for <freedreno@lists.freedesktop.org>; Thu, 18 May 2023 19:39:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684463942; x=1687055942;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rPNIghn0XJ0SWng+xegh98pXn9OmFxCxXfcggZ3NhzM=;
 b=jqUgEDdUvBcFOs9vGVrg03sl8GtF2kSA8wpm10ccG9YYnxyTrpQBo/xCvtqa2BfkM8
 eDYaX2Jju9nSGmRrrTpadplPcQNLETSoLOBq9cg+aFIsaOnnZSgo7dlhUR28mM3mmjYq
 4n6Ld2B02aGJcahT8Dfn7fzgwfYiqqKDIeC0UnhtOeVPjeHzYSckT9I+3wcDfRyQw3Vq
 xDkQ0tOjxHVlxL8HSxhPhAgcQEHlzjlNbAVFFXQx/jqrNrVCvY0KhenZ1N8HREzEjwT0
 YrooHGHKbRI8Z5fNi1yCK9HhBg6nDNKsZ7RQIErxALRyd/ewPFdE6/m2sg33LVjArfDI
 DvwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684463942; x=1687055942;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rPNIghn0XJ0SWng+xegh98pXn9OmFxCxXfcggZ3NhzM=;
 b=BkrdajrARsQ4h8AVcy+A0gicoYsNMzLRTcWDt2D5HGgNWyqUOFXBc3EPE1LWqM+O/u
 yXPONIjoDYCwBynBx4Zk3oRH1npZw7OYzLkwIE2r+3UUBnanAlAwTxhTDvC0vlHaNw9O
 QvWFb5Wo9hEEK3xSHnxiVWJtUqL3hONV9PeMiqkP8DZlYXMLMWgBTl9zisw4XnoXPrNH
 8889SlKu+N60+pv4xy48+/HkeWyCvEBchZYShv/uqYONJW7EQPYHyZV4peb03NjmZ1zq
 oNJ6ksAQRnBQDKgeFmQtka1x/FQ5oUt0UgLiq1gyHfvoTdQbk7DcE0HvJzVkDqn/geYR
 06TQ==
X-Gm-Message-State: AC+VfDydOCyXQlfZYtXr2HnAj+aw3GjAZnO5DwdmqSNggKn/6PFt3JrV
 N+l7xMpCfu919/jEIB4rsBIsQw==
X-Google-Smtp-Source: ACHHUZ5xrh422ZzI+xsoIKNhJW8/H9x5HQ4BGByJmrKc2iqsPa/8/rV61bJ/e8r3SUISaA4huTT1DQ==
X-Received: by 2002:a2e:3603:0:b0:2ad:98a6:4af0 with SMTP id
 d3-20020a2e3603000000b002ad98a64af0mr131239lja.23.1684463942246; 
 Thu, 18 May 2023 19:39:02 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a2e2c0f000000b002af25598ef9sm25906ljs.0.2023.05.18.19.39.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 19:39:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri, 19 May 2023 05:38:55 +0300
Message-Id: <20230519023855.3840907-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org>
References: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 7/7] drm/msm/dpu: simplify
 dpu_encoder_phys_wb_init()
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

There is no need to assign a result to temp varable just to return it
after a goto. Drop the temporary variable and goto and return the result
directly.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c | 10 ++--------
 1 file changed, 2 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
index 6608c00e3c33..e9325cafb1a8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c
@@ -684,21 +684,18 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
 {
 	struct dpu_encoder_phys *phys_enc = NULL;
 	struct dpu_encoder_phys_wb *wb_enc = NULL;
-	int ret = 0;
 
 	DPU_DEBUG("\n");
 
 	if (!p || !p->parent) {
 		DPU_ERROR("invalid params\n");
-		ret = -EINVAL;
-		goto fail_alloc;
+		return ERR_PTR(-EINVAL);
 	}
 
 	wb_enc = kzalloc(sizeof(*wb_enc), GFP_KERNEL);
 	if (!wb_enc) {
 		DPU_ERROR("failed to allocate wb phys_enc enc\n");
-		ret = -ENOMEM;
-		goto fail_alloc;
+		return ERR_PTR(-ENOMEM);
 	}
 
 	phys_enc = &wb_enc->base;
@@ -715,7 +712,4 @@ struct dpu_encoder_phys *dpu_encoder_phys_wb_init(
 	DPU_DEBUG("Created dpu_encoder_phys for wb %d\n", phys_enc->hw_wb->idx);
 
 	return phys_enc;
-
-fail_alloc:
-	return ERR_PTR(ret);
 }
-- 
2.39.2

