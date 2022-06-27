Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C737455BBE3
	for <lists+freedreno@lfdr.de>; Mon, 27 Jun 2022 22:03:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 80A8D11B55B;
	Mon, 27 Jun 2022 20:03:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-oa1-x2c.google.com (mail-oa1-x2c.google.com
 [IPv6:2001:4860:4864:20::2c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F3711B55B
 for <freedreno@lists.freedesktop.org>; Mon, 27 Jun 2022 20:03:26 +0000 (UTC)
Received: by mail-oa1-x2c.google.com with SMTP id
 586e51a60fabf-1013ecaf7e0so14262609fac.13
 for <freedreno@lists.freedesktop.org>; Mon, 27 Jun 2022 13:03:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Aon9KWNqlTPJUCEzfiiGPiFzQemxxhc4mveTBdeN0mQ=;
 b=bgLsaloJiLF+jGaYy/5nmCIMlKh5WIQB1EG2jQ7fBkV+u6ZUjB/p8TIAjMt8rKmV7Y
 /sDvbDNejmE9n0B9iJtR+FlGtvZ+HLgS3KlUXrE8RXckTFHv2jBq81yv7uiBRNwc+iQ3
 0n8NaW0iXrrs4HS/OWgeBqzUNcKS1LQCdiyOFr0Q1p9MBeRtTwEBHxJvNFXk2MZf0+g9
 1em7z2T6w3DR93zgE+Bg+oG4MGyZQq/jN1qYU9r8KlHgs2ZoTQ4zhz23U7N0Dv3c5sCK
 Ex9pWzzqSQCYtn8M1J0zPMXnIZv9okBdAAbTsSXU9Ut409bWog5+k0Y0oJNbhRb3DCVl
 YdIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Aon9KWNqlTPJUCEzfiiGPiFzQemxxhc4mveTBdeN0mQ=;
 b=V/oc4LlHQenl+w0C3QBErZFg7xJynf5VKWY2fR1IXnbeNAsM6lD15VnRqhu5+DjWnp
 voaZ/q27/7amqh6t06hfkf3/CYP7ZoepMS2IZgwjk0ETNn0g8lmJNsmJKRKYsmXbzu+w
 NDONDAalE0Ontn+VPQWCBnJ5PjTaQRvCoGZT/ip9lVf8XNVf4Wf3Z22OFELMiHz/Avac
 N/y+a+VvfZCSqwqC2yCtjp2FYU0QADPisejLtN7A3Ab+uIxrhUV8Z4seVZMMOTXLn1nQ
 Oi4Sxhfmu5hnr/uAlbIgSWe9eNGJ04bOAzVkuU47EU9vSnGImGNDrGR6X/JH3/fl0Mxu
 gOJQ==
X-Gm-Message-State: AJIora8g6ZznXK38XCggenCo7E++QBSNEJtwQsm7RKK8SRrborifspEl
 N1nNHOye1XCNHw8iNU6DtigeVyWd5NFWfA==
X-Google-Smtp-Source: AGRyM1tYwpVrLTOek08Oo6ZIoPaPI9ZE8y8ATJCqHorh5n/D6KeaTSUlWZHlXy1t5+Eh+L/Rqf+j+g==
X-Received: by 2002:a05:6870:f616:b0:f2:dac0:e339 with SMTP id
 ek22-20020a056870f61600b000f2dac0e339mr11622237oab.116.1656360205558; 
 Mon, 27 Jun 2022 13:03:25 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net.
 [104.57.184.186]) by smtp.gmail.com with ESMTPSA id
 m16-20020a4a9510000000b0041bdf977c6dsm6428729ooi.31.2022.06.27.13.03.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 27 Jun 2022 13:03:24 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 27 Jun 2022 15:02:45 -0500
Message-Id: <165636016349.3080661.3240629203212471824.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220531124735.1165582-1-dmitry.baryshkov@linaro.org>
References: <20220531124735.1165582-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] (subset) [PATCH] arm64: dts: qcom: sdm845: use
 dispcc AHB clock for mdss node
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
Cc: linux-arm-msm@vger.kernel.org, Taniya Das <quic_tdas@quicinc.com>,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 devicetree@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On Tue, 31 May 2022 15:47:35 +0300, Dmitry Baryshkov wrote:
> It was noticed that on sdm845 after an MDSS suspend/resume cycle the
> driver can not read HW_REV registers properly (they will return 0
> instead). Chaning the "iface" clock from <&gcc GCC_DISP_AHB_CLK> to
> <&dispcc DISP_CC_MDSS_AHB_CLK> fixes the issue.
> 
> 

Applied, thanks!

[1/1] arm64: dts: qcom: sdm845: use dispcc AHB clock for mdss node
      commit: 3ba500dee327e0261e728edec8a4f2f563d2760c

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
