Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C8A0CA133B9
	for <lists+freedreno@lfdr.de>; Thu, 16 Jan 2025 08:26:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658D110E8BB;
	Thu, 16 Jan 2025 07:26:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="cDAmmhNM";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com
 [IPv6:2607:f8b0:4864:20::634])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0CBC610E8BB
 for <freedreno@lists.freedesktop.org>; Thu, 16 Jan 2025 07:26:44 +0000 (UTC)
Received: by mail-pl1-x634.google.com with SMTP id
 d9443c01a7336-216401de828so8903645ad.3
 for <freedreno@lists.freedesktop.org>; Wed, 15 Jan 2025 23:26:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737012403; x=1737617203; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=6vUwtbv6QkBMkinOtoSzI57ocGpisrQ8kP4ZBj8OJ9w=;
 b=cDAmmhNMhLVvJxXNgZknwL4NTkIb/Pyw3FIWu6VpT43U1CUHdGuwrY3IPkVn4WD+mP
 JxpzbBGyM6h6ieA2eaeEI4gl7Pg7jpnOV0wtOmW4n8vFxoHgeFibJd7lcwqg+Eh4LFG9
 QpHX9vhu0nTV18Mgxm9V8xKt4mgoyvnFuFAnmBpXFisKR80FtNdvibyOxS808poSEox6
 qfc3L4f6EQ9fWvJSLVPpauA8SE6vUZbd+0LRwvPBqfJkYLKRqkhQYF7RxghDa1MiYf1J
 BK0UJaam1XxIF2dBQzHL821K/+ZPRss2TLn03GX/O4uBx7OtKSAAK1ryiDCEsb/6iqFt
 eO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737012403; x=1737617203;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6vUwtbv6QkBMkinOtoSzI57ocGpisrQ8kP4ZBj8OJ9w=;
 b=IFCpTCxEfwNI48m7NsTAafMFF92jMX/mrrjPPVK/WVCyQF+5m13sWAyFws98OGCUaE
 fJEb89qle0PDbygiYxOyNDe3jF7vjKrEJxldDDAxEyhjr5gqcktwbCbhtZaUzYCsM5B/
 dwHwjY07pCOPKuOSCbFnLzl3W31QomE5GCl5TRX/n4h9S4HrJ7YcntWpFzHryQAjC4Gg
 bbs59QQALT83rJ9yisMO8Hip6H22ZuU4/3m5a3Pn0g6Z7zv22MuzROZdjfPm2dzNP4GD
 /QTPYMX1RK0hzKDH8CFpIy6agR3QZkYBj+Dew2CAadHQD52NkcYG/n4IP5lCmf0DXU5I
 yj8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXQjN4NqlkHqSkYjW7B4a/x0Ague4A0LjbUmecSHb81mQaY1Cn4ZSITISDuwemNgMIx1xzB8/9bCTY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw75Nh2obkvQyDDap+GwEfF7a7ATRvfMwuYSzdiAbYUq9iqypkj
 8k/5oVDY+TuOp26mXJWHMaDcqxUsbswqq5Kp2F0ddMamUWkeO3NZEIcWppRRPpE=
X-Gm-Gg: ASbGnct1sim77E47F43jJL9soIa2EwD5et379MlDZ23z4naiAqyAt8rd/NA2s5DUhPF
 WbcijWpJboevqewSBIYUXKmQsLpYOp2dR+vznYRlZW6Gy3o+kKQcgKyicc/HWIl8HhVX5g4hVAF
 E44DE4Fc2rraGkwI1vpWy3u0sQN0TGDFtmO3yVr1dDklOPb0JXp6KyU0k6xEggDudKg0pqCAj2x
 xihOM4h8+nNcBqeZbDcD5nGgygbl5WR2vMYiSm8DtgoMt9Je4gfGg==
X-Google-Smtp-Source: AGHT+IHEZ8xbbHf6WOE5lVgvL/EZZjzSZcR/ONwuLfwLhiLy0XL6LoLqBpWJ3PuAXM7IxlN82vAVrA==
X-Received: by 2002:a05:6a00:4485:b0:71e:16b3:e5dc with SMTP id
 d2e1a72fcca58-72d21fd8b84mr48514252b3a.19.1737012403491; 
 Wed, 15 Jan 2025 23:26:43 -0800 (PST)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-72d4059485bsm10164583b3a.83.2025.01.15.23.26.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 15 Jan 2025 23:26:43 -0800 (PST)
From: Jun Nie <jun.nie@linaro.org>
Date: Thu, 16 Jan 2025 15:25:55 +0800
Subject: [PATCH v4 06/16] drm/msm/dpu: fix mixer number counter on allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-6-74749c6eba33@linaro.org>
References: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
In-Reply-To: <20250116-sm8650-v6-13-hmd-deckard-mdss-quad-upstream-33-v4-0-74749c6eba33@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1737012353; l=1148;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=Sj3Czivhsbaa4LJdooT+esNwlFrWC/YCnOEkeTa//RM=;
 b=wwLDum0ZmSKxVWLUCff0iyuTso8UOKgLOcC3MiXn4ZuV5Y6iB9FHmaZj2ZQVC7cFkBqmZxjDI
 a2qygM2FjnWB8cXJ4P9EoUGyKCT+CWVNu+4OQpOFxt5SOMAwFQ1W45Q
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

Reset the current lm_count to an even number instead of completely
clearing it. This prevents all pairs from being cleared in cases
where multiple LM pairs are needed.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
index 24e085437039e..3b3660d0b166d 100644
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

