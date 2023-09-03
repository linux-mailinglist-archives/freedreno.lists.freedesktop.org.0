Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC07E790E44
	for <lists+freedreno@lfdr.de>; Sun,  3 Sep 2023 23:41:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BC0A510E21B;
	Sun,  3 Sep 2023 21:41:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E42C10E002
 for <freedreno@lists.freedesktop.org>; Sun,  3 Sep 2023 21:41:53 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-500bbe3ef0eso992556e87.1
 for <freedreno@lists.freedesktop.org>; Sun, 03 Sep 2023 14:41:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693777311; x=1694382111; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=V8+6hRoyuo0w27wr7qjZ8oFHPY2yc7kx8FAgPsdCc/g=;
 b=GGENpY+oo0Ai/+V+hw3qwbuTYKgYBR2/N4EIjBCYS5ubgAv6NmahR7OO1n7yIM9T7A
 MPrHhByqA3OJuOdXgGtksjzGvnC9cAG/9QOIBD3zzmpx32EL058UyBsBGdXhSMCuwEq+
 USQYUL7KsAr41teXi3d1MqLzasjh9OLQWdE8CCUbhghFZuYpPIDt+jqFtRcE4Thcpfeo
 oXKJwMz2HvDBPR/A/LlpPnuVvYWthlIs9YIZqE0AuYWVGufCN8TCqQLzy/PLOdRpXXOp
 VAGCRR1EKHb+Oqc3hGsWWD3ujvvL6M6AIB9/Nu8nBxjbGsqw27qyn+j542EIau7H+tDZ
 yGcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693777311; x=1694382111;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=V8+6hRoyuo0w27wr7qjZ8oFHPY2yc7kx8FAgPsdCc/g=;
 b=B6/PnXIOFt7LnH2xlNrrjFzCete/yusIIAGTrmYfyStIh6VHPEWkGyw9Js00dG4cAJ
 Bplnqq7HhmnBhH7QGRjMePSA2ILIiwI6MX0Kedxd2aY/af1XJ/Akwz/MwaELRgTWUyMN
 yju9a+tQMmtRBa81ylYPpuGa1AuynDaVI67Mn/FNgzt75p4W2Dhk02F7bj1IrlTHMHi4
 P4iORi0T5+3AQz/u/UdhRAsk4zMrfMrRjJQj7a3NCWaLAW3nc4FMA1aIFi+nVnZUPYvC
 SaZvidYmCPB8SD3tBCWCeAKBg/8++/Vdh2jyIPzT/B7+awBroceu7Zz2ymbdOxKz8PVW
 N3Fg==
X-Gm-Message-State: AOJu0YwigL0JASwVXlr/1GNi9nNEX4HIKG/fAskrZ0u6q7odC5/HC9wU
 d7/S2MC0DGACnusejPYchWrziw==
X-Google-Smtp-Source: AGHT+IGtFPj/i132V84gFgb+9UX2XVd1+6zrpeCc6Tu4V8tR6EXyMighkqxBy2CLmJBokzxnUP+RZQ==
X-Received: by 2002:ac2:498d:0:b0:500:91f6:f129 with SMTP id
 f13-20020ac2498d000000b0050091f6f129mr2178545lfl.26.1693777311128; 
 Sun, 03 Sep 2023 14:41:51 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x17-20020ac25dd1000000b004f8555f7aa1sm1422506lfq.52.2023.09.03.14.41.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 14:41:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 "Bryan O'Donoghue" <bryan.odonoghue@linaro.org>,
 Guenter Roeck <linux@roeck-us.net>,
 Heikki Krogerus <heikki.krogerus@linux.intel.com>,
 Janne Grunau <j@jannau.net>, Simon Ser <contact@emersion.fr>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Date: Mon,  4 Sep 2023 00:41:38 +0300
Message-Id: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH v1 00/12] drm,
 usb/typec: uABI for USB-C DisplayPort connectors
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
Cc: linux-arm-msm@vger.kernel.org, linux-usb@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

During the discussion regarding DisplayPort wrapped in the USB-C
connectors (via the USB-C altmode) it was pointed out that currently
there is no good way to let userspace know if the DRM connector in
question is the 'native' DP connector or if it is the USB-C connector.

An attempt to use DRM_MODE_CONNECTOR_USB for such connectors was
declined, as existing DP drivers (i915, AMD) use
DRM_MODE_CONNECTOR_DisplayPort. New drivers should behave in the same
way.

An attempt to use subconnector property was also declined. It is defined
to the type of the DP dongle connector rather than the host connector.

This attempt targets reusing the connector's PATH property. Currently
this property is only used for the DP MST connectors. This patchset
reuses it to point out to the corresponding registered typec port
device.

Dmitry Baryshkov (12):
  Revert "drm/sysfs: Link DRM connectors to corresponding Type-C
    connectors"
  drm/sysfs: link DRM connector device to the connector's fw nodes
  drm/connector: extend PATH property to covert Type-C case
  drm/bridge-connector: set the PATH property for the connector
  drm/bridge: remove conditionals around devicetree pointers
  soc: qcom: pmic_glink_altmode: fix DRM connector type
  soc: qcom: pmic_glink_altmode: report that this is a Type-C connector
  usb: typec: support generating Type-C port names for userspace
  usb: typec: tcpm: support generating Type-C port names for userspace
  usb: typec: qcom: implement proper error path in probe()
  usb: typec: qcom: extract DRM bridge functionality to separate file
  usb: typec: qcom: define the bridge's path

 drivers/gpu/drm/bridge/panel.c                |  2 -
 drivers/gpu/drm/drm_bridge_connector.c        | 14 ++++-
 drivers/gpu/drm/drm_connector.c               | 10 +++-
 drivers/gpu/drm/drm_sysfs.c                   | 42 +-------------
 drivers/soc/qcom/pmic_glink_altmode.c         |  3 +-
 drivers/usb/typec/class.c                     | 14 +++++
 drivers/usb/typec/tcpm/qcom/Makefile          |  4 ++
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 56 ++++++-------------
 .../usb/typec/tcpm/qcom/qcom_pmic_typec_drm.c | 40 +++++++++++++
 .../usb/typec/tcpm/qcom/qcom_pmic_typec_drm.h | 22 ++++++++
 drivers/usb/typec/tcpm/tcpm.c                 | 14 +++++
 include/drm/drm_bridge.h                      |  9 ++-
 include/linux/usb/tcpm.h                      |  2 +
 include/linux/usb/typec.h                     |  2 +
 14 files changed, 146 insertions(+), 88 deletions(-)
 create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.c
 create mode 100644 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.h

-- 
2.39.2

