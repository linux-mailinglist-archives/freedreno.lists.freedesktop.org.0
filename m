Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 3C9E07C4513
	for <lists+freedreno@lfdr.de>; Wed, 11 Oct 2023 00:52:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA8F710E3F5;
	Tue, 10 Oct 2023 22:52:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 959B510E3F5
 for <freedreno@lists.freedesktop.org>; Tue, 10 Oct 2023 22:52:32 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-50337b43ee6so8115590e87.3
 for <freedreno@lists.freedesktop.org>; Tue, 10 Oct 2023 15:52:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696978351; x=1697583151; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=xH3JTlYLfu1lrgQDYNOeSk2pxNRl1vKQGAR++5/WjFk=;
 b=nfad4ksaTv/zElXNX2YUt9Vc+jAvs3bxuAbR4YNqb7tlOmvw7GkwRB24sOJUzTmeDz
 A+YEn2f1VTs+TG0JEXwx/9l5DNGEw57qXiUv0AIOgN6wBbjVXxLnKMQj4oAwrabVH8CL
 bUKIYKanwxDHqJt4qpfeTt3bdo4Si/9LmmMUHTHh87uhpzYB+1irD66ZukmEfXIdz0aQ
 iGNbgjRbbn/ietsCmqEVbKFAkv8jUACUSQh4Iu7y95xoNxorR3CYDfFf3sqhA6mLcoDs
 Lh1g9xgiZIRaFinNY9ax3/5WzhOCDycUm1K82SrFWCHInw/2cUm88QmJEKyETiZYWdnd
 xwdQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696978351; x=1697583151;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xH3JTlYLfu1lrgQDYNOeSk2pxNRl1vKQGAR++5/WjFk=;
 b=mDi5/GTa76J2/ayi7+iyhhtozyU2RilyUAF5ROGEzJgtfShVdxomjFZqScXRUfsbdC
 jhfGJXNGdczxK74WVmGB4HWXYkV8kZKtsyyDaXuGWJ5K1RZjDkCL8l0J2OFZzxMu5nmQ
 WVJMfgs3drWEQ7wSY1HXEH6nqUeBUbXjuiYs8QpZocQCCgJRcXz3x4cw1shlcudhFNss
 flJAdRXsygN5K2ioH7qlnVVrbV+SQ4XVmouIxfolVCkCDm5whCfkTWBrZv1+GwZLoVHx
 pRNPOYy/Homz5mWcD7CdimLZAaft8Bk/dcsvlpDyGfOGzQutyCyGRjIfaAkgWAspGRfA
 XHpQ==
X-Gm-Message-State: AOJu0Yx1Rwv/8TW/J0juypfWdUpLpzV/7Hu2y2rGh8UYimdQcB+jZYKb
 2hHbd++mY7ousHwI1lfGhJVFEW9CEJUA8BNK9hc=
X-Google-Smtp-Source: AGHT+IHfk6VCKksN4Igx3bmkbaZopWpKwJo0WHSqUsFC/05mZuF8oO3Ub7CcEBTaWPPWuQrXUtGzRA==
X-Received: by 2002:a19:ca17:0:b0:500:9b7d:ee3c with SMTP id
 a23-20020a19ca17000000b005009b7dee3cmr14696545lfg.7.1696978350783; 
 Tue, 10 Oct 2023 15:52:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a22-20020a19f816000000b00501ccebeaf6sm1974481lff.88.2023.10.10.15.52.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 10 Oct 2023 15:52:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 11 Oct 2023 01:52:29 +0300
Message-Id: <20231010225229.77027-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] soc: qcom: pmic_glink: fix connector type to be
 DisplayPort
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
 Simon Ser <contact@emersion.fr>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

As it was pointed out by Simon Ser, the DRM_MODE_CONNECTOR_USB connector
is reserved for the GUD devices. Other drivers (i915, amdgpu) use
DRM_MODE_CONNECTOR_DisplayPort even if the DP stream is handled by the
USB-C altmode. While we are still working on implementing the proper way
to let userspace know that the DP is wrapped into USB-C, change
connector type to be DRM_MODE_CONNECTOR_DisplayPort.

Fixes: 080b4e24852b ("soc: qcom: pmic_glink: Introduce altmode support")
Cc: Simon Ser <contact@emersion.fr>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/pmic_glink_altmode.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pmic_glink_altmode.c b/drivers/soc/qcom/pmic_glink_altmode.c
index 9569d999391d..6f8b2f7ae3cc 100644
--- a/drivers/soc/qcom/pmic_glink_altmode.c
+++ b/drivers/soc/qcom/pmic_glink_altmode.c
@@ -467,7 +467,7 @@ static int pmic_glink_altmode_probe(struct auxiliary_device *adev,
 		alt_port->bridge.funcs = &pmic_glink_altmode_bridge_funcs;
 		alt_port->bridge.of_node = to_of_node(fwnode);
 		alt_port->bridge.ops = DRM_BRIDGE_OP_HPD;
-		alt_port->bridge.type = DRM_MODE_CONNECTOR_USB;
+		alt_port->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
 
 		ret = devm_drm_bridge_add(dev, &alt_port->bridge);
 		if (ret) {
-- 
2.39.2

