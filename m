Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 536B27BE8F6
	for <lists+freedreno@lfdr.de>; Mon,  9 Oct 2023 20:11:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47BD710E06D;
	Mon,  9 Oct 2023 18:10:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4013010E2A4
 for <freedreno@lists.freedesktop.org>; Mon,  9 Oct 2023 18:10:48 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2bff936e10fso70222471fa.1
 for <freedreno@lists.freedesktop.org>; Mon, 09 Oct 2023 11:10:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696875046; x=1697479846; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=znTJnZe1eU48JjBsnTfzCMGOflPzOp8ZDEbta/LuWII=;
 b=DEXrXZETr6iKgZ7xIu8IwaiDfivIKONlEhoq4jVUVV7yXh9eI6CBDUyJll+QPDw4xo
 l9Nzus5lHMI7Tw8K6C2ns/uKpxnBH3Adwa2IFc3kNT12MjoCXwedXLtx6ag9gvO/ohuW
 YrnbOJWP7tGP3FXSrOVI88BnmlyHolJU6OXvb05ZQ31b9nnet6GorPSJ5E4aK38MH8p4
 sin59h9/3WYEUkSwoAP4/yRLQIF0I6fpjAn9tHIrov04U8kvBL651caDqQYmiSz6QUQ3
 wKItz8PfoxZ0s7BUcFkahYj5zipgMyGerHrWsz/xzvF8xSfXM9/o6tqw32URhEdKftCP
 6hHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696875046; x=1697479846;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=znTJnZe1eU48JjBsnTfzCMGOflPzOp8ZDEbta/LuWII=;
 b=qhHM1jcgiDryBLeQwVFiTCk9aH+wQ6b29AzAQ7IjAmu88CF4Ysfqe+aK7LZrXx28rV
 Xh2zSwM2izWExiudXOWJqoX/zaJgMG9ET8F773tmPIH2pT0kYyXs4HaEqGcZ1JaN9JIV
 +jl2X7aBx7Gw5brxdtn3idRfIBrF0kVJEeE9ZMuIHYUcpBTzPtAWrG94RzRNEe2c9IuV
 cQt0pamv3PszrgB5y1W138ANoefRWS9wrZVpOYJ//WCdQcBJWRD8oAWHARkj4hYqQ3t7
 w1YI4sezrpSF2hU5pwyUKoOnHUUrQXEvbtAkSyisR6NlXWX4Ow9Rc98JRQbYdyvLNaiY
 TyUA==
X-Gm-Message-State: AOJu0YzYhIIltmJF4u/RT/NtHoyo3vKBGZN+Lkhh1/8HK6cBjs4sSUls
 64mr4vh9n3dJXYGITdvCARZcCQ==
X-Google-Smtp-Source: AGHT+IHE6rUV6n/8/o3X/GGKBulZ/BEWEElLvf0NxLXzu3dOfhP4sDOjS2sIfxkEd+5dKWvsn3UBxw==
X-Received: by 2002:a05:6512:3995:b0:4f8:586a:d6ca with SMTP id
 j21-20020a056512399500b004f8586ad6camr9733327lfu.9.1696875046534; 
 Mon, 09 Oct 2023 11:10:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d6-20020ac25446000000b00505677e7a99sm1506963lfn.139.2023.10.09.11.10.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 11:10:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  9 Oct 2023 21:10:33 +0300
Message-Id: <20231009181040.2743847-7-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 06/13] drm/msm: drop pm ops from the headless
 msm driver
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The msm_pm_prepare()/msm_pm_complete() only make sense for the
KMS-enabled devices, they have priv->kms guards inside. Drop global
msm_pm_ops, which were used only by the headless msm device.

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 7617c456475a..fe885bfd9742 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1122,11 +1122,6 @@ void msm_pm_complete(struct device *dev)
 	drm_mode_config_helper_resume(ddev);
 }
 
-static const struct dev_pm_ops msm_pm_ops = {
-	.prepare = msm_pm_prepare,
-	.complete = msm_pm_complete,
-};
-
 /*
  * Componentized driver support:
  */
@@ -1305,7 +1300,6 @@ static struct platform_driver msm_platform_driver = {
 	.shutdown   = msm_drv_shutdown,
 	.driver     = {
 		.name   = "msm",
-		.pm     = &msm_pm_ops,
 	},
 };
 
-- 
2.39.2

