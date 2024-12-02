Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 747F19DFE1D
	for <lists+freedreno@lfdr.de>; Mon,  2 Dec 2024 11:06:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 548CB10E6A4;
	Mon,  2 Dec 2024 10:06:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="EZ9n3m11";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f51.google.com (mail-lf1-f51.google.com
 [209.85.167.51])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DE70F10E69E
 for <freedreno@lists.freedesktop.org>; Mon,  2 Dec 2024 10:06:46 +0000 (UTC)
Received: by mail-lf1-f51.google.com with SMTP id
 2adb3069b0e04-53df80eeeedso4008632e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 02 Dec 2024 02:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733134005; x=1733738805; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xY822JqISKSBvZvj0s20BCeD1NcNyIjNyABXPzWHxOc=;
 b=EZ9n3m11BAOoFRYpf7QuA4FNl2HiKihukPrxzGyS0kr18uWUck7vk9ps2Ma2Ej4/J4
 cb4c4Rv61BIioTVSfmd7o1ai+Un6xLzv8xlJvBI4K4fskQG0TU7iGJ3WN8ioXTlRkjnR
 yHHhXYv5/qJxlxl5yE0igOhiWjIi8VCaiFCaNd5XNMbytrIrG+lN6RJyRz+V/Y18qzL+
 UV3SBMRXJloEs02cdbyT6u8lxZL2CnDG2YwFPlJcXgl36jgHL1f5olkP0+LC0p3XxbI5
 cdRF9NWiwz1agN4sFnBRQrwRaS63CVe4WQZPaYLeEfd0RF1i2wFqU987SFUKaIVkzyd2
 +ufQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733134005; x=1733738805;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xY822JqISKSBvZvj0s20BCeD1NcNyIjNyABXPzWHxOc=;
 b=DsJvieuhRLQJUGQTu2yiaHek6nfnb5zGkbNq4V/gW9wUp146P37k2OCH/0KWKtKHZI
 zbEXsicjD/3rqVHY1YMtbO0pC/EDCGPA4vW9MvbhQ6oJHvGkLZ53sLOaF/8UHwZSWSdA
 H2GUiYfFvZuLQwJQjegHTbtmxRHsaOGmNJdQaCY0dgZmQ5hyTMLySYp8nfCeGL9MKvvw
 I/Rc+gWu/b0i3pOZuhYm92a9jlstMEBKhIXw8R6bbCGwAppl0m5lgHFuNmxtjvnZO13D
 mURxZdhQBFrZbzxipIjcAioftow/TDU/bFLH7ooNBJycyZYYYtPSkFZ0iin3/IPDpC5R
 8Epg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9YVZdBndRVGJSZR2AHWMO2ZpoOZMNs9EVNNMilYzorXbD3NS5czWwH+LbGTCXEd6OD7jsRTwNY9c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyjc62VZlV/XDroG4FctHp6xcu04zpStFi+85ccsHilUju5m0zi
 /cEpbjgghNa/tqlNUG5RQjp1I/XHIRDM97xFjTJ5zD2LJZBqMtqFHEQ9Fqb10Uw=
X-Gm-Gg: ASbGnctYBy70bQmuqagMBLZETLQHvJEZmsXXPI5cbGOxy/3yZq4fGyzyd8mzM01rM6r
 wZ2mrlSNmYuM9gJy+HSHqh67OQ2z14ytJq+ZsDdOwNMSFOeYj8z+Tt52Iw9UMat2/C8DYZLnaiz
 iIn1UAxA6OC4x7pyBMD2uqR1U2vbZVcb24OXiW42c0EVCUgFRAvFnEIR40Ys3hLH9E42xTBEoFM
 rxONRCthiptk39STi1P1EPCiMxaNwRL8pBJ7zO14XvUsdMLUG4AMmgMEQ==
X-Google-Smtp-Source: AGHT+IFP4lsbN034uazTQ5cwRdJDA12eq3+eRm1H0gkVc9pxfx7WQYmk4WuTYNRM7wHcbbplGL51oA==
X-Received: by 2002:a05:6512:3e1e:b0:53d:a9c4:9ed6 with SMTP id
 2adb3069b0e04-53df00dc9a4mr9334930e87.25.1733134004996; 
 Mon, 02 Dec 2024 02:06:44 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-53df646f191sm1418314e87.136.2024.12.02.02.06.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 02 Dec 2024 02:06:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 02 Dec 2024 12:06:32 +0200
Subject: [PATCH v2 02/14] drm/msm/dp: fix msm_dp_utils_pack_sdp_header
 interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241202-fd-dp-audio-fixup-v2-2-d9187ea96dad@linaro.org>
References: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
In-Reply-To: <20241202-fd-dp-audio-fixup-v2-0-d9187ea96dad@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2535;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=abn+V/VW2R04+ivG5L+16aCpi+lS1tSzUvuSfrCga00=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnTYasgk4X/0Ogz40yCleICJWnJzduNvDdpABSX
 EAM9EF7/gWJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ02GrAAKCRCLPIo+Aiko
 1fp6CACtGFwJ9kceGBynmVPKNUl3XYUj79S1auIEEtiA3kP/JftPdu5WqzGTXBEZVw6xwsmATbO
 cOaI7cYBxA6aFk6raoT346wHwii/UrN2/rvHd2ZAuTGUlp+YfxR/m3/Jr6aS/aekEvlpJ4DWjud
 e/O9fpQU8CkiPREcnFOdwfBa+MLSV3zV/gQ7XgpcqOu+Ftdyjx0sT5TU211n8TGFHt1ooX4Ryvk
 0p/hawRQ7uiloIIyMFJ3cmTPChJxRNZQIZ5u4qlW4KH0fr9OikX6kVZDJNXPHXl9Cvy5OtYZ4cy
 GrOvwQeH4lSMso097djgxo6OIFbZramAvOViCxmINzYqZ5Zk
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The msm_dp_utils_pack_sdp_header() accepts an unlimited-size u32 pointer
for the header output, while it expects a two-element array. It performs
a sizeof check which is always true on 64-bit platforms (since
sizeof(u32*) is 8) and is always falce on 32-bit platforms. It returns
an error code which nobody actually checks.

Fix the function interface to accept u32[2] and return void, skipping
all the checks.

Fixes: 55fb8ffc1802 ("drm/msm/dp: add VSC SDP support for YUV420 over DP")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_utils.c | 10 +---------
 drivers/gpu/drm/msm/dp/dp_utils.h |  2 +-
 2 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_utils.c b/drivers/gpu/drm/msm/dp/dp_utils.c
index 2a40f07fe2d5e20114a7692d1269bb8fd5bddbbd..4a5ebb0c33b85e3d55eb974d74c1f54591301b35 100644
--- a/drivers/gpu/drm/msm/dp/dp_utils.c
+++ b/drivers/gpu/drm/msm/dp/dp_utils.c
@@ -74,14 +74,8 @@ u8 msm_dp_utils_calculate_parity(u32 data)
 	return parity_byte;
 }
 
-ssize_t msm_dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 *header_buff)
+void msm_dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 header_buff[2])
 {
-	size_t length;
-
-	length = sizeof(header_buff);
-	if (length < DP_SDP_HEADER_SIZE)
-		return -ENOSPC;
-
 	header_buff[0] = FIELD_PREP(HEADER_0_MASK, sdp_header->HB0) |
 		FIELD_PREP(PARITY_0_MASK, msm_dp_utils_calculate_parity(sdp_header->HB0)) |
 		FIELD_PREP(HEADER_1_MASK, sdp_header->HB1) |
@@ -91,6 +85,4 @@ ssize_t msm_dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 *head
 		FIELD_PREP(PARITY_2_MASK, msm_dp_utils_calculate_parity(sdp_header->HB2)) |
 		FIELD_PREP(HEADER_3_MASK, sdp_header->HB3) |
 		FIELD_PREP(PARITY_3_MASK, msm_dp_utils_calculate_parity(sdp_header->HB3));
-
-	return length;
 }
diff --git a/drivers/gpu/drm/msm/dp/dp_utils.h b/drivers/gpu/drm/msm/dp/dp_utils.h
index 88d53157f5b59e352a29075e4e8deb044a6de3bd..2e4f98a863c4cb971e621ac24b8b58f035236e73 100644
--- a/drivers/gpu/drm/msm/dp/dp_utils.h
+++ b/drivers/gpu/drm/msm/dp/dp_utils.h
@@ -31,6 +31,6 @@
 u8 msm_dp_utils_get_g0_value(u8 data);
 u8 msm_dp_utils_get_g1_value(u8 data);
 u8 msm_dp_utils_calculate_parity(u32 data);
-ssize_t msm_dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 *header_buff);
+void msm_dp_utils_pack_sdp_header(struct dp_sdp_header *sdp_header, u32 header_buff[2]);
 
 #endif /* _DP_UTILS_H_ */

-- 
2.39.5

