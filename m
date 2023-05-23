Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 96EC170D5BC
	for <lists+freedreno@lfdr.de>; Tue, 23 May 2023 09:47:10 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A38D610E3E0;
	Tue, 23 May 2023 07:47:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90AE010E3EF
 for <freedreno@lists.freedesktop.org>; Tue, 23 May 2023 07:47:02 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id
 2adb3069b0e04-4f4c264f6c6so265106e87.3
 for <freedreno@lists.freedesktop.org>; Tue, 23 May 2023 00:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684828020; x=1687420020;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=uz91t5CPsz6QMWtRIYuzaeaGaQUSJIZo7OKNOwA96Nw=;
 b=UlwfKNSVJBhPxE30HjUkiApKtA4o/j+IQcgcgMlwf0oDC6YsygNnbZpJUblLGu7wIK
 BF9j/m8y6lXF19X/dpy1/NDKqBlaNp1eOpA/1NIfr5JMTe1121rfBVJBhrUl4ciud9Ji
 Zx3uvBnFjtko0vvvSjcZ+1nN6DuR+CaZNofDv3zHbMZST1aYDk1v0BCHps5rMICrt4px
 65tRnlJv2nZV5BQ4rCeNk8/K/dFn9zDl1BJkN3pY3o6v3U10YpLD7nv3EUK67cLzQWsC
 BKs4LH1E5db8UTtCvtKT/qnYtJSOu3nEtoLRlD3UVwQi5SZ2XqFCtZLTdcs8niN8OE9K
 nk5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684828020; x=1687420020;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uz91t5CPsz6QMWtRIYuzaeaGaQUSJIZo7OKNOwA96Nw=;
 b=YfdMpgih82MU2e9at9nuRzFFN8tHEAnDuF7CztLPQnQDOPmheES7VyaHL3fBsThtZS
 c0dzub3lTNBAZfW/EDq43nTYmZCVEYDCC35LfGBS6XwytN0BaTF6HH59MoRldmbSnqVE
 XL/8WXS5l24Tym8sD6t72G+husDZrOvJ0ixSO2xm4TDWtSjmTX51Nf86iHyQ2mb1w51s
 x1UHXxc2tvHP1CTp7KBn20bd4V2Ul/Vo7UFA1TgW4wZhpzxurGQwF/OGBbxGM47XVd0G
 2sFtfAD2I911DcI9Iyqcfv5xEoY9RaA7u6nTDbzFvHLInPY6E/fIHcHhDxjhFaB4Hekr
 Wxug==
X-Gm-Message-State: AC+VfDyVInJO1FFaabDSLobSMcJrRChiXb/1Ac3//JKLNBIYCyXfKdR3
 rMWAfqqwIr6OJtJZw1+m6FEJEA==
X-Google-Smtp-Source: ACHHUZ5kAF5uQSeuXgAPRImGMQR5VzZ/7OSgGpdEbGRQ+peABQ0DXcoD5LeeMzy346x6Cn0v/DN4vQ==
X-Received: by 2002:ac2:4c09:0:b0:4f2:74d3:8996 with SMTP id
 t9-20020ac24c09000000b004f274d38996mr4455935lfq.8.1684828020519; 
 Tue, 23 May 2023 00:47:00 -0700 (PDT)
Received: from [192.168.1.101] (abyk138.neoplus.adsl.tpnet.pl. [83.9.30.138])
 by smtp.gmail.com with ESMTPSA id
 t9-20020ac25489000000b004eb0c51780bsm1257070lfk.29.2023.05.23.00.46.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 00:47:00 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 23 May 2023 09:46:20 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230411-topic-straitlagoon_mdss-v5-9-998b4d2f7dd1@linaro.org>
References: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
In-Reply-To: <20230411-topic-straitlagoon_mdss-v5-0-998b4d2f7dd1@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>, 
 Joerg Roedel <joro@8bytes.org>, Conor Dooley <conor+dt@kernel.org>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1684828003; l=1022;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=Nh6zuYJI8gb14gxje6MmS/hbQSaIA3Eeoi75EfztoC0=;
 b=mwOMTHZtQczidymOKPTKW1hJ3k0Sfycwrop+S9790DYqps1onxdXRPHNXVFw+jMyTBbN68XRh
 O+ZzxbdzSd9AdFBeZSqcdaG2O5vRco+Dkni81Bj96yukCZc4ScXw/yr
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v5 09/12] drm/msm: mdss: Add SM6375 support
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
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, iommu@lists.linux.dev,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add support for MDSS on SM6375.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index 4e3a5f0c303c..05648c910c68 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -580,6 +580,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sc8280xp-mdss", .data = &sc8280xp_data },
 	{ .compatible = "qcom,sm6115-mdss", .data = &sm6115_data },
 	{ .compatible = "qcom,sm6350-mdss", .data = &sm6350_data },
+	{ .compatible = "qcom,sm6375-mdss", .data = &sm6350_data },
 	{ .compatible = "qcom,sm8150-mdss", .data = &sm8150_data },
 	{ .compatible = "qcom,sm8250-mdss", .data = &sm8250_data },
 	{ .compatible = "qcom,sm8350-mdss", .data = &sm8250_data },

-- 
2.40.1

