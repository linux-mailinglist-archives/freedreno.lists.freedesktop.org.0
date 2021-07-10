Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 841F63C3714
	for <lists+freedreno@lfdr.de>; Sun, 11 Jul 2021 00:20:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9C7D6EB70;
	Sat, 10 Jul 2021 22:20:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 49F6C6EB6A
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jul 2021 22:20:13 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id i5so2326551lfe.2
 for <freedreno@lists.freedesktop.org>; Sat, 10 Jul 2021 15:20:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=hoN8ubV+NL8AcGXwOuvZXUIKfTF5XnABfb0Z79GoR78=;
 b=ZUh4O8Uq5OAkw2Yj6Tt6vfKLJ/c73uzzW70zh4gYRHDgFdfcbsa9TYHfkCUDw2rKi7
 kAdD8eskVqCnEQ0tu3+v+oF025XuGQj9vgwDSR4gl9g+Zw4RX3uAtMfP905ofFNlCThO
 ZHpI78Vokpv2+sTfxbqa38wjCZNVsayUgFO0bMDnQGY18cV8/6c4/jMyXHdrxrDNPeV4
 o0m7dwZaWRP7cZPv5kdtXUUDQcs+Xd+7imJa2oM6+0qswIrzcw2XFUAh8lLu6i6iE6m0
 3ijY7ZZDKsoS5GQhgCnFTjZLRb1x4E3pt2+6X24d0TGKdQrg+QzNZET55uHjYHVMueSM
 E2gA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=hoN8ubV+NL8AcGXwOuvZXUIKfTF5XnABfb0Z79GoR78=;
 b=McvJMG8RSBJyHNWbgEBHLdGnTl3G0EL7p9++nbM76LguiQBBkmhng9njNQaNy50Hiu
 DUEk9t+NHMUIyf6D0STjePcR/qiriQtsR+Hoez3B31BEX0r+RWlLQHiqQFi4sNuTG5Uj
 LTtrUQN8Imvj22/lIsxD1De31NwGF8e7JMbBId00IClV8UfMcypfet4c6rA3KNywVtun
 F2UeOV+449iPGVgjvb40z7BQVqnfnwH9SuMxPmgQfxoPaxLUVpAPvf69Kpe+53XoSDSt
 3Ievw6WIU7AuCoks8gtbWHZuSqHda0Oe4DZEvcTChpqhKHRt8v+hJwvtJ9Q0NiZLmv3C
 E/dQ==
X-Gm-Message-State: AOAM531jrth80MR2zDcDZ8JFlBkT61lTgxR6wNrughsEjNPMzI2VFocT
 tq8/a5h2m5xb/VoYI8xkx9yz4Q==
X-Google-Smtp-Source: ABdhPJyjcx0AB95L0qYORaJEoRS4aSNevZfMQ7NnsUs741NpjV75fb0/QM9yQBZhwXEVPVc2YlLDjQ==
X-Received: by 2002:a19:e012:: with SMTP id x18mr34883500lfg.394.1625955611596; 
 Sat, 10 Jul 2021 15:20:11 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id s15sm795466lfp.216.2021.07.10.15.20.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 10 Jul 2021 15:20:11 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Sun, 11 Jul 2021 01:20:02 +0300
Message-Id: <20210710222005.1334734-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210710222005.1334734-1-dmitry.baryshkov@linaro.org>
References: <20210710222005.1334734-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v3 4/7] drm/msm/mdp5: move
 mdp5_encoder_set_intf_mode after msm_dsi_modeset_init
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
Cc: Jonathan Marek <jonathan@marek.ca>, Stephen Boyd <sboyd@kernel.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Move a call to mdp5_encoder_set_intf_mode() after
msm_dsi_modeset_init(), removing set_encoder_mode callback.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <abhinavk@codeaurora.org>
---
 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 15aed45022bc..b3b42672b2d4 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -209,13 +209,6 @@ static int mdp5_set_split_display(struct msm_kms *kms,
 							  slave_encoder);
 }
 
-static void mdp5_set_encoder_mode(struct msm_kms *kms,
-				  struct drm_encoder *encoder,
-				  bool cmd_mode)
-{
-	mdp5_encoder_set_intf_mode(encoder, cmd_mode);
-}
-
 static void mdp5_kms_destroy(struct msm_kms *kms)
 {
 	struct mdp5_kms *mdp5_kms = to_mdp5_kms(to_mdp_kms(kms));
@@ -287,7 +280,6 @@ static const struct mdp_kms_funcs kms_funcs = {
 		.get_format      = mdp_get_format,
 		.round_pixclk    = mdp5_round_pixclk,
 		.set_split_display = mdp5_set_split_display,
-		.set_encoder_mode = mdp5_set_encoder_mode,
 		.destroy         = mdp5_kms_destroy,
 #ifdef CONFIG_DEBUG_FS
 		.debugfs_init    = mdp5_kms_debugfs_init,
@@ -448,6 +440,9 @@ static int modeset_init_intf(struct mdp5_kms *mdp5_kms,
 		}
 
 		ret = msm_dsi_modeset_init(priv->dsi[dsi_id], dev, encoder);
+		if (!ret)
+			mdp5_encoder_set_intf_mode(encoder, msm_dsi_is_cmd_mode(priv->dsi[dsi_id]));
+
 		break;
 	}
 	default:
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
