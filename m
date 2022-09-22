Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A6EA45E6164
	for <lists+freedreno@lfdr.de>; Thu, 22 Sep 2022 13:42:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 27C1910EACD;
	Thu, 22 Sep 2022 11:42:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com
 [IPv6:2a00:1450:4864:20::22a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BB710EACD
 for <freedreno@lists.freedesktop.org>; Thu, 22 Sep 2022 11:42:02 +0000 (UTC)
Received: by mail-lj1-x22a.google.com with SMTP id b6so10606193ljr.10
 for <freedreno@lists.freedesktop.org>; Thu, 22 Sep 2022 04:42:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date;
 bh=+1WSPKWPrsc/qCB3+vUopjI5nZ0YDPu4pJY+FLQ9d2g=;
 b=MFSvPboCRq4R6FIggkWWQ3DXdLdL9n5qZDgoEkrudLezY2MDKnJP4wtJs7ttGBOZSc
 BcdF0QP+wa6Flm4LNfPX3OZBlIlLdLWhJx4s5tb0gNyTDo0/xMRuI4cf7EOMULCWT8aO
 lqtu4MCYdNwM3f6e3vI5RjMCTyVE/e5u7MXcIP9LlzTxFdL+1KwnDby1EQznZJ+kRDUl
 0SyGrD4Mw2fjA99PNwqxVkcfKqY0g/0ul9z6SO3MhKPlEnfC26Hy+6waB8P0a+ruU77y
 QxCiDdSN/WPOVNDjIwRB9dhBf7Y2V/cV8+FsolgnsRUuLuP/FOlcir5kLI5xK1c2M8lH
 jH3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date;
 bh=+1WSPKWPrsc/qCB3+vUopjI5nZ0YDPu4pJY+FLQ9d2g=;
 b=20y1sPLoKIGV2RHhw0rP3UpTg9C3dWKGn5wHG3DIMyjyW7OH4ig6p4z4tlT6Q7mGv4
 7edSoi4TupC3rqzg+tyyXoFTME58DG3WCYV3yPhZEGjvaIfkCe13rLVPsf8OV2xkv7RU
 njYCmL99MI+AofuYulfRRHXQLAt/RWKhJRUu29+5v+PCf4SZn0elkCy+t0AHcayEGx1l
 WItZJVJacDHrDNqGgn27CT2bUnA9oyLygv1zRh1F/2QIVOKemPxGYP8hk/FoBv/1gxTH
 zJuERcFGJ8U9ddBvC5fnZGu15NNocwqr4yxRWvJll/dt5nBXS2a5VTyn3ltKSRtt3c9z
 GH3A==
X-Gm-Message-State: ACrzQf28ae+NoJThb1wuRl/fKvvhQG/LNGBEABMKnmEqF6/QXwAb8tfG
 B0q+SDT0mXtA4wIZdskROeTdjw==
X-Google-Smtp-Source: AMsMyM6zHeMHrlIuqY4/28l8FLxG/78F98uMeprX3YAgBNuR2l6PU1cveCKQz16copA4pZIFLZZisw==
X-Received: by 2002:a2e:940f:0:b0:261:b9ca:6207 with SMTP id
 i15-20020a2e940f000000b00261b9ca6207mr955616ljh.192.1663846920252; 
 Thu, 22 Sep 2022 04:42:00 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl.
 [78.11.189.27]) by smtp.gmail.com with ESMTPSA id
 d2-20020a056512368200b00494a603953dsm902628lfs.89.2022.09.22.04.41.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 22 Sep 2022 04:41:59 -0700 (PDT)
Message-ID: <4841c705-0944-9e94-1ade-47ad2f462303@linaro.org>
Date: Thu, 22 Sep 2022 13:41:58 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20220915133742.115218-1-dmitry.baryshkov@linaro.org>
 <20220915133742.115218-5-dmitry.baryshkov@linaro.org>
 <2c7769ae-79af-dab5-ebe3-31ccca0bd9a4@linaro.org>
 <CAA8EJppRdrfy5vPuLxH0+=DAELdadK4h6X0xmHA01rySoBFN7g@mail.gmail.com>
Content-Language: en-US
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <CAA8EJppRdrfy5vPuLxH0+=DAELdadK4h6X0xmHA01rySoBFN7g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v7 04/12] dt-bindings: display/msm: move
 common DPU properties to dpu-common.yaml
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
Cc: devicetree@vger.kernel.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Stephen Boyd <swboyd@chromium.org>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 22/09/2022 09:50, Dmitry Baryshkov wrote:
> On Thu, 22 Sept 2022 at 10:02, Krzysztof Kozlowski
> <krzysztof.kozlowski@linaro.org> wrote:
>>
>> On 15/09/2022 15:37, Dmitry Baryshkov wrote:
>>> Move properties common to all DPU DT nodes to the dpu-common.yaml.
>>>
>>> Note, this removes description of individual DPU port@ nodes. However
>>> such definitions add no additional value. The reg values do not
>>> correspond to hardware INTF indices. The driver discovers and binds
>>> these ports not paying any care for the order of these items. Thus just
>>> leave the reference to graph.yaml#/properties/ports and the description.
>>
>> This is okay, but you loose required:ports@[01].
> 
> This is fine for me. The ports do not have 1:1 correspondence to
> intfs. Usually platforms add ports as new sinks are added. For example
> a platform can start with a single DSI node and later get second DSI,
> DP, eDP, etc. as they are receiving support/required by end-user
> devices.

Then at least port@0 would be required. Node without ports does not look
correct.

Best regards,
Krzysztof

