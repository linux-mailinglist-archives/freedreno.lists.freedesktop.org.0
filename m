Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0DD6F6C6B24
	for <lists+freedreno@lfdr.de>; Thu, 23 Mar 2023 15:36:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C60D010EAC4;
	Thu, 23 Mar 2023 14:36:21 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com
 [IPv6:2a00:1450:4864:20::32a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9036110EABF
 for <freedreno@lists.freedesktop.org>; Thu, 23 Mar 2023 14:36:20 +0000 (UTC)
Received: by mail-wm1-x32a.google.com with SMTP id
 l15-20020a05600c4f0f00b003ed58a9a15eso1240198wmq.5
 for <freedreno@lists.freedesktop.org>; Thu, 23 Mar 2023 07:36:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679582179;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:from:to:cc:subject:date:message-id:reply-to;
 bh=rEhytZxehTs3+RJ5GfT9s2lxvfEx0RYE515lvUYjdJ0=;
 b=V5SDWIsRwgNllTO/1dZ8+2BeK8fbUIMrxlRp8YqiPNgzroz2Wbf42M22zyEjpuE2bY
 qgqp/Io2hGg1kuOh6iNwhebtRd73evLzKIpwIV2tQVpC7RdEvmN59f6Ne5BM1a9AisYl
 neiJw5JYJv3H2VxgaKHAVI6d/r+7tUHQh5i6jEiKm/quY1AMvH2/bNAG2s/oDxIQx74N
 0R1yDBwYe8r+SVMvEtW21TLR03uQlcqzpGXVVQqbW4lde1BiTLehpjaH2zD+wVrDvolC
 GfZ9Hf4iWQl5qSQc8JudkWgWuRZBt0PUJB0ngMPpmcuynMFqDC7PXWD8ICpDVXxTyaQZ
 QrEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679582179;
 h=content-transfer-encoding:in-reply-to:organization:references:cc:to
 :content-language:subject:reply-to:from:user-agent:mime-version:date
 :message-id:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rEhytZxehTs3+RJ5GfT9s2lxvfEx0RYE515lvUYjdJ0=;
 b=KRKFgpRN3hhXJNFQUPjHzHetyWGeGQbsIQEXX7dMJkjSe02M8CoH3esNp0JlMRcren
 5B0XmgyGRO0epCTzt2mOWYM/r9CVu/3pDFtzY9GNkJz9iuK2FmffYX+AcXvjr2uf6/Zb
 l7hW6nmpR/P1H/bustOAu4A+gAInvOgvGWpozP0Jir6bYUKMcA0VDTgzJayjFpCBM7tL
 PFaG/dOJmpZ3AWJ3OIJDztQgYQTeM9rYsUc2Bm/AIIzmLPuHOFeRfk554ijsVVeU3C6o
 +2/dbW+/vka+pE8+g0P0tD3MBUpIdVQY1Ra7lfuvElRiQ3tkwWMJXyx2e1CjZxX5bfVU
 CyOw==
X-Gm-Message-State: AO0yUKUU1yvShtDZAx3K4aSOgaS0pgFsyxmr5IpbIkhKiIbEIXl15V1F
 5jwH0rzxsQ7Xxf3GH9vEEKQ+Tg==
X-Google-Smtp-Source: AK7set+24+OLG2+h3jPdMAyZlS0SXJwCzS2t+JZk67f0y0qT5SVukxMnGLO7PUFJy2j1bri6RObmeg==
X-Received: by 2002:a05:600c:365a:b0:3ee:5754:f139 with SMTP id
 y26-20020a05600c365a00b003ee5754f139mr2585793wmq.13.1679582179009; 
 Thu, 23 Mar 2023 07:36:19 -0700 (PDT)
Received: from ?IPV6:2a01:e0a:982:cbb0:e25a:65de:379a:3899?
 ([2a01:e0a:982:cbb0:e25a:65de:379a:3899])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a05600c510a00b003edd2ec9f85sm2247944wms.6.2023.03.23.07.36.18
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 23 Mar 2023 07:36:18 -0700 (PDT)
Message-ID: <5ab0601c-5acd-ef49-419b-36f5a7679758@linaro.org>
Date: Thu, 23 Mar 2023 15:36:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.8.0
From: Neil Armstrong <neil.armstrong@linaro.org>
Content-Language: en-US
To: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>
References: <20230206-topic-sm8450-upstream-dp-controller-v6-0-d78313cbc41d@linaro.org>
 <20230206-topic-sm8450-upstream-dp-controller-v6-5-d78313cbc41d@linaro.org>
 <b1e6ca00-348b-4d61-6e90-30bef756732c@linaro.org>
 <20230323143814.cdfbgzlnlbnocx5z@ripper>
Organization: Linaro Developer Services
In-Reply-To: <20230323143814.cdfbgzlnlbnocx5z@ripper>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: [Freedreno] [PATCH v6 5/5] arm64: dts: qcom: sm8450: add dp
 controller
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
Reply-To: neil.armstrong@linaro.org
Cc: freedreno@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 David Airlie <airlied@gmail.com>, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Hi,

On 23/03/2023 15:38, Bjorn Andersson wrote:
> On Tue, Mar 21, 2023 at 09:51:34PM +0100, Konrad Dybcio wrote:
>> On 17.03.2023 16:06, Neil Armstrong wrote:
>>> @@ -2783,6 +2790,78 @@ opp-500000000 {
>>>   				};
>>>   			};
>>>   
>>> +			mdss_dp0: displayport-controller@ae90000 {
>>> +				compatible = "qcom,sm8450-dp", "qcom,sm8350-dp";
>>> +				reg = <0 0xae90000 0 0x200>,
>>> +				      <0 0xae90200 0 0x200>,
>>> +				      <0 0xae90400 0 0xc00>,
>>> +				      <0 0xae91000 0 0x400>,
>>> +				      <0 0xae91400 0 0x400>;
>>> +				interrupt-parent = <&mdss>;
>>> +				interrupts = <12>;
>>> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>>> +					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
>>> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
>>> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
>>> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
>>> +				clock-names = "core_iface",
>>> +					      "core_aux",
>>> +					      "ctrl_link",
>>> +			                      "ctrl_link_iface",
>> I applied this locally and noticed line has 2x 8 spaces.. Bjorn, could
>> you please take care of that when applying?
>>
> 
> Thanks for pointing it out. I did correct it, and I had to do the same
> in sm8350.dtsi.
> 
> @Neil, please run checkpatch --strict, it will highlight these errors.

Thx, sorry... usually I don't miss such errors, won't happen again.

Neil

> 
> Thanks,
> Bjorn

