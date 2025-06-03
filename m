Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A1C30ACC0D6
	for <lists+freedreno@lfdr.de>; Tue,  3 Jun 2025 09:10:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 78A0310E6B1;
	Tue,  3 Jun 2025 07:10:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="iBVwlfIg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com
 [209.85.210.182])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E3E610E6AC
 for <freedreno@lists.freedesktop.org>; Tue,  3 Jun 2025 07:10:47 +0000 (UTC)
Received: by mail-pf1-f182.google.com with SMTP id
 d2e1a72fcca58-739b3fe7ce8so3925014b3a.0
 for <freedreno@lists.freedesktop.org>; Tue, 03 Jun 2025 00:10:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748934647; x=1749539447; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rt8YnN9QqmYqFYc3WnGD82J6Gb61BHncikNZ5zZQ3CM=;
 b=iBVwlfIgUVeOHIhe2iVfHL4055KGuaIfFCkuLw2Fe9yWFzlG7GQdG1geJiwtj/2mj3
 aFH9/WEucXcWPifhCXWduHP2DHTo9tSJQfu0MMSVH3pwk+4vCNAs/zl2yXIqbmOCGUC9
 5Bw8yfMRlyy3lLFNKtfTxmQpb2fGLhUDvKzI5JL1drbrI18WcfswLkQlmY+89uPTIA2O
 U/g0+vQQK+6UrBmg8f+n6rJm6BzJp/OXUhcwSNmvyqe3FVK7jcvTfNcSEiQc7VcwS58E
 AdE/WGaI4RmxD1YLeGAwfZ9OY8EYcGZZP9HJORpUKJUIoAPgt1deITyYRmD6TZRqFEgO
 LrdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748934647; x=1749539447;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rt8YnN9QqmYqFYc3WnGD82J6Gb61BHncikNZ5zZQ3CM=;
 b=tHCWMvFxoBg6XcP3Vop2+yk/mYp37ZvJutwNl73+T4j10LeQnkFv2GhZdu+Gai7xhV
 Rgs9ENVOCg3kLf8Fn6sztHjM7FNJtiQROgtjYsRqjUPhZVwLRmrItut5ujqkvDV9Nt/d
 jscU1TGqzwQAkWYHnh7O9n+s9gV+erK0njRTSPT2xaRQKphEs6IUdSE0cfUzRcR0G7jI
 N2b9cj4bIPJ4D3E7bsROEw3S0vl65BwOF3stc+6ayGyRQp1leKUdjB5kkcS1sfMxgHQw
 cJBBmFc1oVH8U4ABBGOe3ep2uKIXAlyIPNrZpsPi3OJzCS2h4V/vgV/02wqkZSOiuAGn
 u3Rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP4xbyHOX4e8chBUN3POg7aY1JyYw/QKPNlv5+zTn6mR1R3/nFWC6s/1z7jIyOl/d1AY/0Pc6KcIQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxfjXG4aP5Jkjer8Fl3jR4dEdTH4zQwJw82+M/HrCI1ibWzpGUa
 7SgUYqOHfD/5cUxzWwyQSU9KMVj6bC+lTgNYrlZ/ocQRZevBdGnhyNMyrFC8FdXiDT4=
X-Gm-Gg: ASbGncsgpX1JN+7QYyB76gItODrr/gq3hJCju3k+0Z3te93xyZ/x3wgU0nBFt5sGG9w
 fjULsedighcwBTUm4z3tVxZhGD89EUIYZVZXj/+4Mde5+gWBQqR+XPPG6BzK/6CIjeeSmfsBoS1
 wxOBMy8IOg+bwwRVDh4sKmFO8lSdekBzsayaY9+j1WJMGJPPfZPzIWEY9W0XN1RHo9uvu3jlX9o
 mHWOs3naz7gzweZ8LE2Ws8ue7gSK59oRYbjCrFkeubHDNB5SPogHEwczTsYYrHfn1j4wp3opBtd
 kYUhE0jw8N6S8CxaOaQsSPNT1a9ScRlf+NtyJxjq4I2l1lY4y0zm01rgcm6I
X-Google-Smtp-Source: AGHT+IECU07ZJTnHbY+6PX1HVqrdVBJvjDjVo6qU85+DIIL39w20q2KY+lm0QftMCabBa3zRnow5tg==
X-Received: by 2002:a05:6a00:4b04:b0:746:cc71:cc0d with SMTP id
 d2e1a72fcca58-747bd9873e8mr22641065b3a.12.1748934646820; 
 Tue, 03 Jun 2025 00:10:46 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afed360fsm8746481b3a.81.2025.06.03.00.10.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 00:10:46 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 03 Jun 2025 15:10:02 +0800
Subject: [PATCH v11 03/12] drm/msm/dpu: fix mixer number counter on allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-v6-15-quad-pipe-upstream-v11-3-c3af7190613d@linaro.org>
References: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
In-Reply-To: <20250603-v6-15-quad-pipe-upstream-v11-0-c3af7190613d@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Dmitry Baryshkov <lumag@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748934620; l=1366;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=2zVon4JQp3GbP7LIHy+YThFAabtOIovGb5UEovt+mkU=;
 b=M6kGX+zoyyifKCoa3Ihq4iUR6UyyVoU6M2k4GhholpJmyeFukaEvdo5CO2SVv0U+uk2QpqrGK
 /5yKxv751IWBn5orwmm1L8XYtOVu7zCAqFdb9V8AdseZitDIGHNmAYw
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
index 2d8ff4b524715c658188fe56bc337e3ffa831c0a..bc7639a46386c6b9457edf3afdf6f747a632651f 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -374,7 +374,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
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

