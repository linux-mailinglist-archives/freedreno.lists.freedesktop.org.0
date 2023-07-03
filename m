Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C8F174534B
	for <lists+freedreno@lfdr.de>; Mon,  3 Jul 2023 02:38:12 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3BAD10E176;
	Mon,  3 Jul 2023 00:37:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12c.google.com (mail-lf1-x12c.google.com
 [IPv6:2a00:1450:4864:20::12c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69D9910E171
 for <freedreno@lists.freedesktop.org>; Mon,  3 Jul 2023 00:37:55 +0000 (UTC)
Received: by mail-lf1-x12c.google.com with SMTP id
 2adb3069b0e04-4fbb281eec6so603480e87.1
 for <freedreno@lists.freedesktop.org>; Sun, 02 Jul 2023 17:37:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688344673; x=1690936673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FTB2UHvzkUCn5HR1GgoJDqVIQMk8vQmx+jHt1n0pheQ=;
 b=GNUJ5dx3XGOSECmjT1DMYoW8QGVRluZHuI+0QWBakn+TWkbdgOu+rpcAfxF8NdhplA
 DTBuOcGYSNhynFV+Tt6n6jW1lqrHvrLCK9AwzacU9fjSgfHRLT2XfRaFd2WeMyVnq9TQ
 4a+JAqrHd4xFLhqQ1OazJ1tx/JlyaOuMaHjZ3eJfBWVzx+sLgXpdVvm+hczRgcQQDsBN
 q3Z2u9vjdv2wPsP8WyNWIx4SNwniXKQnfh+1pIN3bwCNJb8slf7d+o3zdZduCI5TMApy
 DlMOLAruegYEbhu5LRY9Js4rRXuj979oQ1juzuiySOF9x9n3L95LqKa9aUBJPEc/xeoz
 GWYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688344673; x=1690936673;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=FTB2UHvzkUCn5HR1GgoJDqVIQMk8vQmx+jHt1n0pheQ=;
 b=i2HJQgxjpKteYJ4yw81VcYAY2EpRj7ypZwu8dj6BUAzi+tPtiP0VC1t42NWb3vhW6a
 ccM9eFgG9zvAtbJiKeflioA1pJ6eXwSBXgd7QB64gJshLBTo6LJCmhkQKejz/JwvKNCO
 jCU0vLdiioi78Wl6ZKOcjfvmkx2M0DN1BpVDrJGWPpbsaHrm5i/O2xdssBUOWhrocrct
 I2ZXITRftA0q1DMR9rK18z5+scPJjZzlbrPF8VrbTdroawv8aRSHH5cvN8SHppuzOy5o
 6dQg4Y3HibFaANpUTYhhYIBqNIqy327Z9X5qp85HUfFohteyv9LHmjdTO3zjIMU4Rg1d
 ugkg==
X-Gm-Message-State: ABy/qLZ5xs7U44VNP4fnEIcce5qmUJ8jnW6X05hfIOYBMDWMAagj8Mue
 wSeiRfVErbNedqyk6ElhfhiJQA==
X-Google-Smtp-Source: APBJJlFvEw8xaJIG4fjGk0k2vy5tuEF7kntjvRGGs5H0vS/etieC0ZXXWlXFPd2CefZs9E4mdiYfSg==
X-Received: by 2002:a2e:9844:0:b0:2b5:86e4:558e with SMTP id
 e4-20020a2e9844000000b002b586e4558emr5513769ljj.38.1688344673460; 
 Sun, 02 Jul 2023 17:37:53 -0700 (PDT)
Received: from lothlorien.lan (dzdqv0yyyyyyyyyyybm5y-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::ab2]) by smtp.gmail.com with ESMTPSA id
 s24-20020a2e98d8000000b002b6ebc61e85sm136704ljj.54.2023.07.02.17.37.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 02 Jul 2023 17:37:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  3 Jul 2023 03:37:40 +0300
Message-Id: <20230703003745.34239-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
References: <20230703003745.34239-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 08/13] drm/msm: remove shutdown callback from
 msm_platform_driver
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

The msm_drv_shutdown only makes sense for the KMS-enabled devices, while
msm_platform_driver is only used in the headless case. Remove the
shutdown callback from the driver structure.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index ee27837516fc..971c008e82cb 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1300,7 +1300,6 @@ void msm_drv_shutdown(struct platform_device *pdev)
 static struct platform_driver msm_platform_driver = {
 	.probe      = msm_pdev_probe,
 	.remove     = msm_pdev_remove,
-	.shutdown   = msm_drv_shutdown,
 	.driver     = {
 		.name   = "msm",
 	},
-- 
2.39.2

