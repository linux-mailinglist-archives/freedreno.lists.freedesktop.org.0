Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id EE807738940
	for <lists+freedreno@lfdr.de>; Wed, 21 Jun 2023 17:33:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEA7310E4AF;
	Wed, 21 Jun 2023 15:33:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DDE6C10E4AD
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jun 2023 15:33:20 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4f87592eccfso4490557e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 21 Jun 2023 08:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687361598; x=1689953598;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=BH6finOK0NCUs0Gft2KgbaIOESt3pr5OWZYURCYeUXQ=;
 b=U+nfwtRiLk3NGnsdw+gPwlh4SogYB81aLy1y21Sf/ysdNkMKtBGPq7A2XRaViuf0fN
 fV+7aJpmELHv/bCWjqROah0saDjV/uCQZuswjf1sI71Nfo8uCM7eMfcLOHgnvddhV4LI
 WRie7RS86YXr4eM82YQ678wSjVML9yE4iM/X6rOiICLJj44gM8gBlRiNcI8yaWKi1o5x
 +WrlPRHanw3hE5RPucr2oukorA5XdvkamfVQZHxIipQIMHNonewF/M57dKc7wh1Ra0ZC
 QyumOSBvhrVPghfg/Fmbd8xWdg8txWHLtsipQ0Ieq1MIRsYBypBIEdkmOUx2J7JoQ50L
 m/bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687361598; x=1689953598;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=BH6finOK0NCUs0Gft2KgbaIOESt3pr5OWZYURCYeUXQ=;
 b=QS7PZNrW/IbmknqgRafUq5DIBwn8h4bc1eYZd6TAHJW75VRnpyOjAtHKe/MfIUvc17
 Djh0pRNLupNOhIEXrjuxbqvrGkpSgwQaD508zl7b9njIGeXIR0yNebTBX9o6tnc/iyAG
 eJb+Mx5XxMtgDQKrfCnjikjfIQSk5yzbnQTqDJ+Q24e9Hd9Pn9oMhEcIyfFcCPxVwxhu
 5Dbmo8jbddUidfaipICPzf7yuIHnxo9UyLicl7O9LaGixo0xSpTaK7N9Gsf8hiH2TdqM
 37pllLkyDEfwmvZ8xRV/I9Bye3M/RTh/X6DMcB0Ys8dTGMWw5HF8Kd2VVnlZUXPM1AFS
 6lrQ==
X-Gm-Message-State: AC+VfDz4+/AYY3lKS7OnqPKF7oPr4k+/XBa2xEwuzl8LqsnNE0BMbgxW
 l6A66vWB9N5oElyYmzWt0qZ0EA==
X-Google-Smtp-Source: ACHHUZ6JQKPQPArgKFqdZPPb7rjF7JBGHwVhYAEFB4DxBioynvcwfq3a5UuYnz7Ry8DAdKvyHJcQdw==
X-Received: by 2002:a19:e34c:0:b0:4f8:4dbd:36fc with SMTP id
 c12-20020a19e34c000000b004f84dbd36fcmr9455311lfk.8.1687361598431; 
 Wed, 21 Jun 2023 08:33:18 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 o3-20020a056512050300b004f8751285a5sm804888lfb.80.2023.06.21.08.33.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 21 Jun 2023 08:33:17 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Vinod Koul <vkoul@kernel.org>,
 Kishon Vijay Abraham I <kishon@kernel.org>
Date: Wed, 21 Jun 2023 18:33:10 +0300
Message-Id: <20230621153317.1025914-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RESEND PATCH 0/7] phy: qcom: qmp-combo: rework
 register access
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
Cc: linux-phy@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>,
 Neil Armstrong <neil.armstrong@linaro.org>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

For some reason I used the wrong script to send this patchset, resend it
including proper (linux-phy & maintainers) recipients.

The patch at [1], which added another function just to have v4 vs v6
register address difference prompted me to take a look at the combo PHY
driver. We already have mechanism, register layout descriptions, for
coping with register address differences, which I ignored while adding
v4 support. It looks like nowadays this has exploded somehow, resulting
inseveral almost-identicatical functions.

Forcibly use regs layout for all version-specific registers used in DP
PHY programming. As a result, this allows us to drop several very
similar functions. And also while doing this cleanup I spotted a typo,
which resulted in a patch 1, fixing bias0_en programming for sc8280 and
sm8550 PHYs.

[1] https://lore.kernel.org/linux-arm-msm/20230601-topic-sm8550-upstream-dp-phy-init-fix-v1-1-4e9da9f97991@linaro.org/


Dmitry Baryshkov (7):
  phy: qcom: qmp-combo: correct bias0_en programming
  phy: qcom: qmp-combo: reuse register layouts for more registers
  phy: qcom: qmp-combo: reuse register layouts for even more registers
  phy: qcom: qmp-combo: reuse register layouts for some more registers
  phy: qcom: qmp-combo: drop similar functions
  phy: qcom: qmp-combo: drop qmp_v6_dp_aux_init()
  phy: qcom: qmp-combo: extract common function to setup clocks

 drivers/phy/qualcomm/phy-qcom-qmp-combo.c     | 408 +++++++-----------
 .../qualcomm/phy-qcom-qmp-qserdes-txrx-v6.h   |   5 +
 drivers/phy/qualcomm/phy-qcom-qmp.h           |   2 +
 3 files changed, 174 insertions(+), 241 deletions(-)

-- 
2.39.2

