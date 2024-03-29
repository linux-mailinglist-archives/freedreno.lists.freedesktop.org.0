Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0C496891483
	for <lists+freedreno@lfdr.de>; Fri, 29 Mar 2024 08:47:03 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C142D11256B;
	Fri, 29 Mar 2024 07:47:01 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=fairphone.com header.i=@fairphone.com header.b="cj5vJdZ8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com
 [209.85.208.44])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1041D11256C
 for <freedreno@lists.freedesktop.org>; Fri, 29 Mar 2024 07:47:00 +0000 (UTC)
Received: by mail-ed1-f44.google.com with SMTP id
 4fb4d7f45d1cf-56b0af675deso1999304a12.1
 for <freedreno@lists.freedesktop.org>; Fri, 29 Mar 2024 00:46:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=fairphone.com; s=fair; t=1711698356; x=1712303156; darn=lists.freedesktop.org;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=O2Yw8I3npoX2UZ1a8v7MBLYBW49lXvLIxaEAjAdwtH0=;
 b=cj5vJdZ8cpcwyE+sB5CO1lrj32lIwfXk7ajgKtXotyjCGFtZfJtRdlXgIzeInnggbr
 +MlxmDcnShxC4NxDNqTRvbqxpjQO3QbKR+C4S+3NB73bC4gA9GX4WxUzlfJfsBN7zLR9
 AdxRWQcRynMC8XFvOFktgBiSMTDzO5RxXASfSKc4D6AM0jm1X8xNAfU0/XhoPyeOju/u
 OSg515ZqQKXh+AEXBCAmKG8zJO+BKUC+o4wB6I+wNAgcyKByuH7tQHu0JslYn8huB5uh
 ReS4Hc/sdp86ejKo2SOevzMPGlr4Z4Krho/lIeZ+bzno79rvjZx6IBNuEq52HtOQ3erH
 w6MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1711698356; x=1712303156;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=O2Yw8I3npoX2UZ1a8v7MBLYBW49lXvLIxaEAjAdwtH0=;
 b=XU1Uatbmujd1EriiB83lwHJOnTkvJ6O5/cRQfXuyh7nl5xIXn/YciVmuGjHbIHArVq
 vxXtk2+hqxO1VPbMaNQp7x9gmBgOIvZij1aroR9br6Y0VBSHr82mQjZH0fXeNd20AHpw
 PFcHI54PvxumZhTHdRibQqOXsIiQRc1qrKMkpwWUoSqhfOTnzmPsfAOmfFkcy1zpVHeB
 eBPVNQJ/0i7SIXzznEPq+jwUhpWIGo5Mrt08tycZSc0esb8O4UMIKGdou49OHgTSI5f8
 I7tkADnbTvAiykZ12RjX7ygyfAf+5/BJLtUnegv2urOBoj62g2F3ZWOk2kluZLwrb/3D
 Z1bg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXU1ztucbp/DOjgmEl7PP9QeIZGprKKalcuSaUWZBRuwEHoCrvZ8GMc43RqQbLpF1eCUoDRRQ8CEW7/4Fap6FkCXYw/C1PKnP9ADp7IMVI8
X-Gm-Message-State: AOJu0YxDPydne3RdKxdojSfFN2b8xREvhm0d6YqdILmsCePDR3rib4N9
 fDelWpE7HEODRtOIfrJDXpWKcYfvSQzMSO44YEtCDWpCw0Lxh/cpidP+UY2l1X4=
X-Google-Smtp-Source: AGHT+IFxPMIBsdZk0Lxri/jnEnAqJk6fcA0McqLNuoYlYxcF2e/U3vOHL2/tR0eQxjRYpIKHZ4rGRw==
X-Received: by 2002:a17:906:f6d4:b0:a47:8767:671a with SMTP id
 jo20-20020a170906f6d400b00a478767671amr1115394ejb.21.1711698356276; 
 Fri, 29 Mar 2024 00:45:56 -0700 (PDT)
Received: from otso.luca.vpn.lucaweiss.eu
 (144-178-202-138.static.ef-service.nl. [144.178.202.138])
 by smtp.gmail.com with ESMTPSA id
 l9-20020a1709060cc900b00a4e24d259edsm1382737ejh.167.2024.03.29.00.45.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 29 Mar 2024 00:45:56 -0700 (PDT)
From: Luca Weiss <luca.weiss@fairphone.com>
Subject: [PATCH v2 0/3] DisplayPort support for SM6350/SM7225
Date: Fri, 29 Mar 2024 08:45:53 +0100
Message-Id: <20240329-sm6350-dp-v2-0-e46dceb32ef5@fairphone.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALFxBmYC/23MQQ7CIBCF4as0sxYDAxjiynuYLiilMotCAw3RN
 Nxd7Nrl//LyHVB8Jl/gPhyQfaVCKfbAywAu2PjyjObegBwVl2hYWW9SczZvTAmURmg5KWWg/7f
 sF3qf1nPsHajsKX9Ouorf+k+pgnGGQjuLkxFO6sdiKW8hRX91aYWxtfYFvdDmaKYAAAA=
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
Cc: ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Luca Weiss <luca.weiss@fairphone.com>
X-Mailer: b4 0.13.0
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

Add the required changes to support DisplayPort (normally(?) available
via the USB-C connector) on the SM6350/SM7225 SoC.

This has been tested on a Fairphone 4 smartphone with additional changes
not included in this series (mostly just wiring up TCPM and the SBU
mux).

Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
---
Changes in v2:
- Fix typo in dp-controller patch subject
- Use 'contains' for subnode in mdss schema
- Pick up tags
- Link to v1: https://lore.kernel.org/r/20240328-sm6350-dp-v1-0-215ca2b81c35@fairphone.com

---
Luca Weiss (3):
      dt-bindings: display: msm: dp-controller: document SM6350 compatible
      dt-bindings: display: msm: sm6350-mdss: document DP controller subnode
      arm64: dts: qcom: sm6350: Add DisplayPort controller

 .../bindings/display/msm/dp-controller.yaml        |  1 +
 .../bindings/display/msm/qcom,sm6350-mdss.yaml     |  9 +++
 arch/arm64/boot/dts/qcom/sm6350.dtsi               | 88 ++++++++++++++++++++++
 3 files changed, 98 insertions(+)
---
base-commit: 871760455183dc66b3e185f8d3ed2184cc9fac25
change-id: 20240328-sm6350-dp-41238153b448

Best regards,
-- 
Luca Weiss <luca.weiss@fairphone.com>

