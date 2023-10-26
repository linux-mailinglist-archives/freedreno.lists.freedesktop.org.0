Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9B15B7D89D7
	for <lists+freedreno@lfdr.de>; Thu, 26 Oct 2023 22:50:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 59EA010E8A5;
	Thu, 26 Oct 2023 20:49:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com
 [IPv6:2a00:1450:4864:20::333])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D5EEF10E8A5
 for <freedreno@lists.freedesktop.org>; Thu, 26 Oct 2023 20:49:56 +0000 (UTC)
Received: by mail-wm1-x333.google.com with SMTP id
 5b1f17b1804b1-40790b0a224so10066935e9.0
 for <freedreno@lists.freedesktop.org>; Thu, 26 Oct 2023 13:49:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1698353395; x=1698958195; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=7+tTyISiZtMmzjPiRJNN0KqFKy1wko0l5JwAIuQLXRU=;
 b=s24xkHfBN5eoX7O2q1QxnXNUuJ+8I3HcHnQ13A17/TaSK0Gr6TM//+pFUh+wntwPd4
 HOBPRoZbLs/S3J6ps0/M2R8pjl9Y6nQGKrikU6axEPL3omuM+QpImmmgP38vVGW7t20E
 IlD729dA5sI4IFaS6OywJkSYTkVXadZngmSoB1o3DT+Un5shNONHmf8+wnqSlGQSdPbA
 teaIAI+8fQHLgSFQZC+QrkjQRd4EyRY0+jlQeI4BR8kS5jpzbNROZK3dJOKY/rr/KLrb
 hErTehOt/g8a3hzhYQGRewGjDk8XK8vtjSG2JR9JSoiG+unOFEfHV1ReDulFMdrqqQZJ
 FBLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1698353395; x=1698958195;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=7+tTyISiZtMmzjPiRJNN0KqFKy1wko0l5JwAIuQLXRU=;
 b=WxLPHNQfcoKH57+7WyRvS5fcwWznx4LII+Gqd6K+2EybvJYKYQhSQZ3UXaEVIMhHOP
 HmrQYgvZvre6V43dt5BVecDZHERqzreX5HnrtKDKW08V9sX82BfWC58cY9vp1IRrm69u
 3vf/roXBy2PtlHevAwaQaHTV0QCtJwwaMjoejQg4mbLqlDETggurMq8DHSj/KI9YY6q7
 RnYJRuDYUmJzAN9wGipNXGDEmVMzJaq2y686U8883Eycp7JQnEDf61OM2HOnW8RrQVQM
 ScARpN8sjgogAm+iD9GVX+l/wV2oXvNMqxd0evE7yt1kXGGL0fX2BhKuZP88fI6n80gZ
 Sn1w==
X-Gm-Message-State: AOJu0YyzIoZMBmFNcNzr9e27GVLjti72LsPtRawd8nD53C+6ymxOhuPD
 TiD1j3LiWKdCaLBgl+sOv990hA==
X-Google-Smtp-Source: AGHT+IFQ0G93i4ai41OiX7KGzsO94OIBxSh7ikKpUJGDGbO/J0L3URazErYlBG90mddk6LGPqwdL6Q==
X-Received: by 2002:a05:600c:3b20:b0:407:612b:91fb with SMTP id
 m32-20020a05600c3b2000b00407612b91fbmr713606wms.30.1698353395286; 
 Thu, 26 Oct 2023 13:49:55 -0700 (PDT)
Received: from [172.30.204.240] (UNUSED.212-182-62-129.lubman.net.pl.
 [212.182.62.129]) by smtp.gmail.com with ESMTPSA id
 o1-20020a05600c510100b003fe1c332810sm3492503wms.33.2023.10.26.13.49.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 26 Oct 2023 13:49:54 -0700 (PDT)
Message-ID: <ac995dde-b5b3-4dd8-b704-5081cf9f9162@linaro.org>
Date: Thu, 26 Oct 2023 22:49:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20231004003125.2289613-1-dmitry.baryshkov@linaro.org>
 <20231004003125.2289613-2-dmitry.baryshkov@linaro.org>
 <abc36c33-bfd9-4451-80ab-a631492044de@linaro.org>
 <ed18292b-efe8-48fc-8696-79e51acf8ab4@linaro.org>
 <CAA8EJpo_H3-Lk1GQXGQikXiCtaEQ4C+FBW-fz9D2TbuX2HDhRA@mail.gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpo_H3-Lk1GQXGQikXiCtaEQ4C+FBW-fz9D2TbuX2HDhRA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [RFC PATCH 1/2] clk: qcom: implement RCG2 'parked'
 clock support
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, linux-clk@vger.kernel.org,
 Taniya Das <quic_tdas@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Andy Gross <agross@kernel.org>, freedreno@lists.freedesktop.org,
 Michael Turquette <mturquette@baylibre.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 10/26/23 22:47, Dmitry Baryshkov wrote:
> On Thu, 26 Oct 2023 at 21:57, Konrad Dybcio <konrad.dybcio@linaro.org> wrote:
>>
>>
>>
>> On 10/7/23 01:43, Konrad Dybcio wrote:
>>> On 4.10.2023 02:31, Dmitry Baryshkov wrote:
>>>> clk_rcg2_shared_ops implements support for the case of the RCG which
>>>> must not be completely turned off. However its design has one major
>>>> drawback: it doesn't allow us to properly implement the is_enabled
>>>> callback, which causes different kinds of misbehaviour from the CCF.
>>>>
>>>> Follow the idea behind clk_regmap_phy_mux_ops and implement the new
>>>> clk_rcg2_parked_ops. It also targets the clocks which must not be fully
>>>> switched off (and shared most of the implementation with
>>>> clk_rcg2_shared_ops). The major difference is that it requires that the
>>>> parent map doesn't conain the safe (parked) clock source. Instead if the
>>>> CFG_REG register points to the safe source, the clock is considered to
>>>> be disabled.
>>>>
>>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
>>>> ---
>>> Would the intention here be to replace all usages of _shared_?
> 
> Yes
Then I suppose an immediate followup question would be: "why
introduce new ops instead of replacing the existing ones in the
patchset?".

Konrad
