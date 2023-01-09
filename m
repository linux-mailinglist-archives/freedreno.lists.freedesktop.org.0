Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2ED4E6622C7
	for <lists+freedreno@lfdr.de>; Mon,  9 Jan 2023 11:15:41 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0549710E3C4;
	Mon,  9 Jan 2023 10:15:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x334.google.com (mail-wm1-x334.google.com
 [IPv6:2a00:1450:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FA9189BEC
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 10:15:27 +0000 (UTC)
Received: by mail-wm1-x334.google.com with SMTP id
 k26-20020a05600c1c9a00b003d972646a7dso8588723wms.5
 for <freedreno@lists.freedesktop.org>; Mon, 09 Jan 2023 02:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=rC1HixjrwVN9Qc0qid0oTivyKuzDUPdxp8z39RQ72Wo=;
 b=hrmmo8SfG3rmXaOE36H7v1YZqukMDa8MI8vpJRCx1CnZUlDPVo4sgTKsZe1EhicxGD
 Z7j3yv3t4IwRwCg0bPqLbt6upC4ABF6iKrwi+JCLHHa8GbiszajKnYfB9HrG6RKq9aXu
 rtVmJ/dFAKn6rp2DYq0toXAi01/YKxFGPs3WaVoSjq42zDs6FHcS1TbW/L4jN4lKB7/t
 lQBG6pawRi49WYYRWKs0yfLFWRMK7D2XSuYhWHkPU64igHOINl1a51eELIICdiX+HK5g
 2yapJv5ar9Jusxmy9ObnGiIbh9enqvpkD3xvOgnsA8XpFyBhHvtAjACkUDQNRds+F2kz
 Px8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=rC1HixjrwVN9Qc0qid0oTivyKuzDUPdxp8z39RQ72Wo=;
 b=HFRk2Mz0jqet6aMy1nWPN7GnxLYZlJ+HhxTKLLRt4O5SZS8kBlWPwdncyoiVpa/bN7
 xg4rGjSPSwmS5GQxkbXgw84RHtUT+HvAeJzKPZ0fKBxO1tFiWhJ4R53iGqApqQUTXXlW
 bSEGcVpU59iwuFgGY3oTRwomn3k4TuRWxUcfuL8jXl/q8N4xaPJNiFfBD3LKIwW714UH
 cYot3iLTl71fUZNdHWExRO9+WzOTLbmequaHln6H+Z5ncDUHQCPhxUl+rwzyerMZ6Ur8
 DtyzwXESoWMhAxOxXdP/K/S9SnFiIGQ6gWgxKiLP2tp5vFu4LoYUXyulzSY+aLOS4Mno
 t3Mg==
X-Gm-Message-State: AFqh2kqsPs+hrte1slVjqP3zvS8JDEZFZL845dtzCTprIEEJBrTV1sUN
 wf3L6SrHAsZWlM2NYM9BT+z7cA==
X-Google-Smtp-Source: AMrXdXvN9kPFfEkhuEuShiZhptcP7yVgJq6IbPS8mOT9HkvcQPU81vvmcJtpG//3N6IhBs5RiJbKnw==
X-Received: by 2002:a05:600c:1c90:b0:3cf:75a8:ecf4 with SMTP id
 k16-20020a05600c1c9000b003cf75a8ecf4mr46102577wms.24.1673259325399; 
 Mon, 09 Jan 2023 02:15:25 -0800 (PST)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 h10-20020a05600c2caa00b003cfd58409desm15815376wmc.13.2023.01.09.02.15.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 09 Jan 2023 02:15:25 -0800 (PST)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Mon, 09 Jan 2023 11:15:21 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230103-topic-sm8550-upstream-mdss-dsi-v3-5-660c3bcb127f@linaro.org>
References: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
In-Reply-To: <20230103-topic-sm8550-upstream-mdss-dsi-v3-0-660c3bcb127f@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Jonathan Marek <jonathan@marek.ca>
X-Mailer: b4 0.11.1
Subject: [Freedreno] [PATCH v3 5/7] drm/msm: mdss: add support for SM8550
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
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
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
