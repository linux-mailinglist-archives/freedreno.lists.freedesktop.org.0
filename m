Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 057A55500CF
	for <lists+freedreno@lfdr.de>; Sat, 18 Jun 2022 01:33:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 25B0210F8B0;
	Fri, 17 Jun 2022 23:33:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A8BA10F816
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 23:33:33 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id y29so6210132ljd.7
 for <freedreno@lists.freedesktop.org>; Fri, 17 Jun 2022 16:33:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=9plUk4yuJHI9KQEwjKvSKAhzBHEdS1qic5Z60CrCjLI=;
 b=vwYNKA3mFqnN6V3Y0psPcXFYgGmC7OjV0mQTP0R/36Wp4nsaDK0xw8EA/8M93r/d72
 UBeXvvd617oBpcfeECb8QB1p1QKQOLExELPmWCT8rinXftWy5z0cjH/zW+r8nQdMjogv
 1rHrUfH54XhDdG9jYD2ZA5cxHobggE95E992uC+wHqrh90xC06zbbcT3JK1UCcdxE2Ve
 fo9iI38UmP76cqTifI0SBUwJBIOUig8xU8EViQ0ErNfOIbr7IQoqLOXcjr3tbLtUUu/B
 EmpXderT7ZBZ+jCCX1cC0Xz22iZatkiSsR4U+47Vrm3sqe6F0FlE15nRUvLnUZXTmVo+
 Nyow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=9plUk4yuJHI9KQEwjKvSKAhzBHEdS1qic5Z60CrCjLI=;
 b=EDk+NNtwtdwG4FoDNun0Gj8wJDuPjbtFN7thaQ4l1YbhW0RAdf7bhQDq1y98OATmCt
 dO+CXxzle9ltfqBa8Re7GD4t+Pa4QP/0Q7MIBLxL5SwUNrQ0j+0pglgvKUojxTfmG4X8
 nGggqZJmkqSWBX4nl/2Kqy4O9nYUsEwjHCk98pTTnMi65UK4fODbdEc2ZRw4Lh7Y+Bvk
 WNjMCe2lNwFAYVYT0vt7/RyljOVehcD8jUrYTxZfTOAzMP26vSg550P+kDmvJMIGa/mh
 A8Xpv3kOVIwB1L7OYUZr1MFOaBBaf2zONtYT6tup13DrNtxHO5INtcFvSe/OcNKtCa92
 1iWw==
X-Gm-Message-State: AJIora8/NDcNpvHwLOcTLr8QMC3usMzFRH7M2PD1xeKKzz1ayV2UvPDd
 EbfB3ZqIefUAmMYm+37l88+bqQ==
X-Google-Smtp-Source: AGRyM1ucXsrdIM7nzBNXjCAc2D9qJZH6jHx/c1+TagewrvF+KfQOEgkB+zuAhD9m+o2RYJMWtS0+FQ==
X-Received: by 2002:a2e:9958:0:b0:25a:541a:1273 with SMTP id
 r24-20020a2e9958000000b0025a541a1273mr2287584ljj.516.1655508811728; 
 Fri, 17 Jun 2022 16:33:31 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 b2-20020a056512060200b004787d3cbc67sm800138lfe.219.2022.06.17.16.33.30
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 17 Jun 2022 16:33:31 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat, 18 Jun 2022 02:33:25 +0300
Message-Id: <20220617233328.1143665-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
References: <20220617233328.1143665-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 1/4] drm/msm: clean event_thread->worker in
 case of an error
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

If worker creation fails, nullify the event_thread->worker, so that
msm_drm_uninit() doesn't try accessing invalid memory location. While we
are at it, remove duplicate assignment to the ret variable.

Fixes: 1041dee2178f ("drm/msm: use kthread_create_worker instead of kthread_run")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 44485363f37a..1aab6bf86278 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -436,7 +436,7 @@ static int msm_drm_init(struct device *dev, const struct drm_driver *drv)
 		if (IS_ERR(priv->event_thread[i].worker)) {
 			ret = PTR_ERR(priv->event_thread[i].worker);
 			DRM_DEV_ERROR(dev, "failed to create crtc_event kthread\n");
-			ret = PTR_ERR(priv->event_thread[i].worker);
+			priv->event_thread[i].worker = NULL;
 			goto err_msm_uninit;
 		}
 
-- 
2.35.1

