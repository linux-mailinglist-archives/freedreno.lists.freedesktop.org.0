Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B19266C210
	for <lists+freedreno@lfdr.de>; Mon, 16 Jan 2023 15:18:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E3C8910E450;
	Mon, 16 Jan 2023 14:18:42 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C708610E44E
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jan 2023 14:18:40 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id bp15so42903812lfb.13
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jan 2023 06:18:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=slDvNSXAJAnJLiEBukDiWieNTlz1AsAaE1WqqEMwQIQ=;
 b=ShC0ZOWyY8rS2sZui0cQWppHUDXFiAB3Kexyg0zzG5TBH73fw0ck3aNHoG+s04F31f
 qlawK3OhURIbgn0M1vLuL84r3kWgY3Eb6ma6raj53cnq7RkSWvIJ6zltENXFQSGDBbE5
 r7D+HksV9NM52wn7aI2eJTRrbyKGVJiQln9rPjQ7xYvsJW0FzEBAebD67IiohNJRhE5H
 t3aj/VAGKcw3am77haZ84qmlZODePFqqKIupgMVeI2hr21GyKYnUaMtX79Md29lo3bk0
 ZvLpWgkRkPUkeLBOzcy9XXRLg5MEOateBpfRDRiIr/bXbvlZHlrkY+W8ecXUOmNOd96G
 IIIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=slDvNSXAJAnJLiEBukDiWieNTlz1AsAaE1WqqEMwQIQ=;
 b=5R7N2rGhKUJC2mHycJslP2IXasHGZUtddIqbRcckSmzdi171h2K6OBO6EC1t5+4302
 CyV2+eEjg/B58qcz17l/pePV4JwnOYzCYPWst/cpfTCgFuXjylB426B9Dws4ib8JIAYk
 2euThNdQluKtEgqMNX/idvEhZrtr24iMWo/IaAP5f0o+BQKqDDGwaYsN0reCTBuuou8E
 S7S60543EZvDBC1MlsgAX8if4yl6bjAzpiMZaLUj5nVqt/Hj0pnGvEudObMVFuQ6vdCo
 Ma/mNDyw4ttWu4f4MIoHfZDgbXFnHak/nT2inMtiWKIDfy5FIDtMv+a7Y9+WjAfEkN+P
 YHKQ==
X-Gm-Message-State: AFqh2krL22KV4nYE4Spo7yW2fC2RUM7NMRmKFTEnuIFQHi+lxlifAx/f
 7x+TA41lF78oYKy1MJH8Ve/uWg==
X-Google-Smtp-Source: AMrXdXtm9IhxsXuJ3onLpyyBzZemmPaIMqa9NXW78S49UorNPyK233cYb/xj0vlWalHC+tSq3XtAaA==
X-Received: by 2002:a05:6512:3ba1:b0:4b5:8fbf:7dd6 with SMTP id
 g33-20020a0565123ba100b004b58fbf7dd6mr39391026lfv.61.1673878719081; 
 Mon, 16 Jan 2023 06:18:39 -0800 (PST)
Received: from [192.168.1.101] (abym53.neoplus.adsl.tpnet.pl. [83.9.32.53])
 by smtp.gmail.com with ESMTPSA id
 g5-20020a056512118500b004d57ca1c96csm218388lfr.172.2023.01.16.06.18.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jan 2023 06:18:38 -0800 (PST)
Message-ID: <e0230675-9451-f5d7-b85e-15066d611fe6@linaro.org>
Date: Mon, 16 Jan 2023 15:18:36 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230116115132.348961-1-konrad.dybcio@linaro.org>
 <CAA8EJprNzLMnU7cguMit6Y4sgU0-SOkiiL+=s_BFBZiyvNvsAw@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJprNzLMnU7cguMit6Y4sgU0-SOkiiL+=s_BFBZiyvNvsAw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH] dt-bindings: msm/dsi: Don't require
 vdds-supply on 7nm PHY
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
 Jonathan Marek <jonathan@marek.ca>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, andersson@kernel.org,
 krzysztof.kozlowski@linaro.org, Rob Herring <robh+dt@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 agross@kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, marijn.suijten@somainline.org,
 David Airlie <airlied@gmail.com>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 16.01.2023 13:52, Dmitry Baryshkov wrote:
> On Mon, 16 Jan 2023 at 13:51, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> On some SoCs (hello SM6375) vdds-supply is not wired to any smd-rpm
>> or rpmh regulator, but instead powered by the VDD_MX/mx.lvl line,
>> which is voted for in the DSI ctrl node.
> 
> I think we should have an explicit `if compatible then required:
> vdds-supply' clause. WDYT?
Well, the driver will still probe and function without it,
so I'm not sure if it's strictly required..


Konrad
> 
>>
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 -
>>  1 file changed, 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
>> index 9c9184f94c44..8e9031bbde73 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
>> @@ -48,7 +48,6 @@ required:
>>    - compatible
>>    - reg
>>    - reg-names
>> -  - vdds-supply
>>
>>  unevaluatedProperties: false
>>
>> --
>> 2.39.0
>>
> 
> 
