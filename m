Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 761D34DD19E
	for <lists+freedreno@lfdr.de>; Fri, 18 Mar 2022 01:07:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 53FB510E8DD;
	Fri, 18 Mar 2022 00:07:35 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x529.google.com (mail-pg1-x529.google.com
 [IPv6:2607:f8b0:4864:20::529])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E652310E8D4
 for <freedreno@lists.freedesktop.org>; Fri, 18 Mar 2022 00:07:33 +0000 (UTC)
Received: by mail-pg1-x529.google.com with SMTP id w21so180969pgm.7
 for <freedreno@lists.freedesktop.org>; Thu, 17 Mar 2022 17:07:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1i8tHBCz0yGUnXTP63evaW8shC/1FTv22ymAKssO43g=;
 b=Ur+HSlhkoIDLHekqpPNSXAVLlxD5+T81ff6OBaHTxdXzokDkA8qnnVLDj9q0QAArhQ
 8B28qd/JYP4jKNuPGjkNF8Z9JI3moyBARf9Nk/nhV0r4cLAzMLmI/7ti/9uugVGYGR/J
 4cAJHw+XO9GiplYxM7ZZn9UlMuvIuvwPzTl/g=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=1i8tHBCz0yGUnXTP63evaW8shC/1FTv22ymAKssO43g=;
 b=keV/f94jtuXWytr+5ejvRzk05e0GYuGrvZJeIWv39JJnd9LmIKD6hv+DsSt6W9dBcX
 di2sb5Cj3nfd8LQy3S+GYuRTmb58OQtjfZb1jgVzLkg3jklbP7453Cwm9I2Xy7tP4heN
 z82486UXKMoD4Q1vUXkil65ThEc09f1sbHhXt5bZBlzfopTQ3LukTvkfiys8F25Cckv9
 zLkMSTq8eIZSA1ViBOMa8e4Pch1K73rxAfOJRMC/A4Mm8A8RVUuAqt77HZ8SylN+vyT8
 klPNZ6Lzd1GkfyBHoyM8zYFAnlIpZw/nylv+mTBeSiQcKkpCNpv9oWlFqz5Jgw0twbCk
 6/bw==
X-Gm-Message-State: AOAM532htfBnc3ZM5jOf0mNYnj5OOtCBrdKEMfuF0IjM5IUO9pkCtIkE
 GhwET75OHiw9xtDTcP5NCu4NbQ==
X-Google-Smtp-Source: ABdhPJxx5b5fjDNUn/yUMHMvPSEd5Y6joMRanwaFw9+NHRmy92bdTzHYRpjmt7wsM7IX3PrGoD3Btw==
X-Received: by 2002:a05:6a00:815:b0:4f6:ee04:30af with SMTP id
 m21-20020a056a00081500b004f6ee0430afmr7183021pfk.15.1647562053324; 
 Thu, 17 Mar 2022 17:07:33 -0700 (PDT)
Received: from smtp.gmail.com ([2620:15c:202:201:49cf:7701:359e:b28f])
 by smtp.gmail.com with ESMTPSA id
 o5-20020a056a0015c500b004f76735be68sm8280640pfu.216.2022.03.17.17.07.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 17 Mar 2022 17:07:33 -0700 (PDT)
From: Stephen Boyd <swboyd@chromium.org>
To: Rob Clark <robdclark@gmail.com>,
	Sean Paul <sean@poorly.run>
Date: Thu, 17 Mar 2022 17:07:31 -0700
Message-Id: <20220318000731.2823718-1-swboyd@chromium.org>
X-Mailer: git-send-email 2.35.1.894.gb6a874cedc-goog
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/dsi: Use connector directly in
 msm_dsi_manager_connector_init()
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <seanpaul@chromium.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The member 'msm_dsi->connector' isn't assigned until
msm_dsi_manager_connector_init() returns (see msm_dsi_modeset_init() and
how it assigns the return value). Therefore this pointer is going to be
NULL here. Let's use 'connector' which is what was intended.

Cc: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc: Sean Paul <seanpaul@chromium.org>
Fixes: 6d5e78406991 ("drm/msm/dsi: Move dsi panel init into modeset init path")
Signed-off-by: Stephen Boyd <swboyd@chromium.org>
---

I don't know if this is superseeded by something else but I found this
while trying to use the connector from msm_dsi in this function.

 drivers/gpu/drm/msm/dsi/dsi_manager.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_manager.c b/drivers/gpu/drm/msm/dsi/dsi_manager.c
index 0c1b7dde377c..9f6af0f0fe00 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_manager.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_manager.c
@@ -638,7 +638,7 @@ struct drm_connector *msm_dsi_manager_connector_init(u8 id)
 	return connector;
 
 fail:
-	connector->funcs->destroy(msm_dsi->connector);
+	connector->funcs->destroy(connector);
 	return ERR_PTR(ret);
 }
 

base-commit: 05afd57f4d34602a652fdaf58e0a2756b3c20fd4
-- 
https://chromeos.dev

