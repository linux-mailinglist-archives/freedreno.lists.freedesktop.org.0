Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 996F6ACC0DA
	for <lists+freedreno@lfdr.de>; Tue,  3 Jun 2025 09:11:18 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E22E710E687;
	Tue,  3 Jun 2025 07:10:55 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ARAq5RkN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com
 [209.85.210.170])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5604E10E68D
 for <freedreno@lists.freedesktop.org>; Tue,  3 Jun 2025 07:10:54 +0000 (UTC)
Received: by mail-pf1-f170.google.com with SMTP id
 d2e1a72fcca58-742af848148so3448827b3a.1
 for <freedreno@lists.freedesktop.org>; Tue, 03 Jun 2025 00:10:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1748934654; x=1749539454; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=wtx+6yP/PZ5J4/5h8BZGfldjHe/UjZ6koSQGv1wSzO0=;
 b=ARAq5RkNCY6EjHlpan4j592o0OPVgQxQYvFTT7f20E0g90xZwNoYrSh19fEuX8y2LE
 b/XKDGCnc++1TK+cgL0z1MuxHlK8AMFllO+gxAHe1wKPOI9ttFD93NePeVdSqyTnSTEC
 bALnhWuSONqWjL/47vuCU1GWWndV0P4/YilC+mFja307trH5OG+86T3R/bti1qXCkbhF
 lYoRnQ6/yKzonAdqwrdxv3mS2OZ6d86YhAXd/pnpZ7BnygTOzpOweCBrTLWIN7UGaYxZ
 IxsUhM+B0xVJ76Ux3uXcYHlE5vuyPBv3Gmkx3rKrCL7uqAELgGrvttQ1lfg8RhYkbNw5
 Y5eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748934654; x=1749539454;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=wtx+6yP/PZ5J4/5h8BZGfldjHe/UjZ6koSQGv1wSzO0=;
 b=ILs1SdslkInRHkvt3j5hR2XahHuTbOCx8owonzLEw3BY6x4axRruIPyrl4rsVZ9Xjm
 kqtbSWzqH1NQpwhG7cbjuNof/eVkVfzN4G6/UBngbkqC/l0Aajl5xNJLVW0N7Cctyiz4
 qsVVhu8AunNLoOwLYCNykW6QbwsTBuSQlxcCBOs49nWVAstL1XGxE1BZ9qkOZwmvj8o2
 Nf2eyfW8ik2zYUS3+U/KpgBIOdat9BYzFtCyNDjQYRz6Ytv+pUcEn3x167c+OvPq1Ceg
 jSlucUTqsruBRnahKTuS6mI2EJqVYsblAixjEV0etqvYydKgIicrY3gxWeU3tHWoKFyW
 txSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV/hVkyFb2yNigrCxDZ0vWDokJojvsY3l/orfXMhJZcphA+xZMmsm45USSUcqAQlJWLNXFIxthLLxI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvdmQ5md3gRMC+h5gOx6nUE2thCXBQAhY8X9HyQ9pr03jrSvHu
 i2TU1Rr167uWrjwqErZzg1SvNVfZA3HcnGtzdECcXcvVWvigGQwPx29fYuwsgxkoyFo=
X-Gm-Gg: ASbGncuCufnWD/6H8TTyfbFcnWVFFRIfkWfwpd7wRropw/DQ8vcqO0IstQTQJm6PzGA
 9hyylHfwr3keLDbOTE9GETDWWf2yomgVPK5Mj+oB0mvTc9+XCRZNExbaTkr+7ZQkfZYFRDvtQeh
 SuVKUdkCk2ZoVrYVoXKy76sGAXd4n89mfRPxvpHJvKGUgVjJNK42rkL9upftuiyMwfkk0NN6XzW
 3+sh0aXMrzgs3yi3UBQYBrHq4sxUKgLveZA3ypVe3/By9dxx7VpN36TmfO6b45n8bqDNfbhVSos
 LHd7hlkIqcRMv/CMsjHZ/G71XJXugpvQqiT4Uxffk9AzKgmPdQ==
X-Google-Smtp-Source: AGHT+IEjJGNuidzGcf6sJ/A0meCFZ2p/UGTGDCh8kd70ximZ8dtNCwm1meXyCFhsmKPr3Tv9lyZmUw==
X-Received: by 2002:a05:6a20:a11b:b0:216:1476:f5c with SMTP id
 adf61e73a8af0-21bad120c57mr16078986637.25.1748934653870; 
 Tue, 03 Jun 2025 00:10:53 -0700 (PDT)
Received: from [127.0.1.1] ([104.234.225.11]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-747afed360fsm8746481b3a.81.2025.06.03.00.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 03 Jun 2025 00:10:53 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Tue, 03 Jun 2025 15:10:03 +0800
Subject: [PATCH v11 04/12] drm/msm/dpu: bind correct pingpong for quad pipe
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250603-v6-15-quad-pipe-upstream-v11-4-c3af7190613d@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748934620; l=1809;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=uDQ4bz8vnlfaTdZAeHvnaqmYz1iezU6QmXEPd3wO/d8=;
 b=HYENK6zyOmddtj3kw/I4EdLhSrfkzfZ0p/SQUiDA02c89wQHKvf9pcRyzEdpvnvPF6bqlrhpk
 Ql/a0CaLDNpB6KEqsa8tRrmCptdMW8z86dhWOE+3vIpDR0s53qbgC+X
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

There are 2 interfaces and 4 pingpong in quad pipe. Map the 2nd
interface to 3rd PP instead of the 2nd PP.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 7020098360e474ee149824a488d912a7ad8ed06a..be8102691b99d3b381476ff844ddfd28fe17dc7c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1157,7 +1157,7 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 	struct dpu_hw_blk *hw_ctl[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_dsc[MAX_CHANNELS_PER_ENC];
 	struct dpu_hw_blk *hw_cwb[MAX_CHANNELS_PER_ENC];
-	int num_ctl, num_pp, num_dsc;
+	int num_ctl, num_pp, num_dsc, num_pp_per_intf;
 	int num_cwb = 0;
 	bool is_cwb_encoder;
 	unsigned int dsc_mask = 0;
@@ -1236,10 +1236,16 @@ static void dpu_encoder_virt_atomic_mode_set(struct drm_encoder *drm_enc,
 		dpu_enc->cur_master->hw_cdm = hw_cdm ? to_dpu_hw_cdm(hw_cdm) : NULL;
 	}
 
+	/*
+	 * There may be 4 PP and 2 INTF for quad pipe case, so INTF is not
+	 * mapped to PP 1:1. Let's calculate the stride with pipe/INTF
+	 */
+	num_pp_per_intf = num_pp / dpu_enc->num_phys_encs;
+
 	for (i = 0; i < dpu_enc->num_phys_encs; i++) {
 		struct dpu_encoder_phys *phys = dpu_enc->phys_encs[i];
 
-		phys->hw_pp = dpu_enc->hw_pp[i];
+		phys->hw_pp = dpu_enc->hw_pp[num_pp_per_intf * i];
 		if (!phys->hw_pp) {
 			DPU_ERROR_ENC(dpu_enc,
 				"no pp block assigned at idx: %d\n", i);

-- 
2.34.1

