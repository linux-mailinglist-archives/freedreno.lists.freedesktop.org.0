Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CAD358E5AE
	for <lists+freedreno@lfdr.de>; Wed, 10 Aug 2022 05:48:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE3A01132B1;
	Wed, 10 Aug 2022 03:48:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com
 [IPv6:2607:f8b0:4864:20::32b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F3514E6640
 for <freedreno@lists.freedesktop.org>; Wed, 10 Aug 2022 03:47:47 +0000 (UTC)
Received: by mail-ot1-x32b.google.com with SMTP id
 y10-20020a9d634a000000b006167f7ce0c5so9845006otk.0
 for <freedreno@lists.freedesktop.org>; Tue, 09 Aug 2022 20:47:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=1ttBChNoFl/Up8/6fPaOC7Cj26gzigpytaf8DEk+Aek=;
 b=a9Uh1niVqBnlaw5WkU2oeTeMaYGhUKoDjLPD+aLB52LJew7fkvNgnBYAVhya9bQyED
 kn85SFmjR/oq4DrmnMIT4bc1Tdgc9Mwy9Ngc1dqVlFA1hbXwlXDPiY0n9xePgpT4cZdh
 N63rMRKxIOrEO6d5siZMRinYOkVC7ajZKd30KvV/ndtLBR6sxb3buUIL8w6RhbMtLzmc
 f1+7KC30EXQxRozIsM8NlLI2la4bFyLkGLw771ePE06KjCI/Min5OXbaPL/59QiAA1Uh
 /FZ8hkhW87XSTgmBfOt1A0L1KLzxCyNWIWdloyoG1owahhd2iBj12XbVgAVDJrZNp0Xh
 3qHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=1ttBChNoFl/Up8/6fPaOC7Cj26gzigpytaf8DEk+Aek=;
 b=ifAF8ZqShYdEw4r01pFzjaP+wYD6tKIThV9tEh0OyCAaD5DDWzvWu0NeoHOmvUvI2K
 5nvmBjrVkct98GGlTVKyKdPGZHS0OWBtP0tkgz4yY+gjgWznE4MSk0ndplS2uPuTM6Nb
 +mgTkxlQPfdjGB2U/Ovt8jaXg8hK2QcsYHD+lFm3Z2DeGLoyJiZW8MzbpQVINlf6VopV
 bpJzVPGCIYKk0sPqgB6pEL3MVbwdImsP7wjVlvVpSzprPckBAg4SxxTtI+g+k1gwNUei
 gKDE09slEVbGKsKcfQV7PQFP5tSJ+1AKPDB09Z5OucMRJjptfs3TRr2aIxnncbt0u5Pz
 wOXQ==
X-Gm-Message-State: ACgBeo3crSG2nRD5eWvSZ5uweMZZGwXGVEUZWDdgWJ97Pgt/JojTCmoi
 BhABgPsu5h3kdx9bPffkOL6/fg==
X-Google-Smtp-Source: AA6agR62YvvK2ysqm9m7OTeHjTz/jhFcl0NG1lth+btptlN+5pshg5puEBxk4ECKPyKNuRLbAd5bLg==
X-Received: by 2002:a05:6830:638d:b0:636:a941:d467 with SMTP id
 ch13-20020a056830638d00b00636a941d467mr8664571otb.5.1660103262899; 
 Tue, 09 Aug 2022 20:47:42 -0700 (PDT)
Received: from ripper.. (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 n2-20020a4ae742000000b00444f26822e5sm454337oov.10.2022.08.09.20.47.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 09 Aug 2022 20:47:42 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Stephen Boyd <swboyd@chromium.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Sankeerth Billakanti <quic_sbillaka@quicinc.com>
Date: Tue,  9 Aug 2022 20:50:12 -0700
Message-Id: <20220810035013.3582848-7-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220810035013.3582848-1-bjorn.andersson@linaro.org>
References: <20220810035013.3582848-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 6/7] drm/msm/dp: Don't enable HPD interrupts for
 edp
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
Cc: freedreno@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Most instances where HPD interrupts are masked and unmasked are guareded
by the presence of an EDP panel being connected, but not all. Extend
this to cover the last few places, as HPD interrupt handling is not used
for the EDP case.

Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 15 ++++++++++-----
 1 file changed, 10 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 568295381246..bb4db9acaa4f 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -610,8 +610,10 @@ static int dp_hpd_plug_handle(struct dp_display_private *dp, u32 data)
 	}
 
 	/* enable HDP irq_hpd/replug interrupt */
-	dp_catalog_hpd_config_intr(dp->catalog,
-		DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK, true);
+	if (!dp->dp_display.is_edp)
+		dp_catalog_hpd_config_intr(dp->catalog,
+					   DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK,
+					   true);
 
 	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",
 			dp->dp_display.connector_type, state);
@@ -651,8 +653,10 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 			dp->dp_display.connector_type, state);
 
 	/* disable irq_hpd/replug interrupts */
-	dp_catalog_hpd_config_intr(dp->catalog,
-		DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK, false);
+	if (!dp->dp_display.is_edp)
+		dp_catalog_hpd_config_intr(dp->catalog,
+					   DP_DP_IRQ_HPD_INT_MASK | DP_DP_HPD_REPLUG_INT_MASK,
+					   false);
 
 	/* unplugged, no more irq_hpd handle */
 	dp_del_event(dp, EV_IRQ_HPD_INT);
@@ -678,7 +682,8 @@ static int dp_hpd_unplug_handle(struct dp_display_private *dp, u32 data)
 	}
 
 	/* disable HPD plug interrupts */
-	dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, false);
+	if (!dp->dp_display.is_edp)
+		dp_catalog_hpd_config_intr(dp->catalog, DP_DP_HPD_PLUG_INT_MASK, false);
 
 	/*
 	 * We don't need separate work for disconnect as
-- 
2.35.1

