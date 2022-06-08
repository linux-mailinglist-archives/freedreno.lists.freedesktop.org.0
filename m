Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A4F06542FC9
	for <lists+freedreno@lfdr.de>; Wed,  8 Jun 2022 14:07:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CA83C10FB0D;
	Wed,  8 Jun 2022 12:07:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4A7D10FB09
 for <freedreno@lists.freedesktop.org>; Wed,  8 Jun 2022 12:07:36 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id be31so32919433lfb.10
 for <freedreno@lists.freedesktop.org>; Wed, 08 Jun 2022 05:07:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=ORFFh/OvwkdHyQw6T41fKq8t4AfCf6S/1IDmxoyQ/4c=;
 b=wDi7mI3wFjv+MqE1wKSSFLB8GGcxe+vfPK0vtxw3GUBXmzYkA/1Ov4rnTQCOrdFvDa
 WCzA7ufrcjUn0xLCY/pr3hTjPeVdsyGB9vWa5KJgx5aunKyFtxRuLFRTHcfrW8ULQWlQ
 4qWFCkoe1mX4vdziltcPI5wegX7NYuzr0s5aOmZ0X1YcuBP6ywgxzn6J7a8glXk2SJFC
 VYLo348CEhpBzGjZoPACRRXcnYOvnTHSLwmv9sx1zluWS4s0XHjVhVcY2tQ+Y0Onsca+
 ZR5pADzA/lyp4L3d9SFlzEi8MQT0ezCXnaBh+C8UeidMrEZfper3ZItUBagrFi3sRMRI
 pLHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=ORFFh/OvwkdHyQw6T41fKq8t4AfCf6S/1IDmxoyQ/4c=;
 b=Y4hVh+XSOR3gdy6+XTHrNc7VN7JhO9mCmidmT7XGg42/pq9eJ+7PplAJFAwGU8+tbE
 kS5SAyJPoAvmFSxLdxsgFTlolxdBpRVwNv3KFhKI+R+sDuKClhh7rKTZSIa7Ncrqcama
 TcOlUvHDNsLwBInQWdgzvnJVhKd5mt15w6QtwQLSn23x98u4pcmUvHAh3ofVfElRtN6a
 aRMuVc4+QR5iLl3n6X9ZsWw0b2hHm/5qWxAHJhc0GS2VATIRji1JGBkR5kqh6LaVVYjC
 gdAxqqE27/6ANukI2kewV6MpHKpVJR5BN6xVM8JctZ5LYVcCmEnY7XiDjyYM0PdlaOus
 Gx1A==
X-Gm-Message-State: AOAM533iItWaAZDwyS9oWX3kbT7TaLyH+127Wa+z5sSbBgyZFcjAlUJg
 x91jEnNIyCy43H2O3zsVaAGj4A==
X-Google-Smtp-Source: ABdhPJy+dxO/IWKY0573dyyNPc6FWVijcUPdMYkPtITz4qJPlvq4+Y19DzS2iPFWw9L8FlKp3vWCTw==
X-Received: by 2002:a05:6512:53a:b0:479:1725:51f2 with SMTP id
 o26-20020a056512053a00b00479172551f2mr18043645lfc.688.1654690054546; 
 Wed, 08 Jun 2022 05:07:34 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 4-20020ac25f04000000b0047b0f2d7650sm52049lfq.271.2022.06.08.05.07.33
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 08 Jun 2022 05:07:34 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>,
 Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed,  8 Jun 2022 15:07:20 +0300
Message-Id: <20220608120723.2987843-10-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
References: <20220608120723.2987843-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 09/12] drm/msm/hdmi: drop hpd_regs usage on
 8x74/8084
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

The MSM HDMI driver has support for hpd_regs on 8x74/8084: supply
regulators that are to be enabled for HPD to work. Currently these
regulators contain the hpd_gdsc, which was replaced by the power-domains
support and hpd-5v/hpd-5v-en, which are not used by the chip itself.
They power up the ESD bridge.
However it is a separate device which should be represented separately
in the device tree.
None of upstreamed devices support these properties. Thus drop support
for them from the HDMI driver.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 5 -----
 1 file changed, 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index ebc87f2a626c..bc6ec6aa2cb9 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -364,24 +364,19 @@ static struct hdmi_platform_config hdmi_tx_8960_config = {
 };
 
 static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char *hpd_reg_names_8x74[] = {"hpd-gdsc", "hpd-5v"};
 static const char *pwr_clk_names_8x74[] = {"extp", "alt_iface"};
 static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
 static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0};
 
 static struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(hpd_reg, 8x74),
 		HDMI_CFG(pwr_clk, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
 		.hpd_freq      = hpd_clk_freq_8x74,
 };
 
-static const char *hpd_reg_names_8084[] = {"hpd-gdsc", "hpd-5v", "hpd-5v-en"};
-
 static struct hdmi_platform_config hdmi_tx_8084_config = {
 		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(hpd_reg, 8084),
 		HDMI_CFG(pwr_clk, 8x74),
 		HDMI_CFG(hpd_clk, 8x74),
 		.hpd_freq      = hpd_clk_freq_8x74,
-- 
2.35.1

