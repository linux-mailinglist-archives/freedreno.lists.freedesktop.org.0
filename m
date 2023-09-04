Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 42052790FD7
	for <lists+freedreno@lfdr.de>; Mon,  4 Sep 2023 04:06:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8646510E27A;
	Mon,  4 Sep 2023 02:05:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C7ED10E282
 for <freedreno@lists.freedesktop.org>; Mon,  4 Sep 2023 02:05:02 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2bcc846fed0so13628991fa.2
 for <freedreno@lists.freedesktop.org>; Sun, 03 Sep 2023 19:05:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693793100; x=1694397900; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=LctnTM5rXutjH2qlEAQeifma8NswX6DnB9xbh8Rm9eY=;
 b=asEgwzq/Kq4xtvIvak2j+k3dJ2q4rG4zorJrkdPBT1YaK7RAhvYJuroSTefmq5L54W
 FULzqXRAh0nk1VAAkhpvDEVdt0ZliE8yWQT+srj6rslT8+lJLaUwf7Pft8S9qJrODFfM
 STUgYC7NAwCiO7lNABDc4xdkOQEQPjin1H/b4/MfBH0cxOc5O5YtSVz8I/QINyR8nXYZ
 3B8yJCk6PUpdJFc1KC/8B8+/uHlU2VuT274bZQHq8Qsuxu1//4jT2UA04V2zACyrokpp
 rDeUjaPu1Zooaqin/s6wMuvdc3F8l561x17BEbSi45ReHtXea7HhLPTF/XOmD4NThwGn
 hOkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693793100; x=1694397900;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=LctnTM5rXutjH2qlEAQeifma8NswX6DnB9xbh8Rm9eY=;
 b=FNwh5EZZN1P4JHSeAUbzPu4UHB07bmmZwOsO/J2I2D6yyZ0cEolm8jaxeAKJbQTJGO
 3U3okhB2efrXrf3SGwQdDaN5yI81pz6t+tWMY0OsNqTkvPSV4UnWocd4KNy9tvhxqXhe
 uFLqw9u6TOZELfZVFek8R/2dBpk9bB0JApKrj3prLKr/u85xz6Pf7dYMqf41rWFu8MZR
 iTh1fwjWwT/zpw5Poxi8PKDE3yc4guFJVKorZHt2yIr55mZzeONsUzeX7OsTvPCJcLv+
 wcHawFFH1IgYZMayDWm345mHJ+mLb66yQxGwrHEQT0j+JztvU4GU56bCDPwknioUxKWQ
 sR7w==
X-Gm-Message-State: AOJu0YzcQ5gEFcNdSE1FuGCCcO2fkAwHM/Adwdil/rNhHR/5m+VQP4ZB
 UlKJ893aWwxCjX4mwrM1MjJ3IA==
X-Google-Smtp-Source: AGHT+IErnrm0+qqKHmwbz21Eyaqf6ZQ4HGuLHJcLnOTwGxcmFR3xhvBdJIfEOcc0tD654qjyPABRDQ==
X-Received: by 2002:a05:651c:145:b0:2bb:a123:2db7 with SMTP id
 c5-20020a05651c014500b002bba1232db7mr5205131ljd.51.1693793100378; 
 Sun, 03 Sep 2023 19:05:00 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a2e9c4d000000b002bce0e9385asm1818237ljj.9.2023.09.03.19.04.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 19:04:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  4 Sep 2023 05:04:53 +0300
Message-Id: <20230904020454.2945667-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 7/8] drm/msm/dpu: drop useless check from
 dpu_encoder_phys_cmd_te_rd_ptr_irq()
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

The dpu_encoder_phys_cmd_te_rd_ptr_irq() function uses neither hw_intf
nor hw_pp data, so we can drop the corresponding check.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c | 8 --------
 1 file changed, 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index e03b2075639d..d18236bd98e6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -108,14 +108,6 @@ static void dpu_encoder_phys_cmd_te_rd_ptr_irq(void *arg, int irq_idx)
 	struct dpu_encoder_phys *phys_enc = arg;
 	struct dpu_encoder_phys_cmd *cmd_enc;
 
-	if (phys_enc->has_intf_te) {
-		if (!phys_enc->hw_intf)
-			return;
-	} else {
-		if (!phys_enc->hw_pp)
-			return;
-	}
-
 	DPU_ATRACE_BEGIN("rd_ptr_irq");
 	cmd_enc = to_dpu_encoder_phys_cmd(phys_enc);
 
-- 
2.39.2

