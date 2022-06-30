Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2C195561EFA
	for <lists+freedreno@lfdr.de>; Thu, 30 Jun 2022 17:17:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 69F3B10F5C5;
	Thu, 30 Jun 2022 15:17:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com
 [IPv6:2a00:1450:4864:20::435])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8621D11A292
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jun 2022 12:08:49 +0000 (UTC)
Received: by mail-wr1-x435.google.com with SMTP id v14so26958340wra.5
 for <freedreno@lists.freedesktop.org>; Thu, 30 Jun 2022 05:08:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b+2KfJ+EbtiUw/VFlCJvwTsR648bOr42JoNq/qybfo0=;
 b=tlAlhjc6NZN7ne6vQQPlSmUWHBOWkq6YIolr+75AcP9IiMe7sRBNCo+XTzQUR1fXN0
 2bQlmeJCzRQ3xHciw1xCY6gxg9aJ71INftV391l3/TmYL4vsubg/eZxvAD5xyu4G4YGG
 /6oCIBcdOTRbWjJrif47hNyBPIFO6OOko2gxi4w1VvPq8+UeSx9ZeHqKVtWX3BrsDxkQ
 Bv3ENwd4eOHgqb9kPbTz6YgBXAlaAlqnpjy+PBCTw82ZBlvIkMiaa1ZvA9r4F9eZcvY8
 6OCh7JiR47yYqRfn/c1yK5SeURqJu8nWtfwuMHUbbZTJAiZi8ftu4z8rP/W5O/MKQ8n+
 jCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=b+2KfJ+EbtiUw/VFlCJvwTsR648bOr42JoNq/qybfo0=;
 b=BrpENWiSWDdwNOCraoVleftDX2/fXi3LIG8la4iJU3BywUDxLLpnB7kaw24VNN/Mvl
 npwHZuVKGRfVXZxc6rJc4ItCg/6AdntvfylQ8tMyw2dTNOG3yjUx1edIrd2E3a5Ex7Th
 HPExbqHzO1bnvAGLo2E3r1seqlzS9M6p/8osuzfxaTFV8rFKmKXWhQ3WIaChY9nqRwoU
 nyuZYgFyZ1UOkTwQKn7xoVbeCW9SblIh1DuXEXCPC7a0zM6GXxokaoGcBYZEbw1k1e4U
 MihNRrAW3qtn6WzMX88CJ92E1SA/pExOeAtiIZvsrgum28C9CWQShMGrx1hKGRUCO6sG
 3pwg==
X-Gm-Message-State: AJIora+KkDi1z3mvQL+fUEo0twcwbkYyzf5+8Ywnrk3FTnogTTHGEMKF
 7g8DVH9qCxNjkpQdIUjqoHvz9w==
X-Google-Smtp-Source: AGRyM1tu763LSSFunvSobsS1rb3AceLNnzNP0wf4briumXSyFXIpk6oc7PQ8fjdRvuPu9CZqhod1rg==
X-Received: by 2002:a5d:6a81:0:b0:21d:3f7a:3 with SMTP id
 s1-20020a5d6a81000000b0021d3f7a0003mr1991415wru.300.1656590927998; 
 Thu, 30 Jun 2022 05:08:47 -0700 (PDT)
Received: from sagittarius-a.chello.ie (188-141-3-169.dynamic.upc.ie.
 [188.141.3.169]) by smtp.gmail.com with ESMTPSA id
 m1-20020a7bcb81000000b003a05621dc53sm6286532wmi.29.2022.06.30.05.08.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 30 Jun 2022 05:08:47 -0700 (PDT)
From: Bryan O'Donoghue <bryan.odonoghue@linaro.org>
To: robdclark@gmail.com, quic_abhinavk@quicinc.com,
 dmitry.baryshkov@linaro.org, sean@poorly.run, airlied@linux.ie,
 daniel@ffwll.ch, robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Date: Thu, 30 Jun 2022 13:08:38 +0100
Message-Id: <20220630120845.3356144-1-bryan.odonoghue@linaro.org>
X-Mailer: git-send-email 2.36.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Mailman-Approved-At: Thu, 30 Jun 2022 15:17:39 +0000
Subject: [Freedreno] [PATCH 0/7] msm8916/msm8939 DSI controller and DSI PHY
 bindings fixes
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, bjorn.andersson@linaro.org,
 quic_mkrishn@quicinc.com, bryan.odonoghue@linaro.org, swboyd@chromium.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This series fixes up a number of dtbs checks which are being flagged adding
in the msm8939 dtsi.

When converting from .txt to .yaml a number of the parameters for the older
msm8916 silicon were not transmitted into the yaml.

Adding in the msm8939 which is a near 1:1 copy of the msm8916 in terms of
dtsi triggers a rake of dtbs checks as a result.

Bryan O'Donoghue (7):
  dt-bindings: msm: dsi: Fix phy-name binding
  dt-bindings: msm: dsi: Fix operating-points-v2 constraint
  dt-bindings: msm: dsi: Fix power-domains constraint
  dt-bindings: msm: dsi: Add vdd* descriptions back in
  dt-bindings: msm: dsi: Fix clock declarations
  dt-bindings: msm: dsi: Add missing clocks to 28nm DSI PHY YAML
  dt-bindings: msm: dsi: Add missing qcom,dsi-phy-regulator-ldo-mode

 .../display/msm/dsi-controller-main.yaml      | 39 ++++++++++++++-----
 .../bindings/display/msm/dsi-phy-28nm.yaml    | 20 ++++++++++
 2 files changed, 49 insertions(+), 10 deletions(-)

-- 
2.36.1

