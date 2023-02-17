Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CAA469B479
	for <lists+freedreno@lfdr.de>; Fri, 17 Feb 2023 22:16:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 46F2010E487;
	Fri, 17 Feb 2023 21:16:58 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C3A9E10E482
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 21:16:56 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id r12so2414505ljg.4
 for <freedreno@lists.freedesktop.org>; Fri, 17 Feb 2023 13:16:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=6ak+8LJfZoxeGXvU223WgSUa5zrwLYuaf0G4KExhaBo=;
 b=WzEOsJAM51nZI+PuUQMFYxrbKH7Kjm8RcRectrj+YJYrBMe+/jr5G9W5GGLK273tAj
 gyjiRxoptN1RuyRNovdVWFp+ptTyoDHm529ypMikm1AiVSB5GDRWTDsMSOPt9EFaDz2E
 pQFdM4oRJUIWegWmV0VxOKzhP9sc5f8lirdFKrWE21JUKlh/tWSsWIrK5mqV4YmP0iry
 jOdqCvOeVogJ3hFYfAIi8tNUZOL0RqszwRCt3aaK0ZJCB0kRRZY0DgfyHNycj3SAnZyB
 LJUHYJK4iBf+vmfocarwLgTs7Logeygdg3qTkX5+At0uvcMB8dBYFrjcgD+dhuM0EmAF
 mSDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=6ak+8LJfZoxeGXvU223WgSUa5zrwLYuaf0G4KExhaBo=;
 b=BMHkwGQj1g3mxe4kRAPAqBetJMzwHHvoIAktHZLBej6k4M8LMHek75UfIG2QnJUt9U
 TWQS7J5n7qpPUfo4N4BVbRFVdaFXzP8/tskUXQhaGZU30AFiheJAi2huu2qR+noItQFa
 POwA/sk9TuJ7ttj6GKWOHpaf/WxP8d9IIhrP//79QJavgxVGhtI1QZwuIXh7K4yqd3LV
 pi+bjno2EoWMIvwDWOLmBPNqvl47MXsXwQ8Q7hkv8wvn2CQ3CBedbMK94Tc4EqSUmwdw
 ZMVJSyl+jEcIR49d5wZ1LW8DYTkEGoHocd8lGtn2C0cstQunThvXr/4d3qGOlu3vdQse
 b5aA==
X-Gm-Message-State: AO0yUKVAkxYfOZI6lmobR6TZjBm6CSkB/tOdSaHVhcS6MaFsnKi8/gff
 oMF/1HPtNRtsjHIWfVi1egaPVA==
X-Google-Smtp-Source: AK7set8VSoLlRuQGJZe18IhRYONY61gU+0TX2DkgH0lkoDkSvTfwelptN1tew4Wv5aXvT6asmBteAw==
X-Received: by 2002:a2e:7112:0:b0:293:4fff:9f0b with SMTP id
 m18-20020a2e7112000000b002934fff9f0bmr333071ljc.19.1676668615011; 
 Fri, 17 Feb 2023 13:16:55 -0800 (PST)
Received: from [192.168.1.101] (abxh184.neoplus.adsl.tpnet.pl. [83.9.1.184])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a05651c204d00b0029571d505a1sm31133ljo.80.2023.02.17.13.16.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 17 Feb 2023 13:16:54 -0800 (PST)
Message-ID: <76de00dc-f128-e609-7f0c-b53161036b97@linaro.org>
Date: Fri, 17 Feb 2023 22:16:52 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.2
Content-Language: en-US
To: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org
References: <20230217111316.306241-1-konrad.dybcio@linaro.org>
 <c49904be-d842-fc12-a443-17f229d53166@linaro.org>
 <a4eaccfd-34ba-15f3-033f-165b46c43317@linaro.org>
 <a158bca2-78bf-5b38-60fe-88118e8b4ad7@linaro.org>
 <ab35cdcf-53ae-a3f2-fc08-d0f58c51a0ae@linaro.org>
 <48cb00cd-961c-b72f-fba8-1842d658e289@linaro.org>
 <d4ffa9f0-797e-7a32-147e-64aa46d7e197@linaro.org>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <d4ffa9f0-797e-7a32-147e-64aa46d7e197@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 1/2] dt-bindings: display/msm:
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
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 17.02.2023 22:13, Bryan O'Donoghue wrote:
> On 17/02/2023 12:24, Krzysztof Kozlowski wrote:
>> First, it would be nice to know what was the intention of Bryan's commit?
> 
> Sorry I've been grazing this thread but, not responding.
> 
> - qcom,dsi-ctrl-6g-qcm2290
> 
> is non-compliant with qcom,socid-dsi-ctrl which is our desired naming convention, so that's what the deprecation is about i.e. moving this compat to "qcom,qcm2290-dsi-ctrl"
> 
> Actually I have the question why we are deciding to go with "sm6115" instead of "qcm2290" ?
> 
> The stamp on the package you receive from Thundercomm says "qcm2290" not "sm6115"
Correct, but QCM2290 is not supported upstream yet.

SM6115 (a different SoC) however is, but it used the qcm2290 compatible
as it was a convenient hack to get the DSI host ID recognized based on
the (identical-to-qcm2290) base register without additional driver changes.
We're now trying to untangle that mess..

Konrad
> 
> ?
> 
> ---
> bod
> 
> 
