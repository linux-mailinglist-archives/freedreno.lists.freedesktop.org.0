Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id AC7146A0B26
	for <lists+freedreno@lfdr.de>; Thu, 23 Feb 2023 14:49:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FBF810E4ED;
	Thu, 23 Feb 2023 13:49:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x235.google.com (mail-lj1-x235.google.com
 [IPv6:2a00:1450:4864:20::235])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65F8010EB87
 for <freedreno@lists.freedesktop.org>; Thu, 23 Feb 2023 13:49:05 +0000 (UTC)
Received: by mail-lj1-x235.google.com with SMTP id h3so4835700lja.12
 for <freedreno@lists.freedesktop.org>; Thu, 23 Feb 2023 05:49:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=frB7bLXBAzoLz+jz9s0Y5YZS3DoAI1c5p0MiOZAyg3g=;
 b=RA0VXA2x0u01eDdYnr9UigJZ2T1pl4zDq8NqGuMX5UnjXPlLjgeKxRXqQy3vLOU12v
 JOabwvQh9gnxhIhomkRifz1DnoOv8cMNPI5C3oGD3qTtgEDAJlv9pyLmdK1/0qjsHPfj
 U2Z1q4rG9HVbRdYmcIHenKEEwsYrYbK5Rp0UL378bayXIRu4HhAz8f2Zh/U1VoN0okaj
 JYMBS/y+fs2BCN2jjRr2X4uO7SqfsyTE8yYoMc6vhpr7G+nepm2paL4jH0Uo3u/KrpTz
 5z7zCPtZ0HtSWnEisORbCgNNTNWpeBL5SeW8HQrJZH9LlemOnWAbmLySna534kXjaGsw
 92Lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=frB7bLXBAzoLz+jz9s0Y5YZS3DoAI1c5p0MiOZAyg3g=;
 b=rjR2c4e5Ro8lMXQ7ZNRnAOHf4v5zBpA/0pei7pe4ifKi2YchFnxfOaM841uU+UgMr6
 cSczXGKOWdSf2vYOvuteAtQCiyncTRHXNYMZzYQOebHgufOb4t+XSGjncYtby52KOTe5
 SRkJ1thMtj5QusO6HsTrLg7wE4K7pVr4cBwV9Q5nR5KDAt/3cWKmxVJvID8/quuSe/jO
 lzbIDykmMIY1eYEfjtkBKIo2muzI3a4C4qxqb9xgsN4r2b//xYse11RtVjtlOCdn+j0K
 2xwcGw+mmbzV6no3QafAKw6K1es3wB8IWU4Fb3KGqtqEat90+hsHdXqEBiHKyuFRXCvD
 k89A==
X-Gm-Message-State: AO0yUKXzVGhX/pxK44sShMSRwzsKbmE4P2BM4p5bBDhZq5n5tW14fHVc
 aMuv9KpwzrYb8FLfilwY3HglZw==
X-Google-Smtp-Source: AK7set/+fzhm8Q7+85CuVpa/CC2T12Ib2EKLG78RC9QKfOzgfhUM/TMMpg4QaxdhhCQesbzSHPM6AA==
X-Received: by 2002:a05:651c:1614:b0:293:45f1:c1a6 with SMTP id
 f20-20020a05651c161400b0029345f1c1a6mr3959697ljq.0.1677160143636; 
 Thu, 23 Feb 2023 05:49:03 -0800 (PST)
Received: from [192.168.1.101] (abxi151.neoplus.adsl.tpnet.pl. [83.9.2.151])
 by smtp.gmail.com with ESMTPSA id
 n16-20020ac24910000000b004b7033da2d7sm799123lfi.128.2023.02.23.05.49.01
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Feb 2023 05:49:03 -0800 (PST)
Message-ID: <761e0aba-9364-557a-e6e5-e21494597dbc@linaro.org>
Date: Thu, 23 Feb 2023 14:49:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20230223-topic-gmuwrapper-v3-0-5be55a336819@linaro.org>
 <20230223-topic-gmuwrapper-v3-10-5be55a336819@linaro.org>
 <CAA8EJppi45K0hQ=1fZvf+Mps+4uEkXmLFeqdmyk-yk31CNvUsw@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJppi45K0hQ=1fZvf+Mps+4uEkXmLFeqdmyk-yk31CNvUsw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v3 10/15] drm/msm/a6xx: Fix A680 highest
 bank bit value
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
Cc: Rob Clark <robdclark@chromium.org>, freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 Sean Paul <sean@poorly.run>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 23.02.2023 14:06, Dmitry Baryshkov wrote:
> On Thu, 23 Feb 2023 at 14:07, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>> According to the vendor sources, it's equal to 16, which makes hbb_lo
>> equal to 3.
> 
> I think we might be stricken with the ddr kind difference here, but I
> would not bet on it.
It totally is, but it also seems to be SoC-dependent..
I think all 8180x devices shipped with LPDDR4X FWIW

Konrad
> 
>>
>> Fixes: 840d10b64dad ("drm: msm: Add 680 gpu to the adreno gpu list")
>> Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>> ---
>>  drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 8 +++++++-
>>  1 file changed, 7 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> index b5017c56fa1b..2c4afecdd213 100644
>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>> @@ -885,12 +885,18 @@ static void a6xx_set_ubwc_config(struct msm_gpu *gpu)
>>                 hbb_lo = 2;
>>         }
>>
>> -       if (adreno_is_a640_family(adreno_gpu)) {
>> +       if (adreno_is_a640(adreno_gpu)) {
>>                 amsbc = 1;
>>                 /* HBB = 15 */
>>                 hbb_lo = 2;
>>         }
>>
>> +       if (adreno_is_a680(adreno_gpu)) {
>> +               amsbc = 1;
>> +               /* HBB = 16 */
>> +               hbb_lo = 3;
>> +       }
>> +
>>         if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu)) {
>>                 amsbc = 1;
>>                 /* TODO: get ddr type from bootloader and use 2 for LPDDR4 */
>>
>> --
>> 2.39.2
>>
> 
> 
