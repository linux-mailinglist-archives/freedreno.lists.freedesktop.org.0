Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD0A95B5097
	for <lists+freedreno@lfdr.de>; Sun, 11 Sep 2022 20:32:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6613310E511;
	Sun, 11 Sep 2022 18:32:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com
 [IPv6:2a00:1450:4864:20::22f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCCA10E512
 for <freedreno@lists.freedesktop.org>; Sun, 11 Sep 2022 18:32:13 +0000 (UTC)
Received: by mail-lj1-x22f.google.com with SMTP id a14so6028986ljj.8
 for <freedreno@lists.freedesktop.org>; Sun, 11 Sep 2022 11:32:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=CJXbh3Xap4zY5eQIBuWZa2H6CtZ/Yj97TIZIsBjxr1M=;
 b=z5c14zbbVxY09fE+Nk/QBvyyPJYiCjPwsMB8KGmgbW83W/QBwu/QRURWpzATI+Fzhq
 jBQUCJ0h5UpEOhLQNrikSa0TsyDs94DpyWDhBVYdQt76P9zBYqs9hTkhd8cnxWqpnEwi
 3UR1Werh08Ym28uoNmuOCKXVequx+1skQY49QV0t6kw5G8JiUoZUtCzrCFFlQJGcRJN8
 teT/9vUQ3NJww0DoQQGeWhDgQSnDqAB4pkgzVcD47eN6Hb+oV9i3c15TnNbUmeuC1owF
 m7gcRtRyIvOQj6FQb/wcUz9Mc9ExR73BnNd9wPZ/YiZqVdvIUXLax8Z5yzWqu1fLkCZU
 kk8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=CJXbh3Xap4zY5eQIBuWZa2H6CtZ/Yj97TIZIsBjxr1M=;
 b=B6LTWzeldpLyb6zlWr0T2hOTmxdbEyu1PyoB+V807sePLbV7LvFKOW9+aWsl0CNXX0
 IwKOk5viVRaYiJz6oU9uTCqUkd+S0Xn0j90MsdMzC7FBYbJAcUffdR7KB09FFjCObAGf
 1sD5JdRur5sC+PZbfhEV+kTEkwBdkmJ2vzx50EAjlxXWANDvbQs66hpu3MRwbIRaZdKu
 1HcufmnF+gduCU4rpzNiQ1qdZmdjVMPMPAXIkMhNQ8QbbWRyi6Zrtxu6E36n6OlC2rqo
 MVuNk3m/YrdgLiu1IZ+afeb5bqAfsxbeZSEeR7gHN536ESCOFqUxGgXl6L3Tiaw4AiNC
 nW0Q==
X-Gm-Message-State: ACgBeo1iedEUJUpxfZx48pICRc2ynVHmypibM7ZnrYTsc//lsNN9Wn0J
 kgSjpyjN8J8d777DCYZ4PF+HJA==
X-Google-Smtp-Source: AA6agR5hY97184QmyDcuYKUeAfNkmILa3HpnemXLkjw+R3Ly5FLbgpKseMmBQkt7x2uVq9MVLcIZAA==
X-Received: by 2002:a2e:a4cb:0:b0:26b:6e61:6631 with SMTP id
 p11-20020a2ea4cb000000b0026b6e616631mr5212944ljm.66.1662921130955; 
 Sun, 11 Sep 2022 11:32:10 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 p10-20020a2eba0a000000b00261e8e4e381sm744630lja.2.2022.09.11.11.32.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 11 Sep 2022 11:32:10 -0700 (PDT)
Message-ID: <272413e3-73d4-8e0d-7b5d-93007e419f76@linaro.org>
Date: Sun, 11 Sep 2022 20:32:09 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.13.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220901102312.2005553-1-dmitry.baryshkov@linaro.org>
 <20220901102312.2005553-2-dmitry.baryshkov@linaro.org>
 <3e525135-d205-eddc-ff2d-98c8321386e3@linaro.org>
 <20220908193705.GA3002673-robh@kernel.org>
 <1ebe64a3-fab9-1dd7-517a-01001a176d9f@linaro.org>
 <CAL_JsqLkV_fnUnc4cS=cdTvP3rKYAS011_+KZYiBGhXDx-pHnA@mail.gmail.com>
 <2204eab4-b22d-8ee7-4595-49139cb387a8@linaro.org>
 <CAA8EJpqHL-gO=zSG6Ek=-y4njGF5R66z0MwLeKZ9U4Ag1j51Og@mail.gmail.com>
 <e7a132e7-a819-ebe2-e6e5-c01cbfacef15@linaro.org>
 <CAA8EJpoPPRAQPfVQmSfrrDrroMp0bzvJ=-vHMRx72aKTBgPOTA@mail.gmail.com>
 <f013accb-96f7-a025-1d41-e2e97f8b2aa8@linaro.org>
 <CAA8EJprnrKP9Ze__KTTNGDs8sj3QhqpiHnnhf1=ipq+CFCoXsQ@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA8EJprnrKP9Ze__KTTNGDs8sj3QhqpiHnnhf1=ipq+CFCoXsQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v6 01/12] dt-bindings: display/msm: split
 qcom, mdss bindings
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
Cc: Rob Herring <robh@kernel.org>, Loic Poulain <loic.poulain@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm <linux-arm-msm@vger.kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel <dri-devel@lists.freedesktop.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno <freedreno@lists.freedesktop.org>, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 11/09/2022 19:45, Dmitry Baryshkov wrote:
> On Sun, 11 Sept 2022 at 16:57, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 11/09/2022 15:45, Dmitry Baryshkov wrote:
>>> On Sun, 11 Sept 2022 at 14:27, Krzysztof Kozlowski
>>> <krzysztof.kozlowski@linaro.org> wrote:
>>>>
>>>> On 10/09/2022 14:54, Dmitry Baryshkov wrote:
>>>>>>
>>>>>> However I think there is no such problem, as Dmitry said, that ref
>>>>>> changes anything. There will be always failure - either from parent
>>>>>> schema (using $ref) or from device child schema (the one which actually
>>>>>> misses the property).
>>>>>
>>>>> Initially I stumbled upon this issue with the dsi and dsi_phy nodes
>>>>> for msm8996 devices. If I have $ref here, dsi1/dsi1_phy nodes will
>>>>> emit warnings regarding the missing -supply properties despite nodes
>>>>> being disabled. If I use `compatible' here, the schema checks pass.
>>>>> Thus I'd prefer to leave `compatible' here. Not to mention that it
>>>>> also allows specifying a tighter binding than just using the $ref.
>>>>
>>>> I don't think we understood each other. I claim that error will be there
>>>> anyway, just from different schema. So your change fixes nothing in
>>>> total schema check...
>>>
>>> If the node is disabled, there will be no different schema check.
>>
>> As I wrote before, there was.
> 
> The following results were captured with the following command, with
> most of the DSI and MDSS schema files fixed, using the following
> command:
> $ PATH=~/.local/bin/:$PATH make -C ../build-64/ ARCH=arm64
> qcom/sda660-inforce-ifc6560.dtb  CHECK_DTBS=y
> DT_SCHEMA_FILES=display/msm
> 
> As you can see from the example below, when using 'compatible' I'm
> getting warnings just for the gpu@5000000 node, while using $ref I
> also got warnings for the dsi-phy@c996400 node (disabled in the DT
> file).
> For your reference the tree in question is uploaded to the:
>     https://git.linaro.org/people/dmitry.baryshkov/kernel.git msm-mdss-yaml

I did not say anything about msm-mdss. I said you will get errors from
child schema anyway.

	From schema:
/home/krzk/dev/linux/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml

/home/krzk/dev/linux/linux/out/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb:
dsi@c994000: clock-names: ['mdp_core', 'byte', 'byte_intf', 'mnoc',
'iface', 'bus', 'core_mmss', 'pixel', 'core'] is too long

	From schema:
/home/krzk/dev/linux/linux/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml

/home/krzk/dev/linux/linux/out/arch/arm64/boot/dts/qcom/sda660-inforce-ifc6560.dtb:
dsi@c994000: 'vdda-supply' does not match any of the regexes:
'pinctrl-[0-9]+'



If your child schema fails, the referencing schema fails as well...


Best regards,
Krzysztof
