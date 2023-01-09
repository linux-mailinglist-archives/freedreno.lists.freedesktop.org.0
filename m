Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9D191661E48
	for <lists+freedreno@lfdr.de>; Mon,  9 Jan 2023 06:14:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5351010E276;
	Mon,  9 Jan 2023 05:14:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E6B210E275
 for <freedreno@lists.freedesktop.org>; Mon,  9 Jan 2023 05:14:07 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id cf42so11299416lfb.1
 for <freedreno@lists.freedesktop.org>; Sun, 08 Jan 2023 21:14:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=mxCmYI5w6nxSiqH6mYIJV7nQi3+kDtIa5UINsO5Pmjw=;
 b=o4/UvsEtBooqsTfdDvZ4V6Dw9b6IPeSH3r9D+ICRd3/FqS3ykTsMlhZlKml4B8QYK2
 6pWJ47Uk6IXqPlJVReUTgvFYpltrdnF7w0b90VKB3dnZi4iAe9bjKIVqqZH4JIfrTJNs
 E5oaEdqqno73RolkzszE59NYapReoH6b7MvHwYasTYgImDaG5/bqwrDG0aw6YEBc78ge
 YRLiF5zWwsVHNoFaJG70z7aVAbhUWD02OqBpRf2wpFDBm0NvggaTy3o+Ju2HQxGJrTwW
 fzCG/IkMhiOQBsYwl7gVfJ75Ae+xPGxA2c0sLy/jRLqY0pAN3DCA2HM3DMc+E4jQzpvm
 l0Sg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=mxCmYI5w6nxSiqH6mYIJV7nQi3+kDtIa5UINsO5Pmjw=;
 b=oe2PGHNEZfJOVQNiwJOdVvhF/DXrrLO03ULbcIGPKdwNXgFrD/6wt3RcNxSA0OyPOa
 Ntvcj0eLtApfn1nPyvMRd2Q+6/sLhTFZ1WeeJjlimvRThTzNHAKL9TZx+AF4npJm5xez
 K5j3rxpzBjgG3XkVmki0CLYJMEgIZqYag0Qxbvf/IBjH+nQtvoGUD2n/ksrr0WhGUhaz
 hK5cdrMqGFe9NOvALf/rwdWJoxdOdkmgoLTsFiEFGKiNrO7gAR5HgMD+MKYrz9Bcexht
 WDMPonyhZZR0SIkqHNHmjjUydkiVbFOaTAGD38Bd0vusCKP6DlcGd3fWbgKkzQAfUTR9
 1Hhw==
X-Gm-Message-State: AFqh2kpRDsSEEp/k6JsHyjO5ePxHPWx2oZDYcV/QSqsWsKA8f/tmz8E6
 1ueMcORtKNl2fAR+Uo43epBrkw==
X-Google-Smtp-Source: AMrXdXtzC8ORw8pqBQvThcAQTLn4SruOsYGLbWvNTAJ/HjwV2v5SQsxMPYT2GZ3HsPLYQLBB+dU7tw==
X-Received: by 2002:a05:6512:259e:b0:4b5:5bc6:e3de with SMTP id
 bf30-20020a056512259e00b004b55bc6e3demr19630790lfb.65.1673241245630; 
 Sun, 08 Jan 2023 21:14:05 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w4-20020a19c504000000b004b5812207dbsm1426880lfe.201.2023.01.08.21.14.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 08 Jan 2023 21:14:05 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Mon,  9 Jan 2023 07:14:00 +0200
Message-Id: <20230109051402.317577-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109051402.317577-1-dmitry.baryshkov@linaro.org>
References: <20230109051402.317577-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 4/6] ARM: dts: qcom-msm8974: rename mdss node to
 display-subsystem
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

Follow the schema change and rename mdss node to generic name
'display-subsystem'.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm/boot/dts/qcom-msm8974.dtsi | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/dts/qcom-msm8974.dtsi b/arch/arm/boot/dts/qcom-msm8974.dtsi
index 0cd59088f9c7..bb69247d7ebd 100644
--- a/arch/arm/boot/dts/qcom-msm8974.dtsi
+++ b/arch/arm/boot/dts/qcom-msm8974.dtsi
@@ -1525,7 +1525,7 @@ mmcc: clock-controller@fd8c0000 {
 			reg = <0xfd8c0000 0x6000>;
 		};
 
-		mdss: mdss@fd900000 {
+		mdss: display-subsystem@fd900000 {
 			compatible = "qcom,mdss";
 			reg = <0xfd900000 0x100>, <0xfd924000 0x1000>;
 			reg-names = "mdss_phys", "vbif_phys";
-- 
2.39.0

