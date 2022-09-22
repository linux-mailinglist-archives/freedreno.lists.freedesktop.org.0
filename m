Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 19E545E611B
	for <lists+freedreno@lfdr.de>; Thu, 22 Sep 2022 13:31:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2931B10EADE;
	Thu, 22 Sep 2022 11:30:38 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7F3FE10EAD7
 for <freedreno@lists.freedesktop.org>; Thu, 22 Sep 2022 11:30:34 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id l12so10586759ljg.9
 for <freedreno@lists.freedesktop.org>; Thu, 22 Sep 2022 04:30:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=47vvp11+W20l4C4N5v2oL7Eb2wQVc5MT8hndh5rEnUo=;
 b=fwM+BJ+9XUsoh6Y9ytE96dizU38naJkzLE2buKeHJiv9K2z3DqcZNJgOt+u7Z0DJQG
 ADhgdhu0pcVuEhaVDGC1sasxzwJ4v6BlFa7W0NidFnVtNF+b0jbgSimUyRsBXs8ajG59
 mxg57rx+1XV0sveG4u7y33F3yrtIM382HDFCIJlDDHZvMuX6RY+yB9Vw7IVg+1+3eBf9
 MnPUeGNQVIUthhQPwJfUOG8Lijz+XUv6ieqZT/s5GdtA0IfgBTWrUKoJSAwUbG1wcRjM
 bgrLudtejV9m0lWJ60jGmXfm99QK9YrOJGWdrs9VL+WucAC4l+it35+YmCONtWknehKs
 +/PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=47vvp11+W20l4C4N5v2oL7Eb2wQVc5MT8hndh5rEnUo=;
 b=vbGR8VVsrBci2PwYNRXPaUSNRpPkvIKfPGGok885Ffcn14Xxu/GB0IFL7aHcehYe49
 7h3jOzqbmMArvCH+67i8LmaMr/zPmyNCvDB1QE2xtk6eSNrluZXyA+n+sO34/G8gGqVg
 4ulcEvaq68Gz57JeQk9uXbKisXPuI0RyPQ+Z8/A7bV++lZ++CXOU5a29MM428UdPxCpW
 W5KsqOl06h71xI4KQZifZspCcBTfeQUivvtJQ8Hx9/inc0KF9fsJtMjQBquN9XxlTOYC
 /LtGNPhXtQ6ABVDYzuqX3HNshD32y9L4eMddaugXPLenxRMSe0CTJaXsr4JQZ3kaDoZE
 HfFg==
X-Gm-Message-State: ACrzQf2R4xeN098+EdmrYcBRYXIPaeygGLjSQVXTdEA0BJBIMhCTF206
 s0FVUlb3wyF/98aDel4IoFStHg==
X-Google-Smtp-Source: AMsMyM47XG+fS8A7DyjTZd0TauZkFtNVv0/q18OyWaGukjimZ/J4f7PRXHMUu8Iv2LnBnMA1lIX8oQ==
X-Received: by 2002:a05:651c:160a:b0:25a:62a4:9085 with SMTP id
 f10-20020a05651c160a00b0025a62a49085mr947493ljq.214.1663846220415; 
 Thu, 22 Sep 2022 04:30:20 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 c4-20020ac25304000000b004996fbfd75esm898527lfh.71.2022.09.22.04.30.19
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 Sep 2022 04:30:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 22 Sep 2022 14:30:13 +0300
Message-Id: <20220922113016.355188-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220922113016.355188-1-dmitry.baryshkov@linaro.org>
References: <20220922113016.355188-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/5] drm/msm/dsi: add support for DSI 2.6.0
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
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add support for DSI 2.6.0 (block used on sm8450).

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 ++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h | 1 +
 2 files changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 7e97c239ed48..59a4cc95a251 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -300,6 +300,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&sc7180_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_5_0,
 		&sc7280_dsi_cfg, &msm_dsi_6g_v2_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_6_0,
+		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 };
 
 const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 8f04e685a74e..95957fab499d 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -25,6 +25,7 @@
 #define MSM_DSI_6G_VER_MINOR_V2_4_0	0x20040000
 #define MSM_DSI_6G_VER_MINOR_V2_4_1	0x20040001
 #define MSM_DSI_6G_VER_MINOR_V2_5_0	0x20050000
+#define MSM_DSI_6G_VER_MINOR_V2_6_0	0x20060000
 
 #define MSM_DSI_V2_VER_MINOR_8064	0x0
 
-- 
2.35.1

