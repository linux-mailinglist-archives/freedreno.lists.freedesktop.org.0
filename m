Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3715F790E76
	for <lists+freedreno@lfdr.de>; Sun,  3 Sep 2023 23:42:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6F5710E253;
	Sun,  3 Sep 2023 21:42:16 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E6B2410E21A
 for <freedreno@lists.freedesktop.org>; Sun,  3 Sep 2023 21:41:58 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-500b6456c7eso1526565e87.2
 for <freedreno@lists.freedesktop.org>; Sun, 03 Sep 2023 14:41:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693777317; x=1694382117; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SWHSZWaKhvE1MjysmoYq2syAfT9CG/PqkkscIEqVNT4=;
 b=vaY1OEe+VfBT79nP0p4NxRrmpg8ociGL0cuO4GnVFm82Imm6Z2QtTlZ8pPVIJoLQzW
 GgWCbKp2iQch4vc6WX/ZDAq1hAYi3kXTXDJFK6lMQHbD+QC06XlDE+BRr+T8JMkIalBW
 mtk7LaTRUpCYdfJx7ixZuCRDubD9uCj6MhfmzSSHnmvFFJC3iSI/6mjBSwsuLG8AVuhY
 +kDXmjO7MmvvX1az0G92rIA0KUASfoenF7ZNh3MRD0U4/E1KpuILX7uSSh9zntWnwWIq
 7iUbqhm/4+xhG1yuZDGYXJaAWj44GJsjtpVGWAxLAirWXnDQ2ozTj5ISiQRIfCkmkX7n
 wK3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693777317; x=1694382117;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SWHSZWaKhvE1MjysmoYq2syAfT9CG/PqkkscIEqVNT4=;
 b=hxsIFPKZmug1h9LwluGl4CAAv1EJxtLroj5LYaHFclPHT90PRGwmpRYKXegI6NOt3F
 WCPryKJQVNjaMeSat6Xr6NYS+T2l5fh747k2Tw8W9TkVVZ1I+flssyGjtZpBPpF6enwl
 QL/RS0nRccnAZNZNyYFuf3qP8kQKfDFRqqMlmi0uDKT4U5nVuuF/vmgLAb7pSa9z/gfg
 5BSzHK85RkNBxl8vu6HIB4ofPHpP2MEFvL1TUigjgevJ1MzrKNvReXwCbKnkQy17OPpT
 f8Mt6jLBSZMRSt113H2cKowTJu5j02VIKNkbcFWnKpP+zbvBrb6dTfnICZ2lczC0iFb/
 Wm1g==
X-Gm-Message-State: AOJu0YwWBXzWYbqZqvBs5sYh0UnTiVaI8/SMXAjcY7jKmLNbLz3ggmsu
 g3ARbrG4ocdUiC5NY+5jefPSHQ==
X-Google-Smtp-Source: AGHT+IHdP+cCSWTvD+87l9JrZmPVTmSpURuy7YzU/9ihGfD9uR1Aa2DcxlQZlNBD7Tvco0iNQQ5Pmw==
X-Received: by 2002:a05:6512:2247:b0:500:7dcc:621 with SMTP id
 i7-20020a056512224700b005007dcc0621mr6544464lfu.31.1693777317228; 
 Sun, 03 Sep 2023 14:41:57 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 x17-20020ac25dd1000000b004f8555f7aa1sm1422506lfq.52.2023.09.03.14.41.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 14:41:56 -0700 (PDT)
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
Date: Mon,  4 Sep 2023 00:41:46 +0300
Message-Id: <20230903214150.2877023-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
References: <20230903214150.2877023-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH v1 08/12] usb: typec: support generating
 Type-C port names for userspace
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

We need a way to generate and return the Type-C port device names. For
example, it is going to be used by the DRM to provide PATH property for
DisplayPort connectors.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/usb/typec/class.c | 14 ++++++++++++++
 include/linux/usb/typec.h |  2 ++
 2 files changed, 16 insertions(+)

diff --git a/drivers/usb/typec/class.c b/drivers/usb/typec/class.c
index 9c1dbf3c00e0..7394a2ecef6f 100644
--- a/drivers/usb/typec/class.c
+++ b/drivers/usb/typec/class.c
@@ -2327,6 +2327,20 @@ void typec_unregister_port(struct typec_port *port)
 }
 EXPORT_SYMBOL_GPL(typec_unregister_port);
 
+/**
+ * typec_port_get_name - Get USB Type-C Port name
+ * @port: The port to describe
+ *
+ * Returns a name of the passed USB Type-C port on success or NULL when the
+ * port has not been enumerated yet. The resulting string should be freed by
+ * the caller.
+ */
+char *typec_port_get_name(struct typec_port *port)
+{
+	return kasprintf(GFP_KERNEL, "typec:%s", dev_name(&port->dev));
+}
+EXPORT_SYMBOL_GPL(typec_port_get_name);
+
 static int __init typec_init(void)
 {
 	int ret;
diff --git a/include/linux/usb/typec.h b/include/linux/usb/typec.h
index 8fa781207970..4aa9c9378383 100644
--- a/include/linux/usb/typec.h
+++ b/include/linux/usb/typec.h
@@ -303,6 +303,8 @@ struct typec_plug *typec_register_plug(struct typec_cable *cable,
 				       struct typec_plug_desc *desc);
 void typec_unregister_plug(struct typec_plug *plug);
 
+char *typec_port_get_name(struct typec_port *port);
+
 void typec_set_data_role(struct typec_port *port, enum typec_data_role role);
 void typec_set_pwr_role(struct typec_port *port, enum typec_role role);
 void typec_set_vconn_role(struct typec_port *port, enum typec_role role);
-- 
2.39.2

