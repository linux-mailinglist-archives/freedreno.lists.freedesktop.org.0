Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 166304F4813
	for <lists+freedreno@lfdr.de>; Wed,  6 Apr 2022 01:46:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5673310ED23;
	Tue,  5 Apr 2022 23:45:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6B06C10EB6E
 for <freedreno@lists.freedesktop.org>; Tue,  5 Apr 2022 23:45:56 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id s13so1064680ljd.5
 for <freedreno@lists.freedesktop.org>; Tue, 05 Apr 2022 16:45:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Aea1eCmRXc8SvtM+T5RIzo3X5fELyftyC6ru1eyNaJQ=;
 b=QNMeYGmbbeXLzOYPgSwVK5EPsBm0loeIlT/9PVLnAQSYIwBexuRGVtEtuqmfnl62ol
 U2iFKUauEhHdSPbFcevKHJVoP5d75BPcy1bgBlhguKYCU5TqlCdJykzy4Eg8qBfj+vrZ
 V+qlU5SZBBowD+Pzd9YjJn2vk1XVMXZRGRq4QwKYRXxGdMvnIF+LbUOJmXrdkxn90X+a
 //gUCMfRfZ8X8KUvWOd9x9MI/+VUEnlGqBwV2Vf27WjJ3TP78Bt2g77Rw4+C5EQhD/wn
 3GuadRjY3Jf2C+2HolvwFGp8MLuaGEmQh7y9gvQICUA9PsmRLfKT2sIjc3C1mc2U72Hn
 K3FA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Aea1eCmRXc8SvtM+T5RIzo3X5fELyftyC6ru1eyNaJQ=;
 b=Sm/B7i3q0QnP1KgJSH1tYAYqCcvenhcxI7HbKnzpY5OrJtBDJ6F+jMp8c5JIWS6Chh
 SifXRcv/nBJsgpTUfc1zD12nJcTuU2qjVledglU8QoRWxdwxyft+mGeua+OzX2JZmM6i
 +CghLABpmKVXSVjWE845IjXHVclzK5bbQuTsK8vrwBJvWGUSOJGCWm0Kgx5fDPzim7be
 FZg0c8KtxuxUu4k0SdezNFAMFFf74WQNwOrayd27fGB1UVl8oPzNi47UUscZdKyUHeRL
 hfo8yQlAzckold+f2K8/ah/PK7fiI5fRzGbClmdFqQvPzddGSu2B5VkaoDNd73T0p6Te
 VTaA==
X-Gm-Message-State: AOAM5310olv3vNbAMU5yvAhsGoifsI07W6+nQJ5W6CWTXEGiOakOCV2d
 YYipdp4buq3gNPOPIwJz7KzXDurJfDgGrg==
X-Google-Smtp-Source: ABdhPJzo4h+1cA8+ptBf6oSHmeKyXyUhblQE/hDzU3ZFeZOpPffVOlZamsan2q3hL+qQPtLNbg7+FQ==
X-Received: by 2002:a05:651c:154:b0:24b:152:266e with SMTP id
 c20-20020a05651c015400b0024b0152266emr3656017ljd.185.1649202354706; 
 Tue, 05 Apr 2022 16:45:54 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 g11-20020ac24d8b000000b0044a3454c858sm1651897lfe.81.2022.04.05.16.45.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 05 Apr 2022 16:45:54 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed,  6 Apr 2022 02:45:50 +0300
Message-Id: <20220405234551.359453-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220405234551.359453-1-dmitry.baryshkov@linaro.org>
References: <20220405234551.359453-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 3/4] drm/msm/dp: properly add and remove created
 bridges
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

Add calls to drm_bridge_add()/drm_bridge_remove() for the internal DP
bridges.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_drm.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_drm.c b/drivers/gpu/drm/msm/dp/dp_drm.c
index 80f59cf99089..a7415f9eb80e 100644
--- a/drivers/gpu/drm/msm/dp/dp_drm.c
+++ b/drivers/gpu/drm/msm/dp/dp_drm.c
@@ -230,9 +230,13 @@ struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_devi
 	bridge->funcs = &dp_bridge_ops;
 	bridge->encoder = encoder;
 
+	drm_bridge_add(bridge);
+
 	rc = drm_bridge_attach(encoder, bridge, NULL, DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 	if (rc) {
 		DRM_ERROR("failed to attach bridge, rc=%d\n", rc);
+		drm_bridge_remove(bridge);
+
 		return ERR_PTR(rc);
 	}
 
@@ -242,6 +246,7 @@ struct drm_bridge *msm_dp_bridge_init(struct msm_dp *dp_display, struct drm_devi
 					DRM_BRIDGE_ATTACH_NO_CONNECTOR);
 		if (rc < 0) {
 			DRM_ERROR("failed to attach panel bridge: %d\n", rc);
+			drm_bridge_detach(bridge);
 			drm_bridge_remove(bridge);
 			return ERR_PTR(rc);
 		}
-- 
2.35.1

