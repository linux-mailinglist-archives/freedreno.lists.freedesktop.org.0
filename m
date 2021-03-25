Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35569349BA2
	for <lists+freedreno@lfdr.de>; Thu, 25 Mar 2021 22:28:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D057C6EE4A;
	Thu, 25 Mar 2021 21:28:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x430.google.com (mail-pf1-x430.google.com
 [IPv6:2607:f8b0:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55AF16EE4A
 for <freedreno@lists.freedesktop.org>; Thu, 25 Mar 2021 21:28:24 +0000 (UTC)
Received: by mail-pf1-x430.google.com with SMTP id x126so3335984pfc.13
 for <freedreno@lists.freedesktop.org>; Thu, 25 Mar 2021 14:28:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ar68jm2yqLLP/HtYyEXI6uh/AJB1y8cS7PMCnpcIT0Y=;
 b=TEhkRsQE/1x3MCeVcTv1S4X5n9NVnMa/jFa1XAMbvGy39rpRV1ols2bNLEAqx+w+h5
 g2Q8Cf5S/EzPjEVGrOQzwY+XfoaFuzar68pfaJd/vxur40Pn9WtqXa1pHKYOkFb2L6Ii
 ZRPcqJ7LOVPXZga+/NH+evnqAMK2sye1eGuMg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=Ar68jm2yqLLP/HtYyEXI6uh/AJB1y8cS7PMCnpcIT0Y=;
 b=G/VJ3HHh1Vqf9Cwpbph4zAjnsbb5mqq256WQdhfOWfLyNyUxvz9s2eFjhA1OZcECdP
 A7Z6FubovjSEwS1TeYDM+wFnOFJaR3z6M0/ELmtIoKto6oGkxXr762T4hHArRm/xTsEv
 0RqkCgL4Vi6PCN11FWpcbFSELnZU87dlkJsBfpxdDuu9t+TfKhdalaZy5ryh6ofRXAzo
 o/JBve56ovxTD7qCBa9Nxx40DnZirzgK1GlTODANOrcxXQNDUsbrtXjTZh+YDF+fc3w1
 eFCF3B1o0qM3sXw1u0955fv8Ka2o8Jf9/RRiBPAOS94th+FauI2kBPJjqPtAujORAVaY
 aLxg==
X-Gm-Message-State: AOAM533SHLT12eGpdwb0GDFqtxrMkugIbfq/zOntlQfYskfUYorsjBoG
 STeclZuYtoGAbzZe+6mzzsSg7Q==
X-Google-Smtp-Source: ABdhPJxb+M1K271yeV8ZJZrouwWTafpUJhJVRUBFQFGmitdZRBmwSGYAIxMD8Z4uVYOLg333mONJ/Q==
X-Received: by 2002:a17:902:dad2:b029:e5:e7da:cbb0 with SMTP id
 q18-20020a170902dad2b02900e5e7dacbb0mr11705640plx.66.1616707703977; 
 Thu, 25 Mar 2021 14:28:23 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:18a3:238:26c5:1521])
 by smtp.gmail.com with ESMTPSA id e21sm5880792pgv.74.2021.03.25.14.28.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 25 Mar 2021 14:28:23 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>
Date: Thu, 25 Mar 2021 14:28:22 -0700
Message-Id: <20210325212822.3663144-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.31.0.291.g576ba9dcdaf-goog
MIME-Version: 1.0
Subject: [Freedreno] [PATCH] drm/msm: Set drvdata to NULL when
 msm_drm_init() fails
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
Cc: freedreno@lists.freedesktop.org,
 Krishna Manikandan <mkrishn@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Fabio Estevam <festevam@gmail.com>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

We should set the platform device's driver data to NULL here so that
code doesn't assume the struct drm_device pointer is valid when it could
have been destroyed. The lifetime of this pointer is managed by a kref
but when msm_drm_init() fails we call drm_dev_put() on the pointer which
will free the pointer's memory. This driver uses the component model, so
there's sort of two "probes" in this file, one for the platform device
i.e. msm_pdev_probe() and one for the component i.e. msm_drm_bind(). The
msm_drm_bind() code is using the platform device's driver data to store
struct drm_device so the two functions are intertwined.

This relationship becomes a problem for msm_pdev_shutdown() when it
tests the NULL-ness of the pointer to see if it should call
drm_atomic_helper_shutdown(). The NULL test is a proxy check for if the
pointer has been freed by kref_put(). If the drm_device has been
destroyed, then we shouldn't call the shutdown helper, and we know that
is the case if msm_drm_init() failed, therefore set the driver data to
NULL so that this pointer liveness is tracked properly.

Fixes: 9d5cbf5fe46e ("drm/msm: add shutdown support for display platform_driver")
Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krishna Manikandan <mkrishn@codeaurora.org>
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index a5c6b8c23336..196907689c82 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -570,6 +570,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 	kfree(priv);
 err_put_drm_dev:
 	drm_dev_put(ddev);
+	platform_set_drvdata(pdev, NULL);
 	return ret;
 }
 
-- 
https://chromeos.dev

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
