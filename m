Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E9EFF4F4814
	for <lists+freedreno@lfdr.de>; Wed,  6 Apr 2022 01:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7741C10EE2E;
	Tue,  5 Apr 2022 23:46:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12C0610ED23
 for <freedreno@lists.freedesktop.org>; Tue,  5 Apr 2022 23:45:57 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id b21so1025755ljf.11
 for <freedreno@lists.freedesktop.org>; Tue, 05 Apr 2022 16:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=3hI4loPQKfesNHihNQukITqdxiwz9vk8ypDb2Yqay+s=;
 b=JFBR9cW1qO6/WeFEIv0ozzxLr288vzqyaaEq2Wtjt3+bH0OGiYsl8rfUvBJYF8mkcD
 /EqeFYvgtii+DQ+ZDoEmy8Y/kv2FV7nTT54PEDic5H3AIG5XzNylEt38/ks/+jpbbyUF
 pmLYnBOGMv+t/yzkjrr5oVgavXVK32Ysc0l2iMfOq0Nz6REgyKAc3CSGrQG5oPImekAF
 2HbvJBXr+EDpCv8sI1QsEfLQAWFkGHVh6Q1/MM1BHXfDw9h+wC2bXqB3/eplTQOwUr5O
 khU4G6iNjHc06Z5se+MX6Uo4bzkXuexzMKiEGc15pXfPPacXWXQN0wUgzqxg4WuJ7Tap
 Exjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=3hI4loPQKfesNHihNQukITqdxiwz9vk8ypDb2Yqay+s=;
 b=mdnPcbdIyoazB/XOgsVxSERJLr3+KkkdMEsjQF8MlZ9RURnY6EK0El2tH6cvF0pPqV
 Vgadq/foFQD7oHROYnTddsDqpGPw17PjrkaKfK/RvH54uDrdoddmXdBMH9q+ORn2ncRG
 4NjDY3N5B7NHEFRTvTnNe8xl7OYDHSCs9DW8hZQktC0ILUOpCIl/iowDdFnmigTgHhqA
 D+wX4KlYv660mG+WEAwsSLUbVTKB/wRHobA0QU3entwx9sdl+VHJWM7IXo4F46Bh4AT8
 OTX+qce1vGrZZMaIHX1Zbr0e2vEN+9a8tIjVwG2MbNaGOc34HPry8FtRc+o3Rfv7mELn
 hAwA==
X-Gm-Message-State: AOAM5327nnLG/kBq88mD1YhqIzYow/yiCcoTRzaWdrXhNdKAaFSRjSBu
 UztOQYN5j7781OgitZPp70HP+btX+U4ALg==
X-Google-Smtp-Source: ABdhPJzxlKTyT9cYYHxN2DLSvcm8mw6mjktnkfjs1jTREW+tywB+hcj2PYPVdouYdXCOPLfHJvr6YQ==
X-Received: by 2002:a2e:924d:0:b0:24b:238:3be8 with SMTP id
 v13-20020a2e924d000000b0024b02383be8mr3707357ljg.181.1649202355412; 
 Tue, 05 Apr 2022 16:45:55 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 g11-20020ac24d8b000000b0044a3454c858sm1651897lfe.81.2022.04.05.16.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 16:45:55 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed,  6 Apr 2022 02:45:51 +0300
Message-Id: <20220405234551.359453-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405234551.359453-1-dmitry.baryshkov@linaro.org>
References: <20220405234551.359453-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 4/4] drm/msm: unregister all internal bridges
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
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Unwind all drm_bridge_add() calls for internal bridges and remove all
bridges added by the msm driver itself by calling drm_bridge_remove().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_drv.c b/drivers/gpu/drm/msm/msm_drv.c
index affa95eb05fc..71e1b7393f6f 100644
--- a/drivers/gpu/drm/msm/msm_drv.c
+++ b/drivers/gpu/drm/msm/msm_drv.c
@@ -232,6 +232,9 @@ static int msm_drm_uninit(struct device *dev)
 
 	drm_mode_config_cleanup(ddev);
 
+	for (i = 0; i < priv->num_bridges; i++)
+		drm_bridge_remove(priv->bridges[i]);
+
 	pm_runtime_get_sync(dev);
 	msm_irq_uninstall(ddev);
 	pm_runtime_put_sync(dev);
-- 
2.35.1

