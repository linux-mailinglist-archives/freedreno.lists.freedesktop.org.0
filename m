Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C61AF45DD8A
	for <lists+freedreno@lfdr.de>; Thu, 25 Nov 2021 16:34:47 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3EB16E575;
	Thu, 25 Nov 2021 15:34:44 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
X-Greylist: delayed 463 seconds by postgrey-1.36 at gabe;
 Thu, 25 Nov 2021 15:34:43 UTC
Received: from m-r2.th.seeweb.it (m-r2.th.seeweb.it
 [IPv6:2001:4b7a:2000:18::171])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A2716E3C4
 for <freedreno@lists.freedesktop.org>; Thu, 25 Nov 2021 15:34:43 +0000 (UTC)
Received: from IcarusMOD.eternityproject.eu (unknown [2.237.20.237])
 (using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
 (No client certificate requested)
 by m-r2.th.seeweb.it (Postfix) with ESMTPSA id A3F5E3F748;
 Thu, 25 Nov 2021 16:26:53 +0100 (CET)
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Rob Herring <robh@kernel.org>
References: <20210901181138.1052653-1-angelogioacchino.delregno@somainline.org>
 <20210901181138.1052653-3-angelogioacchino.delregno@somainline.org>
 <YTexaJuQSNazh9sn@robh.at.kernel.org>
 <d9ad36f5-1913-2cb3-d4be-125ed2d29041@linaro.org>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>
Message-ID: <fca60152-7f35-e38d-8a51-c9cd74e20674@somainline.org>
Date: Thu, 25 Nov 2021 16:26:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <d9ad36f5-1913-2cb3-d4be-125ed2d29041@linaro.org>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Subject: Re: [Freedreno] [PATCH 3/3] dt-bindings: display: msm: Add binding
 for msm8998 dpu
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
Cc: freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 airlied@linux.ie, linux-arm-msm@vger.kernel.org, konrad.dybcio@somainline.org,
 linux-kernel@vger.kernel.org, abhinavk@codeaurora.org,
 paul.bouchara@somainline.org, robdclark@gmail.com, martin.botka@somainline.org,
 dri-devel@lists.freedesktop.org, daniel@ffwll.ch,
 marijn.suijten@somainline.org, phone-devel@vger.kernel.org, sean@poorly.run,
 ~postmarketos/upstreaming@lists.sr.ht
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Il 25/11/21 12:53, Dmitry Baryshkov ha scritto:
> On 07/09/2021 21:37, Rob Herring wrote:
>> On Wed, Sep 01, 2021 at 08:11:38PM +0200, AngeloGioacchino Del Regno wrote:
>>> Add yaml binding for msm8998 dpu1 support.
>>>
>>> Signed-off-by: AngeloGioacchino Del Regno 
>>> <angelogioacchino.delregno@somainline.org>
>>> ---
>>>   .../bindings/display/msm/dpu-msm8998.yaml     | 220 ++++++++++++++++++
>>>   1 file changed, 220 insertions(+)
>>>   create mode 100644 Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml 
>>> b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
>>> new file mode 100644
>>> index 000000000000..db435342ecbf
>>> --- /dev/null
>>> +++ b/Documentation/devicetree/bindings/display/msm/dpu-msm8998.yaml
>>> @@ -0,0 +1,220 @@
>>> +# SPDX-License-Identifier: GPL-2.0-only or BSD-2-Clause
>>> +%YAML 1.2
>>> +---

<snip>

>>> +
>>> +        power-domains = <&mmcc MDSS_GDSC>;
>>> +        ranges;
>>> +        status = "disabled";
>>
>> Drop. Why disable an example?
> 
> AngeloGioacchino, could you please update and repost this patch series? I'd like to 
> get it merged.
> 

Hey Dmitry,

Sure I can!
Will update/rebase/fix as soon as I find some spare time around.

Thanks,
- Angelo
