Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2673A4B6E7F
	for <lists+freedreno@lfdr.de>; Tue, 15 Feb 2022 15:16:49 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F4210E579;
	Tue, 15 Feb 2022 14:16:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 117C610E575
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 14:16:47 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id b9so12972313lfv.7
 for <freedreno@lists.freedesktop.org>; Tue, 15 Feb 2022 06:16:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=PSfsRzJkEgK/Vmp9eGzQeRkfQQALkinNmbtc1FEuOMY=;
 b=m4CaCdv+n7670jVhY+lvnPejzKPDMxc3DkfOmhG8MrdwGRZZSMsj8xzqC4VZgoXEEa
 g3woR+hHqj3q1mnwZ3uASTBu+ms+weVqOXRoyjq/KXDlWrUzYxJIz++OHKI5Q1d4IvEd
 fRVkAz5jq0lRn/aRj044UjUiIZ5Z7JtUn4zi+ZKNEHKkdR2cIchO+n+YA9qkWUBVkd3d
 G0eep/nHlXcvOtDlXRj9wTPwaoblMk59vwfHbOFLib4SeSw71sdm4/2r9c8tzlIdl+wH
 14pzCi0VzWvidwPOFIztOnF9d7dubWVmRIBhGRGcp1gCxKNM4lirRr9ty7cjldvW12D8
 dYVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=PSfsRzJkEgK/Vmp9eGzQeRkfQQALkinNmbtc1FEuOMY=;
 b=ZDWzKGQTETRMqMlgDoyHLJHKEsL7aaUUpXpBtZd0MYy/MVTEZyb/gnuAYjbePC2YkD
 IAJ4BkrRfiGOcI30hKjbIrKr0sPN6PvZTWNN6UgQtAUTUjR+QJO3lmn6crAROuASfw1u
 cZDeAB8e28h+emcWp0SdrZ3foIIWD4L4Pkc9vBN9U7KJyHPJopXeZFzn/mfdaen/94Ot
 igkTAFe+3pQ5m3m1umCPP+TFxKNopV08KYNUwIphCU1gYhajb5Ue4d1UmDPcmEOeOeuB
 6lpxUW3S8SB3d7Gt56uNomjo3kPW2q/VWOs+eLotupbIhcBklmKdBXnjOKNRkXXRidtF
 ZTTg==
X-Gm-Message-State: AOAM532MVulXS05LHEm18WpZPr+40BtZcqJqPaym46zMctM8GwxKKoEf
 xzAquZCOpJbMOjhN9ptkbcTiSwM9CIiW5A==
X-Google-Smtp-Source: ABdhPJyinQ0AoywLq7LdUetGXGJVk/PRud76P5Q/F1zIkR64pHnyfTnSNAgdY1XV5r7NmkDdQhymBA==
X-Received: by 2002:a05:6512:104c:: with SMTP id
 c12mr3217127lfb.418.1644934605400; 
 Tue, 15 Feb 2022 06:16:45 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id m16sm1018044ljb.131.2022.02.15.06.16.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 15 Feb 2022 06:16:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 15 Feb 2022 17:16:36 +0300
Message-Id: <20220215141643.3444941-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
References: <20220215141643.3444941-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 1/8] drm/msm/dpu: fix dp audio condition
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

DP audio enablement code which is comparing intf_type,
DRM_MODE_ENCODER_TMDS (= 2) with DRM_MODE_CONNECTOR_DisplayPort (= 10).
Which would never succeed. Fix it to check for DRM_MODE_ENCODER_TMDS.

Fixes: d13e36d7d222 ("drm/msm/dp: add audio support for Display Port on MSM")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 132844801e92..c59976deb1cb 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1099,7 +1099,7 @@ static void _dpu_encoder_virt_enable_helper(struct drm_encoder *drm_enc)
 	}
 
 
-	if (dpu_enc->disp_info.intf_type == DRM_MODE_CONNECTOR_DisplayPort &&
+	if (dpu_enc->disp_info.intf_type == DRM_MODE_ENCODER_TMDS &&
 		dpu_enc->cur_master->hw_mdptop &&
 		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select)
 		dpu_enc->cur_master->hw_mdptop->ops.intf_audio_select(
-- 
2.34.1

