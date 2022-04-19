Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5537B5072DF
	for <lists+freedreno@lfdr.de>; Tue, 19 Apr 2022 18:20:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B376910F0E7;
	Tue, 19 Apr 2022 16:20:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C26410F0E7
 for <freedreno@lists.freedesktop.org>; Tue, 19 Apr 2022 16:20:35 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id h11so21176439ljb.2
 for <freedreno@lists.freedesktop.org>; Tue, 19 Apr 2022 09:20:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=VXeyTFTsfoYPFo06SZsNQ99dRK1p3DG4c0ZdovqUbmc=;
 b=LlSwrxiPNMbBWlTQRPNdY0n/WTrx7v4OLM1b9B0AdYIzdT66DCpNAY1SH+iygwDyjE
 MbKrYNyJ0pAPF560Z2eTWPDgql9FneKUBBs4Pnpeaa7m5bCQMPv6JdeRpUqD8kZpCYBo
 2uNIf9xO84BCBRbyiiExxvhkqY3+iGuQSgfUjynB0v7zPry9Pt5Y60clo8lN7r/QQ0Z6
 YHbjSeCOvnzlhWW0WP97FQyM2h2jx7DciH4doNI5WYXMTnt9l4DyHi0NyjU2op7IS8N3
 dDM9+ci1gYwox8Uy86qtdMPxAYCafgRj5Fu+tpnxcBjIWgakE32uLK6FTb/tEWl+/9zK
 2hbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=VXeyTFTsfoYPFo06SZsNQ99dRK1p3DG4c0ZdovqUbmc=;
 b=PwE8rbYk0BHHODMhphg6m49v4k7XAHHXYnK56NYjelSB3jjGZc+jvjEMJBpMoeTs/l
 ERvXRCs8S2fasZiBnYVaYYb3ga4tjhRAG4PyE9ovPhYhfXNlx5eoOOG1WhRsT/X9DQAh
 DwkWw10EgOAJ4bL3Z/X40s+qrsFtYJSysyENieWBsBwoR4yvSuHOYj+LD3UtRnwnPWvB
 G+yt4vaNoO6F1ZXdi0hlnusXo+drUHKixtIUGEmG6EljYiBe3SsGuyqhbpn4gvhFC8Py
 m1cc9jbXf5WQHLRj/2vh/5PMKNmwFmWW8fIPVqLHakxFYf2Ycl8YGQsOeWYiOjccRLUc
 3GCg==
X-Gm-Message-State: AOAM533Ye1Ys//tsffJUpcX05tF6fPVQ3fcsNnZi450HWRqO5a22YdoD
 uqQiVphjCkCqs98Lx424hmnp5g==
X-Google-Smtp-Source: ABdhPJxwdScriRJx3uR0TFUsQrgBLKqdu/LnEG3C8Zkr02oQlpUTup8+q24MTTMVTCgO4xXB5kDVFw==
X-Received: by 2002:a2e:7002:0:b0:249:b34a:69d3 with SMTP id
 l2-20020a2e7002000000b00249b34a69d3mr10678980ljc.474.1650385233468; 
 Tue, 19 Apr 2022 09:20:33 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 k15-20020a2e92cf000000b002493cc687f3sm1495153ljh.45.2022.04.19.09.20.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Apr 2022 09:20:33 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 19 Apr 2022 19:20:29 +0300
Message-Id: <20220419162030.1287562-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220419162030.1287562-1-dmitry.baryshkov@linaro.org>
References: <20220419162030.1287562-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/3] drm/msm/dpu: fix error handling around
 dpu_hw_vbif_init
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

Using IS_ERR_OR_NULL() together with PTR_ERR() is a typical mistake. If
the value is NULL, then the function will return 0 instead of a proper
return code. Moreover dpu_hw_vbif_init() function can not return NULL.
So, replace corresponding IS_ERR_OR_NULL() call with IS_ERR().

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
index aadf032a190b..d38c55f9f003 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c
@@ -1102,10 +1102,8 @@ static int dpu_kms_hw_init(struct msm_kms *kms)
 
 		dpu_kms->hw_vbif[vbif_idx] = dpu_hw_vbif_init(vbif_idx,
 				dpu_kms->vbif[vbif_idx], dpu_kms->catalog);
-		if (IS_ERR_OR_NULL(dpu_kms->hw_vbif[vbif_idx])) {
+		if (IS_ERR(dpu_kms->hw_vbif[vbif_idx])) {
 			rc = PTR_ERR(dpu_kms->hw_vbif[vbif_idx]);
-			if (!dpu_kms->hw_vbif[vbif_idx])
-				rc = -EINVAL;
 			DPU_ERROR("failed to init vbif %d: %d\n", vbif_idx, rc);
 			dpu_kms->hw_vbif[vbif_idx] = NULL;
 			goto power_error;
-- 
2.35.1

