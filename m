Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B6E7DA4C487
	for <lists+freedreno@lfdr.de>; Mon,  3 Mar 2025 16:15:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8EB6810E451;
	Mon,  3 Mar 2025 15:15:31 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="WFNOXWaO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com
 [209.85.216.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A148510E457
 for <freedreno@lists.freedesktop.org>; Mon,  3 Mar 2025 15:15:30 +0000 (UTC)
Received: by mail-pj1-f52.google.com with SMTP id
 98e67ed59e1d1-2fa8ac56891so7236837a91.2
 for <freedreno@lists.freedesktop.org>; Mon, 03 Mar 2025 07:15:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1741014930; x=1741619730; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZEgnok+ywGlBannr6oE9rIQ6mvdj6w1AkrRgjoSATVE=;
 b=WFNOXWaOIq8pU8p67unMpWFV2YuiKZNKOlwanGBsf0c4NxGZt46N7A2zRS0K8QK4Kv
 yxByvdWeTUXOmB348Rq9MqcrBTepXVNolbBc8+QaXKTf/Eot3zJ4xThJfat9v6m+KHYe
 T+kOyE5vt36wvhTQUpBnKRfO0HXQuQcwJRmyLYoG46uy6wTIcsfob33I8XUYFonoe0On
 MNDiSQvO8S0kLhWhY4AVwSNGVU0fhZAR1b/kttFpYg/30ZX61wn0V7t358KCLAtqTM5a
 Ma/+NIOHnmnLvpWfAgLSAbRkXGtL9i9U1s3teT4B/iFUk0JCy9spUIFNgp+w9gdmXJ4N
 PkHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1741014930; x=1741619730;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZEgnok+ywGlBannr6oE9rIQ6mvdj6w1AkrRgjoSATVE=;
 b=JuRIzmiM4BBxLTqolS39z7aKHM1P2QSiHcgb5iawjxGfb7+Fbd+EdvnaIhtVQ6B1pY
 NRDhqJuk/Lq6iNobqxvxKohZus3Z0AZK/0tIwivLGgOLnhiP6lv4LY6/NFVfDk2bd1fT
 3jlPkmvUu3ImXtxsKXZeCP9N6Y7XoephQpuwijCUwsgDiDee0LXHApJYyQ60Iyf+L2Yc
 GT+t7LMj6Ld6cD2g+6+drncCDYI5rhfKVK+c3vTSdYb4ebDqoQfTEICI3a9NBOI2nCmM
 vCQ7T4/ANT0uXZhLj2BLNSsdEoJvr1GG/lcKOTF8lOBtkcjU4I9py0Bs/SfFgXL2vgbg
 afdw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVFo4jfhVb5btjaxMiSHf2up0ivZK+PNKHAPvKcFxgWqbIYssdriGGONZ4Y61GFBrb3UALGgj9dsug=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiNpu9F7VDzULYejAgcYtG8+v/H9vrd2L9m8gu1zdHIsmHkJmQ
 u0fs3HAQXustD9R7sZdJ5n7sbEGVnIe29+mCyde+yw+r1vyoDAQU5xZ2va5YfPY=
X-Gm-Gg: ASbGncsfvZyFxhWNoAvwICK8TTk0bv5mXvllJ93tHoyERrNNs13sEV4f8ieJO7uhk55
 OYCuB9zyv5kJBp6lMvGZqUx0Qw5Z3ouTTV6aUD/RbLU9ZdnShhD25LblY6MeUqfzdDJg1TDVY3U
 uE6i8RSRGmuku9qlbb83thasUgpcX5N2UDC4ucYxsBpayDPpLREwtKi3dWDipCLQshXK2kHbOSC
 NZ5H0Ywd1Olq0MRC7yvcfo+uwD1LX9DN8hajLz/CCjPFtD6L5+SZ2CMmYL2SfgyAjY9njlaVNp/
 klFWBFKxdSwhEWoHXro008FQu4DGwtMyMUvsEr6dYw==
X-Google-Smtp-Source: AGHT+IHgPd7hB7yPXWWisVd5/ez/yv8IIykroy6iDLwr4GSkdS1zMX0dZhCdL6RsY2usvlf3TSat5w==
X-Received: by 2002:a05:6a00:17a8:b0:736:3bd3:1a64 with SMTP id
 d2e1a72fcca58-7363bd31b45mr12732813b3a.24.1741014930031; 
 Mon, 03 Mar 2025 07:15:30 -0800 (PST)
Received: from [127.0.1.1] ([112.64.60.252]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-736584b3cffsm1851984b3a.4.2025.03.03.07.15.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 03 Mar 2025 07:15:29 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 03 Mar 2025 23:14:35 +0800
Subject: [PATCH v8 06/15] drm/msm/dpu: fix mixer number counter on allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-6-eb5df105c807@linaro.org>
References: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
In-Reply-To: <20250303-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v8-0-eb5df105c807@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1741014878; l=1366;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=6KiLXjEpLod6o/Ty8ouIA+JWP5hGEqwM+aKGxHjhLOQ=;
 b=zm/Dw2llcmLMxDOCKUf+KzaXpfdqsyYFQikzN+y7EhKHagSgLgkAFyLnGbdWcff/N4pYIIHb8
 lplymHQX0B5DPwFJBQPw95+6cR9b/sdHAxGHSuLrnNR1aCJruHUViE+
X-Developer-Key: i=jun.nie@linaro.org; a=ed25519;
 pk=MNiBt/faLPvo+iJoP1hodyY2x6ozVXL8QMptmsKg3cc=
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

Current code only supports usage cases with one pair of mixers at
most. To support quad-pipe usage case, two pairs of mixers need to
be reserved. The lm_count for all pairs is cleared if a peer
allocation fails in current implementation. Reset the current lm_count
to an even number instead of completely clearing it. This prevents all
pairs from being cleared in cases where multiple LM pairs are needed.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 24e085437039e677e0fb4bbd755a8cb3852300a4..3b3660d0b166d9b0e947b2c918e37adaae8b76d2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -321,7 +321,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		if (!rm->mixer_blks[i])
 			continue;
 
-		lm_count = 0;
+		/*
+		 * Reset lm_count to an even index. This will drop the previous
+		 * primary mixer if failed to find its peer.
+		 */
+		lm_count &= ~1;
 		lm_idx[lm_count] = i;
 
 		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,

-- 
2.34.1

