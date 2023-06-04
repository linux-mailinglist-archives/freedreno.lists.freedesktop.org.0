Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6707F7219C8
	for <lists+freedreno@lfdr.de>; Sun,  4 Jun 2023 22:35:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EE4BB10E0FE;
	Sun,  4 Jun 2023 20:35:41 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 520BA10E0EC
 for <freedreno@lists.freedesktop.org>; Sun,  4 Jun 2023 20:35:38 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4effb818c37so4947415e87.3
 for <freedreno@lists.freedesktop.org>; Sun, 04 Jun 2023 13:35:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685910935; x=1688502935;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ve6ZUdBLYuqTXgoIqe+BvDl7Md9/EbiIkAt3DnPQx0U=;
 b=H2AkMOyl0n1iWZ+xbgI8wJGliZZTArYfHX2dWmDFK22NCcFhSqtZexoWjSPdSniouS
 3s2Y38hXZ212X16tE0GkWdfFMNjRhmbr84L0abttN7y3e4eBWXIL5baSQmcEwFABhnsI
 H7HTEsQEjVYx2dILh6DBaTa0GZPRUhOqjNlDEvUtF3ONd5bxDDplbpbe0AnE0X5zpET2
 5jNg0LsGj2Xfb+RT6QivA24Q60AMPKpWUHm6BhdoGUVbYOVrBVbLcX7suubX/IiCfyP9
 cxHpRb2QrzA4uFZWuw/seBr5Njc8++y0YTuIOinZoCk5koCqKnMf8r7lARYK0LoDWdG0
 XuTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685910935; x=1688502935;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ve6ZUdBLYuqTXgoIqe+BvDl7Md9/EbiIkAt3DnPQx0U=;
 b=l1gpaQNY+N/OjNTFURdoqGrerkXjRqaw+kyCr2sZX3sP1RbylJkOZEQ3pdinj81Df1
 +TrZC5NahynTD4BE0zvG6RpHSb2x2QV20wcJFsarsKsPjxBLlp/WXGqdS5dFhqMMWhoF
 3Tx4iDEkLBgo4qjCVw4uN/NrkJDquNL3JqdXKhq2gD6Rd2UV+ZAz1IJnwjNVuEx7s0cX
 Eo3X6+xZd6QI3Ayr0sjrWJWCTvy6qVvoBBXaqXKckKCx/i5SNFoy1R4SUUebWzMxAE6R
 STenKkFdlikZ2OBS6nuOjn5A+dc/zs0MzlzIj0euiMKYRbzJhH8APWhxH4htEPsBbWgD
 M+8Q==
X-Gm-Message-State: AC+VfDy/9TmBuVOPTSUZ9XGAZPCaYv/qyyAYV7QD3ScYCekX4Zh7ofip
 Ue+8NBEwNJASLO0Ur/eZcP0CvA==
X-Google-Smtp-Source: ACHHUZ4rArgOGQ1VPKWtYT+F9wL1zuPTdBRFHfi/N7TTiByefF9KAHsaMoSjlA+G4U9YWTQzilYzRA==
X-Received: by 2002:ac2:5473:0:b0:4f6:1805:6096 with SMTP id
 e19-20020ac25473000000b004f618056096mr1871175lfn.28.1685910935399; 
 Sun, 04 Jun 2023 13:35:35 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 a19-20020a19f813000000b004f2794dcb4asm875822lff.255.2023.06.04.13.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 Jun 2023 13:35:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun,  4 Jun 2023 23:35:11 +0300
Message-Id: <20230604203532.1094249-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
References: <20230604203532.1094249-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 01/22] drm/msm/dpu: correct MERGE_3D length
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

Each MERGE_3D block has just two registers. Correct the block length
accordingly.

Fixes: 4369c93cf36b ("drm/msm/dpu: initial support for merge3D hardware block")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 356280aefa3b..fdc0d0c4ffd7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -516,7 +516,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 #define MERGE_3D_BLK(_name, _id, _base) \
 	{\
 	.name = _name, .id = _id, \
-	.base = _base, .len = 0x100, \
+	.base = _base, .len = 0x8, \
 	.features = MERGE_3D_SM8150_MASK, \
 	.sblk = NULL \
 	}
-- 
2.39.2

