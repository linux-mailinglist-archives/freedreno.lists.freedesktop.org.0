Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 76BDBB1847D
	for <lists+freedreno@lfdr.de>; Fri,  1 Aug 2025 17:08:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 51EE610E8AC;
	Fri,  1 Aug 2025 15:08:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="LMOLYIjD";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com
 [209.85.214.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 48CAB10E8AC
 for <freedreno@lists.freedesktop.org>; Fri,  1 Aug 2025 15:08:11 +0000 (UTC)
Received: by mail-pl1-f176.google.com with SMTP id
 d9443c01a7336-2403df11a2aso12939625ad.0
 for <freedreno@lists.freedesktop.org>; Fri, 01 Aug 2025 08:08:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1754060891; x=1754665691; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XDSLLULuQro4tZ+C6kFbdQGbu24iHgqnLikNbErS/QE=;
 b=LMOLYIjDlIH8aT1Lt7v6zn2iqu12bcDUvAj4l/RAbCD+Z4zb7SQhkM5/hhd+355FQn
 WVOntnjS8kA0ctjaiAeVM5AItH7k0MTSKu8ikBBLRa17bJP7CWO7Nr1fYzE2rvgOqyfQ
 jYOm3ZXdM5axGUzeN5N9RjvfG17lnN5OA4ryv80ApKds2s09fam+6sbehSvT8pAQSvHW
 7Z7zAg9KALpId4rcBcNpz1MUR1uIYlMwdE45jWc4iy4Aopw7x5jk0I6a0sUZos8BRcbI
 cTc4070i3pucZ/mpegpjOibvcfHrCB23CDjfj/D6Uux/zodxBWLhLWaBbyyUuM/53/d1
 CZ0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754060891; x=1754665691;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XDSLLULuQro4tZ+C6kFbdQGbu24iHgqnLikNbErS/QE=;
 b=w65uXi/7XmrfzHnT+BUIHt6aLz1gpvq0lro9HQuGVCi+QDNoFjU43XjkFTCEedmFDp
 baCatpWBbiz3XlRR5QeqrdpHTI1X2xSPmZHeKnRgLVnp3xrnsgT7HzpInSyEeETt36+u
 iBcjd9smkO9IbwXv3beRbIj5AH67zc29ytO3UPkAqGojUpBKCE4paXoNGUEPCEbrPCoZ
 V6TGlZpm+6Gfg3v8CnvxO88aHOAPukWX7mO6RB9XBAlXnQOI6AjncpFuZdRF2nvXNPfR
 /nQX54LRNdYsav2dOa4g8LKEZnJSQJv+Qs2aRisGq1knPEWftBxbKtdz53DkMyzMYKby
 Nilw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUt2bMvdSZIh9F73rWLW6JZP5JVlerTeI9tIaWSvYTeMQGRn5mpF/fOxAZAhKVU1ztP3OfFmz4nVRc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyum4+BQ90KklpU7xyX+zASQSfRwuGXCMYkhkdaw5XovOH5zx3P
 wfqBciPuKIgtQ2ojVASNCdzAG8pqC/xr4r5jyEe6iLRoSynmaMV9LcXFRtrmkZtK9EQ=
X-Gm-Gg: ASbGncvHaPm+f10emrscS3yBply8OpuX3VS2fESPe9+ZB57OidhGik47MqmcB8KcWgx
 YBhGj6wtrAd387Pa3Wh/8QjlN/gJV1PjSTxlk9hen83TTTl1ckSCLC5va1IamcT1qv7sOKBKBvo
 VN3sY1UaQxg7opkou+JwAAcIlAZu11DnBt5BVbszN6Knuut2qzIPj6emh2tVWLoHIeqxltZmti1
 G2jauGnKrDalkrtPkdwkGo1spDZULtCcwm3svsSP4LjHYihw7JdyR1GLUk2vTpz/9sqiQHy2Y34
 Jh/UE2lhSGyTL7pn+lGtg5RdFpaibcdr6e/PI0su0IWW5Rggm2SkoRO2S2XNbY/Aw9YScEsr78l
 +AQvVh0U0vIgEqivT9A==
X-Google-Smtp-Source: AGHT+IFayGqBx8hW294QxMt2k98HLw7+m+LZMmht2Y8J5kauLQORFEs1yvXOy9+cvVSKakLHEQx1Ag==
X-Received: by 2002:a17:902:db11:b0:23d:dd04:28e2 with SMTP id
 d9443c01a7336-2422a6b1521mr43892835ad.35.1754060890630; 
 Fri, 01 Aug 2025 08:08:10 -0700 (PDT)
Received: from [127.0.1.1] ([112.64.60.64]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241e8aafa11sm45639705ad.172.2025.08.01.08.08.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 08:08:10 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Fri, 01 Aug 2025 23:07:28 +0800
Subject: [PATCH v14 04/13] drm/msm/dpu: fix mixer number counter on allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250801-v6-16-rc2-quad-pipe-upstream-v14-4-b626236f4c31@linaro.org>
References: <20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org>
In-Reply-To: <20250801-v6-16-rc2-quad-pipe-upstream-v14-0-b626236f4c31@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jessica Zhang <quic_jesszhan@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754060859; l=1366;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=OO2Z7mIWJju/0AAWi0QFQrEeFkD+xuMhO5TmIsG9bFo=;
 b=DETqfYzbBAU3+ZrJj8OiSBo60uswBpiJ+Fiol09/aeqJuM42nOixyKlbhgbx+R/Qv/ErHOuBJ
 OZ4elEmcauaA0/mjq4r+cq1buvaWss0mroaRogcSvaeaex/i2K5+B0T
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
index 2c77c74fac0fda649da8ce19b7b3c6cb32b9535c..3f344322b7f214d0050986e675b32522f8eb0ba7 100644
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

