Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 581696ADF86
	for <lists+freedreno@lfdr.de>; Tue,  7 Mar 2023 14:02:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B4B810E4A2;
	Tue,  7 Mar 2023 13:01:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 965B710E49F
 for <freedreno@lists.freedesktop.org>; Tue,  7 Mar 2023 13:01:54 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id n2so16911599lfb.12
 for <freedreno@lists.freedesktop.org>; Tue, 07 Mar 2023 05:01:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678194114;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CzTyTjVeEOwx0n8Fcur27AsP/7zLfRdjtQMUW7H4GE8=;
 b=Y1f+YlSj6leQtVLh4lCNFkqAnnKyFkvUu4KNMasglEwHsnWS1CWIDaXG7NV3c9WUpX
 NRiQgWMEX6piVxBRmiPzOJLCj9wq7Mndy58OUirCUh71Ng+EWAJp2N88aliHOiJBAM8E
 7b+5iVUIMPTBh5XMzrbrJsAwhdEJ+pXbt4J/gOLoQl58q0//eingsEpM5Atz0mHjkfIL
 MVds9sbVXLf6OJi3DteMUbxILXRjYwf9FtQPM9Fh9Wbrp/DCvlxsZx8ZUbFrPa7tcRYE
 VAD1V182jVcf+x6kIIfb/LVWMkOiQ9MgZcBCAdKXMyruYXQzmOHE0jasp4f3/h/ddBQe
 mstA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678194114;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CzTyTjVeEOwx0n8Fcur27AsP/7zLfRdjtQMUW7H4GE8=;
 b=1aPCeCa1jrwy2IjCEMSnuYdMEFpGqoxaNL6H6jUv/RU4ctoGqJk2DyUWGRcYNHJBe2
 ugCUTCgRoKaSzSPzqlWVsFV7mHX3/ZNRzijpMM3QIflP4SWDReM0dKnMHP1geCnV7MFf
 27z+fkQgvNBbejc/ntpT++BYKZAk5T+x/rpiRfboPg5bfmU36JkevSoAqhP+apt6fJ6N
 PKYsUz+Pedt+OGImTNLM6Epdn7IWczUVzcN9qAFPlBRjJxa2mZFIDuI2VO8uUujsYXK/
 4tEvtxRw7fSnjAHs6AgTu+bUb093BXi9O4LCXSmOLR136QHaEcmfcAko+oC6ZlAfgg5k
 aJHQ==
X-Gm-Message-State: AO0yUKXhM+/sPCWqc+CyusZ1ocrkBjePxp9g/JBNA9TcFHkFS4BDw9ME
 9RljVEp5e391aMQQ8ibCG5tTDQ==
X-Google-Smtp-Source: AK7set8LRRjQl6lQLEVNGwZ+0gcThjUGm/9xpH5kwnxGoIMBR35JIMlsB+tSxqVDk6aJ4RD2FJiseA==
X-Received: by 2002:ac2:5922:0:b0:4d6:ef7f:fc53 with SMTP id
 v2-20020ac25922000000b004d6ef7ffc53mr3535050lfi.34.1678194113951; 
 Tue, 07 Mar 2023 05:01:53 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 u2-20020ac248a2000000b004cc5e97d356sm2048265lfg.148.2023.03.07.05.01.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 05:01:53 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 07 Mar 2023 14:01:46 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v3-8-8bd7e1add38a@linaro.org>
References: <20230307-topic-dsi_qcm-v3-0-8bd7e1add38a@linaro.org>
In-Reply-To: <20230307-topic-dsi_qcm-v3-0-8bd7e1add38a@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>
X-Mailer: b4 0.12.1
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678194100; l=1144;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=dS1N11h2C4bKZ0sJcpp7JilD8JmZ3GC3KRjbGbtwF6E=;
 b=j/CpsyJ5hcGj4Xtxf52pKDseNdb0oMAW4eomJS4lqedzemS1xNJgvbpmqQMJyYoFFERldyqiFvqY
 oNpwyFyeCer8XmHhcOK5oX/9ZOJQHICK1L5Zr8bg/kwTGDpgKXU2
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v3 08/10] dt-bindings: display/msm:
 dsi-controller-main: Fix deprecated compatible
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
Cc: Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The point of the previous cleanup was to disallow "qcom,mdss-dsi-ctrl"
alone. This however didn't quite work out and the property became
undocumented instead of deprecated. Fix that.

Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 2494817c1bd6..94f4cdf88c95 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -34,7 +34,7 @@ properties:
       - items:
           - enum:
               - qcom,dsi-ctrl-6g-qcm2290
-          - const: qcom,mdss-dsi-ctrl
+              - qcom,mdss-dsi-ctrl # This should always come with an SoC-specific compatible
         deprecated: true
 
   reg:

-- 
2.39.2

