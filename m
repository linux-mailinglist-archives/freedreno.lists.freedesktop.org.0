Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A51D621E5F
	for <lists+freedreno@lfdr.de>; Tue,  8 Nov 2022 22:15:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21C6F10E2D2;
	Tue,  8 Nov 2022 21:15:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com
 [IPv6:2a00:1450:4864:20::22d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4D36110E2D2
 for <freedreno@lists.freedesktop.org>; Tue,  8 Nov 2022 21:15:14 +0000 (UTC)
Received: by mail-lj1-x22d.google.com with SMTP id u2so23006731ljl.3
 for <freedreno@lists.freedesktop.org>; Tue, 08 Nov 2022 13:15:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=TbPSXqBkkfsvy6sh0R6QLPf4hCgHc3rDcYUsSV8QWAw=;
 b=gq3BauSNoIQY8OsQReR2/NvF09kGSEZx51qdGVmKUYIUteqzHQQ5J2TnLGb2gefFa/
 66mzynqqNlKLZY2kx74CtQADZIfTPWdGr+5ssjYmxfxCpJgL/xyfq5TI0ZUqDrcatlMF
 xiVLW5M++2vI6ENo5p5rDUHK2ZZXwo81A+Hp26+sU00A3RfwzSgl1wv9jVTvLHXH/6HO
 WJywjXUdU44T1Yx4GweCVL5Cy4y+rNrKlSwVIvYv791IKImsObPWrQ6mLXKARM6BQQio
 jkxVCEs/kOCqhlMPkclREiGtlgPn85HnFq3NQiJS8izHFlulLo0wgwJB8be2jIDStm7r
 zC2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=TbPSXqBkkfsvy6sh0R6QLPf4hCgHc3rDcYUsSV8QWAw=;
 b=mLsB2BxbNnytXGOWqc+8q34WKA7/8FVHz/raYwkHReoljaGot42b6kf8XIawR2+eD0
 9oEaNnOtYwsw5ZGIw1lVK3HgA+Gf3XEohYObbyeP/R4CxzOgaIbRhswH9PoEPoD8hDel
 k8rc+eHYE1uwgJz457uiD/p05kkRoVUwqrErAK6ek+bP5n1EJ8+w3srpiGKhLBBkc5A6
 wQmPUbwhQ4voEIzLlE+E4M38Tce89UQVpEQdDMwJzjJv658FzAyn9fOmlb2C3CtmzR+h
 F5N4aWPVzSibEnSXlGw7dHrjpuozp1fFobUoiu1DHM4ok3eIW0upNs+BlASJyoRLIv+L
 SAeg==
X-Gm-Message-State: ACrzQf1IYK/ZeqW89J1ooLl4CdU0F0OnOCdjd+0uEWowjifRn2heEdbA
 9S/IuinHbVD5Amtv6J04Rn/ZXw==
X-Google-Smtp-Source: AMsMyM7WIn32uNwx5DstbReB/5SJTwpZj+9Ij378/4SmbHtfHmPVJdupIAz9ZY92s7CNJTzU3Lfmaw==
X-Received: by 2002:a2e:9cd9:0:b0:277:489a:40b1 with SMTP id
 g25-20020a2e9cd9000000b00277489a40b1mr19393074ljj.367.1667942112646; 
 Tue, 08 Nov 2022 13:15:12 -0800 (PST)
Received: from [192.168.0.20]
 (088156142199.dynamic-2-waw-k-3-2-0.vectranet.pl. [88.156.142.199])
 by smtp.gmail.com with ESMTPSA id
 s17-20020a056512315100b0048a934168c0sm1931190lfi.35.2022.11.08.13.15.11
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 08 Nov 2022 13:15:12 -0800 (PST)
Message-ID: <d721d484-84d3-f380-3bbc-43dad139bdee@linaro.org>
Date: Tue, 8 Nov 2022 22:15:11 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, robdclark@gmail.com,
 quic_abhinavk@quicinc.com, krzysztof.kozlowski+dt@linaro.org,
 robh+dt@kernel.org, quic_mkrishn@quicinc.com, linux-arm-msm@vger.kernel.org
References: <20221107235654.1769462-1-bryan.odonoghue@linaro.org>
 <20221107235654.1769462-8-bryan.odonoghue@linaro.org>
 <aeb59d3c-34d0-f00a-bfc3-524cd03acb71@linaro.org>
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <aeb59d3c-34d0-f00a-bfc3-524cd03acb71@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 07/18] dt-bindings: msm:
 dsi-controller-main: Add compatible strings for every current SoC
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
Cc: Sean Paul <sean@poorly.run>, devicetree@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/11/2022 13:46, Dmitry Baryshkov wrote:
> On 08/11/2022 02:56, Bryan O'Donoghue wrote:
>> Currently we do not differentiate between the various users of the
>> qcom,mdss-dsi-ctrl. The driver is flexible enough to operate from one
>> compatible string but, the hardware does have some significant differences
>> in the number of clocks.
>>
>> To facilitate documenting the clocks add the following compatible strings
>>
>> - qcom,mdss-dsi-ctrl-apq8064
> 
> Generic comment: I think we'd better follow the arm/qcom-soc.yaml and 
> use qcom,soc-something as compat string. This would leave us with 
> qcom,apq8064-dsi-ctrl

That's a requirement. Only existing patterns are allowed to continue,
but here all there is no such pattern.

Best regards,
Krzysztof

