Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B2DF07C8021
	for <lists+freedreno@lfdr.de>; Fri, 13 Oct 2023 10:25:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA3B10E0BC;
	Fri, 13 Oct 2023 08:25:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32e.google.com (mail-wm1-x32e.google.com
 [IPv6:2a00:1450:4864:20::32e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 864D610E0A7
 for <freedreno@lists.freedesktop.org>; Fri, 13 Oct 2023 08:25:20 +0000 (UTC)
Received: by mail-wm1-x32e.google.com with SMTP id
 5b1f17b1804b1-40535597f01so18916825e9.3
 for <freedreno@lists.freedesktop.org>; Fri, 13 Oct 2023 01:25:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1697185518; x=1697790318; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=M+uauCSgQKcWUCd6FsYiqka8NNHbjlLVkJ7rYh7s+Tg=;
 b=D0c6RpG11uFJFKXOupuYSTBxMsbSJfOmi36jmwCnOza0ZrUP0rQaRbpwHvrQ8YbQET
 XuPrfitwulEEViFVqYY0Q1POZRCSyjdz9o5LpaxVBvFQQrlMByURZcL+czpZn3V/aIN+
 NUmUCPTj/qXJjZM0Dov5hjR1sOmIHVcukSFT52KH75I8vEqZFYQPpeiV4b0DNCa+mkO9
 OUfMFjSvQrvocXW/5vpk7S3sscmaUYPxEcGy3NzmA+OUkl51yLhPEQfcfvD2n07p2/Ru
 N/Z/p3PsH9umKG5yJMAlwguGFFo0XGYPiuXBkosO/ftFP8ggYMeXaOUu/rVmNr8hzsrH
 viJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1697185518; x=1697790318;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=M+uauCSgQKcWUCd6FsYiqka8NNHbjlLVkJ7rYh7s+Tg=;
 b=fcmcFETFqZY8qoUVi4qa1huNlpr556DAzjLFmn90JaJYt5KVKo4tKnTJdyoFuPquYh
 B/g6dQFCrlK8wn+KdWh9VOGKIb1FU8oYlSps7W8K5ARFcjU08ohB0g7z5xg29780RGt6
 Gj52EpXi+XoS2mUI2QvxnD/jvhghF7O6eSlQWJO6iDO7xClPS6IefCuPGjN+a+d4B46k
 +DZ+qyc1OsXwN9OgtqA28ddO9CcKuKTxVgYwQ/r22m7YOEaFF2uqF5Aed+BywiQqZ/ix
 QNpEH+mRAMvQDU6GdBwU46OLddFwtgnO13uBAX/r6kWslPAjYe7YeJDJZKyr5XGNnEzV
 jAmw==
X-Gm-Message-State: AOJu0YwTbgD/S+f88kG8yuPti49KyWoYAH7LfxJrm6KUyh8Zegtvybag
 MivGIM1ZtHJyQX95wSpzXzfB4w==
X-Google-Smtp-Source: AGHT+IEjRa/nZrp2h3uISb8MvRVIEmCnprt03btuSLuHCUEtgB3tAH3dRRIg0+64ePhtBFCv/YHqZg==
X-Received: by 2002:a05:600c:282:b0:406:44e7:ef93 with SMTP id
 2-20020a05600c028200b0040644e7ef93mr24194490wmk.1.1697185518504; 
 Fri, 13 Oct 2023 01:25:18 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 t9-20020a05600001c900b0032179c4a46dsm20236629wrx.100.2023.10.13.01.25.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Oct 2023 01:25:17 -0700 (PDT)
Date: Fri, 13 Oct 2023 11:25:15 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Rob Clark <robdclark@gmail.com>
Message-ID: <ZSj+6/J6YsoSpLak@kadam>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Subject: [Freedreno] [PATCH v2] drm/msm: remove unnecessary NULL check
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
Cc: freedreno@lists.freedesktop.org, Su Hui <suhui@nfschina.com>,
 Sean Paul <sean@poorly.run>, linux-arm-msm@vger.kernel.org,
 kernel-janitors@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This NULL check was required when it was added, but we shuffled the code
around and now it's not.  The inconsistent NULL checking triggers a
Smatch warning:

    drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c:847 mdp5_init() warn:
    variable dereferenced before check 'mdp5_kms' (see line 782)

Fixes: 1f50db2f3e1e ("drm/msm/mdp5: move resource allocation to the _probe function"
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
v2: Added a Fixes tag.  It's not really a bug fix and so adding the
fixes tag is slightly unfair but it should prevent this patch from
accidentally getting backported before the refactoring and causing an
issue.

Btw, fixes tags are often unfair like this.  People look at fixes tags
and think, "the fix introduced a bug" but actually it's really common
that the fix was just not complete.  But from a backporting perspective
it makes sense to tie them together.

Plus everyone introduces bugs.  If you're not introducing bugs, then
you're probably not writing a lot of code.

 drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
index 11d9fc2c6bf5..ec933d597e20 100644
--- a/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
+++ b/drivers/gpu/drm/msm/disp/mdp5/mdp5_kms.c
@@ -844,8 +844,7 @@ static int mdp5_init(struct platform_device *pdev, struct drm_device *dev)
 
 	return 0;
 fail:
-	if (mdp5_kms)
-		mdp5_destroy(mdp5_kms);
+	mdp5_destroy(mdp5_kms);
 	return ret;
 }
 
-- 
2.39.2
