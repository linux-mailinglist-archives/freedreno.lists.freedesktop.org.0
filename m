Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4EEB43A1EC1
	for <lists+freedreno@lfdr.de>; Wed,  9 Jun 2021 23:17:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 310756E406;
	Wed,  9 Jun 2021 21:17:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FCC36E406
 for <freedreno@lists.freedesktop.org>; Wed,  9 Jun 2021 21:17:30 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id r14so1660045ljd.10
 for <freedreno@lists.freedesktop.org>; Wed, 09 Jun 2021 14:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9dgs04cWZ3Msqx0W8W8q6j1oCvkBtnZBWkKinotEoUY=;
 b=MjSGuvkj52+NlpRiGoEMHe2XcyMbHXdWIJJWE2M5Z06Lmbq34wKHLFa8JneKOyxT4T
 zPQnUk2WvpqaElBp2Kt++0dC3z1B0g0kZ6ivnLSHoDGpjw3MNOrdCcvR4C+O91dxKueb
 k7FsAycDiGW+0/StVBhfKgugAfjm+71Hhue8nXVlkxRvWfqHvZGwIyKxYq0CcSwSooMD
 LgZO6GseD3yq11IrONZkYunffe0mtj+x6AblEy57tb2J1N7FWnSMurP4GYaKX8GLQl6m
 wkv4GifRkcHPRRs+XTDFNZyxzRVSzlkMGGxfCWb8RNT7SrPMKi6xWkltr/+v6HrzIMII
 hfZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9dgs04cWZ3Msqx0W8W8q6j1oCvkBtnZBWkKinotEoUY=;
 b=adNBxp8nhnztwrF03OZVP6Hg5jjkrFy8DDKxFkcwDjVDiucdJGMeJ861raxzoGSHRX
 PDA85en1JUIQjdN1L+s0Uy0SDoDvnlMLSZn3gBciSgUhIJfqIReZg7PcYTBvEQzHzMxa
 DsBThaAtg1+CH+sKM6vawGwYpsAFyBwF3Hdp3JJv56mUq0e9eKS1GB984TIUw7tvyH2p
 x2H/136bsEvlhZHbk/EbqFpgn6IbvUZBqwSR/qL24dNpa6YDASgH0+tmTqvKOMIFCZrV
 04ULbHdzaSVXmpI10cp0Me480qDf6qwWaYIwxvLbWXyUTiir3tIY/wR5s79HwiHoCYSG
 i8VQ==
X-Gm-Message-State: AOAM530G6Bg/B58Xwq/EuUOfdETce20TW7sWIRqQ5iNCDn7Jcs0a+tvC
 L6gqnKepn80xCt+WsEDNDXg2pQ==
X-Google-Smtp-Source: ABdhPJwA6Th/FL1bvaEHObvbGAvSjDBwCyEftMmoigBEJSWVVDst/PLSoptXRuDpaYTAtZwJsLWdsA==
X-Received: by 2002:a2e:a48f:: with SMTP id h15mr1304167lji.252.1623273448317; 
 Wed, 09 Jun 2021 14:17:28 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id z20sm95329ljk.50.2021.06.09.14.17.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 14:17:27 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Thu, 10 Jun 2021 00:17:20 +0300
Message-Id: <20210609211723.2565105-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210609211723.2565105-1-dmitry.baryshkov@linaro.org>
References: <20210609211723.2565105-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [RFC 3/6] drm/msm/mdp5: move mdp5_encoder_set_intf_mode
 after msm_dsi_modeset_init
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
