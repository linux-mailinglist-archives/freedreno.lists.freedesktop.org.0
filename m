Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D6217BE902
	for <lists+freedreno@lfdr.de>; Mon,  9 Oct 2023 20:11:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8734610E2C0;
	Mon,  9 Oct 2023 18:11:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1F98D10E2AF
 for <freedreno@lists.freedesktop.org>; Mon,  9 Oct 2023 18:10:52 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50435a9f800so6218448e87.2
 for <freedreno@lists.freedesktop.org>; Mon, 09 Oct 2023 11:10:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696875050; x=1697479850; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=NMPNImdJ1XH1qKLcBF8egU3WJE3EwSdEbTA3EmbAyxE=;
 b=XRDghrBgUqJAEZbB7N/BSTh0g62XFW3okuCq9LsfbEMP2OLNkUMqQfwm64v2hp2iNM
 3cJWSFZpeGD8yW5r1J7x+F74DmLAZ9YvbZZCE3sDulxTwuN8osWg3C1muL/D/pAXKIXN
 6NuAcXaAuJvxKiiPvc/JL+aQ59jc1uKCzrwrqOfk3HCIi8Lju+ERpTFEJUk+KERpJ/NU
 2REHrE1xEuX6vvFFep+Cp6DB51g5pOu+fD7ALssBQN2RWPQXFIGmf3dKb2VduFhGJCA6
 oaeHX9cpuVHmSx99tlDJ8eXQXPlwTCvUxldfMET1CXEQXYRD8sqYZ5AVlK5W/Zka5LaR
 ju7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696875050; x=1697479850;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NMPNImdJ1XH1qKLcBF8egU3WJE3EwSdEbTA3EmbAyxE=;
 b=g1iTv3Jvx+bwVPugxrBfPQY/8omG7OnPy5Qb9OXznCaJhFV6fQh+fOBV7kykEa1JJV
 JFe3Dc+CqC/JpDtGGf6CQi6RRq8FtiZSHhduSoqLKadS0+Qo+gweHxZqisZNsOt2dff8
 57l2jb9p4LKf00AW7ccpEVeeiIzoyqb5maHUvJK47RAKqkbHbNkc0VrjgGKVNmPWOPlU
 dkzy7SuzlPe49Lg0awtQKGVXhLy2/Qs/Ou4AFVzSGLi+U9m1vLpiC5Elf5RdetOw0g+a
 B5pFrQ+SppA5SsLz6q1RRUXjy+SpqNP973mni1/ILP6Fpns+3n1bIG+T+rauXhi3CjdU
 2+ww==
X-Gm-Message-State: AOJu0YztnmnxwoP6dSyRo3+1bvI75gOZmEIJZJQ7TIpLV9HU8q+Okpwr
 UcSnVZCkjsYL7Sw/w4BKXxUZtg==
X-Google-Smtp-Source: AGHT+IGxFWo1cv7MZPWO4e5pj8qUwRrrnJfIcbY5MCcf9WtFviJE0fE4zMGxdE7ohyapXkTdwdxUSg==
X-Received: by 2002:a05:6512:3b29:b0:503:293a:dc1b with SMTP id
 f41-20020a0565123b2900b00503293adc1bmr17109215lfv.30.1696875050408; 
 Mon, 09 Oct 2023 11:10:50 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d6-20020ac25446000000b00505677e7a99sm1506963lfn.139.2023.10.09.11.10.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 11:10:50 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  9 Oct 2023 21:10:38 +0300
Message-Id: <20231009181040.2743847-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 11/13] drm/msm: only register 'kms' debug
 file if KMS is used
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

There is little point in having the empty debugfs file which always
returns -ENODEV. Change this file to be created only if KMS is actually
used.

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_debugfs.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/msm_debugfs.c b/drivers/gpu/drm/msm/msm_debugfs.c
index a0a936f80ae3..06fc632fd6f9 100644
--- a/drivers/gpu/drm/msm/msm_debugfs.c
+++ b/drivers/gpu/drm/msm/msm_debugfs.c
@@ -314,8 +314,9 @@ void msm_debugfs_init(struct drm_minor *minor)
 	debugfs_create_file("gpu", S_IRUSR, minor->debugfs_root,
 		dev, &msm_gpu_fops);
 
-	debugfs_create_file("kms", S_IRUSR, minor->debugfs_root,
-		dev, &msm_kms_fops);
+	if (priv->kms)
+		debugfs_create_file("kms", S_IRUSR, minor->debugfs_root,
+				    dev, &msm_kms_fops);
 
 	debugfs_create_u32("hangcheck_period_ms", 0600, minor->debugfs_root,
 		&priv->hangcheck_period);
-- 
2.39.2

