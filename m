Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AEE717B1A54
	for <lists+freedreno@lfdr.de>; Thu, 28 Sep 2023 13:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CA3F10E60A;
	Thu, 28 Sep 2023 11:16:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1388F10E612
 for <freedreno@lists.freedesktop.org>; Thu, 28 Sep 2023 11:16:41 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50435ad51bbso18593712e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 28 Sep 2023 04:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695899799; x=1696504599; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=HlnLygFYYtSxoKEaC5DFXDBhNuXumh16hVtzEXEvSec=;
 b=ZmjcVzIdVYrtgNFmnQ3GLGOE7nCsJdQep6p0vUbn0hDLa6DDA0LcvR/r3OsQ0Nqq4h
 OgTbzuiY25fNsE71NGCfv2UdZEvZ+2/RrDJQhj2e+MaI9OQBjwXQMxGixfdRpNoegSM1
 0S7WFxerBLOjnLOmI1pep1D0HmzimI4FTl2gZuaCMk23p4lRs1NJelQN4fIsqL4vlHo2
 o6v/MZgXeRqeEYkNan8OqHH8bB++sCQUNqOUbJuXKg3vCRczsVT7sgLApi1xDABPlAdl
 1qhiW6R0x7G2XjDrZJMxwCYBFYmV58DGpOZHn4+AikJvWWh9KUixPn1KcJSzFMqxh7ub
 ojSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695899799; x=1696504599;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=HlnLygFYYtSxoKEaC5DFXDBhNuXumh16hVtzEXEvSec=;
 b=gKiLSPTYhUdWYL8A4qJb4UlbWGJsaKCs9fljVChC9U6Jy34OIoipsbdIIGucAbYr0G
 kiX0f9JFvnaP0cc0gIiKyplWH1GnJG+0pBwVzsXWtObal/p6/sYQAO6Lz7J8O5GiUeih
 IqgF97jl7N1mLdYKSyDSdHd5HsWjQxItB7ORGgFDgXoMy5WPzaUhErJFvyhkzMyxvVVT
 +UdNSxk/8raXxanqA/uF7PyM9m4wwGJ8j6lBcHxacrIldQsouCYZS19ty3b8iUhXZ+ck
 LJ9X58DvW7S26Eex/t1w9/z65lznJ0Jn7ezha3b48aFe5ulu9IS1Fj4+QrcEXSZPebiU
 joxw==
X-Gm-Message-State: AOJu0YzwxPwYUDl44nmaq+Lh9qWMEi3mdqN1AscsguMVKzJiT3/wBjtA
 AdazrEFwGNXKdUQeaE/t23HVTw==
X-Google-Smtp-Source: AGHT+IHs4BEIb3K6wYvwHxL4p5CqDe1+YQl/dXfmh3TBE8urT/HY3ABoF5hl90DcpvKbMm8Y9pmZ2Q==
X-Received: by 2002:a19:790c:0:b0:500:8fcd:c3b5 with SMTP id
 u12-20020a19790c000000b005008fcdc3b5mr772169lfc.12.1695899799367; 
 Thu, 28 Sep 2023 04:16:39 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j18-20020ac253b2000000b004fb738796casm3086623lfh.40.2023.09.28.04.16.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Sep 2023 04:16:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Date: Thu, 28 Sep 2023 14:16:24 +0300
Message-Id: <20230928111630.1217419-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 10/15] drm/msm/hdmi: correct indentation of
 HDMI bridge functions
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
Cc: freedreno@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-phy@lists.infradead.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c | 12 ++++++------
 1 file changed, 6 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
index 62ce1455f974..fbcf4dd91cd9 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c
@@ -291,12 +291,12 @@ static enum drm_mode_status msm_hdmi_bridge_mode_valid(struct drm_bridge *bridge
 }
 
 static const struct drm_bridge_funcs msm_hdmi_bridge_funcs = {
-		.pre_enable = msm_hdmi_bridge_pre_enable,
-		.post_disable = msm_hdmi_bridge_post_disable,
-		.mode_set = msm_hdmi_bridge_mode_set,
-		.mode_valid = msm_hdmi_bridge_mode_valid,
-		.get_edid = msm_hdmi_bridge_get_edid,
-		.detect = msm_hdmi_bridge_detect,
+	.pre_enable = msm_hdmi_bridge_pre_enable,
+	.post_disable = msm_hdmi_bridge_post_disable,
+	.mode_set = msm_hdmi_bridge_mode_set,
+	.mode_valid = msm_hdmi_bridge_mode_valid,
+	.get_edid = msm_hdmi_bridge_get_edid,
+	.detect = msm_hdmi_bridge_detect,
 };
 
 static void
-- 
2.39.2

