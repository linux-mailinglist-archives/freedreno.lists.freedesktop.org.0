Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5C2589F761D
	for <lists+freedreno@lfdr.de>; Thu, 19 Dec 2024 08:50:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 34DF610ECA3;
	Thu, 19 Dec 2024 07:50:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="nBBpF73L";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com
 [IPv6:2607:f8b0:4864:20::632])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3074A10ECA4
 for <freedreno@lists.freedesktop.org>; Thu, 19 Dec 2024 07:50:05 +0000 (UTC)
Received: by mail-pl1-x632.google.com with SMTP id
 d9443c01a7336-218c8aca5f1so5673515ad.0
 for <freedreno@lists.freedesktop.org>; Wed, 18 Dec 2024 23:50:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1734594605; x=1735199405; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=bLZanIqkjuT24X5eyWurXtsoG0wesos+nlrjmuUr9cs=;
 b=nBBpF73LJ+IK88UPUMoGGYN4Az/ZkNjOdKOt6jJ/jTUEyVS/J66PZunF8y+DyTIUGT
 QHWTcSqGYjVTwmXelVkpTUGWLGFIC5RG52+IZ+lx4tSLGqb/Oehekp3gjmlv5wNqkgfB
 L3OsjaiXrc8KxI2272RSjInprnFMnNOgTkJHayEehWMJpOftOXrKiyTjUYbDl/t5EFAV
 Vft5I967UCF/BJS02ld05Binn2X4u2LdYaCQXznVtGO8OZurbxOQ3CjRpbQ8tnmQQp5y
 8gfcQRTDTfemoaUpMZY+aqUJLjrSlaVf/AhudugB/KKHGaYr2Jq/hhynnwLGQ6BNW9DD
 tJCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1734594605; x=1735199405;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bLZanIqkjuT24X5eyWurXtsoG0wesos+nlrjmuUr9cs=;
 b=D6xCfZGNXN+3q268ntkD0n6v/czEVGywK9/YkO1v47pQBxyjX+JjoY3gGjmNgHwlP0
 2xZwlxqfB+s60SkyI4S7Mx23UC5tnVfBQrJiGEPMm+ddjTJjc1kpnwEdfogPQKCFWADK
 k2BKZvAAyLCtaE0YZw6IZnSJ3RDdYskBoMl0zQ4PAqS0uPaYXOOYLMW+AZuPZPrHwjSG
 +2fFsGaWgBsUoJFNPl2FaNgmP1nl0jYM6JzYYFsOTttgHzLmIPaZOB3ZvRl982XBI97c
 JFmaAAnhSgGwZhsaNcn7XrCqtVWncLnsCokhEImpxQVo+9XHnFrlHa9z0BJpWsPKZGip
 VoVQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVGuiExM5tUj4ITbUXCE/3uuZVZOhLdVYBlOjeYZcgZNApPZw6fBiHTNKdHDLTXSzmHyCDjg3DCIs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyOD+0qeWALCOOSsavWIrALkq1ZCYLL4TkeFAZptKCbwuJLVrh+
 9jBy8hkSxBcQdrFGggLG3AVW45Tba2n7HxEw52qyxXzKd9MBEe8LabgfDIlyJUwwAbOtHXhShev
 +XUPoVA==
X-Gm-Gg: ASbGncsSDg7trw/GjAx+MzBpKRoF12W0hi+6tk1wywlWSeU2RuDbxAJ7WRp1cQsKNU/
 cxJeJxZuG/j/xaKD3Q9Dg6C87sw+AUq2tYowW3eOOfolkG7dTmXWmb2gDlfMpNXnYMqn5bkBPP7
 cnvLeExMcqMPuE9d6e2vhh4/9Y4QJwjX/PUNlYI6H9toAgJumVRtLcdB17qx2qSnV9zK8FFbqiY
 Ri2Gbd7hnXAzyO6e/G7jYiIjldEJHeUj42BFojU5pGvCXUi6JZU2A==
X-Google-Smtp-Source: AGHT+IFXiY8We5Q0+brfxd3GD7LjUDQdDdIurNlP5jabQPEF90oqCKt+ZSHV3YR8ACFOHfVNF5ZgXw==
X-Received: by 2002:a17:903:24e:b0:216:49b1:fadc with SMTP id
 d9443c01a7336-218d72529e5mr89035695ad.42.1734594604804; 
 Wed, 18 Dec 2024 23:50:04 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-219dc97432dsm6784445ad.110.2024.12.18.23.49.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 18 Dec 2024 23:50:04 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 19 Dec 2024 15:49:23 +0800
Subject: [PATCH v3 05/15] drm/msm/dpu: fix mixer number counter on allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-5-92c7c0a228e3@linaro.org>
References: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
In-Reply-To: <20241219-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-32-v3-0-92c7c0a228e3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1734594568; l=1237;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=sXtw14ojL1neJpubSJ95lKQnBR+uGpxyPZIo6yVfEbw=;
 b=uhe3cG7vSVDd8zvBrsHOn6GmlwDxsTZ7AbcwvCWm81qkXmw0KR5vmjtRn9kraYnZCrlQphv3n
 ChKiSca7AswCjd1Ey96jMu8FwF/yTtLPcD9AvGOGL+kQiFHvYF5kx9a
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

Add the case to reserve multiple pairs mixers for high resolution.
Current code only supports one pair of mixer usage case. To support
quad-pipe usage case, two pairs of mixers are needed.

Current code resets number of mixer on failure of pair's peer test and
retry on another pair. If two pairs are needed, the failure on the test
of 2nd pair results clearing to the 1st pair. This patch only clear the
bit for the 2nd pair allocation before retry on another pair.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index cde3c5616f9bc..a8b01b78c02c7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -316,7 +316,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
 		if (!rm->mixer_blks[i])
 			continue;
 
-		lm_count = 0;
+		/*
+		 * Clear the last bit to drop the previous primary mixer if
+		 * fail to find its peer.
+		 */
+		lm_count &= 0xfe;
 		lm_idx[lm_count] = i;
 
 		if (!_dpu_rm_check_lm_and_get_connected_blks(rm, global_state,

-- 
2.34.1

