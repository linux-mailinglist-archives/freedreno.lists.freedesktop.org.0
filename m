Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D9C62790E5B
	for <lists+freedreno@lfdr.de>; Sun,  3 Sep 2023 23:42:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0B92C10E246;
	Sun,  3 Sep 2023 21:42:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com
 [IPv6:2a00:1450:4864:20::136])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CE4310E21A
 for <freedreno@lists.freedesktop.org>; Sun,  3 Sep 2023 21:42:00 +0000 (UTC)
Received: by mail-lf1-x136.google.com with SMTP id
 2adb3069b0e04-50079d148aeso1413548e87.3
 for <freedreno@lists.freedesktop.org>; Sun, 03 Sep 2023 14:42:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693777318; x=1694382118; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=+Fl8gZia3d8uGRSMrCOuo+xZGwzdrHyhk9K+cL7FZyc=;
 b=FTI9lxT9APKqouH1X7cZM9vxnixvfNMaWyFBo0sKV/I9ZYMjGosnGE+tro0WP/cr0K
 jqkzae81bKeVihM2Jnv/Xi2ncKl7rhKFszFJdV7JFE1RNb4Gm/NwZxdGRsiC0XOItLFd
 moegcte//ab1xjk+SGXtUZjGDYedZX9ICRuE0J7MWIcRZqgSfqujSlqlKW7sMuqAMkzN
 QwoX6D/i6Dab96sBWirkA2gd+bEFccAWQ2IoHXyE0f9TijsVaEZZHl8B+S/45AvCBai8
 ZtVWMJGHK84Xynu+wFDgXM/L0FCQDJ9mI0H7AC++prC/GdYpxlKkeQDnTzR1WwoVuj+g
 Kdlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693777318; x=1694382118;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=+Fl8gZia3d8uGRSMrCOuo+xZGwzdrHyhk9K+cL7FZyc=;
 b=WUE1pvUa91qxA7w409C/3As02g9rpaQ3Hs8zRi4RmkcomqZPURpNiF6TyLos93I97R
 CtkM7pKSVu6581qgTfOYaUUPFUnMI7SAtiiOB8wxb0ov6aBDfbrD6ioMqQZ/DaqX1Nrm
 DdjcRBN1lMrMCdU5MRvSWl8YYTKfyKEqIqFWciaFreFmSHIQ9C+ECElGjwVK09uqqmjQ
 uv7/dgA/zBIK464kPrpHwaaJIsaS10Bil0ByTpOeVKEnT/BfPGibzvf0H1pfZOwRu0vG
 YdGw/oxuOQH1bjqez7ACH1YD+MaEu5D4ktPdwObSZ82/4zq+mOWKb+rJai9KVyhyyWiN
 h7mw==
X-Gm-Message-State: AOJu0YySSSfwa005lT7AHVTRj4T7Zp4WbmOy/flxckqYfnxpAxAwM/zZ
 JQqrvGTRKUqqpqN2zbiBO2GY3Q==
X-Google-Smtp-Source: AGHT+IFB7g1NLcGbFTo55gFtReAERXtRLC3wSNcCmU3/Hx6wGeI5ha18iUymtWlOuu8WNDnb4g6j1g==
X-Received: by 2002:a05:6512:446:b0:500:9bbf:da17 with SMTP id
 y6-20020a056512044600b005009bbfda17mr4134008lfk.51.1693777318743; 
 Sun, 03 Sep 2023 14:41:58 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x17-20020ac25dd1000000b004f8555f7aa1sm1422506lfq.52.2023.09.03.14.41.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 14:41:58 -0700 (PDT)
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
Date: Mon,  4 Sep 2023 00:41:48 +0300
Message-Id: <20230903214150.2877023-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH v1 10/12] usb: typec: qcom: implement proper
 error path in probe()
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

Implement proper error path in the qcom_pmic_typec_probe(). This makes
sure that we properly disable hardware blocks and do not leak memory.

Fixes: a4422ff22142 ("usb: typec: qcom: Add Qualcomm PMIC Type-C driver")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
index 581199d37b49..ceda594a8d56 100644
--- a/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
+++ b/drivers/usb/typec/tcpm/qcom/qcom_pmic_typec.c
@@ -258,15 +258,22 @@ static int qcom_pmic_typec_probe(struct platform_device *pdev)
 	ret = qcom_pmic_typec_port_start(tcpm->pmic_typec_port,
 					 tcpm->tcpm_port);
 	if (ret)
-		goto fwnode_remove;
+		goto tcpm_unregister_port;
 
 	ret = qcom_pmic_typec_pdphy_start(tcpm->pmic_typec_pdphy,
 					  tcpm->tcpm_port);
 	if (ret)
-		goto fwnode_remove;
+		goto typec_stop;
 
 	return 0;
 
+
+typec_stop:
+	qcom_pmic_typec_port_stop(tcpm->pmic_typec_port);
+
+tcpm_unregister_port:
+	tcpm_unregister_port(tcpm->tcpm_port);
+
 fwnode_remove:
 	fwnode_remove_software_node(tcpm->tcpc.fwnode);
 
-- 
2.39.2

