Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F2612742CF7
	for <lists+freedreno@lfdr.de>; Thu, 29 Jun 2023 21:14:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6CEF510E1BA;
	Thu, 29 Jun 2023 19:14:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0403810E059
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jun 2023 19:14:53 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4fb77f21c63so1679016e87.2
 for <freedreno@lists.freedesktop.org>; Thu, 29 Jun 2023 12:14:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688066091; x=1690658091;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0Vq+T8lQo74iqCO2gARUksyTq7tukw2uYRbItDc46iw=;
 b=NGs2k0y7ct9TAeWIg2sXMCaKO1ie2YUvLXJyeU3KSEZgGdU+ZSFrYJPd+GZ8Y0QrXQ
 snIQmz9Z5dR5Tqgs3/9E/CFKoSJAZyX7A2s2a00Crzbe/yhCuVyJCHtN1ZOV1BQ2sP0z
 j8Fuhub3WhCWuH9gBRkx8v9HuepD+M2Z5v7oUb1memQGcYPbgQGQDU7vILngB4cx+rPs
 XzdC0Uj+KVV8vJjNrB/vZn71mmy335Hr1xVYYCSnzOhfivzCeSGT337/xcAz6Cq4ENFw
 HJgc9Iupi7bCgQwg0MlcgyvpIqq0Uz69eDJJvMLqXx2bd2QC5S2TMSs63YC8EPT1+ay+
 Fsyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688066091; x=1690658091;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=0Vq+T8lQo74iqCO2gARUksyTq7tukw2uYRbItDc46iw=;
 b=UUsawxsjdLtSgimi+fErtm+t01HcBEZ+lkEIYUHIcCQHlyGCjJ+lPNCG5zYJBuZ+NM
 Apkmp5V1hV4DzeWDni5gzdWJKHReiJMpjf5X44Q3cMNiVciPbLTmPvRf7UuYaTDojw7i
 /E4DQEZYZ6PiQaltBZFW3XWNf72Z9Tia4Zr/k9D/4j3UvdTmB4xLkIP7fO0+EwjLF6Zu
 35kzavyJO0O5U4O8yfzGl0yRsO4IUhxk0lG9GXh6DhICCMy1ncpkv8YkUrkps7KDecdb
 Xd8s8aNF9xkhFMIT5A03dPLIi/BSAF7z+sXb2SxyGBhzs6RdTp3gnXzI7eB/ZOA+4b44
 SNjQ==
X-Gm-Message-State: ABy/qLahesv/Ez8nkbPAeGhhUKPNTJd6ykRb2rWmJLVLMVoo4kOEWaD3
 U9WdldWLbxS1Tr4UvDC52OqW5w==
X-Google-Smtp-Source: APBJJlGBtQm30wveE7QHuHEUoBRPBJ59HzZZOwf8zDUMmBFEmC1w9RT6nElA3dhsxQ7/3LNWzbB9VQ==
X-Received: by 2002:a05:6512:3b9c:b0:4ec:9ef9:e3d with SMTP id
 g28-20020a0565123b9c00b004ec9ef90e3dmr778592lfv.26.1688066091464; 
 Thu, 29 Jun 2023 12:14:51 -0700 (PDT)
Received: from [192.168.1.101] (abyk82.neoplus.adsl.tpnet.pl. [83.9.30.82])
 by smtp.gmail.com with ESMTPSA id
 p17-20020a05651238d100b004fb99acbbe7sm401514lft.231.2023.06.29.12.14.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 29 Jun 2023 12:14:50 -0700 (PDT)
Message-ID: <ba1a6af3-b522-09da-ae81-88f75eae7a47@linaro.org>
Date: Thu, 29 Jun 2023 21:14:47 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>
References: <20230627-sm6125-dpu-v2-0-03e430a2078c@somainline.org>
 <20230627-sm6125-dpu-v2-12-03e430a2078c@somainline.org>
 <84eb1d40-436b-a5b4-a4e3-75a511ad5a90@linaro.org>
 <st3nrb54zxa5xp7qqkdyygf7t6ucgzl3xc5w6d426xy6udj4fx@puakunoaoj2l>
 <CAA8EJpqHh4ZWZxuRMLN2z8BZYFqzoWxZV=oW1ANzEJy4i-PWNw@mail.gmail.com>
From: Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <CAA8EJpqHh4ZWZxuRMLN2z8BZYFqzoWxZV=oW1ANzEJy4i-PWNw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v2 12/15] arm64: dts: qcom: sm6125: Switch
 fixed xo_board clock to RPM XO clock
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
Cc: Michael Turquette <mturquette@baylibre.com>,
 Konrad Dybcio <konrad.dybcio@somainline.org>, dri-devel@lists.freedesktop.org,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 David Airlie <airlied@gmail.com>, linux-clk@vger.kernel.org,
 Krzysztof Kozlowski <krzk@kernel.org>, Andy Gross <agross@kernel.org>,
 Lux Aliaga <they@mint.lgbt>, devicetree@vger.kernel.org,
 Conor Dooley <conor+dt@kernel.org>, linux-arm-msm@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Rob Herring <robh+dt@kernel.org>,
 Martin Botka <martin.botka@somainline.org>,
 ~postmarketos/upstreaming@lists.sr.ht, Sean Paul <sean@poorly.run>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Loic Poulain <loic.poulain@linaro.org>, Stephen Boyd <sboyd@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>, linux-kernel@vger.kernel.org,
 Jami Kettunen <jami.kettunen@somainline.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 29.06.2023 14:26, Dmitry Baryshkov wrote:
> On Thu, 29 Jun 2023 at 15:09, Marijn Suijten
> <marijn.suijten@somainline.org> wrote:
>>
>> On 2023-06-29 13:55:28, Dmitry Baryshkov wrote:
>>> On 27/06/2023 23:14, Marijn Suijten wrote:
>>>> We have a working RPM XO clock; no other driver except rpmcc should be
>>>> parenting directly to the fixed-factor xo_board clock nor should it be
>>>> reachable by that global name.  Remove the name to that effect, so that
>>>> every clock relation is explicitly defined in DTS.
>>>>
>>>> Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
>>>> Signed-off-by: Marijn Suijten <marijn.suijten@somainline.org>
>>>> ---
>>>>   arch/arm64/boot/dts/qcom/sm6125.dtsi | 7 ++++---
>>>>   1 file changed, 4 insertions(+), 3 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/boot/dts/qcom/sm6125.dtsi b/arch/arm64/boot/dts/qcom/sm6125.dtsi
>>>> index 722dde560bec..edb03508dba3 100644
>>>> --- a/arch/arm64/boot/dts/qcom/sm6125.dtsi
>>>> +++ b/arch/arm64/boot/dts/qcom/sm6125.dtsi
>>>> @@ -22,7 +22,6 @@ xo_board: xo-board {
>>>>                     compatible = "fixed-clock";
>>>>                     #clock-cells = <0>;
>>>>                     clock-frequency = <19200000>;
>>>> -                   clock-output-names = "xo_board";
>>>
>>> Why? I'd say, leave it.
>>
>> The exact reason is explained in the commit message.
> 
> Usually we do no not kill the xo_board name for the sake of anybody
> still looking for the old name. Weak argument, I know.
The only users are (rg -l '"xo_board"' drivers):

drivers/clk/qcom/mmcc-msm8974.c
drivers/clk/qcom/a53-pll.c
drivers/clk/qcom/gcc-msm8974.c
drivers/clk/qcom/clk-smd-rpm.c
drivers/clk/qcom/mmcc-msm8996.c
drivers/clk/qcom/gcc-msm8916.c
drivers/clk/qcom/gcc-apq8084.c
drivers/clk/qcom/gcc-msm8996.c
drivers/clk/qcom/mmcc-apq8084.c
drivers/clk/qcom/clk-rpmh.c
drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c

This platform only binds clk-smd-rpm, but patch 11 provides a
direct reference in the DT.

Konrad

> 
>>
>>>
>>> With that fixed:
>>
>> Hence I don't think it makes sense to "fix" this.
>>
>> - Marijn
>>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> 
> 
> 
