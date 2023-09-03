Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE6F5790E6A
	for <lists+freedreno@lfdr.de>; Sun,  3 Sep 2023 23:42:15 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 587B110E217;
	Sun,  3 Sep 2023 21:42:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 038DB10E21A
 for <freedreno@lists.freedesktop.org>; Sun,  3 Sep 2023 21:42:02 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-500a8b2b73eso1340775e87.0
 for <freedreno@lists.freedesktop.org>; Sun, 03 Sep 2023 14:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693777320; x=1694382120; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VRU3YcmHhtMgrEwiKr0jiCPmTZjWFsu5C3QySeLjrFk=;
 b=QqA+5fOah4cvJAtNFLHf8p8CDsWk4rNySNqzloCusqM87N7nXBzmOlzgkQYH/4CJUw
 9fla1/WMmTRWLTSFAOD1RdNQtaydC7gN6e2npU+LH6mKLVSWfm4GdJ4vN+c5Qf6FHVWC
 AlbRbmCEENlCZd7fkAKGBQa5E/skTBqA3JRiulTbMEdrbNUWVYIz08L71UJtArWl89eH
 hFLggvG+o68hD+2IXIgsSCMQShZh277i7JOD10xGMqe8PML7L+GLEiItlAeKbu7luKBY
 2L6gDcx8FyJb45Ku1TYaM9UANPsgoPC8YixQQx5SZh3YyNDolUrHb/zaTP7Y3c7ou38k
 dHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693777320; x=1694382120;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VRU3YcmHhtMgrEwiKr0jiCPmTZjWFsu5C3QySeLjrFk=;
 b=dEUNQE/b5WdyIjPQkDFVLs5NR9ioqbxPeSYGjMKd6m2m7nbedPBt25GJSceWNwrayb
 vwJDCI9OCZQNZivhTrCq1qf7/Z3KU+tx5jQ0plpaEtUEYJM9nZ1f9wUthitWXaCEUpkB
 UgCHFbNP9KsgiOTA/xVL+EgkdB6jG/HLcqyA0TkkBv8psXkX4FQeh4xjbvw2u7v9rLUu
 GWfQW5rOsM3ZE8VbrDcVMbkREFeDga5hOo5xWtWwp+NMUCyUl5AAsLw1uxDg2iFjCgj5
 moiQMuy5Xh4utU93OqOYr8IbXkm24k3570AFEYnR+68FukW5EfIGJmGTspMM8xaofAl5
 EmxA==
X-Gm-Message-State: AOJu0YzCgwLW5cJtLIiJ20lPF7gojHawFDpbIecM/BcVRA1tf++mwZYB
 c57D+rhKub4I57CCV63wdi95ZV8cM6GZxh6++fE=
X-Google-Smtp-Source: AGHT+IFsqgNhsNbkZVa3cNm+AdNIgulADr18z4rrsHYsJZU44KXFgwMqPl+5UxHTsBskue63qdvb8w==
X-Received: by 2002:a05:6512:3b26:b0:4fb:caed:95c3 with SMTP id
 f38-20020a0565123b2600b004fbcaed95c3mr5991678lfv.53.1693777320290; 
 Sun, 03 Sep 2023 14:42:00 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x17-20020ac25dd1000000b004f8555f7aa1sm1422506lfq.52.2023.09.03.14.41.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 14:41:59 -0700 (PDT)
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
Date: Mon,  4 Sep 2023 00:41:50 +0300
Message-Id: <20230903214150.2877023-13-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH v1 12/12] usb: typec: qcom: define the
 bridge's path
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

In order to notify the userspace about the DRM connector's USB-C port,
export the corresponding port's name as the bridge's path field.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c     | 11 +++++++----
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.c |  4 +++-
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.h |  6 ++++--
 3 files changed, 14 insertions(+), 7 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
index b9d4856101c7..452dc6437861 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
@@ -156,6 +156,7 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 	struct device_node *np = dev->of_node;
 	const struct pmic_typec_resources *res;
 	struct regmap *regmap;
+	char *tcpm_name;
 	u32 base[2];
 	int ret;
 
@@ -211,10 +212,6 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 	mutex_init(&tcpm->lock);
 	platform_set_drvdata(pdev, tcpm);
 
-	tcpm->pmic_typec_drm = qcom_pmic_typec_init_drm(dev);
-	if (IS_ERR(tcpm->pmic_typec_drm))
-		return PTR_ERR(tcpm->pmic_typec_drm);
-
 	tcpm->tcpc.fwnode = device_get_named_child_node(tcpm->dev, "connector");
 	if (!tcpm->tcpc.fwnode)
 		return -EINVAL;
@@ -225,6 +222,12 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 		goto fwnode_remove;
 	}
 
+	tcpm_name = tcpm_port_get_name(tcpm->tcpm_port);
+	tcpm->pmic_typec_drm = qcom_pmic_typec_init_drm(dev, tcpm_name);
+	kfree(tcpm_name);
+	if (IS_ERR(tcpm->pmic_typec_drm))
+		return PTR_ERR(tcpm->pmic_typec_drm);
+
 	ret = qcom_pmic_typec_port_start(tcpm->pmic_typec_port,
 					 tcpm->tcpm_port);
 	if (ret)
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.c
index e202eb7b52db..7bd7f4bf3539 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.c
@@ -21,7 +21,8 @@ static const struct drm_bridge_funcs qcom_pmic_typec_bridge_funcs = {
 	.attach = qcom_pmic_typec_attach,
 };
 
-struct pmic_typec_drm *qcom_pmic_typec_init_drm(struct device *dev)
+struct pmic_typec_drm *qcom_pmic_typec_init_drm(struct device *dev,
+						const char *path)
 {
 	struct pmic_typec_drm *tcpm_drm;
 
@@ -33,6 +34,7 @@ struct pmic_typec_drm *qcom_pmic_typec_init_drm(struct device *dev)
 	tcpm_drm->bridge.of_node = of_get_child_by_name(dev->of_node, "connector");
 	tcpm_drm->bridge.ops = DRM_BRIDGE_OP_HPD;
 	tcpm_drm->bridge.type = DRM_MODE_CONNECTOR_DisplayPort;
+	tcpm_drm->bridge.path = devm_kstrdup(dev, path, GFP_KERNEL);
 
 	return ERR_PTR(devm_drm_bridge_add(dev, &tcpm_drm->bridge));
 }
diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.h b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.h
index 01f4bb71346b..259c047265f7 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.h
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec_drm.h
@@ -9,9 +9,11 @@
 struct pmic_typec_drm;
 
 #if IS_ENABLED(CONFIG_DRM)
-struct pmic_typec_drm *qcom_pmic_typec_init_drm(struct device *dev);
+struct pmic_typec_drm *qcom_pmic_typec_init_drm(struct device *dev,
+						const char *path);
 #else
-static inline pmic_typec_drm *qcom_pmic_typec_init_drm(struct device *dev)
+static inline pmic_typec_drm *qcom_pmic_typec_init_drm(struct device *dev,
+						       const char *path)
 {
 	return NULL;
 }
-- 
2.39.2

