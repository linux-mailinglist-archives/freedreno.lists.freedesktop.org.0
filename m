Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80DFC4B0C8D
	for <lists+freedreno@lfdr.de>; Thu, 10 Feb 2022 12:41:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0AA6A10E813;
	Thu, 10 Feb 2022 11:41:28 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from dfw.source.kernel.org (dfw.source.kernel.org
 [IPv6:2604:1380:4641:c500::1])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C70CB10E813;
 Thu, 10 Feb 2022 11:41:26 +0000 (UTC)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
 (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
 (No client certificate requested)
 by dfw.source.kernel.org (Postfix) with ESMTPS id 4066361D1F;
 Thu, 10 Feb 2022 11:41:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325A5C340F0;
 Thu, 10 Feb 2022 11:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
 s=k20201202; t=1644493285;
 bh=/OutVh/eSlM2D8L/jMfWJxxmWG0tTyYf7k89K741aNo=;
 h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
 b=rl5jqfj6jAysGYxqiYPgAg6AcYBKVWA+be7zn8KTweo4BrfXSQEzU4cTA5bdnlpOU
 6XPvLHgV6Sb5vXd+896oDooDKmf28WoBQXSXnvY3+c6B+TKEaGbaGLCfnCpWF+faOQ
 Se4X4Fghg5RP0+GcYjv8frytkY6c9V+63tYTqgN33LHXIFlFM2BomvD40Ku5h4MeL6
 75FDh+UaW5i4vdBD4CQgJTwpJxOTjGMk5lmbP6jhG6YBBgXqtH0oTnQ8s2jKWMQG8i
 bycVXyrcOQZ3RhAQ/XKHHb7oDDAmstJzrlyXlBGp2SUiaeI/dwvcNOhAuBRKzx+76P
 wOrOqJwyVq+pQ==
From: Vinod Koul <vkoul@kernel.org>
To: Rob Clark <robdclark@gmail.com>
Date: Thu, 10 Feb 2022 17:11:06 +0530
Message-Id: <20220210114106.290669-3-vkoul@kernel.org>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20220210114106.290669-1-vkoul@kernel.org>
References: <20220210114106.290669-1-vkoul@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 3/3] drm/msm/dpu: Update function parameter
 documentation
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 Guenter Roeck <linux@roeck-us.net>, Mark Yacoub <markyacoub@google.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

dpu_core_irq_callback_handler() function comments seem to have become
stale and emit a warning:

drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:147:
warning: Function parameter or member 'dpu_kms' not described in 'dpu_core_irq_callback_handler'
drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:147:
warning: Excess function parameter 'arg' description in 'dpu_core_irq_callback_handler'

Fix by updating the documentation

Signed-off-by: Vinod Koul <vkoul@kernel.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 9341c88a336f..27073fd49fee 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -140,7 +140,7 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
 
 /**
  * dpu_core_irq_callback_handler - dispatch core interrupts
- * @arg:		private data of callback handler
+ * @dpu_kms:		Pointer to DPU's KMS structure
  * @irq_idx:		interrupt index
  */
 static void dpu_core_irq_callback_handler(struct dpu_kms *dpu_kms, int irq_idx)
-- 
2.31.1

