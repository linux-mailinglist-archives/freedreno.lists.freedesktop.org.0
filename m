Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A4973A1EC6
	for <lists+freedreno@lfdr.de>; Wed,  9 Jun 2021 23:17:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A8156EA9B;
	Wed,  9 Jun 2021 21:17:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9FD7E6E406
 for <freedreno@lists.freedesktop.org>; Wed,  9 Jun 2021 21:17:30 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id m21so24579058lfg.13
 for <freedreno@lists.freedesktop.org>; Wed, 09 Jun 2021 14:17:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2NpJ7aO+Jt+ovnuoQ4df+eCNMUKTUxxJ0ApMITBvevY=;
 b=veUbKvFuP+oeRBedT0sA1vDhr4e4ydtyhtT3/h7V+gSmDwiyvxR6zHy3SMEQMoXoMW
 AK1RfF4RGMC9Uzgk6KOOJW+9P2pHXupJrfbdYU22wah55kA7pFU2VhQMtgpc+4kaaBmz
 I8wg8lepdj50/CpnLfAYxgp0C5ERqGNQUzaAKIjj5WDo0k0lQndM9RBREnHDGwnSHsUd
 0VL7eN8NZYseDCmb3V3Z2qob5Z2/Q484J83/lMXNR8fXjaWKvY0oK6KpiM1Asj+R0tQ1
 1H3wkdotJlWItvokNG0gcd81i/ZQwq1HgST2YBxnH1TR+xvptHf1PAkP5VsElPAsPWZv
 wEIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2NpJ7aO+Jt+ovnuoQ4df+eCNMUKTUxxJ0ApMITBvevY=;
 b=ISU7MIYycs0vIesTw02S4nuehneO/3K8v9dupwi29mMFe3BA6YAcolVJ+nPFI1g3Hk
 vuqBDQASS1rCCZLo7MVbm6PMwDlIRbMJJVIXQ8iqU3Nm++khj82LGIABc+Nna1aF/a+/
 UkZgdtwgdWTno1HxEeuDPbgAI4YKSnOqAf4QTDaitAjidrfKFHj4nPf9SP3365b1j+G7
 Jz/6l+0KmQtDg5NGyIjs7y127pgRemAbYFZJgXeHaHPir23QwBWG2+161nQgvztzLup9
 UMdioofbwl1IbyX6Qa7P3oaANrPz/Lsg7rnTRsP/nia21vzR0wgEw6aNhNHc2uQlfHoV
 Ilqg==
X-Gm-Message-State: AOAM530WCNu2oldQlBsm66/66NZufpKdrtdQ38LDxMp8IuETc3KpWztd
 dgmotoqC11FlHIBTGi8K8/xfaQ==
X-Google-Smtp-Source: ABdhPJzudnpj/64IqWAGrrfaxZulORJw5W1hzbM1Fow+AwNmT786V1WzHSUiw8NLtKZtLD/Ai9wa2w==
X-Received: by 2002:a19:7d82:: with SMTP id y124mr906597lfc.76.1623273449059; 
 Wed, 09 Jun 2021 14:17:29 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id z20sm95329ljk.50.2021.06.09.14.17.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 09 Jun 2021 14:17:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Thu, 10 Jun 2021 00:17:21 +0300
Message-Id: <20210609211723.2565105-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20210609211723.2565105-1-dmitry.baryshkov@linaro.org>
References: <20210609211723.2565105-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [RFC 4/6] drm/msm/dp: stop calling set_encoder_mode
 callback
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

None of the display drivers now implement set_encoder_mode callback.
Stop calling it from the modeset init code.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 18 ------------------
 1 file changed, 18 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 051c1be1de7e..70b319a8fe83 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -102,8 +102,6 @@ struct dp_display_private {
 	struct dp_display_mode dp_mode;
 	struct msm_dp dp_display;
 
-	bool encoder_mode_set;
-
 	/* wait for audio signaling */
 	struct completion audio_comp;
 
@@ -283,20 +281,6 @@ static void dp_display_send_hpd_event(struct msm_dp *dp_display)
 }
 
 
-static void dp_display_set_encoder_mode(struct dp_display_private *dp)
-{
-	struct msm_drm_private *priv = dp->dp_display.drm_dev->dev_private;
-	struct msm_kms *kms = priv->kms;
-
-	if (!dp->encoder_mode_set && dp->dp_display.encoder &&
-				kms->funcs->set_encoder_mode) {
-		kms->funcs->set_encoder_mode(kms,
-				dp->dp_display.encoder, false);
-
-		dp->encoder_mode_set = true;
-	}
-}
-
 static int dp_display_send_hpd_notification(struct dp_display_private *dp,
 					    bool hpd)
 {
@@ -369,8 +353,6 @@ static void dp_display_host_init(struct dp_display_private *dp, int reset)
 	if (dp->usbpd->orientation == ORIENTATION_CC2)
 		flip = true;
 
-	dp_display_set_encoder_mode(dp);
-
 	dp_power_init(dp->power, flip);
 	dp_ctrl_host_init(dp->ctrl, flip, reset);
 	dp_aux_init(dp->aux);
-- 
2.30.2

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
