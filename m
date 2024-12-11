Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D2CCE9EDBE3
	for <lists+freedreno@lfdr.de>; Thu, 12 Dec 2024 00:41:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A30410E1FC;
	Wed, 11 Dec 2024 23:41:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lyUAPYAz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 83B3B10EC74
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 23:41:54 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-53e3a37ae07so5084543e87.3
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 15:41:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733960513; x=1734565313; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TEwFM71k30EaN8cVZKntDI/qViIcrUeJPH3d95sXbSk=;
 b=lyUAPYAzaACdymPHaLJ1YwjGyxZXdTILspcymHEgBEA4Sx78ASvMulBWrpeXsJSul8
 JpuQy5ojtR8b++M6E3+gmGUlX1bIAAXmJrpSUlPd6aSWIWWyEhxRhs/Ae9JYTspQQFPn
 4jhNU0yUFGTxnf45YRQPJgWbvhfAgYSDfdTQmu2ASEEdMCr96R3jqCbhDgosUNt1UArm
 sjOQAXwlAWd+B/fZNdKd3yaPge7aA/5dqVgWuS3tyXf6h+TaOMjsfLF60Ebc7ZjzJuZb
 wcbS7MDTnT3UQgCBUo6JZJUTQA1UhYgd1Jyq+Qwm2OsjyCPkE1S2Zj5lCgaJ42HEpebr
 uDCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733960513; x=1734565313;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=TEwFM71k30EaN8cVZKntDI/qViIcrUeJPH3d95sXbSk=;
 b=bKmm9IS4AseuuSCMZO8YdnCBy+S0zkUVdyhK+s3D5RPMr7hgNkeNGQ96iVALEbxPHR
 xJP5QRKEifC5PvwqASuSdVdcv82QgwP/3nizZ4IGPt3Wn340f2w+camyKLPl10HfolN2
 ZfLHjvtf8V9voU8vZReYsLT6OgEUirsaFptv3YV6Pu7SfX7AcDXYX8mdFC1LcqlbC84+
 n/GAefO2r9P4LvRIpFIHJqET9elpjbqpcmrNa16fMREZ2DJnQfNx0HdwENchnHYnC1mm
 6hkBMNcJvy6Df74H5qoUo2/y2+eT85Cz90GNTdDmZGmegsiaw2dOBTmuDAiINqoWL+ID
 v/Ug==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNgtqEvmDLkoI4w+mA3nbgrxfTSjfLabGjfbymn85IfhpG5sicJOeZfkUJOJKoLQ1TUcbcclmZ08k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzH32UcS8lbIqLwQMWyMJNVg8TBNbDr+MSnU30l6a89WIyHOraq
 kWrnHZggODOKQgcCaDAvN0QNXBcPWTwGWkzUvXRr8n/eCbG72W9+pvrIVJgjIBg=
X-Gm-Gg: ASbGncv7Y1fMjVxHPVjh+piR/pMQaFugbLkbF7gHm1IZhU2tn7hlHxYmT3bkJOoUWTK
 t7a0nmq9PZAELc9wJuP95N0wS+Dvbymw9Rzg5I/vtxK/C4Wp3Azuak59MUYEQyf/1sW6UBOcik0
 DgBU5XAOQoYKVNGw1EP9Y3Hzy8ZOPNer4IrsQUe/nfabBHy2RR/Chkfhld2lzgBCprKJ+j+8Niv
 UKx6TIcxryLPTLD2BQ+iTf36Xl+nbFimEhvLvad89lNg9Akn6K3dgb5ZDEZUw==
X-Google-Smtp-Source: AGHT+IGj49Hwcak5BEjIpvDLC2UjxrR7zzU83GvzRN86z5UCN6Y2OROY6cNCNFctuKn9n1eJTKzqpQ==
X-Received: by 2002:ac2:4550:0:b0:540:2a6e:3732 with SMTP id
 2adb3069b0e04-5402a6e37e2mr1112849e87.9.1733960512905; 
 Wed, 11 Dec 2024 15:41:52 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5401cc76909sm1222207e87.58.2024.12.11.15.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 15:41:51 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 12 Dec 2024 01:41:37 +0200
Subject: [PATCH v3 02/14] drm/msm/dp: fix msm_dp_utils_pack_sdp_header
 interface
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-fd-dp-audio-fixup-v3-2-0b1c65e7dba3@linaro.org>
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
In-Reply-To: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2640;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=HfzBNoNZ5YxREpp+zwNqWVRRAleEY/sLAybyceKsIwk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnWiM3DM6YSvmt2KB7RbnsOnGAh/wrprvgKkoMe
 OrfWcUVum+JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1ojNwAKCRCLPIo+Aiko
 1Wz8B/9dQvWgr1iQnpRunRBkLYJyJCll/ef1ZtgyMOqO217j1/Xm2FAqJf3KSwA0uJVDx7SG98m
 m8E7CG+nA1nOgkU2d7I8ViwHAKLAPcjR6eqNx5/rPL7+1VJSwEf6xvCeqvfPflT3Y9R0X8to3k2
 aUrzJnfknIxSDuHvIJyE/A2r1Pj4QVnXxKIiaishOFgP5Oo3YURVgmPSpunloMpUedd6iVoUnw3
 WyMy+aLAjKvY95LYjwLnJigcEjOK/6nrJKCbLl4h+PlBvmvJdkRIue+ReqWQ8QK1K+oKZ38byo8
 gji5iESruB8ZF5B1VvEjztHiAi8RKeVILuj6LJw8NizsR6o4
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
sizeof(u32*) is 8) and is always false on 32-bit platforms. It returns
an error code which nobody actually checks.

Fix the function interface to accept u32[2] and return void, skipping
all the checks.

Fixes: 55fb8ffc1802 ("drm/msm/dp: add VSC SDP support for YUV420 over DP")
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Stephen Boyd <swboyd@chromium.org>
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

