Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AE3AE5A24A5
	for <lists+freedreno@lfdr.de>; Fri, 26 Aug 2022 11:39:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5F00710E7EE;
	Fri, 26 Aug 2022 09:39:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE18510E7EE
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 09:39:34 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id bq23so1278095lfb.7
 for <freedreno@lists.freedesktop.org>; Fri, 26 Aug 2022 02:39:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=XJBZo86NwzlYcDfKiueYzUkDbZYleRySpVsik2jGH+A=;
 b=qpR7kKD1V3xBxJwj/wDBDO/SFHHHvlDYnlDrpv2aTla7l7Bj4pq1d8enTjpRnpHyOL
 JFrcTElR51YXfx7D8/A5baErgAx6mSa6V5OxSBF67SGUvWDHF18O423UGhbIXXi3Daen
 mcgUicIXXgq/Tek4pesS7vw4IHg30mihFUX/+hJ/dacuXegYwujWZeQ6q3HhUC260bnb
 4RaGeovYLe/gjJz1VSubMQHyrHAttkgcGqA5/qVDk1ZdzQZVD0ludYmRI3rIbO2Y+11k
 o8m2ent+YZyehIkednJG0R0ssgYxtNqK8lG3pT+qI9tH5UlZJ2Xv8VPLm5QKzP6zYeDo
 j0xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=XJBZo86NwzlYcDfKiueYzUkDbZYleRySpVsik2jGH+A=;
 b=hpOrOH8H13+v0B0VF2MpLLO8e/e7c4p/AOcdnYuqz1TNBDRTVG+3yALpk5P8QmywMm
 EmAfx9rfLag5r0z70h8LAwXqDmE9sMniXO+ho0nNZIKTc4L3PsOmcqLCAhqKoOEhfliG
 gpDSGrwFbA9h9GUslBg/aJdrdyvRrwB947nCk+7yk3hx4vIiFiHNiN/xecH3lrDgFnGF
 qUhTsKHICi/mC9VxjsYafEIPS7lhgE8Nh1GPaqdz3MdiNQI4FvqwLS02EToiDgZ9BwtB
 Yg13CqGZ6zf0qd5q5cXUx6ZW4riEbbYtC7NhHBJlPFpjaI6Ev0OFrWfkamBo3UV6Bv0t
 lfRQ==
X-Gm-Message-State: ACgBeo1PLpEot6k/oBFWVwPHnMX7zoWM/ClzFbk3vaGMrBKBiWcyBsU4
 acA8qYM9N1TOavfPl5nG5hHG+SK5uI7BfA==
X-Google-Smtp-Source: AA6agR5dRIkH6udc5pKFMe1bhIYgbLLZvNUngMjDNapUvHnC/ilmRHVTVwwJnT4S7oGbP+Stft24mw==
X-Received: by 2002:a05:6512:acd:b0:492:b8e0:2ef4 with SMTP id
 n13-20020a0565120acd00b00492b8e02ef4mr2091002lfu.360.1661506773119; 
 Fri, 26 Aug 2022 02:39:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 m6-20020a195206000000b004886508ca5csm329055lfb.68.2022.08.26.02.39.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 26 Aug 2022 02:39:32 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri, 26 Aug 2022 12:39:26 +0300
Message-Id: <20220826093927.851597-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220826093927.851597-1-dmitry.baryshkov@linaro.org>
References: <20220826093927.851597-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 4/5] drm/msm/hdmi: don't take extra reference
 on PHY device
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
 dri-devel@lists.freedesktop.org, Bjorn Andersson <bjorn.andersson@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, Stephen Boyd <swboyd@chromium.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The of_find_device_by_node() already increments the device's usage
count, so there is no need to increment it again using get_device().
Drop this extra get_device().

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index c298a36f3b42..926274eeee25 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -106,7 +106,7 @@ static int msm_hdmi_get_phy(struct hdmi *hdmi)
 		return -EPROBE_DEFER;
 	}
 
-	hdmi->phy_dev = get_device(&phy_pdev->dev);
+	hdmi->phy_dev = &phy_pdev->dev;
 
 	return 0;
 }
-- 
2.35.1

