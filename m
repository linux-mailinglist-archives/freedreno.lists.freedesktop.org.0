Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 08C5C73C9E0
	for <lists+freedreno@lfdr.de>; Sat, 24 Jun 2023 11:10:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A28D010E131;
	Sat, 24 Jun 2023 09:10:20 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7098A10E0E8
 for <freedreno@lists.freedesktop.org>; Sat, 24 Jun 2023 09:10:18 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-98e011f45ffso15643766b.3
 for <freedreno@lists.freedesktop.org>; Sat, 24 Jun 2023 02:10:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687597816; x=1690189816;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=iyaZqfbPtoW544erxGkV79CDXXxsYM/Fp16IQb+tP9I=;
 b=jc1Auh5tqvnIULQo0SinoF4pptEI9CJAL3uA1jKLnlNGiTWufhWrhahGAE+h32L1xx
 hCwdO7h3Vmv1b34q5rAjJbBMrkdAJ8jeyZmjvO+/pFLJkS4CYb8abNyKpQxPGX5ienRW
 PIJMAwGBAxWfsdY4eyp40JyXmD5mVqTuA7AjloZ2sTj1+fTYOyn35xzG2+XOl0lDTdlS
 QPyfGp/MBw3L4SDMqlLRDP9AJH7so7ie6Vil1QYZyTe6pApxQk8F1CZiR60hS7V1esSW
 za+FT3/7dbx3jXeTCm+xsyV8y0gAot6PpCd97/OoF2RdV9kXALgQsFE8fatD+p/d2bEU
 4+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687597816; x=1690189816;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=iyaZqfbPtoW544erxGkV79CDXXxsYM/Fp16IQb+tP9I=;
 b=aLQthBOqdCQs7SxiHvBoTUJPxMDtKQobBYuttzf86/Bhf5a9UylB0uQJTKhmhCPJ+n
 EdB+tL1+QjdA9TeQQ/iFs331jWGfWPtHV3qCqgiAI7Q8Y5vixg+2BERNx5pX+PhHL6I3
 /s2A7N+Az1Xpu2Cg85uFZt7AtZVpB4mV48zhi1bKta/u+Je1b2sD+ZHZeKnBJt8STCxn
 +iPIDNyXa9T1DqtTClwOy2wRLSLDjCeF1QKY0sekqxu0eA4d+jZq6kqxi1otZB+TcTeU
 2Hy8puWFMpCrik1o//Ali6Rm7KSHo5H4i9BdRbwyHN8XlC71YRWslLJrDgN9uEZECLyF
 T7rw==
X-Gm-Message-State: AC+VfDwlURNPqhssjVQhZpcD8ECPop+FqWg03O5euWcvbcH6FXjMe6hb
 lgEmtQ72F0ij6MA4OJMthVtu/A==
X-Google-Smtp-Source: ACHHUZ4pqNge7JwaJVBPQcyWNxciyTTsdI3G9ALVxmbefnkvykz7tn8SBKrUteVDofWtt9OCuMQg/g==
X-Received: by 2002:a17:907:7628:b0:98e:a54:42e3 with SMTP id
 jy8-20020a170907762800b0098e0a5442e3mr173662ejc.54.1687597816650; 
 Sat, 24 Jun 2023 02:10:16 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 n3-20020aa7db43000000b0051a4361f3efsm455606edt.61.2023.06.24.02.10.14
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 24 Jun 2023 02:10:16 -0700 (PDT)
Message-ID: <0aefd7ef-a877-2501-1db9-d2c14c6ffdb8@linaro.org>
Date: Sat, 24 Jun 2023 11:10:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Marijn Suijten <marijn.suijten@somainline.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-4-1d5a638cebf2@somainline.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230624-sm6125-dpu-v1-4-1d5a638cebf2@somainline.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 04/15] dt-bindings: clock: qcom,
 dispcc-sm6125: Allow power-domains property
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
Cc: devicetree@vger.kernel.org, Jami Kettunen <jami.kettunen@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Krzysztof Kozlowski <krzk@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Lux Aliaga <they@mint.lgbt>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, freedreno@lists.freedesktop.org,
 linux-clk@vger.kernel.org,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 24/06/2023 02:41, Marijn Suijten wrote:
> On SM6125 the dispcc block is gated behind VDDCX: allow this domain to
> be configured.
> 
> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
> ---
>  Documentation/devicetree/bindings/clock/qcom,dispcc-sm6125.yaml | 5 +++++
>  1 file changed, 5 insertions(+)



Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

