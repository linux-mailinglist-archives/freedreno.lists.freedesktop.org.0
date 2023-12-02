Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77DC5801F46
	for <lists+freedreno@lfdr.de>; Sat,  2 Dec 2023 23:56:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AC91C10E230;
	Sat,  2 Dec 2023 22:56:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B36A510E238
 for <freedreno@lists.freedesktop.org>; Sat,  2 Dec 2023 22:55:55 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-50bc22c836bso4619909e87.0
 for <freedreno@lists.freedesktop.org>; Sat, 02 Dec 2023 14:55:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701557754; x=1702162554; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=ZjGFlHjx1ZkElLYY29NmAfOWv9VBYLIcznU6RxLMTLw=;
 b=QuntcIhOgP8m/WcbXZZrhLWm36nsPmep8dsL8Ots48+O+EzoUQ3ZCWvcJyWJ+RJT+P
 Fl4zMepEJIZEKWzaWdzenocHkwn4imy3ZcfJ25B4ElrgpZUFtAUOQ2y5ZNZaCT5iPqFu
 qfOx8pfEouipnnbNpD+ygv+vEnX96539Ok44nDQTynO/4CpPMrzCZxA14wOlUTn0dDh7
 V8OKMV16uRTH/tfpS15JxOVj3rafbHRIAg7RGmJvs0TCbU3ifT7V4Kkju3uvS1PuLYqK
 OS50vqB7qS9BNT0UCjeRbNlym+k7VG0nbU8bTGklPzLmRrpTtnkgLhDaBYncP2L8yTBx
 37Fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701557754; x=1702162554;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZjGFlHjx1ZkElLYY29NmAfOWv9VBYLIcznU6RxLMTLw=;
 b=gkBivxMp2Pp1foqUk9qrs1MqjBtPf5EX5lzj3TWi9sIH0q50s7x33GsLeUynoxJCNa
 pGTZC7uavy0ZleGmn38Z5s0sDbigJN955tkR3TMG1DbQZRfDZEzvvF2iXr947Jqfq9Zk
 Q3papFmuEFiecqmSAwLSRvf8zP96hoW2G3HTC1L7moXvFhwymx9a/gFKGnqBapb6N7IH
 F+39jA1ybTqkom803mesf9VkSXyGITVD+qPPv6QgknmEmtGXAmtzxU70bkeIkTMUQ+/e
 jg/X/BBS1wspLOjOcVi/VQSfPze5FhFkQRYL/iqGTRprkQuc2Mv2uvNby5jjpXHVJwg6
 Gu4g==
X-Gm-Message-State: AOJu0YzucsnqjdtrjtxVk63uUQ2i7WH7HcTMAPCLs3OTx7f4syMpJhNv
 gy97UF9mj3viwcyqKxTDUDvENw==
X-Google-Smtp-Source: AGHT+IGK8BfhMZ07nbApQncwJAPh0Wwi4l8K1+n8mmoCubtUPG7R1hOs5Bo1yS2Gyp9tFAuZFbUUDw==
X-Received: by 2002:a05:6512:1250:b0:50b:c541:bcd7 with SMTP id
 fb16-20020a056512125000b0050bc541bcd7mr2548153lfb.60.1701557753906; 
 Sat, 02 Dec 2023 14:55:53 -0800 (PST)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 z13-20020a19650d000000b0050bf06c8098sm93515lfb.116.2023.12.02.14.55.53
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 02 Dec 2023 14:55:53 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>
Date: Sun,  3 Dec 2023 01:55:52 +0300
Message-Id: <20231202225552.1283638-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH RESEND] drm/drv: propagate errors from
 drm_modeset_register_all()
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

In case the drm_modeset_register_all() function fails, its error code
will be ignored. Instead make the drm_dev_register() bail out in case of
such an error.

Fixes: 79190ea2658a ("drm: Add callbacks for late registering")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/drm_drv.c | 10 ++++++++--
 1 file changed, 8 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_drv.c b/drivers/gpu/drm/drm_drv.c
index 535f16e7882e..3c835c99daad 100644
--- a/drivers/gpu/drm/drm_drv.c
+++ b/drivers/gpu/drm/drm_drv.c
@@ -949,8 +949,11 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 			goto err_minors;
 	}
 
-	if (drm_core_check_feature(dev, DRIVER_MODESET))
-		drm_modeset_register_all(dev);
+	if (drm_core_check_feature(dev, DRIVER_MODESET)) {
+		ret = drm_modeset_register_all(dev);
+		if (ret)
+			goto err_unload;
+	}
 
 	DRM_INFO("Initialized %s %d.%d.%d %s for %s on minor %d\n",
 		 driver->name, driver->major, driver->minor,
@@ -960,6 +963,9 @@ int drm_dev_register(struct drm_device *dev, unsigned long flags)
 
 	goto out_unlock;
 
+err_unload:
+	if (dev->driver->unload)
+		dev->driver->unload(dev);
 err_minors:
 	remove_compat_control_link(dev);
 	drm_minor_unregister(dev, DRM_MINOR_ACCEL);
-- 
2.39.2

