Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2209C6C78D6
	for <lists+freedreno@lfdr.de>; Fri, 24 Mar 2023 08:27:53 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E444910E50D;
	Fri, 24 Mar 2023 07:27:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com
 [IPv6:2a00:1450:4864:20::530])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2072B10E50E
 for <freedreno@lists.freedesktop.org>; Fri, 24 Mar 2023 07:27:50 +0000 (UTC)
Received: by mail-ed1-x530.google.com with SMTP id eh3so4169292edb.11
 for <freedreno@lists.freedesktop.org>; Fri, 24 Mar 2023 00:27:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679642868;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=oih3Pyj2vg952+sPFJ5XDe6upuoomzNQh4Yo5qTQaxo=;
 b=GY1hpt+FN7fln0dR8BdnbXcu/LbNJ3fpf3kFZ0FEtAunb6CQjF/UG1GMb3Q6Mjg5T9
 j54kRaHPAGqD8TRD/UVP/yqBJZZIs7Zr+oyhXrMRYS2yDmyYfV/1gbMz7gKE8MyZFdL5
 X561dGydhZhie5OvyWoTqVylqy1zPSgMiEYftEkrdjSR2fwMWcjfvFgtmqY1FEBrnrV7
 kox/hCP0Sv1mVESFoa30R/FIghehf0XfUWPj/eB0qZxgnz8aqE8pEsV6oxpnx2Dm0cGm
 HKUXEK81gZQdQGCp3T61jtqXfdq8oH6cRQj001cU1oCGwxRn09azugCZU59CRlJkYp+/
 lm0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679642868;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oih3Pyj2vg952+sPFJ5XDe6upuoomzNQh4Yo5qTQaxo=;
 b=fw46Nxc5hRApjnp0eZQXXfPYZPq8zxE5drvNQuZj/PiHrLIq2hWbfKQcB0k0pdIo4y
 /enu/8Sydu3SPWvO/b+HikGP7kM//1f20ieum1QyHNLIcIFYS8tnJk8FNlI9qipBTbIX
 esfFfmba4c/t2GQ64q8un++IduG5K26COcmxXKaGwzl03UJFfaNQMnE1c7/HZ9Peysgo
 Tg5l2UMlMDwXW8Um9zy7NtGC/+YFKcwKFEZEMvMaDApgMELBCHtreUQpexl5HClYPaoz
 k+rLqsKoCQte17pzgywiEHrYZiyT8D2UFt8UJvn9XO49+B0OAMgNS/W/8mV5SYmkBLK/
 eZNQ==
X-Gm-Message-State: AAQBX9cJrN9kEmC+UuxuuYUlcr2Q95Klr0Z2kM2gH74F+n6TWSUb1CvE
 Mkog73jPsNyeLWsxeKidKUv88g==
X-Google-Smtp-Source: AKy350ZunRJAXsfCtjyQ9QD3LrcckTtK/mvR3aNTMn6rSvTzB/AHlYFY975tPMMibVWK0xODrnmwRA==
X-Received: by 2002:a17:906:32d5:b0:931:1e69:e1da with SMTP id
 k21-20020a17090632d500b009311e69e1damr1676830ejk.7.1679642868521; 
 Fri, 24 Mar 2023 00:27:48 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:ce50:243f:54cc:5373?
 ([2a02:810d:15c0:828:ce50:243f:54cc:5373])
 by smtp.gmail.com with ESMTPSA id
 lg10-20020a170906f88a00b008cc920469b5sm9878299ejb.18.2023.03.24.00.27.47
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Mar 2023 00:27:48 -0700 (PDT)
Message-ID: <799dac6c-f364-916f-4440-61c2429054c8@linaro.org>
Date: Fri, 24 Mar 2023 08:27:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Content-Language: en-US
To: Luca Weiss <luca.weiss@fairphone.com>, Eric Biggers
 <ebiggers@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-0-3ead1e418fe4@linaro.org>
 <20230323-topic-sm8450-upstream-dt-bindings-fixes-v1-7-3ead1e418fe4@linaro.org>
 <9614782e-0d78-e8f2-a438-452cfa86f80b@linaro.org>
 <316d7d7d-b370-36e1-648a-400447d2dd47@linaro.org>
 <20230324065247.GA9598@sol.localdomain> <CREFOMX7DAPN.2NR3VSFCX9K10@otso>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CREFOMX7DAPN.2NR3VSFCX9K10@otso>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 7/8] arm64: dts: qcom: sm8450: remove
 invalid reg-names from ufs node
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
Cc: Alim Akhtar <alim.akhtar@samsung.com>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, Rob Herring <robh@kernel.org>,
 Bart Van Assche <bvanassche@acm.org>, linux-scsi@vger.kernel.org,
 Lee Jones <lee@kernel.org>, Krzysztof Kozlowski <krzk@kernel.org>,
 Andy Gross <agross@kernel.org>, devicetree@vger.kernel.org,
 Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Avri Altman <avri.altman@wdc.com>,
 Rob Herring <robh+dt@kernel.org>, Sean Paul <sean@poorly.run>,
 Stephen Boyd <sboyd@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 24/03/2023 08:26, Luca Weiss wrote:
> Hi Eric,
> 
> On Fri Mar 24, 2023 at 7:52 AM CET, Eric Biggers wrote:
>> Hi Neil,
>>
>> On Thu, Mar 23, 2023 at 02:10:44PM +0100, Neil Armstrong wrote:
>>> Hi,
>>>
>>> On 23/03/2023 11:49, Krzysztof Kozlowski wrote:
>>>> On 23/03/2023 11:25, Neil Armstrong wrote:
>>>>> Fixes the following DT bindings check error:
>>>>> ufshc@1d84000: Unevaluated properties are not allowed ('reg-names' was unexpected)
>>>>>
>>>>> Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
>>>>> ---
>>>>>   arch/arm64/boot/dts/qcom/sm8450.dtsi | 1 -
>>>>>   1 file changed, 1 deletion(-)
>>>>>
>>>>> diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>>>>> index ef9bae2e6acc..8ecc48c7c5ef 100644
>>>>> --- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
>>>>> +++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
>>>>> @@ -3996,7 +3996,6 @@ ufs_mem_hc: ufshc@1d84000 {
>>>>>   				     "jedec,ufs-2.0";
>>>>>   			reg = <0 0x01d84000 0 0x3000>,
>>>>>   			      <0 0x01d88000 0 0x8000>;
>>>>> -			reg-names = "std", "ice";
>>>>
>>>> This is also part of:
>>>> https://lore.kernel.org/linux-arm-msm/20230308155838.1094920-8-abel.vesa@linaro.org/#Z31arch:arm64:boot:dts:qcom:sm8450.dtsi
>>>> but I actually wonder whether you just missed some binding patch?
>>>
>>> I'm aware of Abel's RFC patchset to support shared ICE, but this is a cleanup of the current DT,
>>> and the current bindings schema doesn't document reg-names.
>>>
>>
>> The ufs-qcom driver accesses the "ice" registers by name, so the reg-names can't
>> be removed from the device tree.  A few months ago there was a patch to fix the
>> device tree schema for qcom,ufs to include the reg-names.  It looks like that
>> patch got missed, though:
>> https://lore.kernel.org/r/20221209-dt-binding-ufs-v2-2-dc7a04699579@fairphone.com
> 
> Are you implying that I should resend the patch or something? Not sure
> who to bug about applying this patch.

Yes, you should. It has been almost three months...

Best regards,
Krzysztof

