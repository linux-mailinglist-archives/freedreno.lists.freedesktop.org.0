Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6520A714684
	for <lists+freedreno@lfdr.de>; Mon, 29 May 2023 10:47:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19A2510E238;
	Mon, 29 May 2023 08:47:22 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com
 [IPv6:2a00:1450:4864:20::231])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C7A210E238
 for <freedreno@lists.freedesktop.org>; Mon, 29 May 2023 08:47:19 +0000 (UTC)
Received: by mail-lj1-x231.google.com with SMTP id
 38308e7fff4ca-2af2e908163so32107671fa.2
 for <freedreno@lists.freedesktop.org>; Mon, 29 May 2023 01:47:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1685350038; x=1687942038;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=YzR1qktZzOvH81Zib2LaEXdkG13P7Z7RhzbaUscbWOw=;
 b=jxn7BQOdZmvckaE12Hl2c9bavNMy7RrdjwUnwR6H/Xt/+VXWtp4rFvxrxZPVmghylB
 ycBTAWo9YKSZZ8jmGXuRRat+0FfJVaghtW3S6BG1mszhfxNtu/yGIF6ACBWqSMJQbktT
 xWU1fgUvF7ILRUuezpToY26mWXttrcGHCQdANf0mhIbTMj+QXmtbJYv+honJzyJ/5mn0
 VingADEIYqRrNEUk27dIrFdRvOm0olSdaj4oKalk970Al+FoDbd+TIBPDCn25P6HneJ2
 KZck+WCD857/l4Lf7olFAR3fkihylDAhZ8RIsewf5UHQisqhvX5INqi+wdQpdKqUE8VP
 uFSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1685350038; x=1687942038;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=YzR1qktZzOvH81Zib2LaEXdkG13P7Z7RhzbaUscbWOw=;
 b=hk4jUdS+M7a36vlt9XwpvwSL3Y7CalciIqsCOYtOT5pE4f4V16wZUEoQQMNdIs4E8B
 GlFmnNHmyZq6CKQLh06QJvg32tCZmy68Pg3qvgmmza/tz5uCSsNMbwFn6vf0BMZdiKdm
 h/kYtg8owVDdCwB2J28UVYjlNbGMTVZHVjr//8aHKQOmByCQ9+SBeXH5ITzUCE3dg2uh
 b+Gz6S5szKNxoKkdOQAzrX4glF2qwE6s8erVKNrin4Mm7JnAkjVbeCmv9papc+Bxtq3S
 wqevS5L7ZL/oAavnzuDcKSCdxnw3uPTmvl05AUaCCHHCOeTpkj5JpgKKOEl4sVSYrXZa
 6qMQ==
X-Gm-Message-State: AC+VfDwgypY34bDIEH/2iEvlOPxkgPHrUkywC4w1DU6zYRPa+iLmJvoE
 3aRfmD0pkqEWrBlhI0H4ZxpBZQ==
X-Google-Smtp-Source: ACHHUZ5O1rcmLdfc7ENpclDamyb8dvL++NBXNXBVpxw+CFTsLwnZcMYU/9MNKtWHxoVGtRtW87O6AA==
X-Received: by 2002:a2e:850d:0:b0:2ad:bb53:8b9a with SMTP id
 j13-20020a2e850d000000b002adbb538b9amr3861865lji.20.1685350038248; 
 Mon, 29 May 2023 01:47:18 -0700 (PDT)
Received: from ?IPV6:2001:14ba:a0db:1f00::8a5?
 (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::8a5])
 by smtp.gmail.com with ESMTPSA id
 m25-20020a2e97d9000000b002a8b9570403sm2346883ljj.31.2023.05.29.01.47.17
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 29 May 2023 01:47:17 -0700 (PDT)
Message-ID: <254cd131-4ad1-44c9-2653-862580503c15@linaro.org>
Date: Mon, 29 May 2023 11:47:17 +0300
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Content-Language: en-GB
To: Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230417-topic-dpu_regbus-v1-0-06fbdc1643c0@linaro.org>
 <CAA8EJpo8X7KrrXoButyW0d1Lz=a5Stw2inFGt2R7KJ+2NTX6wA@mail.gmail.com>
 <74a817ff-5850-330d-8cac-f551be6fa35c@linaro.org>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <74a817ff-5850-330d-8cac-f551be6fa35c@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH 0/5] MDSS reg bus interconnect
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
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 29/05/2023 10:42, Konrad Dybcio wrote:
> 
> 
> On 29.05.2023 04:42, Dmitry Baryshkov wrote:
>> On Mon, 17 Apr 2023 at 18:30, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>>
>>> Apart from the already handled data bus (MAS_MDP_Pn<->DDR), there's
>>> another path that needs to be handled to ensure MDSS functions properly,
>>> namely the "reg bus", a.k.a the CPU-MDSS interconnect.
>>>
>>> Gating that path may have a variety of effects.. from none to otherwise
>>> inexplicable DSI timeouts..
>>>
>>> This series tries to address the lack of that.
>>>
>>> Example path:
>>>
>>> interconnects = <&bimc MASTER_AMPSS_M0 0 &config_noc SLAVE_DISPLAY_CFG 0>;
>>
>> If we are going to touch the MDSS interconnects, could you please also
>> add the rotator interconnect to the bindings?
>> We do not need to touch it at this time, but let's not have to change
>> bindings later again.
>>
> Ack

Also, several points noted from the mdss fbdev driver:

- All possible clents vote for the low bw setting. This includes DSI, 
HDMI, MDSS itself and INTF
- SMMU also casts such vote, which I do not think should be necessary, 
unless there is a separate MDSS SMMU?
- PINGPONG cacsts high bw setting for the sake of speeding up the LUT 
tables if required.

-- 
With best wishes
Dmitry

