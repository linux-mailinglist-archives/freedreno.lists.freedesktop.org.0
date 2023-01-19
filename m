Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F0B06739F5
	for <lists+freedreno@lfdr.de>; Thu, 19 Jan 2023 14:22:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F03CF10E931;
	Thu, 19 Jan 2023 13:22:30 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D779410E92B
 for <freedreno@lists.freedesktop.org>; Thu, 19 Jan 2023 13:22:23 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id v10so2806006edi.8
 for <freedreno@lists.freedesktop.org>; Thu, 19 Jan 2023 05:22:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PIsMxIaM7FWCSnFu6ERIKZQQpBb8dWtHDLyxMia/DaE=;
 b=zHvsLCp4UZgDNma6+o6Dmdwxkm3zIJp0m/SuNq7yeGJL+z9KQrgJX/co3O5A3QYrT7
 e4r9cVDq6tO5l8iwY5UvTjSmSCI4LndapEYdwjIkhqcC0ERiKXWaraRGe0LTHAKzcJ7f
 p38O+rmC37wkeWh952qfDH4DzT3e+QioB8DvLKsMJyGxmd7LqklQQBNfA9eNhgLgmbEy
 MnhcJ9VwetYFUFDdhQOHT74cBVbWeOBamVzbV9nF4twKrAuQf1DNG2I76e96XhAMQzin
 Ng7ODPJsI0TVer52u5bWEYaE/AAiHPzjJXho4bPgsPFnDt+LLJnTBrDn3jPL1ou66ILo
 EIEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=PIsMxIaM7FWCSnFu6ERIKZQQpBb8dWtHDLyxMia/DaE=;
 b=S3uGfCYjsowetbWFoMXxgZEj6KRf6QSbTPCzH3lxk8ar8WGdr5sNM5bX9QCWDPEohq
 Lnk92zONaREZ1Rt692VitOTsY5sNWc5SeuwvlxuWcJVliUHNIu2FPWkvW7MSxjbxZLkK
 ljlcwskv4XQ/DTni1/NELMfoCDyWQim2oWYbtT+64ayx3VCxwrcFw6LXCBrNmHOHteDQ
 gKWcvdcT0iOulDboW4mfWs0OEFYR2xmxRXMxPepdDZL5Z5Bj9lH5ITgLYofnqKaFdBMr
 ulFSKrvCKCA7u0PZP4Kh/PgPtirFdR+TbeqdU/Yf9m17E5w0CzUCKkDuQZrXUclKoOlf
 pCGQ==
X-Gm-Message-State: AFqh2kqJOJmyOVJpBYhk77yXK4EEsxfqZn5yG3KSfR+8b8+orJcyzbTG
 lBuFM7xJbn9sO9vwwY3Kybuybw==
X-Google-Smtp-Source: AMrXdXuMIUAAq9eH1sfX626DL7xXAJlq4u5CdG/LFj32y0rjrQyb7gWRmyJlPsV2QEvee/RfsxxM7A==
X-Received: by 2002:a05:6402:194c:b0:498:b9ea:1896 with SMTP id
 f12-20020a056402194c00b00498b9ea1896mr12562874edz.9.1674134543424; 
 Thu, 19 Jan 2023 05:22:23 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 bt16-20020a0564020a5000b00482e0c55e2bsm15532646edb.93.2023.01.19.05.22.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 05:22:23 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu, 19 Jan 2023 15:22:15 +0200
Message-Id: <20230119132219.2479775-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
References: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 2/6] dt-bindings: phy: qcom,
 hdmi-phy-other: mark it as clock provider
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

Eventually all HDMI PHYs are going to provide the HDMI PLL clock to the
MMCC. Add #clock-cells property required to provide the HDMI PLL clock to
other devices.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../devicetree/bindings/phy/qcom,hdmi-phy-other.yaml          | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
index 2c21e120ff8d..0c8f03b78608 100644
--- a/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
+++ b/Documentation/devicetree/bindings/phy/qcom,hdmi-phy-other.yaml
@@ -43,6 +43,9 @@ properties:
   vddio-supply:
     description: phandle to VDD I/O supply regulator
 
+  '#clock-cells':
+    const: 0
+
   '#phy-cells':
     const: 0
 
@@ -113,6 +116,7 @@ examples:
                   "hdmi_pll";
       reg = <0x4a00400 0x60>,
             <0x4a00500 0x100>;
+      #clock-cells = <0>;
       #phy-cells = <0>;
       power-domains = <&mmcc 1>;
       clock-names = "slave_iface", "pxo";
-- 
2.39.0

