Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 55B8D9EDBFB
	for <lists+freedreno@lfdr.de>; Thu, 12 Dec 2024 00:42:24 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C4FE10EC7B;
	Wed, 11 Dec 2024 23:42:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="Wfk34iWY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x135.google.com (mail-lf1-x135.google.com
 [IPv6:2a00:1450:4864:20::135])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A23F810EC87
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 23:42:21 +0000 (UTC)
Received: by mail-lf1-x135.google.com with SMTP id
 2adb3069b0e04-53e399e3310so14234e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 11 Dec 2024 15:42:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1733960540; x=1734565340; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=qE7GDtRTStTKn7zTKbCKRrNoh4JnzGeSHWe+F3Oy/c4=;
 b=Wfk34iWYQnKMKs1IYNzIP6imQqfUtGTPK1A2CN0hxY7WxPbC9XQdc6XG0C0lzFPj0X
 MkQYczNWNql8lRxfdROp/iL7E4BkNaePidiAt6mQ0qKErQmyGeCNDm4eA9yfQFvqsoV6
 smkBkd4a7u2EmXRAMNQMWx1ANedj7PLRYCGgrvJanP9iz5N32XLUaBLFT+Yk7UBw+OLw
 UQ6BxYtPskEWxfvcS+qpZIdnDUy/tHT6Eruq9b6GEysoA6+9dozcKYYKoSH7gX8LA194
 KwjbvSSGs0gXS1i2UcIXOJ4gpv5dQ2sn03d8hOik9PDvMZ7qrf4RwfTDqKwVX0+ANteA
 B7Sw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1733960540; x=1734565340;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qE7GDtRTStTKn7zTKbCKRrNoh4JnzGeSHWe+F3Oy/c4=;
 b=brtHvtVHJoYjMT+/X5o4riTfD8xYbxI/Wm5pDqUO7HjH27z0XX3ytToGU8+KnvlYio
 7D2CE9tWiu38Ic0Udk7GWXDlrtANpLOcCHeuyNfQTvmYtSpChXfEF/0nJ/37nbthEX/H
 tpBAl/IVWFnxrXyF7gmn+5/aTF0eFUGsz+S5w/mtYUM9sor79WMej+aT7yYnWCO/fUDh
 SAj98kT8AcquO2apfn0tokmuIetp3t9tWfezObWnaUzOMSjzdBjC1OVsss3pqNJPukf4
 6NzwR/iiz3bJEyzeRwG5y06O9l/cvtdsyHnK+rkicsVtcDsA+IONbmF9Xd4lb9HMt/9g
 ERCw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWJNxC4gIPKF6T/O/xoXRpJl9/zzV4C4Kgpx4rGryJBJJKTWrTOq9BD8yd2SX8y85P6yxMZaar1ia8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyiqZDN54vYOyBmn2aB/v7WsXCx0TDz5z782ftZ+FrP12k2j8qJ
 uhNIi4CTNnacewNmYmlcZT2fvLMj1xBz6AdN2ihgv+zcsrfvMvgxOVqk2jgSxMI=
X-Gm-Gg: ASbGncvzouQDQOD8PCvLjVx4+hm0ypdGCXpWGkbOuRC00N0MOzpbkQLuNU5+E0NbYTw
 MVydSK10QZSq6hcBbFu18PAaVUWY2fH0IeiOHjZAoT8S5+QZn2QgAdcp/8kOVfZRl8tpe/Fxkmg
 HBx+mEzsR3b+bX2zKAOjsP4pDnhUd1WYu9wWJj+h8sa3MlvpDbcCz6quH7tDzI4qZtfJn7OTPja
 URDD96Qit/uptqUZi8LrwdwL9VVaAiw/wamJKtqagXpHloztHSc0Bm09ZteXA==
X-Google-Smtp-Source: AGHT+IHV/gS244rNWMbZoF7ZJs+GMe2+NwsjTqUbRwLIukPaiz09y59qS8DRvo52E+Lvw8sNNYtzgw==
X-Received: by 2002:a05:6512:b23:b0:540:1d0a:57f5 with SMTP id
 2adb3069b0e04-5402f00b8dfmr475551e87.22.1733960539965; 
 Wed, 11 Dec 2024 15:42:19 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5401cc76909sm1222207e87.58.2024.12.11.15.42.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Dec 2024 15:42:18 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 12 Dec 2024 01:41:48 +0200
Subject: [PATCH v3 13/14] drm/msm/dp: drop struct msm_dp_panel_in
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241212-fd-dp-audio-fixup-v3-13-0b1c65e7dba3@linaro.org>
References: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
In-Reply-To: <20241212-fd-dp-audio-fixup-v3-0-0b1c65e7dba3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>, 
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3830;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=MMvFCqfALU6wJGnue5h/pJv8DRZdW1yevlezkUKG1JM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnWiM5JfTAka5yOe8WD4DIrb4G1HNDkAAKSav7k
 WeZp3UjeNaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ1ojOQAKCRCLPIo+Aiko
 1YRMCACWvpBhLFtz3kgiXuXfdW5Vh8vyZyOPtkS+ev+stKCA26jNaowHDR7ccgmYyhCsV5k36Nh
 W5KSKNDGUa06xBZkdMoUuUi96CHTTJSgZC++C3O85o5TxznHG1E7ynlDkn5sPXan5I9JxOnwLcD
 KibsKIQz70ufHCaBFA80+OEZPrS1Sbs+j+N0LLVSPGOnibc1K+U3QOqS5YvytUwUmg0saa2zvlL
 USzFu3om+M5Vi9HLlj92q8RkKH4V9CEU+2yWSAYNa/SFgruzOkmFvx89uquBF/yslrl0C11Qvij
 VroT01XOwxDNY/xU4MUo31anFZFGe+PX1Auw4uJq4BmAq5Tf
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

All other submodules pass arguments directly. Drop struct
msm_dp_panel_in that is used to wrap dp_panel's submodule args and pass
all data to msm_dp_panel_get() directly.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c |  9 +--------
 drivers/gpu/drm/msm/dp/dp_panel.c   | 15 ++++++++-------
 drivers/gpu/drm/msm/dp/dp_panel.h   | 10 ++--------
 3 files changed, 11 insertions(+), 23 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index cb02d5d5b404925707c737ed75e9e83fbec34f83..a2cdcdac042d63a59ff71aefcecb7f8b22f01167 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -722,9 +722,6 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 {
 	int rc = 0;
 	struct device *dev = &dp->msm_dp_display.pdev->dev;
-	struct msm_dp_panel_in panel_in = {
-		.dev = dev,
-	};
 	struct phy *phy;
 
 	phy = devm_phy_get(dev, "dp");
@@ -765,11 +762,7 @@ static int msm_dp_init_sub_modules(struct msm_dp_display_private *dp)
 		goto error_link;
 	}
 
-	panel_in.aux = dp->aux;
-	panel_in.catalog = dp->catalog;
-	panel_in.link = dp->link;
-
-	dp->panel = msm_dp_panel_get(&panel_in);
+	dp->panel = msm_dp_panel_get(dev, dp->aux, dp->link, dp->catalog);
 	if (IS_ERR(dp->panel)) {
 		rc = PTR_ERR(dp->panel);
 		DRM_ERROR("failed to initialize panel, rc = %d\n", rc);
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.c b/drivers/gpu/drm/msm/dp/dp_panel.c
index 25869e2ac93aba0bffeddae9f95917d81870d8cb..49bbcde8cf60ac1b297310a50191135d79b092fb 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.c
+++ b/drivers/gpu/drm/msm/dp/dp_panel.c
@@ -659,25 +659,26 @@ static int msm_dp_panel_parse_dt(struct msm_dp_panel *msm_dp_panel)
 	return 0;
 }
 
-struct msm_dp_panel *msm_dp_panel_get(struct msm_dp_panel_in *in)
+struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
+			      struct msm_dp_link *link, struct msm_dp_catalog *catalog)
 {
 	struct msm_dp_panel_private *panel;
 	struct msm_dp_panel *msm_dp_panel;
 	int ret;
 
-	if (!in->dev || !in->catalog || !in->aux || !in->link) {
+	if (!dev || !catalog || !aux || !link) {
 		DRM_ERROR("invalid input\n");
 		return ERR_PTR(-EINVAL);
 	}
 
-	panel = devm_kzalloc(in->dev, sizeof(*panel), GFP_KERNEL);
+	panel = devm_kzalloc(dev, sizeof(*panel), GFP_KERNEL);
 	if (!panel)
 		return ERR_PTR(-ENOMEM);
 
-	panel->dev = in->dev;
-	panel->aux = in->aux;
-	panel->catalog = in->catalog;
-	panel->link = in->link;
+	panel->dev = dev;
+	panel->aux = aux;
+	panel->catalog = catalog;
+	panel->link = link;
 
 	msm_dp_panel = &panel->msm_dp_panel;
 	msm_dp_panel->max_bw_code = DP_LINK_BW_8_1;
diff --git a/drivers/gpu/drm/msm/dp/dp_panel.h b/drivers/gpu/drm/msm/dp/dp_panel.h
index f305b1151118b53762368905b70d951a366ba1a8..a4719a3bbbddd18304227a006e82a5ce9ad7bbf3 100644
--- a/drivers/gpu/drm/msm/dp/dp_panel.h
+++ b/drivers/gpu/drm/msm/dp/dp_panel.h
@@ -21,13 +21,6 @@ struct msm_dp_display_mode {
 	bool out_fmt_is_yuv_420;
 };
 
-struct msm_dp_panel_in {
-	struct device *dev;
-	struct drm_dp_aux *aux;
-	struct msm_dp_link *link;
-	struct msm_dp_catalog *catalog;
-};
-
 struct msm_dp_panel_psr {
 	u8 version;
 	u8 capabilities;
@@ -94,6 +87,7 @@ static inline bool is_lane_count_valid(u32 lane_count)
 		lane_count == 4);
 }
 
-struct msm_dp_panel *msm_dp_panel_get(struct msm_dp_panel_in *in);
+struct msm_dp_panel *msm_dp_panel_get(struct device *dev, struct drm_dp_aux *aux,
+			      struct msm_dp_link *link, struct msm_dp_catalog *catalog);
 void msm_dp_panel_put(struct msm_dp_panel *msm_dp_panel);
 #endif /* _DP_PANEL_H_ */

-- 
2.39.5

