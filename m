Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 69E86809E17
	for <lists+freedreno@lfdr.de>; Fri,  8 Dec 2023 09:28:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3675E10EA16;
	Fri,  8 Dec 2023 08:28:39 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com
 [IPv6:2a00:1450:4864:20::42c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C64910EA18
 for <freedreno@lists.freedesktop.org>; Fri,  8 Dec 2023 08:28:38 +0000 (UTC)
Received: by mail-wr1-x42c.google.com with SMTP id
 ffacd0b85a97d-333630e9e43so1826586f8f.2
 for <freedreno@lists.freedesktop.org>; Fri, 08 Dec 2023 00:28:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1702024116; x=1702628916; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:from:to:cc:subject:date:message-id
 :reply-to; bh=tvDaevsK7/OdtIN4ZZ92+SBkN0d/AhKeYYJWkWcCFcM=;
 b=op0njKD6b0+ydcD9pHpx6jw9xrWKs1p+N5lKEG7+c32NvskKycMJbOpL1IoIPoKIfq
 v4OyYxH/dxudzR2pNtGYGCuZ2t1D05AuY1PRetq/DE1O/j49IEpqk6zZwAdaU9+/fcFo
 YoZ/CNfruc/0PHYe6RsA3BDoRHq3w9GyA1ATfYzOhBWGUbpQHI+kBCgQPJYFiVtihyCg
 /LJgfOh2gcii/OQmyI41yPt0UorP/DAbwh2I5WEuSzt3EK8Aya3gOhRxFRpSGFljbbjr
 xh47zLjDrRmr9qDKtbbVXvXPGKY53TcQxMBuvV27jPZiMTVS9LvJZxVIlWsp+IidWtqQ
 pdLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1702024116; x=1702628916;
 h=content-transfer-encoding:in-reply-to:organization:autocrypt
 :references:cc:to:content-language:subject:reply-to:from:user-agent
 :mime-version:date:message-id:x-gm-message-state:from:to:cc:subject
 :date:message-id:reply-to;
 bh=tvDaevsK7/OdtIN4ZZ92+SBkN0d/AhKeYYJWkWcCFcM=;
 b=HF9a/M3GKhYei42qPTAwY5gGGCqIWZhj9WFHnsZocmsxImHIKhA0iVgiaiqn7inSup
 Qkp2egXMh46IKAmnn2gVO38O3vQ9q3cAnJOV0iRB/82Bp8MOyvKNV6g+Ct3mlzPKSSPF
 5ityIdawFdza37Veo860aeZ9ximRv/jUEhdBBl4h4KL+pKWQ42x6VLY+Ofllic2FRkFJ
 QA+JX7DqVcnC8EIZzAZD0PigJBET6FENG4JFFWc3mZsr4qjEwjpNR6RM9znbOFZV2cht
 FzHxCEtWxjoN4CrXfOCIPRIP7I5/DSeq5BiarS5dd6JrQm4TO3nzAXdvmXX2AhcqO74L
 p/Pg==
X-Gm-Message-State: AOJu0YzNvqA3RPewlEEDaoHYHEZPDKQLqqlFN/w9VYbjHzttc/5zuBKJ
 1pQftMiNZoqrNP+H2iiOshtAwA==
X-Google-Smtp-Source: AGHT+IEBO5Hb/8bJQCK/Qq3DsVqqs4n08jSKkaq3CCjQjLLptybMAMNqJbrR+mF21o23C48+AF1EzQ==
X-Received: by 2002:adf:f752:0:b0:333:2fd2:3be2 with SMTP id
 z18-20020adff752000000b003332fd23be2mr1651859wrp.155.1702024116507; 
 Fri, 08 Dec 2023 00:28:36 -0800 (PST)
Received: from ?IPV6:2a01:e0a:982:cbb0:8ada:86ec:5358:ef2a?
 ([2a01:e0a:982:cbb0:8ada:86ec:5358:ef2a])
 by smtp.gmail.com with ESMTPSA id
 o10-20020a5d58ca000000b0033338c3ba42sm1483097wrf.111.2023.12.08.00.28.35
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 08 Dec 2023 00:28:36 -0800 (PST)
Message-ID: <a0e0e803-47a6-4b66-bc14-7a9f7db696fd@linaro.org>
Date: Fri, 8 Dec 2023 09:28:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Neil Armstrong <neil.armstrong@linaro.org>
Subject: Re: [PATCH 3/3] arm64: dts: qcom: sm8650: Add DisplayPort device nodes
Content-Language: en-US, fr
To: Bjorn Andersson <andersson@kernel.org>
References: <20231207-topic-sm8650-upstream-dp-v1-0-b762c06965bb@linaro.org>
 <20231207-topic-sm8650-upstream-dp-v1-3-b762c06965bb@linaro.org>
 <bcecxzpogq6pndwmhgrl52ia3orni2q5brg6mpc6fkn5widigb@v6dy4minwajx>
Autocrypt: addr=neil.armstrong@linaro.org; keydata=
 xsBNBE1ZBs8BCAD78xVLsXPwV/2qQx2FaO/7mhWL0Qodw8UcQJnkrWmgTFRobtTWxuRx8WWP
 GTjuhvbleoQ5Cxjr+v+1ARGCH46MxFP5DwauzPekwJUD5QKZlaw/bURTLmS2id5wWi3lqVH4
 BVF2WzvGyyeV1o4RTCYDnZ9VLLylJ9bneEaIs/7cjCEbipGGFlfIML3sfqnIvMAxIMZrvcl9
 qPV2k+KQ7q+aXavU5W+yLNn7QtXUB530Zlk/d2ETgzQ5FLYYnUDAaRl+8JUTjc0CNOTpCeik
 80TZcE6f8M76Xa6yU8VcNko94Ck7iB4vj70q76P/J7kt98hklrr85/3NU3oti3nrIHmHABEB
 AAHNKk5laWwgQXJtc3Ryb25nIDxuZWlsLmFybXN0cm9uZ0BsaW5hcm8ub3JnPsLAkQQTAQoA
 OwIbIwULCQgHAwUVCgkICwUWAgMBAAIeAQIXgBYhBInsPQWERiF0UPIoSBaat7Gkz/iuBQJk
 Q5wSAhkBAAoJEBaat7Gkz/iuyhMIANiD94qDtUTJRfEW6GwXmtKWwl/mvqQtaTtZID2dos04
 YqBbshiJbejgVJjy+HODcNUIKBB3PSLaln4ltdsV73SBcwUNdzebfKspAQunCM22Mn6FBIxQ
 GizsMLcP/0FX4en9NaKGfK6ZdKK6kN1GR9YffMJd2P08EO8mHowmSRe/ExAODhAs9W7XXExw
 UNCY4pVJyRPpEhv373vvff60bHxc1k/FF9WaPscMt7hlkbFLUs85kHtQAmr8pV5Hy9ezsSRa
 GzJmiVclkPc2BY592IGBXRDQ38urXeM4nfhhvqA50b/nAEXc6FzqgXqDkEIwR66/Gbp0t3+r
 yQzpKRyQif3OwE0ETVkGzwEIALyKDN/OGURaHBVzwjgYq+ZtifvekdrSNl8TIDH8g1xicBYp
 QTbPn6bbSZbdvfeQPNCcD4/EhXZuhQXMcoJsQQQnO4vwVULmPGgtGf8PVc7dxKOeta+qUh6+
 SRh3vIcAUFHDT3f/Zdspz+e2E0hPV2hiSvICLk11qO6cyJE13zeNFoeY3ggrKY+IzbFomIZY
 4yG6xI99NIPEVE9lNBXBKIlewIyVlkOaYvJWSV+p5gdJXOvScNN1epm5YHmf9aE2ZjnqZGoM
 Mtsyw18YoX9BqMFInxqYQQ3j/HpVgTSvmo5ea5qQDDUaCsaTf8UeDcwYOtgI8iL4oHcsGtUX
 oUk33HEAEQEAAcLAXwQYAQIACQUCTVkGzwIbDAAKCRAWmrexpM/4rrXiB/sGbkQ6itMrAIfn
 M7IbRuiSZS1unlySUVYu3SD6YBYnNi3G5EpbwfBNuT3H8//rVvtOFK4OD8cRYkxXRQmTvqa3
 3eDIHu/zr1HMKErm+2SD6PO9umRef8V82o2oaCLvf4WeIssFjwB0b6a12opuRP7yo3E3gTCS
 KmbUuLv1CtxKQF+fUV1cVaTPMyT25Od+RC1K+iOR0F54oUJvJeq7fUzbn/KdlhA8XPGzwGRy
 4zcsPWvwnXgfe5tk680fEKZVwOZKIEuJC3v+/yZpQzDvGYJvbyix0lHnrCzq43WefRHI5XTT
 QbM0WUIBIcGmq38+OgUsMYu4NzLu7uZFAcmp6h8g
Organization: Linaro Developer Services
In-Reply-To: <bcecxzpogq6pndwmhgrl52ia3orni2q5brg6mpc6fkn5widigb@v6dy4minwajx>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
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
Cc: freedreno@lists.freedesktop.org, Conor Dooley <conor+dt@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 devicetree@vger.kernel.org, David Airlie <airlied@gmail.com>,
 dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, Maxime Ripard <mripard@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Rob Herring <robh+dt@kernel.org>, Andy Gross <agross@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On 08/12/2023 04:38, Bjorn Andersson wrote:
> On Thu, Dec 07, 2023 at 05:37:19PM +0100, Neil Armstrong wrote:
>> diff --git a/arch/arm64/boot/dts/qcom/sm8650.dtsi b/arch/arm64/boot/dts/qcom/sm8650.dtsi
> [..]
>> +
>> +			mdss_dp0: displayport-controller@af54000 {
>> +				compatible = "qcom,sm8650-dp";
>> +				reg = <0 0xaf54000 0 0x200>,
>> +				      <0 0xaf54200 0 0x200>,
>> +				      <0 0xaf55000 0 0xc00>,
>> +				      <0 0xaf56000 0 0x400>,
>> +				      <0 0xaf57000 0 0x400>;
>> +
>> +				interrupts-extended = <&mdss 12>;
>> +
>> +				clocks = <&dispcc DISP_CC_MDSS_AHB_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DPTX0_AUX_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DPTX0_LINK_INTF_CLK>,
>> +					 <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK>;
>> +				clock-names = "core_iface",
>> +					      "core_aux",
>> +					      "ctrl_link",
>> +					      "ctrl_link_iface",
>> +					      "stream_pixel";
>> +
>> +				assigned-clocks = <&dispcc DISP_CC_MDSS_DPTX0_LINK_CLK_SRC>,
>> +						  <&dispcc DISP_CC_MDSS_DPTX0_PIXEL0_CLK_SRC>;
>> +				assigned-clock-parents = <&usb_dp_qmpphy QMP_USB43DP_DP_LINK_CLK>,
>> +							 <&usb_dp_qmpphy QMP_USB43DP_DP_VCO_DIV_CLK>;
>> +
>> +				operating-points-v2 = <&dp_opp_table>;
>> +
>> +				power-domains = <&rpmhpd RPMHPD_MX>;
> 
> Are you sure the DP TX block sits in MX? I'd expect this to be
> RPMHPD_MMCX, and then the PHY partially in MX...

Hmm, yeah probably, will switch to MMCX

> 
>> +
>> +				phys = <&usb_dp_qmpphy QMP_USB43DP_DP_PHY>;
>> +				phy-names = "dp";
>> +
>> +				#sound-dai-cells = <0>;
>> +
>> +				status = "disabled";
>> +
>> +				ports {
>> +					#address-cells = <1>;
>> +					#size-cells = <0>;
>> +
>> +					port@0 {
>> +						reg = <0>;
>> +
>> +						mdss_dp0_in: endpoint {
>> +							remote-endpoint = <&dpu_intf0_out>;
>> +						};
>> +					};
>> +
>> +					port@1 {
>> +						reg = <1>;
>> +
>> +						mdss_dp0_out: endpoint {
>> +						};
>> +					};
>> +				};
>> +
>> +				dp_opp_table: opp-table {
> 
> Is there any reason why we keep sorting 'o' after 'p' in these nodes?

No, seems it's a copy-paste issue, will fix

Thanks,
Neil

> 
> Regards,
> Bjorn

