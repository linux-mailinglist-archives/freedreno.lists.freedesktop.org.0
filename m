Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 10B0A25A10E
	for <lists+freedreno@lfdr.de>; Tue,  1 Sep 2020 23:59:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C67BD6E0C4;
	Tue,  1 Sep 2020 21:59:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x642.google.com (mail-pl1-x642.google.com
 [IPv6:2607:f8b0:4864:20::642])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12D746E0C4
 for <freedreno@lists.freedesktop.org>; Tue,  1 Sep 2020 21:59:46 +0000 (UTC)
Received: by mail-pl1-x642.google.com with SMTP id k13so1223402plk.13
 for <freedreno@lists.freedesktop.org>; Tue, 01 Sep 2020 14:59:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=yyHMLM4ELnE5TBLINkhsx/ZOVL6DEfANxYCpgeB+3ig=;
 b=KqeOaddw0AfZ2GYLkBfVZzt+5xX3DH+bRc8mRKnuHFvU2QprnK/RboHxIyhnRrOFo5
 ze6fnI+TGS5qcwk37ySRDIq9F52AnduHRqbazGPz5qi0XY1RIxerNTytyTZ9LgNJQGwH
 nQHwvSwhZvqL0EWuiF+c1ZhwgHwjOYWt8SwTs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=yyHMLM4ELnE5TBLINkhsx/ZOVL6DEfANxYCpgeB+3ig=;
 b=XHUrg3ARyp3YSR5rP96orO3OldQRGzhAxwJZzW/FcZmcMzfDumq/H9B1yTY+crMyBa
 C17F53aCwfo8zFXYpHnQTIyGQtqr9yE7lKhGjhmA57ir27k1Qdf2KU6TLlQzyIfx57/b
 ViLW++8ePCkmAb2swU68aof7nyp4+E3hdX0Xdqw9labyquea+k2lupRUubgwWFr3a3iR
 LBuZCGmCf44Rx/QyktVeBcTtxSqtJCVXVg1sDkeOVKf4N1ZE6emMaiKmSAN1qP9zqg0j
 CKwUl3HnzodSHrsl2jz4CfIzT1Y6DUBHz1X9tdGhHPWmjoPvfiCL0WxCMZUdRrN8UcDB
 +SCw==
X-Gm-Message-State: AOAM5317SOO7JfwrA8ocZgEblRtmByGt4Pzc6jiMAGCmIqA28g/rYAQp
 9u4cuh1nicNoZbCwRNulxastqA==
X-Google-Smtp-Source: ABdhPJygyY7debsqFH8WtQ3Zg2VOGcIsIKr04QOPYsplwKI/0izan3soYosz9Lol7HtneM2yH/v8rw==
X-Received: by 2002:a17:90b:95:: with SMTP id
 bb21mr3454393pjb.68.1598997585709; 
 Tue, 01 Sep 2020 14:59:45 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:1:3e52:82ff:fe6c:83ab])
 by smtp.gmail.com with ESMTPSA id q5sm3044037pfu.16.2020.09.01.14.59.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Sep 2020 14:59:45 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>
Date: Tue,  1 Sep 2020 14:59:42 -0700
Message-Id: <20200901215942.2559119-3-swboyd@chromium.org>
X-Mailer: git-send-email 2.28.0.402.g5ffc5be6b7-goog
In-Reply-To: <20200901215942.2559119-1-swboyd@chromium.org>
References: <20200901215942.2559119-1-swboyd@chromium.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 2/2] drm/msm: Drop debug print in
 _dpu_crtc_setup_lm_bounds()
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Jordan Crouse <jcrouse@codeaurora.org>, Sean Paul <seanpaul@chromium.org>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Jeykumar Sankaran <jsanka@codeaurora.org>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This function is called quite often if you have a blinking cursor on the
screen, hello page flip. Let's drop this debug print here because it
means enabling the print via the module parameter starts to spam the
debug console.

Cc: Abhinav Kumar <abhinavk@codeaurora.org>
Cc: Jeykumar Sankaran <jsanka@codeaurora.org>
Cc: Jordan Crouse <jcrouse@codeaurora.org>
Cc: Sean Paul <seanpaul@chromium.org>
Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index 74294b5ed93f..2966e488bfd0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -421,8 +421,6 @@ static void _dpu_crtc_setup_lm_bounds(struct drm_crtc *crtc,
 
 		trace_dpu_crtc_setup_lm_bounds(DRMID(crtc), i, r);
 	}
-
-	drm_mode_debug_printmodeline(adj_mode);
 }
 
 static void _dpu_crtc_get_pcc_coeff(struct drm_crtc_state *state,
-- 
Sent by a computer, using git, on the internet

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
