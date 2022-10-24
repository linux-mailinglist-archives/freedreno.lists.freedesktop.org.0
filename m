Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7C8D60AF38
	for <lists+freedreno@lfdr.de>; Mon, 24 Oct 2022 17:39:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E35D610E898;
	Mon, 24 Oct 2022 15:39:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com
 [IPv6:2a00:1450:4864:20::232])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C75E10E22A
 for <freedreno@lists.freedesktop.org>; Mon, 24 Oct 2022 15:39:32 +0000 (UTC)
Received: by mail-lj1-x232.google.com with SMTP id o4so8437228ljp.8
 for <freedreno@lists.freedesktop.org>; Mon, 24 Oct 2022 08:39:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jshUQGH4UtEAs7tQmmFEpIMJkGozvqVnz1M3FYmS5xY=;
 b=tpjysAKOJ5VaFAPzmTJB/VM/VOuNF+MS6KNYzrqn6q9OuyQoxkmq9iayhnfoqRdYRP
 W3+YJycr9GYEwQZHeI4+a3MZ30C7NI1iETRhOHMVdXV1qUOzx8962R2dwNfRMSVAK0PP
 uuq2AHiqP+R5Yzq71Huizl57+nOYDicAur6FtnR1DERXhusyU1y1KXB1ubKrYVCk5luf
 ykWHt5FglTIRCvKdm9ydlpRZ3guNoa+wlj3wsLtQ3+b6c10PsdRRGBczM4eeMMOEHBRZ
 WXKEL1vrBZkh9nYm8AuR+TkwoYnpIDGIsrtXD6It2CSJ/18Ce8K4PqvwdCfIbBgpE+bH
 p+uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jshUQGH4UtEAs7tQmmFEpIMJkGozvqVnz1M3FYmS5xY=;
 b=SEiY5CVaQ61uK17p10xsWHNOl8u5kqSeCh+D1VSwwGBUPCDptpbqee68C13Egww+iT
 AecXO4+IPKm4BWiAn046T3hv/AkYOjaHmfhTopEMmdMKD2HiTUUU2PxTtL41wkLbcrAq
 v/BSGdJvUeXRAQeWOjrzX6Z5kNlyG3n9NLaWIkj6cCqPEXLO+ArHmCGNO+EDe9Rn9K2l
 SbkerUvtoBl6mUCOCTDVO4TrlNfyULZZ7CGS4lqHhYN/0NQb1GP2bCCy5UMyLag1N6OR
 ikcdxjDcK62AKHy8fpaloBqUwTvc7PWEr3LQpfuqBW7Ies0DnkXM3GFjQAd8OHqwbwF1
 wToQ==
X-Gm-Message-State: ACrzQf3cCUltmd/NJZHKzkArbY9l5nxbprWg4yiNca0tEEVKHohZNtQw
 92ODHsBr9V4lqzgDFJrF4ou3cmxgTuyVT+Lz
X-Google-Smtp-Source: AMsMyM79q8/bozlYbdMbYTfc4ZQ/uK1sOv8g0duf81dQ5KIoiK1riaEhzTxB4eepVuG/nr/YlUA6uw==
X-Received: by 2002:a05:651c:12c6:b0:26f:c55a:a59b with SMTP id
 6-20020a05651c12c600b0026fc55aa59bmr12126668lje.281.1666625971780; 
 Mon, 24 Oct 2022 08:39:31 -0700 (PDT)
Received: from eriador.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 f23-20020a19ae17000000b00497b198987bsm452181lfc.26.2022.10.24.08.39.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Oct 2022 08:39:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Laurentiu Palcu <laurentiu.palcu@oss.nxp.com>,
 Lucas Stach <l.stach@pengutronix.de>,
 Philipp Zabel <p.zabel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, NXP Linux Team <linux-imx@nxp.com>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Tomi Valkeinen <tomba@kernel.org>
Date: Mon, 24 Oct 2022 18:39:24 +0300
Message-Id: <20221024153926.3222225-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221024153926.3222225-1-dmitry.baryshkov@linaro.org>
References: <20221024153926.3222225-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 5/7] drm/msm/hdmi: stop using
 drm_bridge_connector_en/disable_hpd()
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
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org, dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The functionality of drm_bridge_connector_enable_hpd() and
drm_bridge_connector_disable_hpd() is provided automatically by the
drm_kms_poll helpers. Stop calling these functions manually.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 93fe61b86967..a540c45d4fd3 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -348,8 +348,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 		goto fail;
 	}
 
-	drm_bridge_connector_enable_hpd(hdmi->connector);
-
 	ret = msm_hdmi_hpd_enable(hdmi->bridge);
 	if (ret < 0) {
 		DRM_DEV_ERROR(&hdmi->pdev->dev, "failed to enable HPD: %d\n", ret);
-- 
2.35.1

