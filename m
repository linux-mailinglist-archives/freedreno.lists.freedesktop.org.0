Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53BA3828E93
	for <lists+freedreno@lfdr.de>; Tue,  9 Jan 2024 21:41:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A49510E4E7;
	Tue,  9 Jan 2024 20:41:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5346E10E4E7
 for <freedreno@lists.freedesktop.org>; Tue,  9 Jan 2024 20:41:11 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2cd08f0c12aso36595991fa.0
 for <freedreno@lists.freedesktop.org>; Tue, 09 Jan 2024 12:41:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1704832869; x=1705437669; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1IMTrLGXL3DoYuQMmQ7qjtoDUmoVxjKFdnyiQCYD2qI=;
 b=jSFfyisAjq3NWmqSLrML4WSrDlbQp2kmqMbXKRLJ6gh/eis86znbzPPb063yfE8f/Z
 RnT3iRTF3ePrOZEA6MPIWbFiVz6vJG6EtHNVw8eCt+ny6cgDOozcY6w2PLAj9+CkF4l0
 z7NGqYh4FTgsHAPen7+aq/9UTExsbAk2WSmPPkSy9SExxJ6e1uRxZIlQPfn+04v+F7Si
 uYw3hWvcYgxfXbUqdcH214PusE2bd9eukaq7n8wca+CQTpFSEy0sV0FgzIvvNKhBFjbe
 apQB9toNlpY/yRI7mmI1ygklW9Hga91xutomYSNCDIrimCk0GCivcD0mQHLFVJl+ggks
 eQ+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1704832869; x=1705437669;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1IMTrLGXL3DoYuQMmQ7qjtoDUmoVxjKFdnyiQCYD2qI=;
 b=P0apzQAvHg7sQZofNYfS26rXh7vvwTmhvoEx9VGdc4J3xTYj/7g9HF6lldIqw3oBXm
 5/lO4Ml+O58iJMFy2Uo13cTgw+IoPYDIYIV4fn0IRuDcwGyDlsIoJADaxpNOLOUNsxbJ
 GkHH9/RE/L+XxUl3k0GshQp9qkY5ionGjCXfSYf72Y2s0mJIZtGKGJVTmAHu3UMi/eJ4
 ud4lrVVwISqXdqU01ryBAsmbfWlcbqw/WkBBKjNwacjmSiAox/Vf0ebv2ufAH2f97rZ9
 81A3Wmm/dzsdYJiRJ0M45DAiBcchz6CRLBVklbZW3aPDgH70WitWj8Z49IKyE+hRAPW2
 8WfA==
X-Gm-Message-State: AOJu0Ywom+rQztauuOZonH/fd1v4l9IkLpMhOz1BjaSR0PENIqH1Kw4P
 e1Qln4Ie0iXdE52RsEkq//H4LC/Yr0Y4XA==
X-Google-Smtp-Source: AGHT+IGq5218wvaogJueOD/DpYuKLoXmu4W+n/+HB2kF4j3PUDGcL22+DHFIx6i8j3H6hWkaN3FnnA==
X-Received: by 2002:a05:6512:2023:b0:50e:64f5:ad71 with SMTP id
 s3-20020a056512202300b0050e64f5ad71mr1476328lfs.146.1704832869503; 
 Tue, 09 Jan 2024 12:41:09 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 y3-20020a197503000000b0050e7e19b692sm448489lfe.154.2024.01.09.12.41.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Jan 2024 12:41:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Subject: [PATCH] drm/msm/a6xx: set highest_bank_bit to 13 for a610
Date: Tue,  9 Jan 2024 22:41:08 +0200
Message-Id: <20240109204108.3385496-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

During the testing of Gnome on Qualcomm Robotics platform screen
corruption has been observed. Lowering GPU's highest_bank_bit from 14 to
13 seems to fix the screen corruption.

Note, the MDSS and DPU drivers use HBB=1 (which maps to the
highest_bank_bit = 14). So this change merely works around the UBWC
swizzling issue on this platform until the real cause is found.

Fixes: e7fc9398e608 ("drm/msm/a6xx: Add A610 support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---

The photo of screen corruption:
https://photos.app.goo.gl/k4MPzpBKPUD3AKR37

---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index c0bc924cd302..c9c55e2ea584 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1287,7 +1287,7 @@ static void a6xx_calc_ubwc_config(struct adreno_gpu *gpu)
 	gpu->ubwc_config.highest_bank_bit = 15;
 
 	if (adreno_is_a610(gpu)) {
-		gpu->ubwc_config.highest_bank_bit = 14;
+		gpu->ubwc_config.highest_bank_bit = 13;
 		gpu->ubwc_config.min_acc_len = 1;
 		gpu->ubwc_config.ubwc_mode = 1;
 	}
-- 
2.39.2

