Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 481AB735F04
	for <lists+freedreno@lfdr.de>; Mon, 19 Jun 2023 23:25:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 658E810E08A;
	Mon, 19 Jun 2023 21:25:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E962210E08A
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jun 2023 21:25:23 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id
 2adb3069b0e04-4f8689fbf59so2533347e87.0
 for <freedreno@lists.freedesktop.org>; Mon, 19 Jun 2023 14:25:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687209921; x=1689801921;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=5gFB/5Z8bifSrL3SocS7kcyTOqWiXcJYOMvj9APdBaU=;
 b=O8AmWHxclCA83Dsrbof9IrerkLZvfILqxSQ1U24buq8/UJ05ZURnn/HbeNCAi8wGoc
 fJ/yicWWIO8At9zxoPxNvxs4+djx6wyG3/0zE8Z04keTA1mQqtm3NtjbmEOQlHx364XF
 /Ip6Eo+wI/ICUTESE/J9ti199B+JF+9qWtJBAWVjun8xmvjnP2F6NPVNFxyEVnJBFZKM
 LxPaPtFUnXX3qHSovtvH+nQMkqG5i0eMe3CMPriIUnsLG4I6kH+Ohe+yWO60GjDNxA1v
 wzGnT1hIgR8q1nUsL4m4Z9oy08HbsCLDIvYDrPiivySncagGHCuxz3XtUekhGVpSEuru
 4L2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687209921; x=1689801921;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=5gFB/5Z8bifSrL3SocS7kcyTOqWiXcJYOMvj9APdBaU=;
 b=gjn/fDoQYfxZWntdi9QKJSS6s8wdHnS1hPUWba2HDXj4iLq429yNzCByyY54UyFhED
 Pc2mh0vdrNdCkp/plh5fvIq0dstTISV2Pwwad9DDA/TQSDVWTh7wWqaDSpoTI4QGd41n
 noMM8aunU48Z08mmE0YIFXTNnEpL8069cEJkUwbO8p/UbZNT/r+eRF1RP+ixDwJQM05K
 Etzm5APPBkNQHaz7aQ0rDPYYR2Wv33exOHQD13Qi9fuy/7gWJfPz3KpBu34FERV/2pSm
 tdPamOeLC8zW/5fnHv9jbyhAG/pa7bGLZE+txMoG0Hi5WFnri4D+DMGUO8En3PIvKMMj
 DYdg==
X-Gm-Message-State: AC+VfDwgWo0rtsW4AvFjd25ZwYuGLKgCcI5pA9WrVJ1GW7YZZ/il8m1U
 eOQotIrCw4kVcl7uwwmPLD45yQ==
X-Google-Smtp-Source: ACHHUZ4YrFvEFfsKLUQzLpd/qHCvn2opTHnZRLvA60ASIzHkU97jEvEecp9yG6DSfL5BBLRnhDCQdg==
X-Received: by 2002:ac2:5b1d:0:b0:4f8:6ff9:ec55 with SMTP id
 v29-20020ac25b1d000000b004f86ff9ec55mr1492415lfn.20.1687209921587; 
 Mon, 19 Jun 2023 14:25:21 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j12-20020ac253ac000000b004f611dd9935sm84864lfh.152.2023.06.19.14.25.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 19 Jun 2023 14:25:21 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 20 Jun 2023 00:25:01 +0300
Message-Id: <20230619212519.875673-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
References: <20230619212519.875673-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 01/19] drm/msm: enumerate DSI interfaces
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
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Follow the DP example and define MSM_DSI_CONTROLLER_n enumeration.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Tested-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_drv.h | 8 +++++++-
 1 file changed, 7 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/msm_drv.h b/drivers/gpu/drm/msm/msm_drv.h
index e13a8cbd61c9..ad4fad2bcdc8 100644
--- a/drivers/gpu/drm/msm/msm_drv.h
+++ b/drivers/gpu/drm/msm/msm_drv.h
@@ -65,6 +65,12 @@ enum msm_dp_controller {
 	MSM_DP_CONTROLLER_COUNT,
 };
 
+enum msm_dsi_controller {
+	MSM_DSI_CONTROLLER_0,
+	MSM_DSI_CONTROLLER_1,
+	MSM_DSI_CONTROLLER_COUNT,
+};
+
 #define MSM_GPU_MAX_RINGS 4
 #define MAX_H_TILES_PER_DISPLAY 2
 
@@ -117,7 +123,7 @@ struct msm_drm_private {
 	struct hdmi *hdmi;
 
 	/* DSI is shared by mdp4 and mdp5 */
-	struct msm_dsi *dsi[2];
+	struct msm_dsi *dsi[MSM_DSI_CONTROLLER_COUNT];
 
 	struct msm_dp *dp[MSM_DP_CONTROLLER_COUNT];
 
-- 
2.39.2

