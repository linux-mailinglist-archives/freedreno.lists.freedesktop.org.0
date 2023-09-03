Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C6A3790E65
	for <lists+freedreno@lfdr.de>; Sun,  3 Sep 2023 23:42:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3A6F10E245;
	Sun,  3 Sep 2023 21:42:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B4D3410E217
 for <freedreno@lists.freedesktop.org>; Sun,  3 Sep 2023 21:41:54 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-4ff09632194so1457203e87.2
 for <freedreno@lists.freedesktop.org>; Sun, 03 Sep 2023 14:41:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693777313; x=1694382113; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Ma99b4LHGq53HSGcZQ6vjRnRZEGnePGsfNP3DlvaRh0=;
 b=f1NyVWOtreRaKAcKFlQgUdauoznmfWFtMDHk34+u038++CcF6kyfyyd7+g55J6nKlm
 G0cH8OBVQGaTjjNb+Up2w4H34JiySAQwDOtRbLeEbi2IUde0DNxqlu5B+mOAb26al44S
 wrnOyTuQdgJKzlr4BJbx0jNkiW5D0prWBlwy3APOEsLeg5w0SQbkRv17GBwihETN/PxZ
 6+JLy/B5RTFQurg/mlvzHd+PaY6BOGcfHgHJNOab/O+Ldf5VdW3Ddy7vZVIIlPEal9Kw
 CbHVAbiTggjd5uVyk/qFc6te/HPGdNRn6fliFpjQSF9EeQIDqMBpFEb5JTlV2r04BAX6
 rHIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693777313; x=1694382113;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Ma99b4LHGq53HSGcZQ6vjRnRZEGnePGsfNP3DlvaRh0=;
 b=ahtMqaxLQ4hqVY+XUEQuLOVecdGWgkFySdLwCaJR2e1iGbUrKxBU5w9JPkfTNlJvve
 iZsag9iHJRDaJ1YkjvWH4ZJax8y6OzIfzaIgFWkqUKkYoZKKnFwnsUdxChS4IvcfTrJU
 udeCqLVCbuUgqOiayR2hnKc4N1i/221dBrnHRdfhMYDRVHd7XdMvIxdDXpcZtPrUnins
 kR0SGJnyazNZg2hxxPmL1BjX+5Tn5flb3xJT9Mn6+DLaQPiVtg0hO0pHNLOxn+IDkLDt
 RJDUW5qy2aRTpDsr9+qqGkGHkDThK4ZcDV2JCFMHW3NNB5V36GdS2/MlvRGfUOg3l5Ih
 QT3A==
X-Gm-Message-State: AOJu0Yx/+wx89URRLC+AfCNqWxFhfUxV9Cp5gUHoCaN9V/2eP2w4/f5/
 YUihT5xnKxB405b+4ocXVuFi+w==
X-Google-Smtp-Source: AGHT+IHJVW1SRXqtDqVwoMB9XSCNYSPZYNLw0l5nqazh953B3y2RWKaTYGlv3/IkcL42Y/AtV9dO0g==
X-Received: by 2002:a05:6512:44c:b0:4fd:d517:fbcd with SMTP id
 y12-20020a056512044c00b004fdd517fbcdmr4553861lfk.6.1693777312712; 
 Sun, 03 Sep 2023 14:41:52 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x17-20020ac25dd1000000b004f8555f7aa1sm1422506lfq.52.2023.09.03.14.41.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 14:41:52 -0700 (PDT)
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
Date: Mon,  4 Sep 2023 00:41:40 +0300
Message-Id: <20230903214150.2877023-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH v1 02/12] drm/sysfs: link DRM connector
 device to the connector's fw nodes
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

Setup the of_node and fwnode fields for the DRM connector device,
making respective links to appear in /sys.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_sysfs.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/drm_sysfs.c b/drivers/gpu/drm/drm_sysfs.c
index 06662cc8d3f4..cb926d95ef0e 100644
--- a/drivers/gpu/drm/drm_sysfs.c
+++ b/drivers/gpu/drm/drm_sysfs.c
@@ -345,6 +345,8 @@ int drm_sysfs_connector_add(struct drm_connector *connector)
 	kdev->class = drm_class;
 	kdev->type = &drm_sysfs_device_connector;
 	kdev->parent = dev->primary->kdev;
+	kdev->of_node = to_of_node(connector->fwnode);
+	kdev->fwnode = connector->fwnode;
 	kdev->groups = connector_dev_groups;
 	kdev->release = drm_sysfs_release;
 	dev_set_drvdata(kdev, connector);
-- 
2.39.2

