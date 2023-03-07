Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 64C446ADF71
	for <lists+freedreno@lfdr.de>; Tue,  7 Mar 2023 14:01:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1905310E129;
	Tue,  7 Mar 2023 13:01:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4155010E12B
 for <freedreno@lists.freedesktop.org>; Tue,  7 Mar 2023 13:01:45 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id s22so16929191lfi.9
 for <freedreno@lists.freedesktop.org>; Tue, 07 Mar 2023 05:01:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678194103;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=ZBjV0MIGjzxWCA4dde9ccbuSp/4SeZ0AfFye0IJguH0=;
 b=S8K842lXW/grOayUPiw1/stytcPwZSZw0ib3Rwy0G8TyU3BoqzW3i8GNnezA75iJe0
 F7HbbM9q2lxbK5+c3ta6HNsfVLqMBtL+CzPhG4mIP/5W7xIU+socPmju4EYLTcIUOU79
 +zj5AxGzs7WfjpWK/llomuMJ7Vp3dns4XOpOPPDLIZvJPcHMrWMDIkpBBQ0DVaik4aeC
 Myyy6/XxwQ8T9XVXJbWlX0/rC6juLAo+ZwwGNEAbopbofiS91kTYa9nKLJpyw/MP7lHw
 P0jWblIUN56/EU3Een7Ib8YU0ugO5btmCZdq2y6MOVR/gimEISu0JfHR37i7PelEw5ig
 eetg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678194103;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZBjV0MIGjzxWCA4dde9ccbuSp/4SeZ0AfFye0IJguH0=;
 b=yAaPtYhFYmWez1RaGQ3oqyJuv/6HjzVpXQgUQDPGJFSVTdG00JLQBW+YyA+uooogGE
 getr+QWQ7N08Yk+V1mazzJYC4OG7if0qQtDi0jzF0KjBvf5nGPORPzFEBKD1SKTze6TC
 TvCiRYAXXYsaJ1luIGpyhF95jr6Wds7FnZ4iv0Ib/4lw9kASaBSYChyNPjNIx7asGyGO
 yXr90+CcY9Nb+xgcxpZaBvNI6/Z8wtHuZlqpmaiVSMIsmfY4hWSBSokVSB6S2Vkg0qL8
 0DalYbHLt0W8s03QTFmpRI7m51jHX8YxaY9FYShQU1aLNtCy2PrjgcLWS2alQoum9eY9
 xRJQ==
X-Gm-Message-State: AO0yUKUZNlKl8auSWkLRlCdbu9ljlTzy+kx9yeJ81dJjHhhuXKYeHFHA
 VCEeH/QtGzOjlWhk1NGfz0Io/w==
X-Google-Smtp-Source: AK7set/BUtMgR4MG5rcNS3SZZlwGfqldYfAdp5uYc++c6d8LEm3HWAca8HOGIbFj8Oi5XqD7hswj6A==
X-Received: by 2002:ac2:43aa:0:b0:4b5:6042:d136 with SMTP id
 t10-20020ac243aa000000b004b56042d136mr4125457lfl.22.1678194103253; 
 Tue, 07 Mar 2023 05:01:43 -0800 (PST)
Received: from [192.168.1.101] (abyj16.neoplus.adsl.tpnet.pl. [83.9.29.16])
 by smtp.gmail.com with ESMTPSA id
 u2-20020ac248a2000000b004cc5e97d356sm2048265lfg.148.2023.03.07.05.01.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 07 Mar 2023 05:01:42 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 07 Mar 2023 14:01:39 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230307-topic-dsi_qcm-v3-1-8bd7e1add38a@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1678194100; l=1022;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=yadLtYUd+NaBlrHtthnWah/BoxxYiya5SpI6g5dSH5k=;
 b=VXFbvloo8L6tf6wwoMkScWR9GbZ6ztU3t6q9TPy+AM8ughrYGsc0FKWNJHCSqgBFQH3zp2bjnBiP
 1u/l49IqAkFsvhNRiqUfofrrCrYY3xmsfHQCG0TIA5f8YQPX277W
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v3 01/10] dt-bindings: display/msm:
 dsi-controller-main: Fix deprecated QCM2290 compatible
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

The qcom, prefix was missed previously. Fix it.

Fixes: 0c0f65c6dd44 ("dt-bindings: msm: dsi-controller-main: Add compatible strings for every current SoC")
Acked-by: Rob Herring <robh@kernel.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index e75a3efe4dac..2494817c1bd6 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -33,7 +33,7 @@ properties:
           - const: qcom,mdss-dsi-ctrl
       - items:
           - enum:
-              - dsi-ctrl-6g-qcm2290
+              - qcom,dsi-ctrl-6g-qcm2290
           - const: qcom,mdss-dsi-ctrl
         deprecated: true
 

-- 
2.39.2

