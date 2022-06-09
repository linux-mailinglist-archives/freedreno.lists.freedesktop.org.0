Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5AA4544BB8
	for <lists+freedreno@lfdr.de>; Thu,  9 Jun 2022 14:24:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CABBE11BE86;
	Thu,  9 Jun 2022 12:24:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B1ADA11BE7D
 for <freedreno@lists.freedesktop.org>; Thu,  9 Jun 2022 12:23:59 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id be31so37740883lfb.10
 for <freedreno@lists.freedesktop.org>; Thu, 09 Jun 2022 05:23:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ZJYymURK1ooLEfSP/aqRxnY76lXz03RkU1O+1NjQuyM=;
 b=uDnry5WSdqH+pwItT/cc+DSFONG1148sG3cnJOUymCn4MtVCSkYzQzIwe6o3d6XRPh
 lPhG49tE9aUWAe0XD3Aw4qV9DJr4/q775qRROAhEcl5F32vZThdJL0DGd+8Rbo7st34z
 2B9n9arjnKi8MRnX3xAwoAQ/2QUrznAppuw3OyX9Nd/NwcPLejMMB/E9TLBdfdh8wmni
 lwzvAGmEd/v8V0aERPk8HMjzTQQteYO9NdyIFx9S/P32pNbsb/gnkBtYBqu2c9h4q5I4
 BzKjJlYrT1WOk3GwjzMnxiJkTx/82xVKfLIKZ1EkCiSuXnF0DVAs8Em2p2u/YJZQLtaE
 H7cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ZJYymURK1ooLEfSP/aqRxnY76lXz03RkU1O+1NjQuyM=;
 b=SOF4TPqBnedVy+q1fOJx96HbNWMs2etsle/UzWpQsu4YyT2Ouunl15IbjvhtFQ3ztZ
 hUQbpb3XeNj2u7UD7Yzvfn07dyP70oiE+aKin07sJTYpqOvAz1jEcElCJND9HnFxEwV/
 9Nu0Iq/fnt7vwqhshUWUsGhIyQIzAOe7/XwxVEzou7EweNgaqB50O0VH3H4Hw3H+qMjT
 8IgojvNTrJRNWXLFoPkpJcGbG54CAYKQyJY6t2UZNhTWxDrLNMnl/q7oX6BZ3Y03yaT8
 h54cnAclLpx6LKkmDjr3YEgxB2bCVcfkcANc1JYRonJVey8bmXJtI4qSSf29oVHqGC4r
 uwVg==
X-Gm-Message-State: AOAM533O8trEUSp2iI6PZUx4WmSNF2C1XPd2an/wSW57dlrVtBKh379Y
 VvVWFb0P29brws1ePiOA8mdIBg==
X-Google-Smtp-Source: ABdhPJzWBEDpXdjV9Ao8W/BgvF8xy/D2dXZWL8SxAJGm0ZX6vEp/+cwP9Ox1cWo4IGKtTGjclQMWrw==
X-Received: by 2002:a05:6512:4004:b0:479:1d77:4e43 with SMTP id
 br4-20020a056512400400b004791d774e43mr18884709lfb.537.1654777438019; 
 Thu, 09 Jun 2022 05:23:58 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 f11-20020a056512360b00b0047daa133decsm32421lfs.166.2022.06.09.05.23.57
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 09 Jun 2022 05:23:57 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu,  9 Jun 2022 15:23:43 +0300
Message-Id: <20220609122350.3157529-8-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
References: <20220609122350.3157529-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 07/14] drm/msm/hdmi: enable
 core-vcc/core-vdda-supply for 8996 platform
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
Cc: devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

DB820c makes use of core-vcc-supply and core-vdda-supply, however the
driver code doesn't support these regulators. Enable them for HDMI on
8996 platform.

Fixes: 0afbe59edd3f ("drm/msm/hdmi: Add basic HDMI support for msm8996")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 6d79f1b910a5..4ec55616a2e5 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -416,7 +416,7 @@ static struct hdmi_platform_config hdmi_tx_8994_config = {
 };
 
 static struct hdmi_platform_config hdmi_tx_8996_config = {
-		HDMI_CFG(pwr_reg, none),
+		HDMI_CFG(pwr_reg, 8x74),
 		HDMI_CFG(hpd_reg, none),
 		HDMI_CFG(pwr_clk, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
-- 
2.35.1

