Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B7AC29C12F4
	for <lists+freedreno@lfdr.de>; Fri,  8 Nov 2024 01:21:46 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5608310E8FC;
	Fri,  8 Nov 2024 00:21:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="tqG8gUqc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com
 [209.85.208.181])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F7C10E8FC
 for <freedreno@lists.freedesktop.org>; Fri,  8 Nov 2024 00:21:44 +0000 (UTC)
Received: by mail-lj1-f181.google.com with SMTP id
 38308e7fff4ca-2fb5fa911aaso23343281fa.2
 for <freedreno@lists.freedesktop.org>; Thu, 07 Nov 2024 16:21:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1731025302; x=1731630102; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=xY822JqISKSBvZvj0s20BCeD1NcNyIjNyABXPzWHxOc=;
 b=tqG8gUqcJjwIL3ig3UHwypwGoGvYUa42Aikw5jaW1IUNrnaWQ+9ambKUxD3wJl1yh5
 NoSUlgT/k9lPm+pGr/kHrn794IXBVu7AelNcrLEiWCpzGX37GsDRjnzcvbv1pIsP1dEy
 ggOSoupdwkJW6Rqcfw/4U2AiOSl1Zk0Sufk3prfGkNtyqL0epN5xEyDFcQ5sVRFYhXEU
 KOpl12Iue4+nrCNgZtFgqBK4bup8YdOwafEeCNn/IoSSnyQudyDALmQ7+XLmPocwLw9d
 8K8NwVdSpivVmCIskW9Wvitui2ECoEqNk1FXXU34LNim7/Un9FvqIfjbjPYhUajNNaog
 N9TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1731025302; x=1731630102;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xY822JqISKSBvZvj0s20BCeD1NcNyIjNyABXPzWHxOc=;
 b=AsNgDr6dOftN2NtTnL1ycFsnnm8wepyxE6DGUQNcvwc/FoDUW/CrNC2sNQ+6su210k
 dsOAghzPoTvUZYoCUklYoGOHGa8hrJtIHYZj9uqvTKIkHanHfvRVSptGw5Rtfn3Gzm1D
 3zXJUCt3+BKCPkwe78SbGArKmzYU8WqFv4yEvp2Jjo2exDdlcs927xIiFRNi6kWTXQ+S
 Jmq7aiuYO2uVwbtAa/2X/oKepaEgmcmBnq2JBtkJ5lu75xFcTXiDFNZSr5Q59xt+vuCE
 6cIJFiqj+TtfIj+zOqLJGaQAXXh7kB4j+NbP4QYmASrc165kIeecJtRWZGaE31OvZ/xf
 whgg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUVYXBHne3YnbTMWhQJYSA62Wj8Qgi2NhlkI9oPeQQpFPVOtNbRCfIX8WbZf1sOaq04R60wZSY7ilc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy7tUHBWpm1z09r0hAsKUrbBtbYXM9mRe13rXxbhRXNvK3dVoYY
 IY6sUJP+KIkxMsw1mJ0iF9/rtOsneyZ3xEiGNZG+PU4QIbLW1BkMxYNgvVyhDm8=
X-Google-Smtp-Source: AGHT+IEq6ivfN+wJwzSVr2+2EsfSbjnKIpmoB5DdUoek2Tpc2v2YqRfcEYVZeYyjXtOgbLpQYY7sVQ==
X-Received: by 2002:a2e:a803:0:b0:2f7:6653:8053 with SMTP id
 38308e7fff4ca-2ff201c7cc0mr7133511fa.18.1731025302111; 
 Thu, 07 Nov 2024 16:21:42 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-2ff17900a63sm4195191fa.47.2024.11.07.16.21.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 07 Nov 2024 16:21:40 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Fri, 08 Nov 2024 02:21:32 +0200
Subject: [PATCH 01/14] drm/msm/dp: fix msm_dp_utils_pack_sdp_header interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241108-fd-dp-audio-fixup-v1-1-40c8eeb60cf5@linaro.org>
References: <20241108-fd-dp-audio-fixup-v1-0-40c8eeb60cf5@linaro.org>
In-Reply-To: <20241108-fd-dp-audio-fixup-v1-0-40c8eeb60cf5@linaro.org>
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
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnLVmOlTL82Q+yU+jTYQJ2nDrxLnq8YKm4nBQrW
 XWQ3vKXdO6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZy1ZjgAKCRCLPIo+Aiko
 1aVAB/wMp1GUIzKR0e0Z7EmL6OhYO8pzNKgXmJzLpBJHGsb3lAkcVB8stTyd7yx4NyeObcSp0dN
 FEXTHPvI4cEqqpzxMjTMzvERHuhHalCM/N4bmNMEg9aBigDEDFFeyVoIOgrOVrYPe1PsFL6ibG7
 BxcCRw1Xe4T0Dzdcj5708UB0Ejd54RFOjX7lfeC+JAryOMN05sG3b+S2NJsOHi4fq/Dhk6HGu5T
 wLyg+ob9chEYbWjZvDgaixAMyFsah9l5WnBj4IFCcWOlbJ1H9d3cTnpnv+W7PG7VxzJFk3b+kNn
 tUJRuMx5kL6Wa/PvEsa2clV8XVeqacZ/osSRe8CjnyW1wkLD
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

