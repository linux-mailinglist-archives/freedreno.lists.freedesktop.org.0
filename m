Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B378634AC5
	for <lists+freedreno@lfdr.de>; Wed, 23 Nov 2022 00:13:14 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AA24410E49B;
	Tue, 22 Nov 2022 23:12:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22e.google.com (mail-lj1-x22e.google.com
 [IPv6:2a00:1450:4864:20::22e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 291E710E49C
 for <freedreno@lists.freedesktop.org>; Tue, 22 Nov 2022 23:12:48 +0000 (UTC)
Received: by mail-lj1-x22e.google.com with SMTP id a15so19579091ljb.7
 for <freedreno@lists.freedesktop.org>; Tue, 22 Nov 2022 15:12:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=qFfDzv26PSPKle35bbHIudwu2pfLnHezdaMAAf4+MDM=;
 b=nwxlyA1Xsbv6cMVS7Mv0sDdhBWe3BPRMqqQPClaVQRosWTBMMf6vRuBEF/NTd2epGQ
 U6UOdUNSe2D94YU15MhC1b/YCMLo/VFofkz0Lw46S9GXzTkV52AwPTxTojY1mBkqtMiS
 WyC807k5cKG/FjNHcbUagATFiJpt4ySVNhoWfJMBTLaZK3aeZoOWWbaOI6Vaa+33jVv0
 YW+p/ce8IE0g6zJuXoMsW5f1/RnPPTfhQh+v8yX9mmcac1NSAhLpmk4dCOsMhnFHK1U/
 iie5dOccED+XXfjYbyVD/X6rjJuHUj1AWFmQrPFfJUESEmSokcjCoc06QWvI1xUUJoWd
 gSGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=qFfDzv26PSPKle35bbHIudwu2pfLnHezdaMAAf4+MDM=;
 b=0n81dnVj3N5wYNft6Urugfj7RpmLeBuAyyv5Ubhl7lAy5TSqNQY79TyObKuIFJdO3r
 VXl2KTyQNeGNkdtpFKhiviJR3zeyi0OW6J8cqRlIAhxwkmdKqi5byfhAlEekZlnqAhPR
 bFRkRc5bV80pWosJytjVpWxQ2eNE990hb8mbQ3FowBos6tV2Em38+QHZ9/YrJ7bD/U8o
 yQkrU50wTAzFbLFWocmlyBsIzp3qYb6UgTu8fiEAxY6khoGGUJV4s50punFB7QOBjfAv
 QNdI8UZnX9OU8oLW5DK6US0YpkmIAbdcl/aUF5LjUFMEU53S4Bq1/Pi2NlXZU5hmY+GJ
 tyBg==
X-Gm-Message-State: ANoB5pmB9M+h1XTeiCmnZLjxcp5yZxsq7Y9NEMLZOoirnKrZN7mRO58J
 L4Gni5D/H8baOoyqIq71uZxHkw==
X-Google-Smtp-Source: AA0mqf7SgQkkPErJqPAXl40ZPkuumJgRT4JLyzqbnc46KHQnuZYFQkLJJakcJsaFJL3VjfxaIM78IA==
X-Received: by 2002:a2e:a594:0:b0:277:4150:b560 with SMTP id
 m20-20020a2ea594000000b002774150b560mr2258472ljp.299.1669158765084; 
 Tue, 22 Nov 2022 15:12:45 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (dzpbkzhtyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:8a1a::1])
 by smtp.gmail.com with ESMTPSA id
 q18-20020ac246f2000000b00497feee98basm2617541lfo.274.2022.11.22.15.12.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 15:12:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 23 Nov 2022 01:12:34 +0200
Message-Id: <20221122231235.3299737-12-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
References: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 11/11] drm/msm: mdss add support for SM8450
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Vinod Koul <vkoul@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add support for the MDSS block on SM8450 platform.

Tested-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Vinod Koul <vkoul@kernel.org>
Reviewed-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 6a4549ef34d4..5602fbaf6e0e 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -283,6 +283,10 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 	case DPU_HW_VER_720:
 		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_3_0, 6, 1, 1, 1);
 		break;
+	case DPU_HW_VER_810:
+		/* TODO: highest_bank_bit = 2 for LP_DDR4 */
+		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
+		break;
 	}
 
 	return ret;
@@ -511,6 +515,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sc8180x-mdss" },
 	{ .compatible = "qcom,sm8150-mdss" },
 	{ .compatible = "qcom,sm8250-mdss" },
+	{ .compatible = "qcom,sm8450-mdss" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);
-- 
2.35.1

