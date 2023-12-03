Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A9684801FE9
	for <lists+freedreno@lfdr.de>; Sun,  3 Dec 2023 01:06:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 70EF010E246;
	Sun,  3 Dec 2023 00:06:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACFDE10E249
 for <freedreno@lists.freedesktop.org>; Sun,  3 Dec 2023 00:05:39 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-50be24167efso1353934e87.3
 for <freedreno@lists.freedesktop.org>; Sat, 02 Dec 2023 16:05:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701561938; x=1702166738; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=2wetDbrUp7wzaYT8YoqkILZjkdOZaiSrBcUzXNmocOY=;
 b=fEVpPg63KwjfUSZIuQorYJBee0mGXUJnX+TLI/DMPTfSlo0J8QxA3/+oAEyT3GoHLv
 Us41RklZMcwmcMpnPMcslra7O95CBmnrOEAWxW3A6nZkjOwt+gTVDfeRo6fO/JHRw9M8
 89Hx3S30DxsCQszxMxNKcrWX0OOLv5RJRAO11hSE1VoY3pR6pSPch2O5EvtqK0NNEaq2
 hu87b768Eydq6TcmKqWmSo4Sb4PgBJ+NFaUN3QTgiei70ESPFUUkc1LE8s5WiR8rE60r
 w9UyY/5BmFBqoZPNUtvpreknTGmSzPRa/uw03TQ/Pg+i6NEo0df0fN8yQH3PBIsxEfs9
 JgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701561938; x=1702166738;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2wetDbrUp7wzaYT8YoqkILZjkdOZaiSrBcUzXNmocOY=;
 b=YgcKsrmpHvPhddud4dVdmvS6YVaX6R9MLB3kjtMonXDtXNxtkzFBkQRsOWmTGWAY0H
 pvPVtynAo52iOk47tXudCacU2nnDZah7FhDe1hftaHUxH52+aDI3+SB096s5dlUjNVJS
 LCHITRQewmEjjJN8PxLXRwINJA825iUxN3Oy/u6FYseEIiXTUC9iHrAOwRj+P7TD2IXR
 IyLQrG6HFx8ImlQT4InIQLQkxZzdIJzxsDmLhXywNAosTDmQRnEyRho4sgi98+vhlCHB
 AnlWhc7e6G8qtrf5qJ09KEkwhd8S6+cGzXgW8LytkuBg2oL+CqtzlqjF5y5sqHSz1iyr
 DxZg==
X-Gm-Message-State: AOJu0YwffreN1Jqcclhe+V39Hy8vceBWzkb2a4QsupNBPV2z0a4b18U4
 a9hH7tjK7izlLnSuERU/YN9weQ==
X-Google-Smtp-Source: AGHT+IESMi4Mgc++6MpM8bxtFAp/InWMKWQpyiMp3iYt0NBXebRAcZmsAaZhn2GmXTCD2zsL9XK8hQ==
X-Received: by 2002:a05:6512:6c5:b0:50b:d944:bfcc with SMTP id
 u5-20020a05651206c500b0050bd944bfccmr1144212lff.142.1701561937829; 
 Sat, 02 Dec 2023 16:05:37 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t2-20020a19ad02000000b0050bc5edfa45sm826273lfc.85.2023.12.02.16.05.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 16:05:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Date: Sun,  3 Dec 2023 03:05:31 +0300
Message-Id: <20231203000532.1290480-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231203000532.1290480-1-dmitry.baryshkov@linaro.org>
References: <20231203000532.1290480-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH RESEND 4/5] drm/msm/mdp5: migrate SMP dumping to
 using atomic_print_state
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
Cc: linux-arm-msm@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The Shared Memory Pool (SMP) state is a part of the MDP5's private
object state. Use existing infrastructure, atomic_print_state()
callback, to dump SMP state (which also makes it included into
debugfs/dri/N/state). This allows us to drop the custom debugfs file
too.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c |  2 --
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 46 ++++++------------------
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c | 12 ++-----
 drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h |  4 ++-
 4 files changed, 15 insertions(+), 49 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
index 43443a435d59..b40ed3a847c8 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_irq.c
@@ -31,8 +31,6 @@ static void mdp5_irq_error_handler(struct mdp_irq *irq, uint32_t irqstatus)
 	if (dumpstate && __ratelimit(&rs)) {
 		struct drm_printer p = drm_info_printer(mdp5_kms->dev->dev);
 		drm_state_dump(mdp5_kms->dev, &p);
-		if (mdp5_kms->smp)
-			mdp5_smp_dump(mdp5_kms->smp, &p);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index ec933d597e20..cd46c2b0ec0c 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -119,9 +119,19 @@ static void mdp5_global_destroy_state(struct drm_private_obj *obj,
 	kfree(mdp5_state);
 }
 
+static void mdp5_global_print_state(struct drm_printer *p,
+				    const struct drm_private_state *state)
+{
+	struct mdp5_global_state *mdp5_state = to_mdp5_global_state(state);
+
+	if (mdp5_state->mdp5_kms->smp)
+		mdp5_smp_dump(mdp5_state->mdp5_kms->smp, p, mdp5_state);
+}
+
 static const struct drm_private_state_funcs mdp5_global_state_funcs = {
 	.atomic_duplicate_state = mdp5_global_duplicate_state,
 	.atomic_destroy_state = mdp5_global_destroy_state,
+	.atomic_print_state = mdp5_global_print_state,
 };
 
 static int mdp5_global_obj_init(struct mdp5_kms *mdp5_kms)
@@ -226,39 +236,6 @@ static void mdp5_kms_destroy(struct msm_kms *kms)
 	mdp5_destroy(mdp5_kms);
 }
 
-#ifdef CONFIG_DEBUG_FS
-static int smp_show(struct seq_file *m, void *arg)
-{
-	struct drm_info_node *node = m->private;
-	struct drm_device *dev = node->minor->dev;
-	struct msm_drm_private *priv = dev->dev_private;
-	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(priv->kms));
-	struct drm_printer p = drm_seq_file_printer(m);
-
-	if (!mdp5_kms->smp) {
-		drm_printf(&p, "no SMP pool\n");
-		return 0;
-	}
-
-	mdp5_smp_dump(mdp5_kms->smp, &p);
-
-	return 0;
-}
-
-static struct drm_info_list mdp5_debugfs_list[] = {
-		{"smp", smp_show },
-};
-
-static int mdp5_kms_debugfs_init(struct msm_kms *kms, struct drm_minor *minor)
-{
-	drm_debugfs_create_files(mdp5_debugfs_list,
-				 ARRAY_SIZE(mdp5_debugfs_list),
-				 minor->debugfs_root, minor);
-
-	return 0;
-}
-#endif
-
 static const struct mdp_kms_funcs kms_funcs = {
 	.base = {
 		.hw_init         = mdp5_hw_init,
@@ -277,9 +254,6 @@ static const struct mdp_kms_funcs kms_funcs = {
 		.get_format      = mdp_get_format,
 		.set_split_display = mdp5_set_split_display,
 		.destroy         = mdp5_kms_destroy,
-#ifdef CONFIG_DEBUG_FS
-		.debugfs_init    = mdp5_kms_debugfs_init,
-#endif
 	},
 	.set_irqmask         = mdp5_set_irqmask,
 };
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
index b68682c1b5bc..ab5e3ba5aa2f 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.c
@@ -325,22 +325,17 @@ void mdp5_smp_complete_commit(struct mdp5_smp *smp, struct mdp5_smp_state *state
 	state->released = 0;
 }
 
-void mdp5_smp_dump(struct mdp5_smp *smp, struct drm_printer *p)
+void mdp5_smp_dump(struct mdp5_smp *smp, struct drm_printer *p,
+		   struct mdp5_global_state *global_state)
 {
 	struct mdp5_kms *mdp5_kms = get_kms(smp);
 	struct mdp5_hw_pipe_state *hwpstate;
 	struct mdp5_smp_state *state;
-	struct mdp5_global_state *global_state;
 	int total = 0, i, j;
 
 	drm_printf(p, "name\tinuse\tplane\n");
 	drm_printf(p, "----\t-----\t-----\n");
 
-	if (drm_can_sleep())
-		drm_modeset_lock(&mdp5_kms->glob_state_lock, NULL);
-
-	global_state = mdp5_get_existing_global_state(mdp5_kms);
-
 	/* grab these *after* we hold the state_lock */
 	hwpstate = &global_state->hwpipe;
 	state = &global_state->smp;
@@ -365,9 +360,6 @@ void mdp5_smp_dump(struct mdp5_smp *smp, struct drm_printer *p)
 	drm_printf(p, "TOTAL:\t%d\t(of %d)\n", total, smp->blk_cnt);
 	drm_printf(p, "AVAIL:\t%d\n", smp->blk_cnt -
 			bitmap_weight(state->state, smp->blk_cnt));
-
-	if (drm_can_sleep())
-		drm_modeset_unlock(&mdp5_kms->glob_state_lock);
 }
 
 void mdp5_smp_destroy(struct mdp5_smp *smp)
diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h
index ba5618e136c3..7a24c887760b 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_smp.h
@@ -70,7 +70,9 @@ struct mdp5_smp *mdp5_smp_init(struct mdp5_kms *mdp5_kms,
 		const struct mdp5_smp_block *cfg);
 void  mdp5_smp_destroy(struct mdp5_smp *smp);
 
-void mdp5_smp_dump(struct mdp5_smp *smp, struct drm_printer *p);
+struct mdp5_global_state;
+void mdp5_smp_dump(struct mdp5_smp *smp, struct drm_printer *p,
+		   struct mdp5_global_state *global_state);
 
 uint32_t mdp5_smp_calculate(struct mdp5_smp *smp,
 		const struct mdp_format *format,
-- 
2.39.2

