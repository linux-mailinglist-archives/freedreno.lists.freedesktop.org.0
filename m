Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D02AAFAB98
	for <lists+freedreno@lfdr.de>; Mon,  7 Jul 2025 08:18:30 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAC4910E410;
	Mon,  7 Jul 2025 06:18:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="pjppZHzh";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2229410E412
 for <freedreno@lists.freedesktop.org>; Mon,  7 Jul 2025 06:18:27 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-74924255af4so2498068b3a.1
 for <freedreno@lists.freedesktop.org>; Sun, 06 Jul 2025 23:18:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751869106; x=1752473906; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XDSLLULuQro4tZ+C6kFbdQGbu24iHgqnLikNbErS/QE=;
 b=pjppZHzhVylETIF1BknV2Bq/ZjZtU7NAA4PXoUoL93L0yRJVEGN7w9Ge5NtCca3M+6
 yLKX1KNn8JlnVCMZVtTrTpir3InSab6TYd+0+YIkb6w13HRbS8z+LbrmA6Yf2Q7xdoq4
 umARVEVwliKbY5qitKn9S7ZlNamVrPqHvWP0ER6A2rByzms4yI+KZtdTGZPOHWLYBo4O
 ik+eCUHfghTAsvIIlPgYHqDuz+MXXp1Qn3puH9fZncVLH+DlH3m8aeaY8U3v113+bOve
 /DLPuK4BJYkMhMdEfOqSRWITr/YYbuwU2zHUE9dZF63izZIxROr4EhlI95QA/61F/rZP
 6RFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751869106; x=1752473906;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XDSLLULuQro4tZ+C6kFbdQGbu24iHgqnLikNbErS/QE=;
 b=kIYTBd4zHaTdQkS6uzxGnRoOOK4v4bpgjpke5/FEiLpaqyrJAGPf2551lCa8wJJvUp
 KRIGtM2tBwq7TkT8sdbsUAydXPjsiHkntTpFfxP1gU1MK9rlFl8fLfI0pY+NLOTlw4mG
 vBiKFEedCq4Uk2tjKcVOtaemjSD215KxEzo/9cOTNh/xDfvMS0PVOZmzMXw703ZxfJLK
 9pGfr/SSRJxo4Z2cy+vzooIySGfWl8gjcoWDJ9OnR6K3WEa870aylHooPd0wAh7lTWeT
 uapIoiaUYIzkacewzpK1btyau3KKQ9O47ZbsPIvLSxN8ugPykLvvUaNmK0wmrFk0/TLx
 iAeQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCU8m/7pcdayWww+5f987ms1BEv9w6uEUcrdH1F5ELX+q2YxPBaHXSrctlMLdiWjcnHTkgNqythNB80=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyrvaGQpwECSjUFEIRNORnR68s4K0fOB4kvHG9YqaKbnQ4O6vRd
 7E3priTa8LVIIut9etXzRoM/Llr9B/ZtuuSvIytAUMZs48BlEb1OsP4uySmu6W2ZIvw=
X-Gm-Gg: ASbGnctiSuzv6ObybDBbnbPehAS12sq9rIYE0TOPB0KVvMPzkWQbP8VN1AHtv8zT5zK
 yKY0HDOjhAYzgX/PY1/mO6yD8NVKi/9EW1nPBJhPlhH6OD1pGGmB3wmAhcCgo8VYBYPJtCzAr2p
 2KZqf3Ia2+yNseOYM3Hthq5zOq8ltSq+jxlDEZo6XzJAlqDSTI491v1Nf48LqUGy3ErSEhnDZw/
 fD5hJ1UMqM68RXa16zUQcJyJNccpdRBFiR2hDZsp6BKdZ7UFj4V6hODBMekgKcDl7ot1qElpNgm
 Blh414MX3ayxWs90PRXQRxH9wCBY1ixTcjQ9F/NgD4OiH72u3VRN8NG/StY=
X-Google-Smtp-Source: AGHT+IEmnc9Nl7lcGHKBCmQmCi/m7XOmXpKt5Cnl8qyjZqXrrplvrrS72dHqfjoA89VugwwUs5rqDw==
X-Received: by 2002:a05:6a20:3ca6:b0:225:c286:5907 with SMTP id
 adf61e73a8af0-2260a0a362bmr17640836637.3.1751869106645; 
 Sun, 06 Jul 2025 23:18:26 -0700 (PDT)
Received: from [127.0.1.1] ([103.163.156.9]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b38ee450ccbsm8037327a12.3.2025.07.06.23.18.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jul 2025 23:18:26 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 07 Jul 2025 14:17:58 +0800
Subject: [PATCH v12 03/12] drm/msm/dpu: fix mixer number counter on allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-v6-16-rc2-quad-pipe-upstream-v12-3-67e3721e7d83@linaro.org>
References: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
In-Reply-To: <20250707-v6-16-rc2-quad-pipe-upstream-v12-0-67e3721e7d83@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751869084; l=1366;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=OO2Z7mIWJju/0AAWi0QFQrEeFkD+xuMhO5TmIsG9bFo=;
 b=HIyipBAXPGv4iNFX/AHEf7r3WMbFa9ZI0N5soHzc2+H6HD25aR3ZFY5RtKQV9yhsI3bp4xQZp
 NKWA9XKuuigCEPtJpJX+IkEjE/6yf+9/eIdQRwzGkisQtZC9ZCsrtJ7
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

