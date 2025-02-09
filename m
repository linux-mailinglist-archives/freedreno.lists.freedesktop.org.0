Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 85ED0A2DB00
	for <lists+freedreno@lfdr.de>; Sun,  9 Feb 2025 06:07:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3FF4C10E479;
	Sun,  9 Feb 2025 05:07:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="e54f/pRl";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com
 [209.85.167.45])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3435510E46D
 for <freedreno@lists.freedesktop.org>; Sun,  9 Feb 2025 05:07:23 +0000 (UTC)
Received: by mail-lf1-f45.google.com with SMTP id
 2adb3069b0e04-54509f46614so199852e87.0
 for <freedreno@lists.freedesktop.org>; Sat, 08 Feb 2025 21:07:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1739077641; x=1739682441; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=1xZToT8Ipw+PUjO7BMQGdecD6LauDPp0cZ9YFUj8vWA=;
 b=e54f/pRl9k1ed6/KVc14BCRSEU4u0ATsKRXe+nBPALzBc9lcIOcNRuCYKKOKjEwGbt
 rBLZG/PssGRR21L5lLkSoVGeN+LzlUmHZpQUT5Wr9enDH7irug1WMiqkF38SNWhKC3sN
 myB3ogzbfqTUoiRm9CvqsCBE8StOWzZkCLQckOoDov9qlJNE+qlWer8Ip+JYbRa49SeB
 GT3R/27FZiF26M6i8kGRD8kUHHPX8vhtIKYt1uHF0aqjTVha1Hca2GWP1HnFVwD7WXJK
 s7YLmnMcP8UbNVkR92H5qDqy4AJtod5m2jW4cvh5MwraKCxJJfjCJCXhwBgsUA6wErbD
 k5ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1739077641; x=1739682441;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1xZToT8Ipw+PUjO7BMQGdecD6LauDPp0cZ9YFUj8vWA=;
 b=unqdeUewlSI3sJqy2TewSpQqpb+Yl3JLgAwrCnrietv6A7qEq3RosDv1nbHEQGHipM
 wmE33lX+SKfAfSBK2rDqYIhH5b2NELUajnkg4Eq2oUGsIv1BF2RSUYNplTpQJ1NllK9F
 T5BXfmUMVfq3zOMV6DWfsnuv6lkzJgMdprub8M4zYC+/R7xZ8wOJim9CzhVDP0PCjNgS
 7thzxxjsz+REaoDpLpJsXWVwF397wJNPeUMxC5BwD/nQQYJWdaA612ioRrCJQx20gp8D
 JvNeiwJ13MrN0xxOshRJHG9yxEzYe48gSYpBC4JozgTMIZmQjFsiG5QWFcxAdQYY/7SB
 0bJQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVII4FHD0bSK3Cv6xyE8mypUwBUkRJVCFfFu7I9n6JJMRwCfM0cqp5060Ku0o2VGz8FgU2sO+LjQE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzlxt4DXQnySDjbTjlRdKryYhDD3Xm+fDGDVNrHx6KwuBtVwxQy
 v9AzSYD/6oMhJrZUupMF/eNpJVYswmLl6pf0zi47MJxyIODV8+HBBYn67HNZgSU=
X-Gm-Gg: ASbGncvYAFVsvu8pM93Bj3lEPtsiWlaTU9CY0j5gKBJOWKFPRu6D0mP4UdkHxk9wFM4
 Eq42Z8O/gpH5IAF+SZsRvQQfnuIyTR2J+zcZ93IKxoTRBmkfZa/U/IYl5ClSQVPcnZB2ghsNpri
 KB4dqYlHhy7ofBbJbqz2yDfKfq/tkRLHY7vS5rw5HsdP4Q+NnjAZk6cCc+MklLeI+rxei87Wvjg
 pAPy7I/squtIRvOAEH2gkKbEpp/+uS048j6GYNmCBgm68vTP+atLdt4heU7ALOBxrzVsUQJnfqJ
 MkruFJq8CgSmrmKhSGF7JKk=
X-Google-Smtp-Source: AGHT+IGUIoNub6sm47xBPrwhQD2mG90ISalcUTKePpFjzxx94Lo1dp3HQT4XawwCjUCjbA6kpfg6Qg==
X-Received: by 2002:a05:6512:ba1:b0:53e:df2b:df25 with SMTP id
 2adb3069b0e04-54414ab6943mr3253079e87.16.1739077641516; 
 Sat, 08 Feb 2025 21:07:21 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54506ef1733sm245576e87.1.2025.02.08.21.07.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 08 Feb 2025 21:07:20 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Sun, 09 Feb 2025 07:04:59 +0200
Subject: [PATCH v4 15/16] drm/msm/hdmi: wire in hpd_enable/hpd_disable
 bridge ops
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250209-fd-hdmi-hpd-v4-15-6224568ed87f@linaro.org>
References: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
In-Reply-To: <20250209-fd-hdmi-hpd-v4-0-6224568ed87f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konradybcio@kernel.org>, 
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4317;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=vYpQX4Can/9pA++xmzUVsvBmfqVytun4ULSAJD2bgJ8=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnqDfktyJ/HyMNRFnPtswfbXaSvIUEhqYROBJ0T
 mK3ItZNpo6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ6g35AAKCRCLPIo+Aiko
 1Wo4B/9wEko2KqapmTdzdtrGI05PnVyOMHtGr6U0m5DtWqAvsXy8q8aLx+EPLrXuh4d6/X6pN9w
 BKvU+doQVrevh7GR54HOPGdIdY6o6aThjw6JItlIZOzHnZcfcLtiCrbvACurjF6ttN8ZcdISSbc
 PLsmnqzXx72u2bvsrnW2pUDgummi4+lKGGICyAM6i9gCJ9ru1ZTxBaxlhpwULRe9YMX+IK3Kj0c
 Ctb4StyJljvtFV0bij01C6835twtirGRYCnhvwKfLVz05XHsUB9hTizzRFTWKi9IOzwlZABi5bS
 IDep805qclyL8OJE8++hZ5W0HyuOUtMlAX37Sya3F2PLjEB9
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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

The HDMI driver already has msm_hdmi_hpd_enable() and
msm_hdmi_hpd_disable() functions. Wire them into the
msm_hdmi_bridge_funcs, so that HPD  can be enabled and disabled
dynamically rather than always having HPD events generation enabled.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c        |  9 ---------
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  4 ++--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  2 ++
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 12 ++++++------
 4 files changed, 10 insertions(+), 17 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index b0292750265082c47093ed5cf50bbcba9e67c955..f1898d8eed6fa46c47c9b632a90daeabe74f4359 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -200,12 +200,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
 		goto fail;
 	}
 
-	ret = msm_hdmi_hpd_enable(hdmi->bridge);
-	if (ret < 0) {
-		DRM_DEV_ERROR(&hdmi->pdev->dev, "failed to enable HPD: %d\n", ret);
-		goto fail;
-	}
-
 	return 0;
 
 fail:
@@ -261,9 +255,6 @@ static void msm_hdmi_unbind(struct device *dev, struct device *master,
 	struct msm_drm_private *priv = dev_get_drvdata(master);
 
 	if (priv->hdmi) {
-		if (priv->hdmi->bridge)
-			msm_hdmi_hpd_disable(priv->hdmi);
-
 		msm_hdmi_destroy(priv->hdmi);
 		priv->hdmi = NULL;
 	}
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index 39adc8929bd601d4846f75b35c087de93c3df6be..679a2dab762c1333153c97709c99db8cc5a76d1a 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -214,8 +214,8 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi);
 void msm_hdmi_hpd_irq(struct drm_bridge *bridge);
 enum drm_connector_status msm_hdmi_bridge_detect(
 		struct drm_bridge *bridge);
-int msm_hdmi_hpd_enable(struct drm_bridge *bridge);
-void msm_hdmi_hpd_disable(struct hdmi *hdmi);
+void msm_hdmi_hpd_enable(struct drm_bridge *bridge);
+void msm_hdmi_hpd_disable(struct drm_bridge *bridge);
 
 /*
  * i2c adapter for ddc:
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index f97f8b104f93bcca20e5f81f928d9b23c14fbe28..4de0f9b870a426bca825469195b1e3fac7729445 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -462,6 +462,8 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
 	.atomic_post_disable = msm_hdmi_bridge_atomic_post_disable,
 	.edid_read = msm_hdmi_bridge_edid_read,
 	.detect = msm_hdmi_bridge_detect,
+	.hpd_enable = msm_hdmi_hpd_enable,
+	.hpd_disable = msm_hdmi_hpd_disable,
 	.hdmi_tmds_char_rate_valid = msm_hdmi_bridge_tmds_char_rate_valid,
 	.hdmi_clear_infoframe = msm_hdmi_bridge_clear_infoframe,
 	.hdmi_write_infoframe = msm_hdmi_bridge_write_infoframe,
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
index 7726de95be4891e4a821ec4e056482263f23ac05..bd17f63546dd2e3d3484aa9d46bae87274001a82 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c
@@ -60,7 +60,7 @@ static void msm_hdmi_phy_reset(struct hdmi *hdmi)
 	}
 }
 
-int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
+void msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 {
 	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
 	struct hdmi *hdmi = hdmi_bridge->hdmi;
@@ -70,8 +70,8 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	unsigned long flags;
 
 	ret = pm_runtime_resume_and_get(dev);
-	if (ret)
-		return ret;
+	if (WARN_ON(ret))
+		return;
 
 	mutex_lock(&hdmi->state_mutex);
 	msm_hdmi_set_mode(hdmi, false);
@@ -99,12 +99,12 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)
 	hdmi_write(hdmi, REG_HDMI_HPD_CTRL,
 			HDMI_HPD_CTRL_ENABLE | hpd_ctrl);
 	spin_unlock_irqrestore(&hdmi->reg_lock, flags);
-
-	return 0;
 }
 
-void msm_hdmi_hpd_disable(struct hdmi *hdmi)
+void msm_hdmi_hpd_disable(struct drm_bridge *bridge)
 {
+	struct hdmi_bridge *hdmi_bridge = to_hdmi_bridge(bridge);
+	struct hdmi *hdmi = hdmi_bridge->hdmi;
 	struct device *dev = &hdmi->pdev->dev;
 
 	/* Disable HPD interrupt */

-- 
2.39.5

