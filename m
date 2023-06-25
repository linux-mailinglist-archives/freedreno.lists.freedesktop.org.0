Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7B4F473CEDF
	for <lists+freedreno@lfdr.de>; Sun, 25 Jun 2023 09:16:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DA03C10E14A;
	Sun, 25 Jun 2023 07:16:33 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52d.google.com (mail-ed1-x52d.google.com
 [IPv6:2a00:1450:4864:20::52d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D7F8A10E0DE
 for <freedreno@lists.freedesktop.org>; Sun, 25 Jun 2023 07:16:31 +0000 (UTC)
Received: by mail-ed1-x52d.google.com with SMTP id
 4fb4d7f45d1cf-51d9124e1baso1001720a12.2
 for <freedreno@lists.freedesktop.org>; Sun, 25 Jun 2023 00:16:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687677386; x=1690269386;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=uIrahwiJfRblkW3SQe71HLoNxiAeifXwVotzPF1COO8=;
 b=SLN/+lBuA+L4hOibaG99ROPhT2q+4Zk1BkcUiRXl4SmMBXbIW7ZDZeuRWDY1cBg38Z
 ds8IN6Tf2v7H77bI5N82BPsA6p+sb1Lj+PSR0P8pInIDV1RTT6vqMpSWO9KEJ0hHzfC9
 PstfvAk+/fjKU2B0e7eYYEH2W3iBHla9soKb01tYlDCjDXbBy2hscxufKR4AS0Pqb0fw
 xW/pU4+OdDUQISR5H5kuYf4bnneam72K/FNMC6qv8UwrAGSJsMpE/MizlpDV4DdZLRUJ
 CLXPt0bN46dNwZB1ey2SqK6RPM+T8D3l2FMCfWMHk6CSE+YuPcm2jgpBH2tceoFZhhEK
 CXig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687677386; x=1690269386;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=uIrahwiJfRblkW3SQe71HLoNxiAeifXwVotzPF1COO8=;
 b=LcEXX9D6ry9vEwt/Csp1eihzljLbHrS3nH4oOr7AbuTYUHs26D8I5lmsnU6lthwp31
 QuCovI3OOrgdSfTewJBPZyBLpsUc4rrybLa1/iSY6skc/6SuC90fp7S3BcwtnC6OoS3Y
 Y4gsbfJRsZ6rAEbjUBCk7l4PW/vmPKIDtMPX7WgpC5cKxwMt7offePT+o0c/OGZrfomk
 Tc4Q/+ymkYrTsrbQBT0g0zO5dsmSYvZz+fY39FHEqL1pTGlPgOI0X87Uzq7GP7VhOyd3
 SjsIQPGoz6IP8Q7NXTjadOOKHG9FMJwdMURBeTsqocKIBZXkQl3UUHGUmIsy601W0dwO
 N8GQ==
X-Gm-Message-State: AC+VfDydCI8M59faZaaFUUYcfRxh7aXivZ8tC8rY3a38e6/hniCmtioT
 tt1sxpqd9PUczXxYvb+htnNm3Q==
X-Google-Smtp-Source: ACHHUZ7yWmteCJ2ASXP6XlOddI/EKOWOLbTyVMMVtsIAE32VSvu1Ve67QKpbz2Drqglycme6vQHnYQ==
X-Received: by 2002:a05:6402:517:b0:51a:53e0:843f with SMTP id
 m23-20020a056402051700b0051a53e0843fmr15138396edv.37.1687677386589; 
 Sun, 25 Jun 2023 00:16:26 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
 by smtp.gmail.com with ESMTPSA id
 k21-20020aa7d8d5000000b0051bf6318fd7sm1440765eds.97.2023.06.25.00.16.23
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 25 Jun 2023 00:16:25 -0700 (PDT)
Message-ID: <6be00ec7-2fab-7da0-ab47-fcaf3a1ce042@linaro.org>
Date: Sun, 25 Jun 2023 09:16:22 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>
References: <20230624-sm6125-dpu-v1-0-1d5a638cebf2@somainline.org>
 <20230624-sm6125-dpu-v1-10-1d5a638cebf2@somainline.org>
 <1b40b16e-025a-c10b-e99b-404246de73fe@linaro.org>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1b40b16e-025a-c10b-e99b-404246de73fe@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 10/15] dt-bindings: msm: dsi-phy-14nm:
 Document SM6125 variant
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

On 24/06/2023 15:48, Dmitry Baryshkov wrote:
> On 24/06/2023 03:41, Marijn Suijten wrote:
>> Document availability of the 14nm DSI PHY on SM6125.
>>
>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>> ---
>>   Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>> index a43e11d3b00d..60b590f21138 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-14nm.yaml
>> @@ -18,6 +18,7 @@ properties:
>>         - qcom,dsi-phy-14nm
>>         - qcom,dsi-phy-14nm-2290
>>         - qcom,dsi-phy-14nm-660
>> +      - qcom,dsi-phy-14nm-6125
> 
> Should we start using standard scheme, so "qcom,sm6125-dsi-phy-14nm" ?

I guess the earlier the better.

Best regards,
Krzysztof

