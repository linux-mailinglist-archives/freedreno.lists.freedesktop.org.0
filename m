Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2F3636590E6
	for <lists+freedreno@lfdr.de>; Thu, 29 Dec 2022 20:19:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C4E6D10E221;
	Thu, 29 Dec 2022 19:19:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B24D10E217
 for <freedreno@lists.freedesktop.org>; Thu, 29 Dec 2022 19:19:03 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id y25so28750387lfa.9
 for <freedreno@lists.freedesktop.org>; Thu, 29 Dec 2022 11:19:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=DZwJ9mZTT5zldaxndYWJFkFUXjJdkwhervFdabSpxaQ=;
 b=Xw9L0kCzAsY3uZVsWPm/LESE3jBReM36lOw42QX3H1hRpjNdg1K2ZJGtWOhagK5lSX
 gb/ieCeSJCq1JM0Ltxx/3JarSAj5Oif6vyGMG9+o7Ic1EaSo4yjukkywZxoe7vAoam/O
 mLtW49eSXDobIHB54B92n3hKt9KT93Y9tNUGsOn+7dqpp54FoFElBOmG6c70jj2EPlID
 4v7dGrbdBw+7iMeY5q97IGcADEOfLGskQsXFb1d7roaEwP4PmbA0UAxpFTRaWftn7BEu
 1Zi3J/BwpACsYBBrRarpQSKT2V3iX5ul287lUOKmKxQQCqcsbKhYTf/6Iw9GVcSL1jk/
 OgoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=DZwJ9mZTT5zldaxndYWJFkFUXjJdkwhervFdabSpxaQ=;
 b=kkx95hQgy6jF4zreMt/YgR8s2i4Ntw1VlL3iixr/1NYBMiTDkpvMgxm5up3JXroUOd
 k8JilgG3q9uXYGdlNKlm9dJn7gpuelWsiXOt8UO6E4VTsW4VYfEKVNlEiQV93HdWWEKI
 4JRzLec5fFbd7PIGyys9wAB6QjokEMabDqBUkz/mWBw3Okzn+tCf9erTSjeoptUcuEr/
 h/xZ0AxM5IThkqDjCjZiDq9cd0w3XJH1dQFtfqDZwbNgRW1n7LctExH6IuGVFgGqtsPH
 640EvbEhjp701Gm2tMqDWFfRptosy/B1ejkDtITIA9rxaydxo/uvJlZ6B1cw9H6dEx5Z
 beYg==
X-Gm-Message-State: AFqh2kpQTgK46CXIHCMPfMnd/f5BHw/xC+0FFNWRBPR05CHNFrzniQdD
 rW4Oq/bdk0Jb/X0wQQs6aFTWqA==
X-Google-Smtp-Source: AMrXdXugom1+TtthJTnJlbj6J/olcZzkTq62d4aH1OikinEStSGbcOoXbTsGVtPwZQ1oelScbawXmg==
X-Received: by 2002:ac2:5b41:0:b0:4a4:68b8:9c5b with SMTP id
 i1-20020ac25b41000000b004a468b89c5bmr8641922lfp.67.1672341543208; 
 Thu, 29 Dec 2022 11:19:03 -0800 (PST)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t13-20020ac24c0d000000b004cb10c151fasm1162295lfq.88.2022.12.29.11.19.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 29 Dec 2022 11:19:02 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 29 Dec 2022 21:18:33 +0200
Message-Id: <20221229191856.3508092-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
References: <20221229191856.3508092-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 04/27] drm/msm/dpu: move SSPP debugfs
 creation to dpu_kms.c
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

As SSPP blocks are now visible through dpu_kms->rm.sspp_blocks, move
SSPP debugfs creation from dpu_plane to dpu_kms. We are going to break
the 1:1 correspondence between planes and SSPPs, so it makes no sense
anymore to create SSPP debugfs entries in dpu_plane.c

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c     | 18 ++++++++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 16 ----------------
 3 files changed, 18 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index 651621b9794f..8c3e9090be4b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -388,7 +388,6 @@ struct dpu_hw_sspp *dpu_hw_sspp_init(enum dpu_sspp idx,
  */
 void dpu_hw_sspp_destroy(struct dpu_hw_sspp *ctx);
 
-void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct dentry *debugfs_root);
 int _dpu_hw_sspp_init_debugfs(struct dpu_hw_sspp *hw_pipe, struct dpu_kms *kms, struct dentry *entry);
 
 #endif /*_DPU_HW_SSPP_H */
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index b71199511a52..2dfc4748a0e8 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -250,6 +250,24 @@ void dpu_debugfs_create_regset32(const char *name, umode_t mode,
 	debugfs_create_file(name, mode, parent, regset, &dpu_regset32_fops);
 }
 
+static void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct dentry *debugfs_root)
+{
+	struct dentry *entry = debugfs_create_dir("sspp", debugfs_root);
+	int i;
+
+	if (IS_ERR(entry))
+		return;
+
+	for (i = SSPP_NONE; i < SSPP_MAX; i++) {
+		struct dpu_hw_sspp *hw = dpu_rm_get_sspp(&dpu_kms->rm, i);
+
+		if (!hw)
+			continue;
+
+		_dpu_hw_sspp_init_debugfs(hw, dpu_kms, entry);
+	}
+}
+
 static int dpu_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
 {
 	struct dpu_kms *dpu_kms = to_dpu_kms(kms);
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index e443799de2c1..cdde7b9ec882 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -1399,22 +1399,6 @@ void dpu_plane_danger_signal_ctrl(struct drm_plane *plane, bool enable)
 	_dpu_plane_set_qos_ctrl(plane, enable, DPU_PLANE_QOS_PANIC_CTRL);
 	pm_runtime_put_sync(&dpu_kms->pdev->dev);
 }
-
-/* SSPP live inside dpu_plane private data only. Enumerate them here. */
-void dpu_debugfs_sspp_init(struct dpu_kms *dpu_kms, struct dentry *debugfs_root)
-{
-	struct drm_plane *plane;
-	struct dentry *entry = debugfs_create_dir("sspp", debugfs_root);
-
-	if (IS_ERR(entry))
-		return;
-
-	drm_for_each_plane(plane, dpu_kms->dev) {
-		struct dpu_plane *pdpu = to_dpu_plane(plane);
-
-		_dpu_hw_sspp_init_debugfs(pdpu->pipe_hw, dpu_kms, entry);
-	}
-}
 #endif
 
 static bool dpu_plane_format_mod_supported(struct drm_plane *plane,
-- 
2.39.0

