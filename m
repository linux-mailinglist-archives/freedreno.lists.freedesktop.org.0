Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B2622347B55
	for <lists+freedreno@lfdr.de>; Wed, 24 Mar 2021 16:00:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 774E86EC5D;
	Wed, 24 Mar 2021 15:00:49 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 37E236EC5C
 for <freedreno@lists.freedesktop.org>; Wed, 24 Mar 2021 15:00:48 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id y1so30574748ljm.10
 for <freedreno@lists.freedesktop.org>; Wed, 24 Mar 2021 08:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=d5O4S87sSonR8b8YReuDQ+tyO7OoPApI6qR6ZtyWtNo=;
 b=ag41z3TTI+1hBOp+V0y4TJVbNjU4P32YDILwsy7eFogpNU14hviu29k6mpVJXDa0/O
 ZAKTkSO145kL4WjVZSc3XzIoAaxYiPPZ9SMz/64GtrFp3ovjG38Rg4O8EBNaWk1O+0Kq
 XnnFzHB3jqgTkfQ2c2HL3O13OmbKf7NUiJ5OD4GXA62V6Dc4NA/ysda9maA2cIXl/Cm2
 cXXPSs+nzdrt7uH5OcNULCqokEROmZKlR1ekDxYlKzVsPEMJOphetpg0MvnjLar5EJBH
 3Q6jZjWbGGzkoihRkVXkCAHYbmYer8U2Wb1xszsMI0DsTJ+wCBHQKGudylwMsWa0fvsi
 9bag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=d5O4S87sSonR8b8YReuDQ+tyO7OoPApI6qR6ZtyWtNo=;
 b=QQyCii2cp3dHMzUm/IV4gIbL1bgX3rmQJ8P3fR2R2ABLnN4Vc56+00O0J/tkxtQu3n
 iYj8kDojnC+Vq+x18iJiB/uMjCQHAgJ5YWpY1xAHh+ilJgh79TCNUu+VQs3vE5I8rAUS
 +6XXoKeZcpPfkjtC8y4MP1JTo6c6YarCGn0nFINXdxXcHAM4YZC9W06PeShSaoYUBZMQ
 uVE3M28q67nDC7vYokeGW5hrvWVIoVkzuIFbMU5RuTfbDabTN/BUq+pfPCn1YaTigoTm
 2mlVo9dvYCRL318Qw58p8vyc9w9aGT0vszPrTnIEdtTgLe7TajvqpzIP30YqqCJILROR
 C4ZQ==
X-Gm-Message-State: AOAM531QxNFoNU5EU7cqxHzSRQQIKD9dyI338FLitYVvBkgVynwpVtmc
 y9Y4tRjM4dNJ3vQx+fQFKG8k3aIeJgyEOQ==
X-Google-Smtp-Source: ABdhPJxKAmSj+KeuEBTRDy807NV2uoHenAL8d/JKDr/XiRp5IT+zSvPM1S4LjmLY5sC2E0blLpRhcw==
X-Received: by 2002:a2e:6c10:: with SMTP id h16mr2397033ljc.388.1616598045961; 
 Wed, 24 Mar 2021 08:00:45 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id p5sm252463lfe.154.2021.03.24.08.00.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 24 Mar 2021 08:00:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Jonathan Marek <jonathan@marek.ca>
Date: Wed, 24 Mar 2021 18:00:16 +0300
Message-Id: <20210324150024.2768215-14-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
References: <20210324150024.2768215-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 13/21] drm/msm/dpu: hw_pp: make setup_dither
 mandatory
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

All supported hardware instances feature DPU_PINGPONG_DITHER option, so
just mark setup_dither as mandatory rather than optional callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c     | 3 ---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c | 3 +--
 2 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index f80694456fd6..ac03f329491d 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -217,9 +217,6 @@ static void _dpu_encoder_setup_dither(struct dpu_hw_pingpong *hw_pp, unsigned bp
 {
 	struct dpu_hw_dither_cfg dither_cfg = { 0 };
 
-	if (!hw_pp->ops.setup_dither)
-		return;
-
 	switch (bpc) {
 	case 6:
 		dither_cfg.c0_bitdepth = 6;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
index 89c1123d957f..5c1ce835cf49 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c
@@ -258,8 +258,7 @@ static void _setup_pingpong_ops(struct dpu_hw_pingpong *c,
 	c->ops.poll_timeout_wr_ptr = dpu_hw_pp_poll_timeout_wr_ptr;
 	c->ops.get_line_count = dpu_hw_pp_get_line_count;
 
-	if (test_bit(DPU_PINGPONG_DITHER, &features))
-		c->ops.setup_dither = dpu_hw_pp_setup_dither;
+	c->ops.setup_dither = dpu_hw_pp_setup_dither;
 };
 
 struct dpu_hw_pingpong *dpu_hw_pingpong_init(enum dpu_pingpong idx,
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
