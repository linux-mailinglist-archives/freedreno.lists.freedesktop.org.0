Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B10FA6F2AAC
	for <lists+freedreno@lfdr.de>; Sun, 30 Apr 2023 22:36:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 296FC10E09E;
	Sun, 30 Apr 2023 20:36:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA06710E083
 for <freedreno@lists.freedesktop.org>; Sun, 30 Apr 2023 20:36:00 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2a7ac89b82dso17782511fa.1
 for <freedreno@lists.freedesktop.org>; Sun, 30 Apr 2023 13:36:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682886959; x=1685478959;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5J+iFxf1ulALPVvSRXTgTvfbQT2He6CPNoNs7jBvyPc=;
 b=VBBHhsEGzJGwH7b+7+6WwqX45vTlQIaZmZKB8iwGFrpnihADVMv9NV95MaqONthA+V
 Kvzak/8iFyJzNrWbeppaFfaJRRH/Fl3CIcN8W/ZWkIW7L1gAGHQlIeL2ngLpVBAcykU6
 XRq6XqqPQ675r+OS1+hn4CCTR1EBg1qPIvRRdNo97q6F91BOychzA68Ysc+bRQ0vs154
 Tw15JB4jcO1MCw+MqgTtsEU+wA1bBQ38r679ebDfG0+p1koAn5q47Xc8wH3Laeq93Dqf
 VXaNiVwhL7rI6wlfzsPfZeDYRE8yu3W9wBlrI8VXcjk2zKoLFMIWfbQoZjZxiBwUaZB4
 ldhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682886959; x=1685478959;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5J+iFxf1ulALPVvSRXTgTvfbQT2He6CPNoNs7jBvyPc=;
 b=eceLXrRhO0D5tPZm9i3VxCXR8+GKmKB8XKP9WQywlFvNz5L6sUBZVDZwRkfIgeYTfe
 2iCzewN0Oe669Ki1+WFHCHkZmpJVGX1aCDDfnEfgkq3EM/YYNTmRLsp5tcEJkYmphxjn
 HGcbRftyha8Mw7NEu/JnsZy33kDW42Ny673mUylkMJoIazxCDHmmujP3h9yCJBggrS7Z
 TcmBtcmNNBBoCQFdTRlhFkyk9CJ7PKyd45ixzjo0yoN4+rj81f1eEvCJkH+ofYja7Jgu
 gRqISYBgTk9VwWqvu8IXmM2AwlL4dFByFVix9atY1WjJFDkGB4XqR0WgDcmMVwtRQqk1
 YZ1w==
X-Gm-Message-State: AC+VfDyPRdWMSsAk8aAM8MKu2RWKOtpTYVCEn/7G99HM7RNq7rPbT79X
 6FxHzy+dwvJguTqUvs31tBfnaw==
X-Google-Smtp-Source: ACHHUZ6hAAXso5vr870a9YPhqsjmLnZ4zsuXWtqlIk3M9l9AMNkHKknxJGOg9J9duRdBLxw2von2Tw==
X-Received: by 2002:a2e:8608:0:b0:2a9:f9d2:7b44 with SMTP id
 a8-20020a2e8608000000b002a9f9d27b44mr3183297lji.40.1682886958885; 
 Sun, 30 Apr 2023 13:35:58 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 b24-20020ac247f8000000b004edd4d1e55dsm4324634lfp.284.2023.04.30.13.35.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 13:35:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun, 30 Apr 2023 23:35:53 +0300
Message-Id: <20230430203556.3184252-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230430203556.3184252-1-dmitry.baryshkov@linaro.org>
References: <20230430203556.3184252-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/4] drm/msm/dpu: replace IS_ERR_OR_NULL with
 IS_ERR during DSC init
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

Using IS_ERR_OR_NULL() together with PTR_ERR() is a typical mistake. If
the value is NULL, then the function will return 0 instead of a proper
return code. Moreover dpu_hw_dsc_init() can not return NULL.
Replace all dpu_rm_init()'s IS_ERR_OR_NULL() calls with IS_ERR().

This follows the commit 740828c73a36 ("drm/msm/dpu: fix error handling
in dpu_rm_init"), which removed IS_ERR_OR_NULL() from RM init code, but
then the commit f2803ee91a41 ("drm/msm/disp/dpu1: Add DSC support in
RM") added it back for DSC init.

Suggested-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index f0fc70422e56..dffd3dd0a877 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -247,7 +247,7 @@ int dpu_rm_init(struct dpu_rm *rm,
 		const struct dpu_dsc_cfg *dsc = &cat->dsc[i];
 
 		hw = dpu_hw_dsc_init(dsc, mmio);
-		if (IS_ERR_OR_NULL(hw)) {
+		if (IS_ERR(hw)) {
 			rc = PTR_ERR(hw);
 			DPU_ERROR("failed dsc object creation: err %d\n", rc);
 			goto fail;
-- 
2.39.2

