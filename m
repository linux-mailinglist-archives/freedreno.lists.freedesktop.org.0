Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5754A736B42
	for <lists+freedreno@lfdr.de>; Tue, 20 Jun 2023 13:43:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E05D10E2C9;
	Tue, 20 Jun 2023 11:43:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12d.google.com (mail-lf1-x12d.google.com
 [IPv6:2a00:1450:4864:20::12d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FC5310E132
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jun 2023 11:43:30 +0000 (UTC)
Received: by mail-lf1-x12d.google.com with SMTP id
 2adb3069b0e04-4f86fbe5e4fso2915932e87.2
 for <freedreno@lists.freedesktop.org>; Tue, 20 Jun 2023 04:43:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687261408; x=1689853408;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=2FQGGkAc9RxTjTrS8MIbdtUiqKpEsk3KUOOFA9RhmnQ=;
 b=UBGl3xSqm1baAnA97pS7lBBrNA4ONxeaCJa+M413+97WO1aQ0VW99QzpXFl7Sieghl
 jmqWghz03MUDY3j6YwlU7qmAcxOrwgVAFzXyY/UGF3IdayyKZDNLQmrw4coRsBsoXhqO
 ffko/DlMu4McGyaKZmiEpNH4ytqMR+Fb28HnnBTyVsNWc38WjKbLVuBZgzR5LrGjna3t
 SS0V1ekAJD63spTAl1SCypaK/oUeZwVzBEbrRzB3lw2tKWY/Zz1b59gdVZv7ja1FZB+u
 VOD9x0u62SEEf/tU3PD7Ms8ekw3sSd2QHc3JCNtFhDJI6FBKOylY8o9kOQGFxTu/C93A
 PE3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687261408; x=1689853408;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2FQGGkAc9RxTjTrS8MIbdtUiqKpEsk3KUOOFA9RhmnQ=;
 b=JuLOQgaP4A/07GSP8pX7THxD3oa2FejpSk+uCkbTtVhUwcH+csCKs/YMopgYpHHsFF
 +peSj9iI5y8Yykfe/rU6QwafWGnI7XYp2WvEub1H0aj8SOXqBypxxc8ROj0D5kT5TI5z
 zkMVIq0Xb6/qVmy3v8pLeQZfmtXMJTrTtAQPXmzrsjcEMjTlIKpJBZ+TEK7HVi2c1kY+
 skDtErZ0tdVkQQjIsGxmRswY2CNeT9kK5HK+whIdMGUIfoz/Es1KhkguBRxcl7f8ZPAK
 IeyFPBYKQ1LLrUBWZiKOHpMhod/i6sNJBeNClF+/UEcHqzy8jLjB5XZygaviMtQkHAIU
 xuRQ==
X-Gm-Message-State: AC+VfDwbDANVrbwAK8hOxil1WoyY7Z3lI1BtqvA4zNsix63UHDaHEbBK
 HPMfhy8vpGUX5dmEyINXrRFbhw==
X-Google-Smtp-Source: ACHHUZ6TnekcsLa2wNSkMKjz2BwqGb90LgHv+cwbK+WYjf0k2LYG1JqoXMGbp84Q5l4knz5sIbcHtQ==
X-Received: by 2002:a05:6512:3109:b0:4f8:6534:9a5f with SMTP id
 n9-20020a056512310900b004f865349a5fmr5445370lfb.36.1687261408408; 
 Tue, 20 Jun 2023 04:43:28 -0700 (PDT)
Received: from [192.168.1.101] (abxj193.neoplus.adsl.tpnet.pl. [83.9.3.193])
 by smtp.gmail.com with ESMTPSA id
 v17-20020ac25591000000b004f640b0fb04sm324158lfg.212.2023.06.20.04.43.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 Jun 2023 04:43:28 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 20 Jun 2023 13:43:20 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230620-topic-dsiphy_rpm-v2-1-a11a751f34f0@linaro.org>
References: <20230620-topic-dsiphy_rpm-v2-0-a11a751f34f0@linaro.org>
In-Reply-To: <20230620-topic-dsiphy_rpm-v2-0-a11a751f34f0@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1687261406; l=890;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=buVQjKrJgv7wbUnC7ZgzaKf+8COn6Ol+mrW/ngymkWo=;
 b=/85q0mWQJ5T3oFFwScs4/F3tDkZu+UWJLiVNpaitT9ghjNJivTGYrvtDPlQA8FRkDIregMkuD
 0uOuTGShsmHBq/dKjr5gKhHVyS6+UPlN8aV2qZqbHD0Rypalbpc56MS
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v2 1/2] drm/msm/dsi: Use
 pm_runtime_resume_and_get to prevent refcnt leaks
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
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

This helper has been introduced to avoid programmer errors (missing
_put calls leading to dangling refcnt) when using pm_runtime_get, use it.

While at it, start checking the return value.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
index 9d5795c58a98..2f319e0eb74f 100644
--- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
+++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy.c
@@ -516,7 +516,9 @@ static int dsi_phy_enable_resource(struct msm_dsi_phy *phy)
 	struct device *dev = &phy->pdev->dev;
 	int ret;
 
-	pm_runtime_get_sync(dev);
+	ret = pm_runtime_resume_and_get(dev);
+	if (ret)
+		return ret;
 
 	ret = clk_prepare_enable(phy->ahb_clk);
 	if (ret) {

-- 
2.41.0

