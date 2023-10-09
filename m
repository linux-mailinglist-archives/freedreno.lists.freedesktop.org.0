Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A5DC7BE8F7
	for <lists+freedreno@lfdr.de>; Mon,  9 Oct 2023 20:11:01 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1147410E2A5;
	Mon,  9 Oct 2023 18:10:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEB0410E2B4
 for <freedreno@lists.freedesktop.org>; Mon,  9 Oct 2023 18:10:49 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id
 2adb3069b0e04-5046bf37ec1so6372917e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 09 Oct 2023 11:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1696875048; x=1697479848; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=rIiIl1qxmpZwJAax2zo4ZFB4kzioqbwuWWlEMohjM5o=;
 b=poZ33nt9aqdQXQPAvOIeGTprazdVol6IPs4onOqrdv1bvJG/NzcS4DcScYtjztds43
 lF6Kj5eTxyCGrFS5VJeJmt5+LpUbadV/Yg/WXhHx3B3GP6jcpj9qpcog2PNJfjrYhC2X
 B4E3ONDLTOz4cunQiuxGlXg9kUk4bL3aZlXY7yiRHDOaLyFyQf8KGeZrQKGZBSPQAyq/
 LmUjQZpOOL8oeZG/q6ZNQf9mOaCghEQFiVrHy/TWptn4n5AwGXjc3+wjKG/vsoFhZGbD
 eD/wyEyCdeE7P7p5AqPUymZLbjlrvgDztju3eyn3UpugGaTNQpjLPlvT4tGTsYNAmTYM
 NXew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1696875048; x=1697479848;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rIiIl1qxmpZwJAax2zo4ZFB4kzioqbwuWWlEMohjM5o=;
 b=lexEJ5toTVxbOLrH9lso7hL2w8+o3q8iDXPfXI+vTY9ZglhhoubxpPHL4+tbzLpxwo
 s+J5RIZuNhLxxAVu+EV8yw13QgnvDOcsU8WNuo7o1UamD+y6M//PSYBQ+iLjcdEpPT6d
 qCx380xLoXB3LNSan8bhwCgEnESNeA4WNPbiDOIbXIfbsdyZWyW3RsMzZ+0k2tnG3KB3
 /ma7qVTfIEDyCBSKxZthoqpkckddBl2slOFxDXxQV39EEczdQ6jNAszuK8o6updr8rVL
 mFc/9Ub+7oBdodqtiIaLh+Phy2RDFVwNVlgzJyO82hD9b+fAnEjtHy4cHbwELKnfIU3Y
 J9YA==
X-Gm-Message-State: AOJu0YwViBPMt4zs+EZOPMROjY8ikY7CX6ml+Ykn5oRpEV2Z/K7/SKTR
 q1KBAvSSjs2Pm7gemXR0WvEx8Q==
X-Google-Smtp-Source: AGHT+IELzXLGkqfFXYHQEEg+Re6/uU4DLwq935JYwzvmyWABx/+281fRZT0fJSVsJMsGdurSBTxfLg==
X-Received: by 2002:a05:6512:3e18:b0:505:7a65:ad5d with SMTP id
 i24-20020a0565123e1800b005057a65ad5dmr15542523lfv.56.1696875048162; 
 Mon, 09 Oct 2023 11:10:48 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 d6-20020ac25446000000b00505677e7a99sm1506963lfn.139.2023.10.09.11.10.47
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Oct 2023 11:10:47 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  9 Oct 2023 21:10:35 +0300
Message-Id: <20231009181040.2743847-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
References: <20231009181040.2743847-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 08/13] drm/msm: remove shutdown callback from
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

Reviewed-by: Rob Clark <robdclark@gmail.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index 76b69f605b9c..c2f989d1ff42 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -1297,7 +1297,6 @@ void msm_drv_shutdown(struct platform_device *pdev)
 static struct platform_driver msm_platform_driver = {
 	.probe      = msm_pdev_probe,
 	.remove_new = msm_pdev_remove,
-	.shutdown   = msm_drv_shutdown,
 	.driver     = {
 		.name   = "msm",
 	},
-- 
2.39.2

