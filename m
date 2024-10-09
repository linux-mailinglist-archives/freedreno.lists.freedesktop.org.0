Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A1149963C0
	for <lists+freedreno@lfdr.de>; Wed,  9 Oct 2024 10:50:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D047210E152;
	Wed,  9 Oct 2024 08:50:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="zY27jmH+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com
 [209.85.216.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9CD3010E696
 for <freedreno@lists.freedesktop.org>; Wed,  9 Oct 2024 08:50:39 +0000 (UTC)
Received: by mail-pj1-f51.google.com with SMTP id
 98e67ed59e1d1-2e28ba2d96aso1268048a91.3
 for <freedreno@lists.freedesktop.org>; Wed, 09 Oct 2024 01:50:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1728463839; x=1729068639; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=E/voAymQ+FLo0K2rDmsz5j/XLkoeZJYYbnZfE87o5mA=;
 b=zY27jmH+xUoDbr18qCzIzUK1hej4cWtLcezJfiQ68QAqZdh1+rpFODsOQGKR8iN1WD
 /JWzRwEekKyP+kqvJeR3KIWIVZIeDJvaag5MbGZZn4VeobHEIXbB1aWia2wjGt0lEgcm
 VNBe0m1NtstJof6R2LbHX30wUKHVMB4tPVUwCB5yzmfobkNGA2SxKkk9Zw//CHhPd8Zo
 Y9A2i/L7+yRCwg0RiF9c/kOCpHL6yyO+6Cn2tkXFLV2y2lqkJqhChMJuG8KjS0nVS2Vp
 xfz6fHoAygyh5VoJhwaPPjBjsG5Onq57jGzZqkLAabw+/ACvxp8g8APAp0UejtG7hIGZ
 E8Ng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1728463839; x=1729068639;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E/voAymQ+FLo0K2rDmsz5j/XLkoeZJYYbnZfE87o5mA=;
 b=FI9mh8J1uxD3/hrXxF/3cefrOKxhb3PrtJg+qOhBF6l2vMebtDnkqjcNtnHxr1Wvrn
 Wg0pVSIyKmNY6msirJo3OXENg4PNfIWLqk3NhUt6ePWR9JKb8d09Uudwh4fqEembQpYk
 8aAu8+8ISgfeKwozQX/MwAklg0kmFZyUxYzfTbvIoAs0/f+QFEmI7P1JNDXbSbkOP9x3
 NAF1N44Xh7FPhb+F4gxHI70oTngTSOHsmtvnGgMqcCM4wt/AJr6FbtDBbhan9u6pnQA0
 XRuJz0YYaV0P9SSG9jXRuhG9CtDrVL9WlwlfM2qp2Qb8gPAQeL7L8/u0nr34hsJCAKU+
 80Tg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmcgHZwb/kQoPUVabMmN9aR3+6pRBzIGeXhq0ai/7Nc4CBtnhEqsR4fTSEr9HmVv5lPC34bAq+2oE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwTbTirzA9QzdLPMLPCQ4fz+8fKmbogxR8wa0VZNekURCCKRkVn
 MbsQiIxFrkeCj0DheAgBmMwWzcsL3OQy5kD3goh+IkKwGukrAqnj9GhDh8esorPBVugiroqxZhl
 nF8VTtw==
X-Google-Smtp-Source: AGHT+IGLdVPxQWHieF+9EHa8/WCKnJVudcn9L6wpuGsElJdCrsUD5SxSB2GtYHpHGZh8Ho+Hcyh1Xw==
X-Received: by 2002:a17:90a:3489:b0:2e2:9a2a:d218 with SMTP id
 98e67ed59e1d1-2e2a21ef24bmr2165076a91.2.1728463839143; 
 Wed, 09 Oct 2024 01:50:39 -0700 (PDT)
Received: from [127.0.1.1] ([112.65.12.217]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-2e2abad236esm898157a91.10.2024.10.09.01.50.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Oct 2024 01:50:38 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Wed, 09 Oct 2024 16:50:16 +0800
Subject: [PATCH v2 03/14] drm/msm/dpu: fix mixer number counter on allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-3-76d4f5d413bf@linaro.org>
References: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
In-Reply-To: <20241009-sm8650-v6-11-hmd-pocf-mdss-quad-upstream-21-v2-0-76d4f5d413bf@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Jun Nie <jun.nie@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1728463820; l=1237;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=WThdm3+r0o6lcg95hlJxNuerWQ1yzvjO0VMSK/DVslE=;
 b=XyWO3HZGDntoWFWpltwc8jk91TUGcI9j/DmmGgwXf1vPYLP+Lq3fLNGmynRO2WPSmNAdXF8VD
 e+84dPuuD53B+CK0+Zi+DNVJEJHL2kkrA5b3HQ84N4bqC1gD7g3BBDq
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
index 2b03ab907c2bc..5c9bb64df7930 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
@@ -306,7 +306,11 @@ static int _dpu_rm_reserve_lms(struct dpu_rm *rm,
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

