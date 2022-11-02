Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DDE5561719D
	for <lists+freedreno@lfdr.de>; Thu,  3 Nov 2022 00:13:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3590B10E55D;
	Wed,  2 Nov 2022 23:13:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22c.google.com (mail-lj1-x22c.google.com
 [IPv6:2a00:1450:4864:20::22c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1A95010E553
 for <freedreno@lists.freedesktop.org>; Wed,  2 Nov 2022 23:13:21 +0000 (UTC)
Received: by mail-lj1-x22c.google.com with SMTP id l8so183595ljh.13
 for <freedreno@lists.freedesktop.org>; Wed, 02 Nov 2022 16:13:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=6fqf25hkfoFdVnSBMn1JvQnvs90VTCg4NOOaAXI5pq8=;
 b=S/Qn87B4jnSh43bul90tVbTclkpZH/Y50HfauJztlau09yFmuoH1d8a1yyHe+uC36W
 DhgE78HyyH9C3yAS+M9EClBqIKclKGuMupTlCFSEr21/fHTUDVigVIrjTgAf4Rd4Nvym
 evat0hleuK3VJHMFXnp3xe8MjGJ/tqfkIYYIAsQdQ5mTretwovhNKYVGlMufVuK/vijb
 sp7GilUmoeRW90PLaH4bFFP2sSCKPO3kG4bPWNvMTROkEIKwBxV9uQhlC8tpMrWXF3FC
 FrTqZSUu2va1E3zB5r6HLB8k5bPaGkt6x801Z8eCeMfBrliHKOJ+VS6OViOrnN6FjvMR
 jCQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=6fqf25hkfoFdVnSBMn1JvQnvs90VTCg4NOOaAXI5pq8=;
 b=HzXcRaSTVkLcC7DABTJaNsdqwZJwLHkbR8gRfjP2YWiTDUg9T/IPXwHtos5WH7kSr0
 TJdHHmV5VxwA7huaF8/OfwMPvNU8WAhh1cmTHxL5jkRc5hmKrqD8rdkEOsdA0t9vGykv
 ws1V26jhd3IPJ100zaBVul6PPRvDudmNMugtvoJqpQD+Oe3yVCEQTbw/16LTqzJNQ/PA
 kd1KJaIZIZjJN0mgeQbdASaBO/lq2y3TZA+AdJaZjBcCCMmMsi38mJVsp3DPaHNjp9gX
 0+7u5/otW5tMrK4mfGlwZt5n/wVokfEgTcVpyFMt7aToR4FRD+59gKT1M1aNrWTdFaWZ
 4xMQ==
X-Gm-Message-State: ACrzQf1DGgVxuPDH9qvfikyREY6/FG8wzjxgYH6f6g1wx31C0Fbf85Nn
 ZKhu2+OsJHPZWKQsjMMAuGHKog==
X-Google-Smtp-Source: AMsMyM62Nxy/dRZPZAs2gcgoUqkXQxFxmZiU7olOjBRCzkBHDJDDMj7lCMuIOg7k31mvS1+VKomMdw==
X-Received: by 2002:a2e:a48f:0:b0:277:6102:5561 with SMTP id
 h15-20020a2ea48f000000b0027761025561mr5570227lji.67.1667430798748; 
 Wed, 02 Nov 2022 16:13:18 -0700 (PDT)
Received: from localhost.localdomain ([195.165.23.90])
 by smtp.gmail.com with ESMTPSA id
 m6-20020a056512114600b004b0a1e77cb6sm1636134lfg.139.2022.11.02.16.13.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 02 Nov 2022 16:13:18 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu,  3 Nov 2022 02:13:09 +0300
Message-Id: <20221102231309.583587-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
References: <20221102231309.583587-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 8/8] drm/msm: mdss add support for SM8450
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

