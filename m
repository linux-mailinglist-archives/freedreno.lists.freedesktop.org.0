Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8B05C85BE74
	for <lists+freedreno@lfdr.de>; Tue, 20 Feb 2024 15:16:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEA4010E469;
	Tue, 20 Feb 2024 14:16:23 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="lWH8Q4Zj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
 [209.85.208.42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DDA210E451
 for <freedreno@lists.freedesktop.org>; Tue, 20 Feb 2024 14:16:17 +0000 (UTC)
Received: by mail-ed1-f42.google.com with SMTP id
 4fb4d7f45d1cf-564a05ab3efso2499126a12.0
 for <freedreno@lists.freedesktop.org>; Tue, 20 Feb 2024 06:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1708438575; x=1709043375; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=fuyUU3yi15kmc0JQ2NK+KRF8Ebxp3j+SrJjLGk5UHWE=;
 b=lWH8Q4ZjRUSibCdG6fZOdmiy5zncuO1VWQfKS1N1wm1T2/eShUgd+kx4j9X5Ptu1hJ
 s5PxpC9yfmagxVcLdjI+hF+ITraGKHYmQPv7PSrSJR4exchfvxIyRcMgEZWrV2jvG678
 J4VwAIxfZbV3xrRaonVwki4utUnWHRi1ai/x461xaqp8DU3bihpNHjWTaly/HdqgeNlB
 N5teRklcGk2wH7ed/G5xOwJf967gU+ciHe9WbTdXOsVXvSv5Yg4yLSDSSYhnI6YJzxxJ
 v9oiAaa+A59/WjbGkEkR8oxcRKnKebQyEaJhl72AFt9+UBYtGKd+mUDo/5Mqcv4KZ6Zj
 BeNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1708438575; x=1709043375;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=fuyUU3yi15kmc0JQ2NK+KRF8Ebxp3j+SrJjLGk5UHWE=;
 b=k+5dGrGFpM1iJuInYDe4SohvglVfFFMI89/WvD+HSvNh4LuWG5CaqTuJxSdMOJ9Zrl
 QUc/kBJOA/NYjKTWXVL+oa5lTEqPSUGeTppBa/46AsXMkDh47nwLF/WoWgkEV85CxkfR
 QPyeLHmmE6WgBZ9jVAeNSsEavHUXVrlKlo0GXqbCcQ4BtC9N5+A5me+66RfOx6klnBAx
 LI9BmhIZC78WFBJBxkpNFlmtqJ6nMUsafSuXMQBQLmlr/HdcnAbNc6p2TTODYwxVNixb
 z4DJx1mTrQ7HzBE3/Xt7Rc35ECRDLMpymOldDByA8okNCUDJ+jhepHFlqeNlU8ET6BI4
 qKog==
X-Forwarded-Encrypted: i=1;
 AJvYcCUlvTQ9hmp5pD0k7QE8IAdsn+7kD8zu0+Fw9AJnVAK5ZZCb6H45HbV5mkXTVDaYhda0Ph6hSU4Hae/f5X4IkeHsDbH8d0BJDFVEHo8ihfbJ
X-Gm-Message-State: AOJu0YxuCZeezU5UHmkjZ4sP+t5eT3XrmLj6eUGY5JPiB4gzR0lEghXd
 lWBkmW1LCSzd094RyWG5k98NJhFWnOyJDE+PnfF+QQSQ9dbwe+NobXSWqPqp+2o=
X-Google-Smtp-Source: AGHT+IECUFBhZGWCW/eOe/rUJ51UGWQ5S19p4bZtDBtlo6u0dqqv5FQRLFS6KHy59qUVzGO1BibIQQ==
X-Received: by 2002:a17:906:48d6:b0:a3e:eb81:ab62 with SMTP id
 d22-20020a17090648d600b00a3eeb81ab62mr1923965ejt.7.1708438575151; 
 Tue, 20 Feb 2024 06:16:15 -0800 (PST)
Received: from [127.0.1.1] ([188.24.162.93]) by smtp.gmail.com with ESMTPSA id
 s8-20020a170906500800b00a3de4c7bf00sm3998534ejj.79.2024.02.20.06.16.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Feb 2024 06:16:14 -0800 (PST)
From: Abel Vesa <abel.vesa@linaro.org>
Date: Tue, 20 Feb 2024 16:15:58 +0200
Subject: [PATCH v4 3/4] drm/msm: mdss: Add X1E80100 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240220-x1e80100-display-v4-3-971afd9de861@linaro.org>
References: <20240220-x1e80100-display-v4-0-971afd9de861@linaro.org>
In-Reply-To: <20240220-x1e80100-display-v4-0-971afd9de861@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Abel Vesa <abel.vesa@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1429; i=abel.vesa@linaro.org; 
 h=from:subject:message-id;
 bh=u2lRwHQr+DNTmD6MOY+Hc1uiaIEemJ6XjPTAocMI6pg=; 
 b=owEBbQKS/ZANAwAKARtfRMkAlRVWAcsmYgBl1LQmpwQCwaM7h86l7n/lgwLER6BCHp8FIaw4s
 fSeFtMTqzKJAjMEAAEKAB0WIQRO8+4RTnqPKsqn0bgbX0TJAJUVVgUCZdS0JgAKCRAbX0TJAJUV
 Vmd0EADFMcoAAj5UThHklCNqyD/WAnBBW1CRjsolukiODmf2oSbkcpO9G6XiedqbIBOh/kavUsG
 7FlOh8qlEo1gR1CY4UUwRlQODaCbfMgzYqlh4gchEPmSubydMkZMCOPI51V8NiN382TRCGB5fg/
 2V4tb91dybOb8pVOrOhXfAO/Fs/rOY9deJIGCvWDinV1A1afxLR7Lng2iUefVHJnQWIDxGLdqMu
 OTt5x/e7Mt+GE9yMPpu95CJWIO0gh7B5EnHWDDkxfC2ZaOe3rbiA8s7eYYPYX0ZTMTAO3V13cZt
 iqzxigN9D76pKtpT4V0n9IiDxCh5RofR4mB52tpc9m7HPcAV3iqzrz+d7EQhhQ/LC7IrORFWZ48
 X7s/cgawdWVoustKBZTufdlXGuchGIS2uisf2o23Jy81Of85ajUP7O6Rs6h6gID6PjU7P8aayjQ
 B75tUOWme28NLtaWnD24Wo3lW9HBdDyudt02y+DL1CYDdarSy8EQMotu1zMMUT+Bpx/yhWVEgGW
 tjmUe2av10CCV6DQWdIhLR36b9CJAKsdiLR4iyXxUxeiE1wdgmGuhYipSa1oP7x6ro58g3RsYnY
 j0qxH8yewcX+e2o8xEAhgzykYOoxysKm8JrxA4mbJVJflcRfGW2TFArf9zM0mg9TUxrP30ojNNH
 xTCm/e2pakgsFrQ==
X-Developer-Key: i=abel.vesa@linaro.org; a=openpgp;
 fpr=6AFF162D57F4223A8770EF5AF7BF214136F41FAE
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

Add support for MDSS on X1E80100.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Abel Vesa <abel.vesa@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 65657230bbff..fab6ad4e5107 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -687,6 +687,18 @@ static const struct msm_mdss_data sm8550_data = {
 	.macrotile_mode = 1,
 	.reg_bus_bw = 57000,
 };
+
+static const struct msm_mdss_data x1e80100_data = {
+	.ubwc_enc_version = UBWC_4_0,
+	.ubwc_dec_version = UBWC_4_3,
+	.ubwc_swizzle = 6,
+	.ubwc_static = 1,
+	/* TODO: highest_bank_bit = 2 for LP_DDR4 */
+	.highest_bank_bit = 3,
+	.macrotile_mode = 1,
+	/* TODO: Add reg_bus_bw with real value */
+};
+
 static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,mdss" },
 	{ .compatible = "qcom,msm8998-mdss", .data = &msm8998_data },
@@ -707,6 +719,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sm8450-mdss", .data = &sm8350_data },
 	{ .compatible = "qcom,sm8550-mdss", .data = &sm8550_data },
 	{ .compatible = "qcom,sm8650-mdss", .data = &sm8550_data},
+	{ .compatible = "qcom,x1e80100-mdss", .data = &x1e80100_data},
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);

-- 
2.34.1

