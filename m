Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14E7F70CCD1
	for <lists+freedreno@lfdr.de>; Mon, 22 May 2023 23:45:44 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7D70610E39A;
	Mon, 22 May 2023 21:45:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5B61510E396
 for <freedreno@lists.freedesktop.org>; Mon, 22 May 2023 21:45:32 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f00d41df22so5038052e87.1
 for <freedreno@lists.freedesktop.org>; Mon, 22 May 2023 14:45:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684791929; x=1687383929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=MPZiyM+41u6KV41f466UiDSi20dbWDpELFpeisbXMJ4=;
 b=kwLUVb/RYRXphumuuqIPcHjZNC8S1lqilqqEA3cBLONADHlwQAYfa80jx2YNLHEQQ9
 iyQf2K9TcDaz4BW1XtGrsZuTeyn3XDi3VlELLNMosUnkFVfsjCpfLZt3diwRIEHhUElC
 8LlX2FfGZXzn91Ciiy6lzRLYdI6PoQ4jjY6Nu2rPMTb3KhvmnM7shAh5DhsTKpHyhrgA
 I8l8exLUObliXYi/S0zgG2gcVxvCqBIElpyd2VUvyYyicGLKPNIi3igQ3oqzNd5MQwv6
 HG5iY7uB/nC7OFwyghTF+zXOrSqJ2YFj8kdUA1j+4vPeGmZDgm47t0+Tqn1sBFFB8+ib
 gWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684791929; x=1687383929;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MPZiyM+41u6KV41f466UiDSi20dbWDpELFpeisbXMJ4=;
 b=FNwnGqu3uVI6JJ6+4yqerS3HjSe9GxwA51VGOs+s56+Bnl2k2HSS9hI88mBjfQYMTB
 khVvixCqkyUPqQRMRKYrbVibfojqn608VPSYF4nW0MtbY8/897IrKkQcrkSoG8YZ2761
 QUmt/PfV3IPRylyu7/qonME31WlszOsPlWCPyRooCMO0mgXsfiQgRfdNfK8W/06uiBTw
 YUN5RYZVpev3suYvMhRszQR5Cz3ZENxr329ZiyhJGBUpUFalvZSVRN769NCd3LDN5W+8
 q8cHK91qzysFNPYCRPxWxICXz/DroxS+Uk/E7T/F5bKCTzOduslg5OoVKoiniYtdnXky
 xPnA==
X-Gm-Message-State: AC+VfDw52hK5I0JuEubp/Os8mZiTtBlRqVYNgTQUMrnkdkcd1mCXLaXP
 qlwxO14KNzYOBr2b1ZLqKgmtYQ==
X-Google-Smtp-Source: ACHHUZ7N55ew+3ZF5N/qRmIuviul0GR4XA/TKZFj9YvHhFZWy9M6af1HDlhR/8Nr8uEW7b4txVtw+g==
X-Received: by 2002:a05:6512:b0e:b0:4f3:7974:2f32 with SMTP id
 w14-20020a0565120b0e00b004f379742f32mr3940967lfu.9.1684791929333; 
 Mon, 22 May 2023 14:45:29 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j7-20020ac25507000000b004f2543be9dbsm1106918lfk.5.2023.05.22.14.45.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 May 2023 14:45:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue, 23 May 2023 00:45:22 +0300
Message-Id: <20230522214527.190054-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522214527.190054-1-dmitry.baryshkov@linaro.org>
References: <20230522214527.190054-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 1/6] drm/msm/dpu: don't set DPU_INTF_TE
 globally
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
Cc: freedreno@lists.freedesktop.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Using BIT(DPU_INTF_TE) in INTF_SC7180_MASK (and by extension in
INTF_SC7280_MASK) results in this bit (and corrsponding operations)
being enabled for all interfaces, even the ones which do not have TE
block. Move this bit setting to INTF_DSI_TE(), so that it is only
enabled for those INTF blocks which have TE support.

Fixes: 152c1d430992 ("drm/msm/dpu: Add TEAR-READ-pointer interrupt to INTF block")
Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 1dee5ba2b312..162141cb5c83 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -101,7 +101,6 @@
 
 #define INTF_SC7180_MASK \
 	(BIT(DPU_INTF_INPUT_CTRL) | \
-	 BIT(DPU_INTF_TE) | \
 	 BIT(DPU_INTF_STATUS_SUPPORTED) | \
 	 BIT(DPU_DATA_HCTL_EN))
 
@@ -544,7 +543,7 @@ static const struct dpu_pingpong_sub_blks sc7280_pp_sblk = {
 	{\
 	.name = _name, .id = _id, \
 	.base = _base, .len = _len, \
-	.features = _features, \
+	.features = _features | BIT(DPU_INTF_TE), \
 	.type = _type, \
 	.controller_id = _ctrl_id, \
 	.prog_fetch_lines_worst_case = _progfetch, \
-- 
2.39.2

