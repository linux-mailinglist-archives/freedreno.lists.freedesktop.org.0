Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B12EDAC3CB9
	for <lists+freedreno@lfdr.de>; Mon, 26 May 2025 11:28:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8BDC010E30B;
	Mon, 26 May 2025 09:28:52 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="i2NokJ30";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com
 [209.85.210.176])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 96D3E10E30B
 for <freedreno@lists.freedesktop.org>; Mon, 26 May 2025 09:28:51 +0000 (UTC)
Received: by mail-pf1-f176.google.com with SMTP id
 d2e1a72fcca58-7399838db7fso1519808b3a.0
 for <freedreno@lists.freedesktop.org>; Mon, 26 May 2025 02:28:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748251731; x=1748856531; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rt8YnN9QqmYqFYc3WnGD82J6Gb61BHncikNZ5zZQ3CM=;
 b=i2NokJ307yEqU1hM2OiTIqiCRQd/btS+Hh1ZixU5gViJTMfsI+ATzaY42umapbJa+M
 L9hG18yVynpPwj0CQouYQoMpW4DQrmCJWo6ZK2FXF1PsxV6XpeFtoP2GzYmqSHaZox9O
 pVpSgEVPm5Vs0hi/bqOozUOE0peCnzVz0K8JDurlefnyoiT1gwJI7mspbbFUVzthMI82
 FMj9EY1hLkMPLtGCSenhemsIJ1rdeP6PvQttF7h0q2GEYLBtgD49nKJ/mlKYV2xQFM+I
 myul3g/iFrxf+Oh9BqHxZLo4f1VE4kU2U2hV0nuDKtJAfSiZWdvuaKssLyFJKrnKDJw7
 Nkgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748251731; x=1748856531;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rt8YnN9QqmYqFYc3WnGD82J6Gb61BHncikNZ5zZQ3CM=;
 b=LYRXnZhzYsDXojczaN3SnYnCHG/KxwtGgLrmWX6nR7XmQU2wWVO12x7dDDftxXYzzv
 wHLukRs3PYgkgsSleylQJneQHn5SfTDEV7Om3Bk0iAWzqS3/V1JrMaBe1Dr8WAPGpSeX
 ouwBsG0px02W43D74H0i2Esmwmah2B6r8V0bfRskfhO8RVGKaV7uw6DnmVbrlDIT3+Ki
 rZh4dlfnL7w/p8UFQw5/2dWB5T4xy7IjpPV+DTyQEzwk4bWEg5/0hm0MZaACy8u35aT+
 AdmC5y5q99/RMwnLorYjDCYq1+vyRDM3pKGMz6L0MWRJETh9R4lnQVbJbfQ5SteVA6i4
 kbDA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUOPoHTurgDe2tTWHU0VOdoDEpnolul5dYYiQyQFmeBzoUROseIu3LWVpXyBzZrAzWETPj3Lq3qy6E=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxoh36MAN1nSvF+nCNNk/4TsKCyyfnvNXj7OyDseLKtdT8ozuWB
 GiFtQg8XRXZXnx4dM/XggzntOzuN7ix7IWL06GK0nNJ4NGVfY+u/wipc+ev46TRXu0o=
X-Gm-Gg: ASbGncsskWMYVY6HlIK9O+Bcm/PvaRVaAQnHscElyYwkx231QNHsw5SsjDMiLAFyJGi
 tJC+H/qzqkZWUN+F9M7IxjIpmVdlQtx4b9lWvJqkVvHegYBrVkWcpQO1dP+El9whiSsEdVCF5Yj
 fryz3Znsg9egsiJDA5Sup91qZqJ+XvoBi97oPbsXCiuNukmGNvmsFE/AIZVpJpU6yHkvugAlpGB
 cBlYYNSsAZrFYv2X2eepd3Mtwdw/5QvRduHpKABVlRosFFvjqWwkaZthbkZOq8Jori+Ka9PqETF
 pI+etvAHsK6Mosiy+vzuLojuBBB903+CQmqDdU9x64KQDysp8w==
X-Google-Smtp-Source: AGHT+IGJHwGsOxCdN5oGis27vb1AyYNhvNbxlgv3Kb4o4M728AI9zEGSMuLJuyD0gEFVU4qbEDu0qQ==
X-Received: by 2002:a05:6a00:138d:b0:742:ccf9:317a with SMTP id
 d2e1a72fcca58-745ece8e29fmr18116579b3a.12.1748251731195; 
 Mon, 26 May 2025 02:28:51 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-742a9876e62sm17162393b3a.147.2025.05.26.02.28.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 May 2025 02:28:50 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 26 May 2025 17:28:21 +0800
Subject: [PATCH v10 03/12] drm/msm/dpu: fix mixer number counter on allocation
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250526-v6-15-quad-pipe-upstream-v10-3-5fed4f8897c4@linaro.org>
References: <20250526-v6-15-quad-pipe-upstream-v10-0-5fed4f8897c4@linaro.org>
In-Reply-To: <20250526-v6-15-quad-pipe-upstream-v10-0-5fed4f8897c4@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748251705; l=1366;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=2zVon4JQp3GbP7LIHy+YThFAabtOIovGb5UEovt+mkU=;
 b=lutuJy0IlgOtx6aUkFLZEfXbrUQnxG83yF25Vb6Q9+e+okhLrSXqHlx66bdw4JoPZ/idme+0t
 fsk2zMHDXoTC4OFQ469lUlWf2vO+151FQG8yJoYNfRKlvlJCcMBqOuI
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

