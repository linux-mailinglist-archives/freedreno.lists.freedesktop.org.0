Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AD5B270B283
	for <lists+freedreno@lfdr.de>; Mon, 22 May 2023 02:42:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2FC210E221;
	Mon, 22 May 2023 00:42:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2201B10E21F
 for <freedreno@lists.freedesktop.org>; Mon, 22 May 2023 00:42:31 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id
 38308e7fff4ca-2af2b74d258so23792671fa.3
 for <freedreno@lists.freedesktop.org>; Sun, 21 May 2023 17:42:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684716149; x=1687308149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=zizt8T4/uGQMQCF98CdS8E/i3f6U3/IZeT/OtJdX66s=;
 b=Ko2WF4bTPQgM8qHFNknx1vVgzZg0edlLshC2M+6/GKzgLgqB71U4IcPyz+iD3WKIdF
 7XKHxZOIroeomHN8y5F26tF8V3O6Sv2W7KjkQY5avUHA8SmUPa7zFybS/saXmCaNnA5i
 EIf2eTAMV5fpjPwcPodzphfR8CJMoxZW1M6ePDw2Bc8Bxd5Cjt/JttI3oqdDAJLJaU4q
 f/Pj/W1LTxUlZVN2kkxWiGveWdpQOKIB/pm/DUbT69vweeiS4faOLSKRmTNaW5JXq/bK
 iHnCsFFpJj6R77KIN1j4V7mAP468rkZ7HX90YJQ7YBfnA6vxEtYzjGYfa3ocb3/3eBIe
 9vBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684716149; x=1687308149;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=zizt8T4/uGQMQCF98CdS8E/i3f6U3/IZeT/OtJdX66s=;
 b=cmXV6HwTe98Jq4oosWnlrT2fTr+4LxMtQK8cyqpbYuSNnavYZUmscaCXAW6jwxd+EJ
 /60Zu7eGuut2z+ymy0OixiU0NcdQmOG/tctJWMSMGcNoKuQ5UFlhdm8s4mxlIq5yxxI6
 a7aPnu3VfbYA56wSghLtmV7IPhYkp7X5GBuQlV4JatnGiRydzEpOSu8w0Z3oIdpMk1FQ
 54mV2AzaiPl1c6kULdIWPCutzeSHJ0Vhrj1Scn/R2ZCJWH/hz2KGLVAAeb+/KBMrt4/d
 l9q9nkyH/Rd3ruUHwwF8wh3oLSHi4xnC8sqJmA+RjHONcOkxy13GrBz3jhdHsMjS+VRk
 z5Cg==
X-Gm-Message-State: AC+VfDx5Z93o941S/h03N+3uPq5+pIEze2BR5IBUC5ppXFHsOo/GnCMv
 LD+ORNCC7dKh/1mk9WKR5q0/Q/RLrGTSR36T5TE=
X-Google-Smtp-Source: ACHHUZ6rje07H1eP9GoyQCx0cI/hiP57JvjtlDmK1E2FdKYtT/rMvIDiZxV3HUZlMJ8UQDWH5shcgw==
X-Received: by 2002:ac2:522d:0:b0:4f3:8411:f146 with SMTP id
 i13-20020ac2522d000000b004f38411f146mr3100721lfl.68.1684716149112; 
 Sun, 21 May 2023 17:42:29 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b15-20020ac25e8f000000b004f139712835sm768159lfq.293.2023.05.21.17.42.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 21 May 2023 17:42:28 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Mon, 22 May 2023 03:42:22 +0300
Message-Id: <20230522004227.134501-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230522004227.134501-1-dmitry.baryshkov@linaro.org>
References: <20230522004227.134501-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/6] drm/msm/dpu: don't set DPU_INTF_TE globally
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

Using BIT(DPU_INTF_TE) in INTF_SC7180_MASK (and by extension in
INTF_SC7280_MASK) results in this bit (and corrsponding operations)
being enabled for all interfaces, even the ones which do not have TE
block. Move this bit setting to INTF_DSI_TE(), so that it is only
enabled for those INTF blocks which have TE support.

Fixes: 152c1d430992 ("drm/msm/dpu: Add TEAR-READ-pointer interrupt to INTF block")
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

