Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 833DB2C0418
	for <lists+freedreno@lfdr.de>; Mon, 23 Nov 2020 12:20:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA6F589EB7;
	Mon, 23 Nov 2020 11:20:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5CA0788007
 for <freedreno@lists.freedesktop.org>; Mon, 23 Nov 2020 11:19:49 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id 1so16862981wme.3
 for <freedreno@lists.freedesktop.org>; Mon, 23 Nov 2020 03:19:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=gKoITWdb0NAA2TK8pxTD/cxHUBVgW9vDIRLy1VQg+s8=;
 b=CCyxnCMqaD6iY/pHwlqr9sW8pQD8avE8KqZDp/baOaadch63BqfnmFUxC2u2xSnwXi
 JdKYp2wkcbJrzPIfpMoT6gtkHiai7DA2fnb3Ws2X24klPs4fyBX4jEyX8ZxxPfqHxDG+
 Vr1ZKgJ15buJstTI+jCKRRnmDMwLjmqcWMNXvRDm4BreDc2ty++tMdtvs82ZJINBUEyi
 /v+3eNY7PEWmWw5QzyOxBTpZ++zFTFv8a4GFEiy9xHCHE5PwKDw74pGHOziGcFNx47bV
 7AjL24ldFFtcp5lNCyqo/6Y0Rf44GruO/z3TIyADZ2Tn8lmp7g9LNdt96ZB5rZUly6Ld
 Im/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=gKoITWdb0NAA2TK8pxTD/cxHUBVgW9vDIRLy1VQg+s8=;
 b=g9NJFTzI6Cdn6j9v3r0dVK+0RVDkCXBfvC2eSUdgSgqEIEIZs6rokg5hsDIQITS+yM
 CCXJBiExCVcCTwiKe9F7kBoB/KCu6XrdYVA8prQ+i+M9PcWXsa1r6mzzE0/WizkWyhD7
 nxF5JOrLKNvEao2W659/KhbN72AmZAqhc9VA3R4nWYTSvrZGNkwfIWKGgDzX8XrpjKuy
 0TydjileQNzPcZv05q+97uJrjkntcZ0CDdz7+OTQY3iJ56x2nMvx/6Gs6QmhVjq1RsG2
 Dp1Fn4eLqgZWkPvxnqPVCJhgvsCLT9pggMkxuZyj2YabGaR0+qYupY5EuN8TzFghzk1m
 6grQ==
X-Gm-Message-State: AOAM532NuuiGNbcVm1365GmCUnA486De6R3GmtuZsLCTC6sWMvcJ20li
 Nf7x8Q64FBFhwlX7BopxqYD75A==
X-Google-Smtp-Source: ABdhPJwFR9JH8+waSGmVuFK54gn5FZd4IubjIUGmE3hzei8uwpKEfY8VjOTl1bSxhPdXOJ9MukO0MQ==
X-Received: by 2002:a1c:1bcb:: with SMTP id
 b194mr23539889wmb.139.1606130388099; 
 Mon, 23 Nov 2020 03:19:48 -0800 (PST)
Received: from dell.default ([91.110.221.218])
 by smtp.gmail.com with ESMTPSA id n9sm16317290wmd.4.2020.11.23.03.19.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Nov 2020 03:19:47 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Mon, 23 Nov 2020 11:18:59 +0000
Message-Id: <20201123111919.233376-21-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201123111919.233376-1-lee.jones@linaro.org>
References: <20201123111919.233376-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 20/40] drm/msm/disp/dpu1/dpu_hw_sspp: Fix
 kernel-doc formatting abuse
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
Cc: freedreno@lists.freedesktop.org, Jonathan Marek <jonathan@marek.ca>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:240: warning: Function parameter or member 'ctx' not described in 'dpu_hw_sspp_setup_format'
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:240: warning: Function parameter or member 'fmt' not described in 'dpu_hw_sspp_setup_format'
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:240: warning: Function parameter or member 'flags' not described in 'dpu_hw_sspp_setup_format'
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:240: warning: Function parameter or member 'rect_mode' not described in 'dpu_hw_sspp_setup_format'
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:446: warning: Function parameter or member 'ctx' not described in 'dpu_hw_sspp_setup_rects'
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:446: warning: Function parameter or member 'cfg' not described in 'dpu_hw_sspp_setup_rects'
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c:446: warning: Function parameter or member 'rect_index' not described in 'dpu_hw_sspp_setup_rects'

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Jonathan Marek <jonathan@marek.ca>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index c940b69435e16..2c2ca5335aa8c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -231,7 +231,7 @@ static void _sspp_setup_csc10_opmode(struct dpu_hw_pipe *ctx,
 	DPU_REG_WRITE(&ctx->hw, SSPP_VIG_CSC_10_OP_MODE + idx, opmode);
 }
 
-/**
+/*
  * Setup source pixel format, flip,
  */
 static void dpu_hw_sspp_setup_format(struct dpu_hw_pipe *ctx,
@@ -437,7 +437,7 @@ static u32 _dpu_hw_sspp_get_scaler3_ver(struct dpu_hw_pipe *ctx)
 	return dpu_hw_get_scaler3_ver(&ctx->hw, idx);
 }
 
-/**
+/*
  * dpu_hw_sspp_setup_rects()
  */
 static void dpu_hw_sspp_setup_rects(struct dpu_hw_pipe *ctx,
-- 
2.25.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
