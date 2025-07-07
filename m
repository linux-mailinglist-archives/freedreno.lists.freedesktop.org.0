Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AFE6CAFABA6
	for <lists+freedreno@lfdr.de>; Mon,  7 Jul 2025 08:19:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C337210E415;
	Mon,  7 Jul 2025 06:19:00 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="adjjdPjA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com
 [209.85.210.174])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E73A310E413
 for <freedreno@lists.freedesktop.org>; Mon,  7 Jul 2025 06:18:59 +0000 (UTC)
Received: by mail-pf1-f174.google.com with SMTP id
 d2e1a72fcca58-7490cb9a892so1539848b3a.0
 for <freedreno@lists.freedesktop.org>; Sun, 06 Jul 2025 23:18:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1751869139; x=1752473939; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ILXciEgW0I//qoLe7GzIdmNaMHGieJ0bsFVXKGQw/3Y=;
 b=adjjdPjAgA5YmrXAtabiMPqwOWqLqQAmc/aZaekwY07A4DUS35lqAbQksL/I2yV3gC
 YpmSMlL4knxwLEc9I/b5haQk9eBp5tR7EPFbT9fPQt2KWfkU8yfbxOUDE8CfGvr7yQf5
 LgvnmnnG0c4InhXu4b28JRL257av7Iicwgqt9E0R/sO/MaUgkmvoH6zwI2jZq+oMgZk0
 SqTzCpMjBEYVcIcxj/0o103v0z/TJqFTBJdyK5KqbUuQdcY785ZA9tHwoylFWKgTWoCa
 f150eJj6gfMmpn9Azf9sNV0JZE3fdA9mSKyp9VDLGwCbXBVu4tS10J2WbNx7mUEV1swM
 J0ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751869139; x=1752473939;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ILXciEgW0I//qoLe7GzIdmNaMHGieJ0bsFVXKGQw/3Y=;
 b=wYovAMv90TMwdeg7HR60iNtvs1MaxLvseSStAX0m3dMtb/g8jQiSBSLqpoSeJYEcX/
 eWU98bgUx1OHbUzQMUxC8dnUv4SwAYsmDkDnZ/A6mbbczk4+wHsL7UDh9hJ4CNUidDml
 6BecL/ZmU8C073TSB0MjEB3Br0luszpIs5OzsL5uYjyf4jNslFLAReeIPPoXmaJitagG
 yTXtb9N+t+c8VGc+UWnAn1MOu8XZ1msXlJ6vnvd2K/XYagpPXrQ4YsbSm2B+Il7CAyIl
 IFB6+d+cqo6tbx/o00vYYR4q1dJ2Z3oFqSQvuiCo7e7d1ZKp7Q32vMP4tfh4bO3mKCsi
 Bxhw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXf+XQsYWwsJP/QJfo35p9it9pBsjFL8kTZ+nFE9K3CGzxZSFdnqTELI8Z6Jj7pzuv/x7HXk5VpZP8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx+roIILAi2R8fAN7IgvQ+FpSpp87ZLy5SBewvDY5xiboHcJ5pt
 Z5jnGDDmHO8dutwNxOzZl6apKB8HwGnf5LQaBi+ykO8wwvfeXdt8k0lo0PqkJCp+bT8=
X-Gm-Gg: ASbGnctTqHimwKgfR/+m50olxOJ9D+KRz5/JBQW5qcgdlwHkDGErTxE4rMnYp2MvW6o
 cRkZti2tojoXgUMw6JpDwJc3hxpmaspboQHkPb0wjXGuIk9J0ESD16lDVygAJLWJ66wHjHAjWS9
 /QGlu6W+QdDrWtYFi0wEz5hTUT2xRBSGz/90+hAPQMhC2Mvscjdj7OsFwyUz54o467T7f56OmJy
 RDAXEmm9ICJhbYwM9sBao7XmVpaJVzgpBgsTjh5sWuG8BwH0rwcI+fTl/wnQE1h9OXE57Sjtm0Y
 YZRpGp2+xgixOBx1/dMyeIvns8hpK+dOiJ3CJohPLfvEYT8T7X/Z0uRrqdI=
X-Google-Smtp-Source: AGHT+IGHeMWJ3CU7o8u2I3jtTuKviAnMMK1jk68uIZizqYV/+1lVKm5gab4fF2qM/al4kHop9FptTg==
X-Received: by 2002:a05:6a20:7f99:b0:220:7b2e:5b3f with SMTP id
 adf61e73a8af0-227213b0f9dmr11250088637.19.1751869139526; 
 Sun, 06 Jul 2025 23:18:59 -0700 (PDT)
Received: from [127.0.1.1] ([103.163.156.9]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b38ee450ccbsm8037327a12.3.2025.07.06.23.18.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Jul 2025 23:18:59 -0700 (PDT)
From: Jun Nie <jun.nie@linaro.org>
Date: Mon, 07 Jul 2025 14:18:03 +0800
Subject: [PATCH v12 08/12] drm/msm/dpu: Use dedicated WB number definition
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250707-v6-16-rc2-quad-pipe-upstream-v12-8-67e3721e7d83@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1751869084; l=1716;
 i=jun.nie@linaro.org; s=20240403; h=from:subject:message-id;
 bh=EMexKmSgbyJrNm4fgVgmbAaex5tIopqSAoqfoqK2ahU=;
 b=nFHB3VxCXhLEoI/KGV5opIO0xVlYrUN+hcLsZnNkOIelu+Vnn0r3HYqoOcRs+4m8mQ7Gt9lwE
 BgWUi8fort7AuSXXlYlKt/MQ7A0V0fejxbdR5aBcTw5rYTUIzzX9JJY
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

Currently MAX_CHANNELS_PER_ENC is defined as 2, because 2 channels are
supported at most in one encoder. The case of 4 channels per encoder is
to be added. To avoid breaking current WB usage case, use dedicated WB
definition before 4 WB usage case is supported in future.

Signed-off-by: Jun Nie <jun.nie@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 2d88d9129ec787df6dac70e6f4488ab77c6aeeed..4616b360812491afbe63f8ffd4a57bc9604382e7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -56,6 +56,7 @@
 	(MAX_H_TILES_PER_DISPLAY * NUM_PHYS_ENCODER_TYPES)
 
 #define MAX_CHANNELS_PER_ENC 2
+#define MAX_CWB_PER_ENC 2
 
 #define IDLE_SHORT_TIMEOUT	1
 
@@ -182,7 +183,7 @@ struct dpu_encoder_virt {
 	struct dpu_encoder_phys *cur_master;
 	struct dpu_encoder_phys *cur_slave;
 	struct dpu_hw_pingpong *hw_pp[MAX_CHANNELS_PER_ENC];
-	struct dpu_hw_cwb *hw_cwb[MAX_CHANNELS_PER_ENC];
+	struct dpu_hw_cwb *hw_cwb[MAX_CWB_PER_ENC];
 	struct dpu_hw_dsc *hw_dsc[MAX_CHANNELS_PER_ENC];
 
 	unsigned int dsc_mask;
@@ -2387,7 +2388,7 @@ void dpu_encoder_helper_phys_setup_cwb(struct dpu_encoder_phys *phys_enc,
 	 */
 	cwb_cfg.input = INPUT_MODE_LM_OUT;
 
-	for (int i = 0; i < MAX_CHANNELS_PER_ENC; i++) {
+	for (int i = 0; i < MAX_CWB_PER_ENC; i++) {
 		hw_cwb = dpu_enc->hw_cwb[i];
 		if (!hw_cwb)
 			continue;

-- 
2.34.1

