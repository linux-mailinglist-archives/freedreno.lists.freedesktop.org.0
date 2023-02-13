Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id E8A446945A4
	for <lists+freedreno@lfdr.de>; Mon, 13 Feb 2023 13:18:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB03F10E593;
	Mon, 13 Feb 2023 12:18:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2FDB10E596
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 12:18:01 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id h4so14458522lja.2
 for <freedreno@lists.freedesktop.org>; Mon, 13 Feb 2023 04:18:01 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=list-id:precedence:content-transfer-encoding:mime-version
 :references:in-reply-to:message-id:date:subject:cc:to:from
 :dkim-signature:resent-to:resent-message-id:resent-date:resent-from
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7JwitY1QgTn2wW32f2EWY7DiZlNcao6/ffQYXSOSkgM=;
 b=oIAngI4ZNecXotkTf0l5XpRIXnO95SQrAjNDqZ5Jz28DBJbozXDWmzwIj+i9M+u9sT
 4f7+slha49OeKuOn4wPy9+kr6IyqMTSMWetAtlnojDMHlnWi+LjSqZPlcsvL2BdVHGkR
 EWoaO9xeVPAjnkMNdkUnak+G+2ZafCFoa3hyHkjrn2rjatKxA56dCb65Rans966M7ETA
 +CkvgkfN03aotJtzdGjpKwBDVe+zDTR2aY5P/fuJwVQZt373PFuD7xJsTS5o9GxJM4Be
 GqZylmJzr0FaIF0whTi+d3wIdMi1A9Xn/Yjc4QtNdFHaG3KWs2P083TLD22mYigqFHQP
 Y7dg==
X-Gm-Message-State: AO0yUKX42fYDPGkeyBWmhcAWigok5siU5nl3nLfMM12jVvg4LX3XVdUA
 ohVtboP1E6EdpWN2FsfMmchcTLxsBR8f2WYQ
X-Google-Smtp-Source: AK7set92evK266rwwB3v6ygvz36P3GS1u7+0CxwouqBToea3V1fhgRPLXejm4qW8+LOMzaHw7uQsDg==
X-Received: by 2002:a2e:9e48:0:b0:290:7fdc:82 with SMTP id
 g8-20020a2e9e48000000b002907fdc0082mr6007467ljk.17.1676290679923; 
 Mon, 13 Feb 2023 04:17:59 -0800 (PST)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 e24-20020a2e9e18000000b00293226d3d48sm2025212ljk.20.2023.02.13.04.17.59
 for <freedreno@lists.freedesktop.org>
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 04:17:59 -0800 (PST)
Resent-From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Resent-Date: Mon, 13 Feb 2023 15:17:57 +0300
Resent-Message-ID: <Y+oqdRI7oS4F1zLq@umbar.lan>
Resent-To: freedreno@lists.freedesktop.org
Received: by 2002:a05:7010:1829:b0:32d:ed3d:eb8e with SMTP id q41csp3112630mdm; 
 Mon, 13 Feb 2023 04:11:58 -0800 (PST)
X-Received: by 2002:a17:907:9c07:b0:8b1:fc:b1b0 with SMTP id
 ld7-20020a1709079c0700b008b100fcb1b0mr4241765ejc.44.1676290317998; 
 Mon, 13 Feb 2023 04:11:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1676290317; cv=none;
 d=google.com; s=arc-20160816;
 b=ua9AihqxeKLhneUS0KH4PxvLaOVPC9dXa+VyOnTIu74tesUlJoyOqNfK6aB0svSetU
 6ltS6BgEOhCgQj3nm3hYZPkn9eYfynPDjle/BxLrGArCAVkK+rgZMxf0WSnhFZ3SwEU/
 AZ8oF3PlF4gOX9iOcXhKAKNbWbIAEi2IkcbpX+JVqmNP9KhCYKXHI8oLJwZGvxo65AWr
 0YaVosjCJQpi7We1cwqJ/DW/G6w0NwV/Cpe1fKSxjsTXhTKoypy7JjaPLgZ8U//o+qCu
 rq6+XmRKI1JBNnP6uMTMc2Dq0iMdyDBC9EIdZgEd1TnJUo4Lwb4X5L6J3jql5xZZfYid
 lETg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com;
 s=arc-20160816; 
 h=list-id:precedence:content-transfer-encoding:mime-version
 :references:in-reply-to:message-id:date:subject:cc:to:from
 :dkim-signature;
 bh=7JwitY1QgTn2wW32f2EWY7DiZlNcao6/ffQYXSOSkgM=;
 b=dZWS3qkqroq+nVfQ9x3NU9+xuVGN4T4oEAdYFnls+oOtjigBHkG7t3ojUjjxpFvaVs
 pjI6Vr5AMTYkq/jpGYek8REAQnNYcGYvKivw0NYvTS7c67tABQJXxMGKC3UlbpVw3oyP
 u88oGOiIsd6gfpJKgNn/kKCwqrCXkMDLS0c22Cp9arPzkh09OjZSEpDHAUjKxhiZEd8D
 KUUOUa1nu0uWS0TB8UUk+7AQCrlka4/vtdsrxfZtBwiNgiGNnA2Bfdh7QvLxLizQEKhs
 kAjSOopclrJfP5gEr8GQ+t27mGU+NYPRgFJ5MW9PyO0h8luhf7I5CoQMHFc74rR2RhEL
 dO9Q==
ARC-Authentication-Results: i=1; mx.google.com;
 dkim=pass header.i=@linaro.org header.s=google header.b=hGvnAsUO;
 spf=pass (google.com: domain of linux-arm-msm-owner@vger.kernel.org designates
 2620:137:e000::1:20 as permitted sender)
 smtp.mailfrom=linux-arm-msm-owner@vger.kernel.org; 
 dmarc=pass (p=NONE sp=NONE dis=NONE) header.from=linaro.org
Received: from out1.vger.email (out1.vger.email. [2620:137:e000::1:20])
 by mx.google.com with ESMTP id
 wj6-20020a170907050600b008af34e8ec36si11980115ejb.69.2023.02.13.04.11.57; 
 Mon, 13 Feb 2023 04:11:57 -0800 (PST)
Received-SPF: pass (google.com: domain of linux-arm-msm-owner@vger.kernel.org
 designates 2620:137:e000::1:20 as permitted sender)
 client-ip=2620:137:e000::1:20; 
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
 id S229688AbjBMMLy (ORCPT <rfc822;vincent.guittot@linaro.org>
 + 12 others); Mon, 13 Feb 2023 07:11:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52022 "EHLO
 lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
 with ESMTP id S230380AbjBMMLS (ORCPT
 <rfc822;linux-arm-msm@vger.kernel.org>);
 Mon, 13 Feb 2023 07:11:18 -0500
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 028C21A49F
 for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 04:10:44 -0800 (PST)
Received: by mail-ej1-x633.google.com with SMTP id hx15so31237059ejc.11
 for <linux-arm-msm@vger.kernel.org>; Mon, 13 Feb 2023 04:10:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7JwitY1QgTn2wW32f2EWY7DiZlNcao6/ffQYXSOSkgM=;
 b=hGvnAsUOiAo8e5XcrV48vO8k565QbdVnV75roqlQVSvdFxJxTvTQOQLz7BHO+B50vI
 RHkrT0HDr85tVr/1L45VwNonktRigwIYL59ygol+VfkoyhnTD3w+yeCZvhD1uJ2e9f8w
 tysowusaNeRWUdr8mApnOVAULocSOn8iC4/f6Cuam+6iF2e+PzlmhVKBbKgL5UpxGKPT
 MTS0nHr2WnEN0UYLdk/Z3GYU+gngVviUfGLxq07nCwYVeQvoX4Ud5rZMOHzNxXb6aNkF
 nfUgNsL/YYHBQL8oRZCWZmPJrliqhgNkZkXvhlouoPRdaNiVvE2Y3so3NEUGqcA/5cBR
 LrYQ==
X-Received: by 2002:a17:907:9a0d:b0:8af:3fcc:2b05 with SMTP id
 kr13-20020a1709079a0d00b008af3fcc2b05mr14287763ejc.12.1676290240723; 
 Mon, 13 Feb 2023 04:10:40 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 dt19-20020a170906b79300b0088ed7de4821sm6651586ejb.158.2023.02.13.04.10.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 13 Feb 2023 04:10:40 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 agross@kernel.org, krzysztof.kozlowski@linaro.org
Date: Mon, 13 Feb 2023 13:10:12 +0100
Message-Id: <20230213121012.1768296-10-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230213121012.1768296-1-konrad.dybcio@linaro.org>
References: <20230213121012.1768296-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
 DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
 SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
 version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
 lindbergh.monkeyblade.net
Precedence: bulk
X-Mailing-List: linux-arm-msm@vger.kernel.org
Subject: [Freedreno] [PATCH v2 9/9] arm64: dts: qcom: sm6115: Use the
 correct DSI compatible
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 marijn.suijten@somainline.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Use the non-deprecated, SoC-specific DSI compatible.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm6115.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sm6115.dtsi b/arch/arm64/boot/dts/qcom/sm6115.dtsi
index bff067ed2e94..15811be82acc 100644
--- a/arch/arm64/boot/dts/qcom/sm6115.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm6115.dtsi
@@ -1447,7 +1447,7 @@ opp-384000000 {
 			};
 
 			mdss_dsi0: dsi@5e94000 {
-				compatible = "qcom,dsi-ctrl-6g-qcm2290";
+				compatible = "qcom,sm6115-dsi-ctrl", "qcom,mdss-dsi-ctrl";
 				reg = <0x0 0x05e94000 0x0 0x400>;
 				reg-names = "dsi_ctrl";
 
-- 
2.39.1

