Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C85185CB19
	for <lists+freedreno@lfdr.de>; Tue, 20 Feb 2024 23:50:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A998210E5A9;
	Tue, 20 Feb 2024 22:50:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="ZBcjahPW";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C691E10E5A7
 for <freedreno@lists.freedesktop.org>; Tue, 20 Feb 2024 22:50:44 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-512cc3ea7a5so1037186e87.3
 for <freedreno@lists.freedesktop.org>; Tue, 20 Feb 2024 14:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708469442; x=1709074242; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=1LG/YBimXAQusHofv1q3iQxH4mPaNrde/6RhU8UnryY=;
 b=ZBcjahPWAMBEEh3nyN30Mp+9lGYsJr/PCKVIz+gzjcGTa9KHfPVpcOgzMSmk1yl+bu
 v+chdpsFnwuCief43pa4zBGTbZmTXAaP/ozKYrGl2VNnbbt+WwErCKLhTwQwUpHDqpbv
 UOWSayOgF90VxfBMJYlK5gXUqUZD/gTdi6y+MokruD91FlQhWkeFtcebsv7R/jKvYzq5
 M+O1Fhup0zxl71roE2XScOMPjoT4cGtyboj0Yqv6m41CKoMscjf02wT/UVREkpVOdr5w
 PMMDP49UnicfUT3zI2kW7CNQ4TZJpVvD3XSVfYQZWSJkyZZB0UQZPhGSEbg/5hqgkf1t
 OTXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708469442; x=1709074242;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=1LG/YBimXAQusHofv1q3iQxH4mPaNrde/6RhU8UnryY=;
 b=J4st8w9VHiQWJDzW3vywQ/JkMHCqFNZdWlWCqw3d6R6Xl2w2MxjlkKzCx/N6JeGXEq
 +tmr0pVrU/GI6fdpKhuIbjmKtNEKuZgdkOTBtKFisNztKJz3YqBWafC06/ycxnAqylCM
 LJ+oCvVZQw23p+UR6DMyYgRjxd7yUAcg072GakEzJ0o4iJOZbcivEruJOqnOEYKBgX7q
 XU6HBpm9o5m3GJhxa8yvE9wPTYGLmSV0oEHBex0k0Zj2/AU2EmPHh+6jQlDgLHH836AX
 koPkbqtvtd2ZksITrBcnkq4cqEnFHXx6QKfRRT26U+D7Wifbx5tc0h+g687+cQfnOAlz
 Uk8g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXp0s6AEzT9PfTeSeeYvbxODolXYwrYZEbb9JudiNoOfqlKeDk+eLLc/LJL8E8KP43fynRrXTz2tskZoud47cvI/IrqLTOR0JhbS7UlmtX7
X-Gm-Message-State: AOJu0Yyra1gQM8pgtlOtsnq5IkVn4RkxHdPhdPuGcq/WhtNfbDHRynDz
 hnuTGpQqU1PZbZ3KFyl01R/EtWzEWyGR/IGgDQY0766W/YATi2riTpCjrkbVKuA=
X-Google-Smtp-Source: AGHT+IGFjq4aRmXhKbeVXidrtL0lugiMcB88ZB9NqST7+igCfACT+E7YS8UgO+RIA94FjWGnszt7vw==
X-Received: by 2002:a05:6512:3d04:b0:512:bf82:139f with SMTP id
 d4-20020a0565123d0400b00512bf82139fmr3245081lfv.25.1708469442497; 
 Tue, 20 Feb 2024 14:50:42 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93]) by smtp.gmail.com with ESMTPSA id
 g3-20020a170906c18300b00a3ed811cff9sm1601977ejz.154.2024.02.20.14.50.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 14:50:41 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Subject: [PATCH RFC 0/3] drm/msm/dp: Rework the eDP/DP modes and add
 support for X1E80100
Date: Wed, 21 Feb 2024 00:50:30 +0200
Message-Id: <20240221-x1e80100-display-refactor-connector-v1-0-86c0e1ebd5ec@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALYs1WUC/x2NQQrCMBBFr1Jm7UAm1VLdCh7AbXERpl8dkKQkI
 i2ldzd09x48/l+pIBsKXZqVMn5WLMUqcmhI3yG+wDZWJ+98K17OPAt6J87xaGX6hIUznkG/KbO
 mGLETRLvudOw1oKW6NNXG5v1loPvtSo9t+wMh1QMmegAAAA==
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Johan Hovold <johan@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1284; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=XUmTiKV+TS3e6Ef/iekjRyOkUOD1YgaHYwrpRNkCpCI=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl1Sy4am+8YdtdpgLN1WSUtUIMsRhnVx4qBl0pE
 Q4WaunMBhyJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZdUsuAAKCRAbX0TJAJUV
 Vkb8EAC3yluN0p4bSupKX3D7fdfiWjltnA2GVXEWe4GZm48cgF9Ptk/hXjQP2fy+eIWsUVKW0Aa
 03qKb0Up3xBD0PQMfV+YRVJWm2WOIwiHwmfEDk2jBWh8Vnv2xT7PtU/KcdM597vYxSDo3bQyIFd
 nMtbo5IHRTrrlZU5JUB707ZOdr2VKg5AYqvqrRnL+IOVR8sucuk0s8mgMGp/GippDRHmy4Mdi7w
 EDOW16RpqerHXNMl5u/xjYmcMdHEl/CVHYqqYGh43oWGjwk5gMtzkL5voXRCAj2JyfeWCI+aoId
 8iaVoPhCBQTLUaLRiWSuJTCqYPw8iLbdj4RFy42uf8FwSw62bcwJ93073b4QOCiNo0SBmZPBX3M
 JfN88v8PpMna2Gi+pLAySico47zuLZWenkjkLdo/Y0dvZ5dsMGLScOxh0LCC2Du/uMoeUhuLu5v
 VnI8twihZf78cUrvA0DP7u92b1rWED0yM0KYneZe5APmE72ZJrFdwsB9lZT7L2cRwUOASknA4wP
 VkfEhk/8E7902SPAK0dxHngdlHzfVaUAJvV4F0Cm0dEPfFIkQqknGgEk82rh2VfMB46Zn5lw5ne
 8DSNFWAfC9EuUIfHfZmiS+Fd/+wtEwiqmh2oXRO9Av6/6EVbUGP6UMdpHemIB9LagufuEh5IoXn
 v71QfqsCZZmE1eA==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Since this new platform supports both DP and eDP, it's the perfect time
to drop the dual compatible (eDP and DP) and figure out a different way
to specify the mode. After some off-list discussion, one suggested way
was to add a 'is-edp' property to the controller node and call
phy_set_mode to let the PHY know which mode it should configure itself.

The PHY counterpart patchset is here:
https://lore.kernel.org/all/20240220-x1e80100-phy-edp-compatible-refactor-v5-0-e8658adf5461@linaro.org/

Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
Abel Vesa (3):
      dt-bindings: display: msm: dp-controller: document X1E80100 compatible
      drm/msm/dp: Add support for setting the eDP mode from devicetree
      drm/msm/dp: Add support for the X1E80100

 .../bindings/display/msm/dp-controller.yaml        |  6 +++++
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   | 11 +++++++++
 drivers/gpu/drm/msm/dp/dp_ctrl.h                   |  1 +
 drivers/gpu/drm/msm/dp/dp_display.c                | 28 +++++++++++++++++++---
 4 files changed, 43 insertions(+), 3 deletions(-)
---
base-commit: 2d5c7b7eb345249cb34d42cbc2b97b4c57ea944e
change-id: 20231219-x1e80100-display-refactor-connector-e1c66548cae3

Best regards,
-- 
Abel Vesa <abel.vesa@linaro.org>

