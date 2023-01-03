Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EB6C065BB7F
	for <lists+freedreno@lfdr.de>; Tue,  3 Jan 2023 09:00:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB9B510E1ED;
	Tue,  3 Jan 2023 08:00:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A46A610E23A
 for <freedreno@lists.freedesktop.org>; Tue,  3 Jan 2023 08:00:00 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id bt23so27939469lfb.5
 for <freedreno@lists.freedesktop.org>; Tue, 03 Jan 2023 00:00:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=xybIa6a5Ht7rHreWUL9qCncLTyU54FM7pG/3ayjmdKc=;
 b=KsOzXa8qhmGd+LTvaEWSnm7pvd3DIMpQZekQfzVSUllNXlETm5HoQNIk0jxJkpKIU4
 8/EM5OPa4innnmDZe7GMeCqvTO8SqGp1Pnb8P2+z4YGcNy9W/pRjkZt2wUR+JOI0rGuy
 0p/w79UISsu7fFdLjsj5AEtDRnRpBmzsoByX9EAQ6hvqLMrVvkt41BsGzchYjRlW5Bc8
 UdjxsEp/p84spDUHNq+QFyUywIrOskmzwD7IQPu2JEBVTF9NpPPwqENvvArFwCPdvFOt
 ghqi/YQ2WEtuSyd7pjFxH8j7av39HS1QOWL12TNSCmXA/p49fDx+BgJMIKvZWoOHDOli
 PnEQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=xybIa6a5Ht7rHreWUL9qCncLTyU54FM7pG/3ayjmdKc=;
 b=Dea9S8Hsg2jsdd8Br1ipTj9g4p93ujyDicg6/9oAHiIkkvMPa3agZ2OxT9AwHQnjKp
 QrnBHpuXWrNYBhQp+3XOGjHA8Fb+LKW6V8oyysusk5DdGErlY03hAvQk2nbgPupyGagi
 4ttcWCeU/B62SWfHYBmLDvv3CftwpLXCsh4u7P4Taq49/hlkMUJNb8d0AzonhL+2EZ/c
 ehsCkD6Gy/pNgYfYagFk4DRkt6l69nfWUaIGI0xoeLjMeiXRo4E120cpXbhQjGDEGdRQ
 ZGVt2Dd+cLglIyyJJNgCLrk1eB97FnGjZSsW7LGkyKJONGR7ylGh2gilwkIhxuvYAsPN
 6wzg==
X-Gm-Message-State: AFqh2kp+F4RUS6zL2pmLRrKi3RB9mk86wrrDjR9zSDbkZ/Jz6W4s3uoC
 DfHLvBdTTXaS4y4ntnfM/SAIgA==
X-Google-Smtp-Source: AMrXdXt+pxCyHcH1HElUDP5VL0fKIW6t92rTlMaruNQVYXAQKv5aZNCcWQWFvaNif4nT4k1xwwr50w==
X-Received: by 2002:a05:6512:398c:b0:4b5:7a91:70f5 with SMTP id
 j12-20020a056512398c00b004b57a9170f5mr13893569lfu.63.1672732798857; 
 Mon, 02 Jan 2023 23:59:58 -0800 (PST)
Received: from [192.168.0.20]
 (088156142067.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.67])
 by smtp.gmail.com with ESMTPSA id
 b3-20020a056512070300b00496d3e6b131sm4711279lfs.234.2023.01.02.23.59.57
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 02 Jan 2023 23:59:58 -0800 (PST)
Message-ID: <b8a0d9c5-eb26-c41c-1190-2628977bc582@linaro.org>
Date: Tue, 3 Jan 2023 08:59:56 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Content-Language: en-US
To: Robert Foss <robert.foss@linaro.org>
References: <20221230153554.105856-1-robert.foss@linaro.org>
 <20221230153554.105856-9-robert.foss@linaro.org>
 <deb17787-1a5a-89a3-3ecf-7690b4149f5c@linaro.org>
 <CAG3jFysU84LRcqQOspub+9vtsP3syiksrGX6D7i3ff+X6+mbTA@mail.gmail.com>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAG3jFysU84LRcqQOspub+9vtsP3syiksrGX6D7i3ff+X6+mbTA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v4 08/11] arm64: dts: qcom: sm8350: Use 2
 interconnect cells
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
Cc: konrad.dybcio@somainline.org, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, liushixin2@huawei.com,
 krzysztof.kozlowski+dt@linaro.org, angelogioacchino.delregno@somainline.org,
 quic_vpolimer@quicinc.com, airlied@gmail.com, vinod.koul@linaro.org,
 Jonathan Marek <jonathan@marek.ca>, robdclark@gmail.com,
 quic_khsieh@quicinc.com, agross@kernel.org, quic_jesszhan@quicinc.com,
 devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org, a39.skl@gmail.com,
 quic_abhinavk@quicinc.com, swboyd@chromium.org, robh+dt@kernel.org,
 sean@poorly.run, loic.poulain@linaro.org, andersson@kernel.org,
 dianders@chromium.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 vkoul@kernel.org, daniel@ffwll.ch, dmitry.baryshkov@linaro.org,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 02/01/2023 18:10, Robert Foss wrote:
> On Fri, 30 Dec 2022 at 17:12, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 30/12/2022 16:35, Robert Foss wrote:
>>> Use two interconnect cells in order to optionally
>>> support a path tag.
>>>
>>> Signed-off-by: Robert Foss <robert.foss@linaro.org>
>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>> ---
>>>  arch/arm64/boot/dts/qcom/sm8350.dtsi | 28 ++++++++++++++--------------
>>>  1 file changed, 14 insertions(+), 14 deletions(-)
>>>
>>
>> I think you need to rebase to include:
>> https://lore.kernel.org/all/167233461761.1099840.5517525898039031248.b4-ty@kernel.org/
> 
> Ah, I see. Functionally I seemed to do fine without those commits.
> 
>>
>> On which tree/revision did you base this?
> 
> msm/drm-msm-display-for-6.2

Then it is not a proper base for DTS changes - you will miss quite some
commits. The DTS patches should be based on Bjorn's SoC tree or
linux-next (although the latter sometimes can lead to conflicts).


Best regards,
Krzysztof

