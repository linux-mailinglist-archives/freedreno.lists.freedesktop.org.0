Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BC3B2634ABE
	for <lists+freedreno@lfdr.de>; Wed, 23 Nov 2022 00:12:55 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E83610E494;
	Tue, 22 Nov 2022 23:12:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1511310E492
 for <freedreno@lists.freedesktop.org>; Tue, 22 Nov 2022 23:12:41 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id d6so25730055lfs.10
 for <freedreno@lists.freedesktop.org>; Tue, 22 Nov 2022 15:12:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=1JSEDSNjhfy5FuCupdNXYQlqb25p5cAnBD74WVJKHUw=;
 b=V9uQCkEOAjtkAZB1nCpLEfL8Q9fgBw2TbbpxhM+R//6bRh8dhATSrLZZtNZmvsL3im
 52R3agbDluW1JxxpjRNHwrA2JNPojKddt5Ta/xZJG+/mi99ro9frZ6cIF+L/rxZTycb/
 1V5styK59o07/rBR+JQfXz/ZwxYePQ4yAzhNUCZNiLFuU5J3vkfMU7aUdWN/8y3eBTCp
 tE7bUpzOlkLBwVu/UwP2tpu44fPZbABH4EC72oCndaupBHrxCxZsYkuRgSKghXEsUgB4
 UUGNCK17yWtt22kljVJrzEMrlMR5mDgfELTEEAcACRWcEq5xF8AFV38+LlnNN5GvW3tJ
 ekPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=1JSEDSNjhfy5FuCupdNXYQlqb25p5cAnBD74WVJKHUw=;
 b=IAeZGeLeLneMYHmJyB7fmP1R/H4O8XCieCJseLSS7IQXmXry68xm54sqouJpFh/b4b
 5vdlYZ8WC/uIqHXwCBePeyDiaiMiXgaJnCUZ6OCgrm9EsdQN2+MiMKMD+5B8fucIVNTp
 /mzIBk6IsebpLolMEOMjUcmn17qUiuqweupPULAFtyNHfUUMj+zw9zCII9098Hss4C6q
 b/Xt521ZKWOesGstxvOIEIQGoybFSlx1L2eZs1SqUWG7LFzFgfiTgbbTLXK5FnFNGnyr
 PV31DXYQzxnI48FNG2B5TJearAjzA30Fem9I5H4x3uLYDm3l403W9AUcQ8qFeYn5XGIX
 Zhgg==
X-Gm-Message-State: ANoB5plBVvWC3lEmY6NWYLnQw3YQiBx9dhEsJF7jCejgtrw3UdOdP6cn
 ga/2c4SzlpBvMhMONrhWm0iwye5oQ+GoHg==
X-Google-Smtp-Source: AA0mqf7CnRMp0y+0/C4SqT+f1mtAM9zTOjUVgcvxymVj38EPNVSmfgfp4yvJW6Vm4qaADOKhQp75Ig==
X-Received: by 2002:a05:6512:3b23:b0:4b3:abaf:b7c1 with SMTP id
 f35-20020a0565123b2300b004b3abafb7c1mr2431193lfv.39.1669158758772; 
 Tue, 22 Nov 2022 15:12:38 -0800 (PST)
Received: from eriador.lumag.spb.ru
 (dzpbkzhtyyyyyyyyyyyyt-3.rev.dnainternet.fi. [2001:14ba:a302:8a1a::1])
 by smtp.gmail.com with ESMTPSA id
 q18-20020ac246f2000000b00497feee98basm2617541lfo.274.2022.11.22.15.12.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 22 Nov 2022 15:12:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 23 Nov 2022 01:12:26 +0200
Message-Id: <20221122231235.3299737-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
References: <20221122231235.3299737-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 03/11] dt-bindings: display/msm: mdss-common:
 make clock-names required
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
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Mark clock-names property as required to be used on all MDSS devices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/mdss-common.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
index 59f17ac898aa..e2980aebf178 100644
--- a/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
+++ b/Documentation/devicetree/bindings/display/msm/mdss-common.yaml
@@ -74,6 +74,7 @@ required:
   - reg-names
   - power-domains
   - clocks
+  - clock-names
   - interrupts
   - interrupt-controller
   - iommus
-- 
2.35.1

