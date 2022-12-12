Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5B5D6649CFA
	for <lists+freedreno@lfdr.de>; Mon, 12 Dec 2022 11:54:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5193210E194;
	Mon, 12 Dec 2022 10:54:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB23710E194
 for <freedreno@lists.freedesktop.org>; Mon, 12 Dec 2022 10:54:06 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id q6so7806643lfm.10
 for <freedreno@lists.freedesktop.org>; Mon, 12 Dec 2022 02:54:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:from:to:cc:subject
 :date:message-id:reply-to;
 bh=jN9sEBY3LAhBIsC2SKGFeUTMmLXmYwsXUk6CCQcXwxI=;
 b=OPkAol+cxiEfwUWOLToSowmwiWak4vBJdX05KL5JTgLv8JWbaYjlXWQUg5ptE8F2GL
 1AFXhyXnq/XU9mQ9eU9alzRptl4z0b0r8KvdRa9Ar6xhV4SMrAwyg73t6r/V/YVw3ozC
 1W5UNNcY3YorB1N5bXyYyPtwfn971LYYhdAUqAQ+LX8U10BJPF5zOQ442H7HU5WVlyAa
 qR8Lw0aX8qRO7LXYfgV54PN+44wrSV1KgNhhDHvSIu9f/tQXKktrR+X0cFf7FjN8ysrS
 cxVxpB2iJ1v7rwHUJqs+ErxxVx+FcNn+L4SiQfiZv+8B0y70qmVAZ2F/BxuGWocOkwtb
 5llg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:references
 :in-reply-to:user-agent:subject:cc:to:from:date:x-gm-message-state
 :from:to:cc:subject:date:message-id:reply-to;
 bh=jN9sEBY3LAhBIsC2SKGFeUTMmLXmYwsXUk6CCQcXwxI=;
 b=hichfInE3nZsxtfuvLd08Q9RPuB6W/cHf6YQz4kArjlVv6fUr0EtYCq9kYuI16zavZ
 5KeEol5j95FQX6klfrUE9moXsBA+5KE1K4llUvK+N3dCLOmgPfr8+KTQqVV1gLi9wre+
 LTBXsrLEzb5Ecc0MZq7PyNwCzfusIDRkRKLtyjlv7t69H4YubuexZ4q5kRfrsRqP6F1G
 o72gaRMA5ha5Waa+/uIYsXFam+1yCLQWST5+pS3P8Q0VawoktnmY/Av96j/+dpJBDDMA
 13L9ZptklONxjIwGpp74uovlYbf2Koub6fN+KqtnQu9gQY6+1fz/3Kvd1okFD3vEPSjw
 Uiyg==
X-Gm-Message-State: ANoB5pnrrORLCAxChDryQec+ph67wbDmn4XOFD5qcugrL22cU9RTAHbR
 Kx/f/u9klOn+NQKhb/tolqZ/WQ==
X-Google-Smtp-Source: AA0mqf5FK4Y1X52q+deu6rdGbCIJ2U5TFCkzrIkKv3HQ4S4H1QrelaJC+P8CW+wTRYBgXdgV0LCdFA==
X-Received: by 2002:a19:5f5a:0:b0:4b5:9b5b:ae92 with SMTP id
 a26-20020a195f5a000000b004b59b5bae92mr3978862lfj.10.1670842445212; 
 Mon, 12 Dec 2022 02:54:05 -0800 (PST)
Received: from [127.0.0.1] ([94.25.229.102]) by smtp.gmail.com with ESMTPSA id
 h28-20020a056512055c00b00494942bec60sm1588845lfl.17.2022.12.12.02.54.04
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Mon, 12 Dec 2022 02:54:04 -0800 (PST)
Date: Mon, 12 Dec 2022 13:53:59 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Konrad Dybcio <konrad.dybcio@linaro.org>, linux-arm-msm@vger.kernel.org,
 andersson@kernel.org, agross@kernel.org, krzysztof.kozlowski@linaro.org
User-Agent: K-9 Mail for Android
In-Reply-To: <80168963-0e17-e8aa-6d99-a1c53f63c934@linaro.org>
References: <20221212093315.11390-1-konrad.dybcio@linaro.org>
 <20221212093315.11390-2-konrad.dybcio@linaro.org>
 <FF242AC6-01EC-4C8E-BE49-BB54FC9D2FEE@linaro.org>
 <80168963-0e17-e8aa-6d99-a1c53f63c934@linaro.org>
Message-ID: <16CE34C3-ADAE-47EC-AAFB-4436C4D8C842@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable
Subject: Re: [Freedreno] [PATCH 2/3] arm64: dts: qcom: sm8150: Add DISPCC
 node
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
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Daniel Vetter <daniel@ffwll.ch>,
 marijn.suijten@somainline.org, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>



On 12 December 2022 13:23:50 GMT+03:00, Konrad Dybcio <konrad=2Edybcio@lin=
aro=2Eorg> wrote:
>
>
>On 12=2E12=2E2022 11:18, Dmitry Baryshkov wrote:
>>=20
>>=20
>> On 12 December 2022 12:33:13 GMT+03:00, Konrad Dybcio <konrad=2Edybcio@=
linaro=2Eorg> wrote:
>>> Years after the SoC support has been added, it's high time for it to
>>> get dispcc going=2E Add the node to ensure that=2E
>>>
>>> Signed-off-by: Konrad Dybcio <konrad=2Edybcio@linaro=2Eorg>
>>> ---
>>> arch/arm64/boot/dts/qcom/sm8150=2Edtsi | 26 ++++++++++++++++++++++++++
>>> 1 file changed, 26 insertions(+)
>>>
>>> diff --git a/arch/arm64/boot/dts/qcom/sm8150=2Edtsi b/arch/arm64/boot/=
dts/qcom/sm8150=2Edtsi
>>> index a0c57fb798d3=2E=2Eff04397777f4 100644
>>> --- a/arch/arm64/boot/dts/qcom/sm8150=2Edtsi
>>> +++ b/arch/arm64/boot/dts/qcom/sm8150=2Edtsi
>>> @@ -3579,6 +3579,32 @@ camnoc_virt: interconnect@ac00000 {
>>> 			qcom,bcm-voters =3D <&apps_bcm_voter>;
>>> 		};
>>>
>>> +		dispcc: clock-controller@af00000 {
>>> +			compatible =3D "qcom,sm8150-dispcc";
>>> +			reg =3D <0 0x0af00000 0 0x10000>;
>>> +			clocks =3D <&rpmhcc RPMH_CXO_CLK>,
>>> +				 <0>,
>>> +				 <0>,
>>> +				 <0>,
>>> +				 <0>,
>>> +				 <0>,
>>> +				 <0>;
>>> +			clock-names =3D "bi_tcxo",
>>> +				      "dsi0_phy_pll_out_byteclk",
>>> +				      "dsi0_phy_pll_out_dsiclk",
>>> +				      "dsi1_phy_pll_out_byteclk",
>>> +				      "dsi1_phy_pll_out_dsiclk",
>>> +				      "dp_phy_pll_link_clk",
>>> +				      "dp_phy_pll_vco_div_clk";
>>> +			#clock-cells =3D <1>;
>>> +			#reset-cells =3D <1>;
>>> +			#power-domain-cells =3D <1>;
>>> +
>>> +			power-domains =3D <&rpmhpd SM8150_MMCX>;
>>> +			/* TODO: Maybe rpmhpd_opp_min_svs could work as well? */
>>> +			required-opps =3D <&rpmhpd_opp_low_svs>;
>>=20
>> Is it required for the dispcc, for the DSI or for the dpu? We have stum=
bled upon the similar issue when working on the 8350, see the latest Robert=
's patchset=2E
>While I don't have any hard evidence, it seems like it is required for
>any "interesting" multimedia components, AFAIU even including video and
>camera clocks=2E=2E
>
>Seems like it's a deep down dependency for a lot of things on this
>particular SoC (and likely also on newer ones, remember the initial
>mess with 8250 mmcx?)

Yes=2E I was questioning the opp level rather than the domain itself=2E Us=
ually the least possible mmcx level is enough to get dispcc going=2E Then t=
he consumers (via the PLLs) bump this requirement=2E=20

In this particular case the vendor dtsi (sm8150-regulator=2Edtsi) declares=
 that the minimum level for mmcx is low_svs=2E So, I think, you can drop th=
e todo completely=2E


>
>Konrad
>>=20
>>=20
>>> +		};
>>> +
>>> 		pdc: interrupt-controller@b220000 {
>>> 			compatible =3D "qcom,sm8150-pdc", "qcom,pdc";
>>> 			reg =3D <0 0x0b220000 0 0x400>;
>>=20

--=20
With best wishes
Dmitry
