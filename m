Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFA13A385C9
	for <lists+freedreno@lfdr.de>; Mon, 17 Feb 2025 15:17:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9559A10E4E7;
	Mon, 17 Feb 2025 14:17:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="eDTV8Sc6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com
 [209.85.214.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D60B10E4E0
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 14:17:17 +0000 (UTC)
Received: by mail-pl1-f170.google.com with SMTP id
 d9443c01a7336-220bff984a0so77671345ad.3
 for <freedreno@lists.freedesktop.org>; Mon, 17 Feb 2025 06:17:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739801836; x=1740406636; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=IpxTAQa8072dELfu5kZ4WUb4EfPVG9CirHn3aioqsaY=;
 b=eDTV8Sc62sbAzUb0WqIPuGynkB+wXToYa+QJlFjq82x+Lh2Anv0FsvtiHrie4n3SbR
 HOuJl2LK7dVw2MEn1QYX9Nh/1WNlPVJeAfmAlNeaHv/qaKNyVd+lraq8k/Wg2gzq3O2B
 Zk/XMYCJGkBQqcvTKxOu24m7wk9M6oHue2713pXWGMTbimtCq91lT9LpV67/IHzI3pq2
 2yE6P7i2vouKXoyjih0YdNoomS8SubDi7L+HsCUW6gjxPvaohHMZOhOrPQK25bPdrnk3
 sBBBNH800P/ko3QqfFxoB5G4czc/q5GWU6njKOQnBJSRmCy1erqcmh0fwH77TtKRrzhy
 zF5Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739801836; x=1740406636;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=IpxTAQa8072dELfu5kZ4WUb4EfPVG9CirHn3aioqsaY=;
 b=sqRN1VdgIqBxtJBXGL6ahQPFRfCZNGZB6bk8A0WSTGo15n67kSCCSLqzpyPtVFUJkp
 W4V/oYaCn/B9SQHYTuFRQZLrWgXRZxngrlOpuWP09wTUKwZ5abmvnAsHWOU7Kf6fgnvl
 Jqq84wWtdXRGmpbdSgXvSfStih6XHpDoqluaHnz81E+8VWQy1JAmZ26XbkqMDZ6UtHuw
 GtgztnOEWk0aFceL9vY7RJ/G3eiKQ1mJBfRyg22hujCZEkcP+Ha4oJUE3SJoKVG1wJko
 G67hJpyI8RlikORB9rHizK0dmO2cBZqpiQgAZc4xslzeXbowQOcxcJAysppHHtXjAQGu
 ChEQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUcE7I0PRoOmtLWw1aX5UXMXS7uDTPTC8WVde5lGdF8E0cmXcPhWlb03VsFDngK3y81eNMaoKkVziw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw2ElkuYy651/qfRB5yKAwpsqfA+eR8WjukhUbV+xsEuOJx/q98
 xbv41gFNVwbnUKh5dtZB7wBbuKcmT84pL4NmOe1MNKkTpxXzfOfC8Ff5TBmI9CY=
X-Gm-Gg: ASbGncvR1GVddlomLzOhxKrczQS8WCzYFzooWYX1fH3MOgZBo6Wr4HBzFdHZvGHzIQX
 bL2Va88eC4o9b64JjgDFnK9DKajKoKIiTpCmHf+aHB1X+U1R75PifHmaJCLBNrcPz8twHEvGWNv
 8mLMvavuxNfunGkpGnefj2UT37gjZ9UYhyQ7L7gCtDhiBP93eB94yzqKwMWKQ3PC4bM6ixnKHna
 zucud8YZFfsQrpcnO6+HnBaRMD+54cUpM8+On9esxlf7iBgB898ns4hymyxXxT17+k+N0yAx5j+
 uJHYOK/e9H/5
X-Google-Smtp-Source: AGHT+IFZHeIA0CD4UYx9Z3ngew6444gPSr2M1ZAt7fuz/lLqxs6zXEfEO8224qriYfC42F0X0mlf2A==
X-Received: by 2002:a17:903:41c8:b0:220:c86d:d7eb with SMTP id
 d9443c01a7336-221040a9a24mr171158235ad.36.1739801836664; 
 Mon, 17 Feb 2025 06:17:16 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-220d5366984sm71900845ad.60.2025.02.17.06.17.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 17 Feb 2025 06:17:16 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 17 Feb 2025 22:15:55 +0800
Subject: [PATCH v6 06/15] drm/msm/dpu: fix mixer number counter on allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-6-c11402574367@linaro.org>
References: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
In-Reply-To: <20250217-sm8650-v6-14-hmd-deckard-mdss-quad-upstream-oldbootwrapper-36-prep-v6-0-c11402574367@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1739801787; l=1305;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=94sGM0uG9AA2R84ut2aXyN09vsNy3Mf9Tf086GLox/k=;
 b=sBcqZRv0ogKjajSPG9ugvgn2jWTjkmdxAHujjheTZRukMN9BXeN5vr1uB92ILnxrl+DGsaYQe
 zZd+h+j/wt+B5YZPhX5R72j8qaa2kWdGJpXRN6qzh7cAXO+14YMKzTs
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

