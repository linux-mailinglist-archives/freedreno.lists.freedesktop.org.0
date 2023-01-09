Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E997662175
	for <lists+freedreno@lfdr.de>; Mon,  9 Jan 2023 10:26:56 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB49510E395;
	Mon,  9 Jan 2023 09:26:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com
 [IPv6:2a00:1450:4864:20::42f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3BB5010E393
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 09:26:47 +0000 (UTC)
Received: by mail-wr1-x42f.google.com with SMTP id z5so6427388wrt.6
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jan 2023 01:26:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rC1HixjrwVN9Qc0qid0oTivyKuzDUPdxp8z39RQ72Wo=;
 b=WCSTQ9fE7LeKldP5+7GocbbKTVHoX/d8InfYfMZRlbNol+MYwWcaNiBXl7GbiuWwhR
 bzVndpVTf3vfMDa/M6/bkeZZLfBe2xzuShKVFxgcyeSty4aaKRsgw5oGBKLZMabeD3nh
 IPT72zACPbO46ASTp4zicPPmdiDx3bMs341v9C/S2XjufaOs8VGF47L6qEi0b3KqaHeE
 hsGWCZaDK8JtLW1/XLTC5JfPFlfjA3d+9MI3sQOGMAO6HXi6YKlRvcZGLUkbd9kRk4vl
 No7fFvcO7s+J+h74KM1a17bxGK8BiD5nOCiGhvPPZi0GmeGrf0+kFN2nSC0HHU6aXl04
 sy4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rC1HixjrwVN9Qc0qid0oTivyKuzDUPdxp8z39RQ72Wo=;
 b=r0AwQuNLNVlOLEmSxZyiU5nbXK1jlJ4b5VaaI4ByhuyAbUzGifGpO+ohSGrmM93zX+
 CMNXHm0Ycn29175q3wR6mqn5weGi61/B/5gpHOZD1vz/obQWZU7YxPO1eSjkRF7R6UFw
 e1VjFewLSAjM/EYoaW4FhZXmx7Z7B6Fca2hJbboXVH8W5fOU6gvGD2QRqM8gYHpou1iQ
 RG+BRQz14H6HNoUFxlRmbPTMnfXxVqdKi8dEA2OhnWQiiSBZz5DPgoYT6zIbgv+FNCuN
 lDgNFtgXsYXQ7Qte4BR6RKLd44i4tqKSCNgUZaB0ISTUESVXQpaP53U9Z4M/mXObIAqN
 oRzg==
X-Gm-Message-State: AFqh2kpNw9/Pu1zLPNLuYJKegQKXSNSVe5TTCavieTImM+7jG+xbj5ea
 z69ANeawDg5LwEmaDLegghl2bg==
X-Google-Smtp-Source: AMrXdXu4ne+cM168gcr5bsxq+9YaFJqprFI6YALoEk7kMsZ6KWiYfgjoLAmIbIm8Z4otE/XGn09ObA==
X-Received: by 2002:adf:e8ca:0:b0:2ba:bd95:e3b1 with SMTP id
 k10-20020adfe8ca000000b002babd95e3b1mr9260409wrn.29.1673256405383; 
 Mon, 09 Jan 2023 01:26:45 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 s23-20020a1cf217000000b003d1e3b1624dsm15195758wmc.2.2023.01.09.01.26.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 01:26:45 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 09 Jan 2023 10:26:37 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230103-topic-sm8550-upstream-mdss-dsi-v2-5-87f1c16d7635@linaro.org>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v2-0-87f1c16d7635@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v2-0-87f1c16d7635@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.11.1
Subject: [Freedreno] [PATCH v2 5/7] drm/msm: mdss: add support for SM8550
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Add support for the MDSS block on SM8550 platform.

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/msm_mdss.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/msm/msm_mdss.c b/drivers/gpu/drm/msm/msm_mdss.c
index f9ef5085041d..02646e4bb4cd 100644
--- a/drivers/gpu/drm/msm/msm_mdss.c
+++ b/drivers/gpu/drm/msm/msm_mdss.c
@@ -297,6 +297,7 @@ static int msm_mdss_enable(struct msm_mdss *msm_mdss)
 		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 2, 1);
 		break;
 	case DPU_HW_VER_810:
+	case DPU_HW_VER_900:
 		/* TODO: highest_bank_bit = 2 for LP_DDR4 */
 		msm_mdss_setup_ubwc_dec_40(msm_mdss, UBWC_4_0, 6, 1, 3, 1);
 		break;
@@ -532,6 +533,7 @@ static const struct of_device_id mdss_dt_match[] = {
 	{ .compatible = "qcom,sm8250-mdss" },
 	{ .compatible = "qcom,sm8350-mdss" },
 	{ .compatible = "qcom,sm8450-mdss" },
+	{ .compatible = "qcom,sm8550-mdss" },
 	{}
 };
 MODULE_DEVICE_TABLE(of, mdss_dt_match);

-- 
2.34.1
