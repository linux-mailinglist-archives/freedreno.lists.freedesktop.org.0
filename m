Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id DBD9670AFD6
	for <lists+freedreno@lfdr.de>; Sun, 21 May 2023 21:22:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6C3F10E0C3;
	Sun, 21 May 2023 19:22:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF74C10E1F2
 for <freedreno@lists.freedesktop.org>; Sun, 21 May 2023 19:22:34 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4f24cfb8539so5979585e87.3
 for <freedreno@lists.freedesktop.org>; Sun, 21 May 2023 12:22:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684696951; x=1687288951;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=SXMRGb1MvFb3LR9SwxNQHCX1I7kyPozNJxpNIKTyp3E=;
 b=hsi1IcoKsc0d64hXiZiDaciRM53HQEg2Ubxutrf09X1xqOMis7b7B9hEaiy+nlz3xF
 SfRP2s1LL7sY+k/5o+7MgVgcWQEXGqJ7yejj9EArE2pmU/PaDaPowpq1NuHQG5Iv0ah+
 J5pggusa1LVw544Hi7A/G9Qff9SqXMF3TaSXWB0X7T1pgLojcLuODeXmmsuVSjCFqVxD
 zjuR1CJCkM3kmu2sNVw73Ov4EcA/3VL5QGLc0gJRY6l6tZ4pG/MeP6lsErbAxkN5D4B2
 8fd8tYUAnUXKMr7if6keOmGNqlNsfIS2SOYnDKFK0Yof0HiyFokrXD5whwfbo10VcQtg
 rjWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684696951; x=1687288951;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=SXMRGb1MvFb3LR9SwxNQHCX1I7kyPozNJxpNIKTyp3E=;
 b=kGFNAes8gkUeckOJp+FN299N+NS8+y25jOUn3SmeTEXCwiWTTcHdqAiVbAmgzFNw6O
 3yGulk547zTWbwX7nSojuU6rGZM1sEh3VPn+a36oAxHVoCWTY9kAXFpBuMLqVO73k1Ed
 TZiPm0bPLTBDMGHvKd1UXC74O6VoVbhujfIpIxSMoLWnKPB8x7CAh0zYpMaGwVmC43U+
 OjlIbGg73HYCC2h6fnPPWDxays+D4Vgjm2L7LilsiR1rQuaJ6Dfmqj0U1yRvGyUp3f6+
 pPwV7teGoQUQP1fqiHmrWoOJMmHzRw+HHuK0ea0vyux1bYnmXjDmb7NVr61GjRg0XAmC
 m5MA==
X-Gm-Message-State: AC+VfDxkbHZLRp2UTNj5DmXAq/8OCD3hXRKw1geQv0ffK8rOeN8fOUUs
 P8dW8ouwcJaZqP/OXOv8Coc2/Q==
X-Google-Smtp-Source: ACHHUZ6+bvWso9kzQFn1RxwOYHel9XJzOMy3jupoyWB+q6AHUyhrQwIyLl9PnTg0KE5aCkR6f80cFw==
X-Received: by 2002:ac2:44d6:0:b0:4f1:3eca:769c with SMTP id
 d22-20020ac244d6000000b004f13eca769cmr2713743lfm.42.1684696951195; 
 Sun, 21 May 2023 12:22:31 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a13-20020a19f80d000000b004edc9da63bdsm692707lff.160.2023.05.21.12.22.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 12:22:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sun, 21 May 2023 22:22:28 +0300
Message-Id: <20230521192230.9747-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 1/3] drm/msm/dpu: drop
 dpu_encoder_phys_ops::late_register()
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
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This callback has been unused since the driver being added. Drop it now.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c      | 7 -------
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h | 3 ---
 2 files changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 1dc5dbe58572..c771383446f2 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -2115,7 +2115,6 @@ DEFINE_SHOW_ATTRIBUTE(_dpu_encoder_status);
 static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
 {
 	struct dpu_encoder_virt *dpu_enc = to_dpu_encoder_virt(drm_enc);
-	int i;
 
 	char name[DPU_NAME_SIZE];
 
@@ -2134,12 +2133,6 @@ static int _dpu_encoder_init_debugfs(struct drm_encoder *drm_enc)
 	debugfs_create_file("status", 0600,
 		dpu_enc->debugfs_root, dpu_enc, &_dpu_encoder_status_fops);
 
-	for (i = 0; i < dpu_enc->num_phys_encs; i++)
-		if (dpu_enc->phys_encs[i]->ops.late_register)
-			dpu_enc->phys_encs[i]->ops.late_register(
-					dpu_enc->phys_encs[i],
-					dpu_enc->debugfs_root);
-
 	return 0;
 }
 #else
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
index 1d434b22180d..9e29079a6fc4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys.h
@@ -63,7 +63,6 @@ struct dpu_encoder_phys;
 /**
  * struct dpu_encoder_phys_ops - Interface the physical encoders provide to
  *	the containing virtual encoder.
- * @late_register:		DRM Call. Add Userspace interfaces, debugfs.
  * @prepare_commit:		MSM Atomic Call, start of atomic commit sequence
  * @is_master:			Whether this phys_enc is the current master
  *				encoder. Can be switched at enable time. Based
@@ -93,8 +92,6 @@ struct dpu_encoder_phys;
  */
 
 struct dpu_encoder_phys_ops {
-	int (*late_register)(struct dpu_encoder_phys *encoder,
-			struct dentry *debugfs_root);
 	void (*prepare_commit)(struct dpu_encoder_phys *encoder);
 	bool (*is_master)(struct dpu_encoder_phys *encoder);
 	void (*atomic_mode_set)(struct dpu_encoder_phys *encoder,
-- 
2.39.2

