Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5DB31645107
	for <lists+freedreno@lfdr.de>; Wed,  7 Dec 2022 02:23:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6453610E178;
	Wed,  7 Dec 2022 01:22:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x134.google.com (mail-lf1-x134.google.com
 [IPv6:2a00:1450:4864:20::134])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC2B410E167
 for <freedreno@lists.freedesktop.org>; Wed,  7 Dec 2022 01:22:38 +0000 (UTC)
Received: by mail-lf1-x134.google.com with SMTP id j4so26450564lfk.0
 for <freedreno@lists.freedesktop.org>; Tue, 06 Dec 2022 17:22:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=i5Gb3UnijTffvUZ5061n1gC+IjflOu8fq8L5Sow654E=;
 b=PIC9qUOax1lNgU52qpQYQPGzpNY6onUZwdx1GC5dBi8GZ5KIIX1IH1816QuhdOXiwx
 ha+jpxvYJTivgjLrmBQGwtztQ0B4nzzQwvBzW2zHBaqiWETCr4QO05o/5KhNpGISkdCj
 MM9AbRVI2YhmnmBSCE/m6OPmmrcn4d9O4kLiX0ZwJxKQ3tXdiVBQDkF+8MLOlNnru18O
 JxBo3V/JaW+SgMUZwxM/U5cgc5IqzGO4JkzTW6VDXGSrprceqoeqsBA/BwutQrweXM6p
 ukTzwOevaxwp8C2Utv5P1fDfM/WHRw1xPUgwMhY0FvACJTzjR7NA8S77F4zb2onc1cjp
 irog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=i5Gb3UnijTffvUZ5061n1gC+IjflOu8fq8L5Sow654E=;
 b=urOiZdiQtUAMdsam9EXvhzdfru8mjLCjtImCSFD5wTwKvAY/e4iowQu+HvT4mJkoah
 InvDBTbrf8+N00HKyBgnKW504G0GhBymr99dKef6tGQVQO+/9NAM0m7qYqgynF7xgo+J
 yQi/crBisKGS8qLHnwUvNt+/wo+RLJgreth/rr8cP0hFbJIyWeAxf3ss5kFg4VLrkc1Q
 LtSXVT1pHNlfMSNe8AIoLXRXlrFfs0D58kqjPEoDu6sqdUmq8GAWSX2k8YUMdc5NLfvp
 Di3Lr986EVKzHfK0QB3uHP3xzCxVClEhn7mDzVxBHv5hE5WztttMKA8uBy9t/CaAp8Gp
 oV9w==
X-Gm-Message-State: ANoB5pnz5yJVho1xIsQVEXLpfHlGxIm/w/VOBoXLWnOxGWjv7UEDzfDP
 2LuEVImYF1GNxS9aKtlJiUijXw==
X-Google-Smtp-Source: AA0mqf6Y5qfBgtZkDtnlFNGlVjbAh8hjm8ugydhK0fpipiipoIX5woUHt+dDaRsGdsJ8ncbiA2718g==
X-Received: by 2002:a05:6512:3b0d:b0:4b4:7cb4:f932 with SMTP id
 f13-20020a0565123b0d00b004b47cb4f932mr24777704lfv.243.1670376158245; 
 Tue, 06 Dec 2022 17:22:38 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 a11-20020ac25e6b000000b0048a9e899693sm2678916lfr.16.2022.12.06.17.22.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 06 Dec 2022 17:22:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed,  7 Dec 2022 03:22:27 +0200
Message-Id: <20221207012231.112059-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
References: <20221207012231.112059-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v6 07/11] drm/msm/dsi: add support for DSI 2.6.0
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add support for DSI 2.6.0 (block used on sm8450).

Tested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
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

