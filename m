Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CCE1B576E1
	for <lists+freedreno@lfdr.de>; Mon, 15 Sep 2025 12:45:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 155DF10E433;
	Mon, 15 Sep 2025 10:45:18 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FZz7aImc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14FA510E433
 for <freedreno@lists.freedesktop.org>; Mon, 15 Sep 2025 10:45:16 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58FAQPCA017534
 for <freedreno@lists.freedesktop.org>; Mon, 15 Sep 2025 10:45:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 3q9UHllEUzo7emL0csxSsit2MUCrJ9I6itNrb0wCCSE=; b=FZz7aImcq32G0kDj
 Oa/v2b1+4ho8TvoVx33/+DXzLu6BhQ+T0y2fU2AyBKpZPlGY9Kk3B3T/s4UjJO3x
 noR9HzsHnCHE+qs5qXNp4LA5L38qpD8KRJuCcw3w/RcKtM9wFfXVtWC2ygn864pG
 6rGWIDOGU0AKw5IN5vhxFFne2Pc/Nh4htyRXVZYhuEhEUAumTfGHbmSoyqc//iri
 +LzLbhra0i3BdLPrYDkwj24dJQofMd10m8psh9gl40fmyJnQ5yXRiuy3sylmDUXj
 zlOs2iqquxLthxrORvtKbARxuKl1sCNtqZU9sIW8cVCoHU0oN7K3b+l7k6UKzjQK
 +0QCbA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496h1sg1q1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 15 Sep 2025 10:45:14 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-245fbdc2546so6684445ad.0
 for <freedreno@lists.freedesktop.org>; Mon, 15 Sep 2025 03:45:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757933112; x=1758537912;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=3q9UHllEUzo7emL0csxSsit2MUCrJ9I6itNrb0wCCSE=;
 b=i8wDXmqYMTKxMd2mi4AOAPuphx1/sCewVN3ooKB2oc6QNeoawKJT6s6flVjSQEJJfA
 MgvxH000ttxGDvMADd2UF2Jd1gLLjTXsrFI4jdTrydL9E0TnL8wPTbNeaI9wR1TsVbhS
 xC3maPbqjBDSfvHutWKRl2+lLwkxEFF+htwdxEgzjTKnEMWN/8zMiZ2peVX/HlDObAUp
 OGH+/dSlXvEAJhjKg43hOW0CA+/jQPeARTsLCYmtKPM0ya5U59Lmu9qkA1Lrh1OaUaSU
 gm7k3RkXPo3lvZVkTHlT4JZY4U35hUW2hisKnxSD0fKY7VRijO6nP7I8ni028IpBi86X
 oyqQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWnXPwP7d0lkfFn5FjFWhpQBQOExPuEQtk+JJQID/hKP33d1yS0G1Uzrj1kV0tUEt6FHXC6Q/Cbdaw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyv3KnAX7UjT/XC1u2gUEhxfFCNUoiDfDcX3mt13uzugs5Y5ima
 EwTIWVxFhpGL3jx0nfQRjQwONoQ/yf8mVt14prr9JWkEDhDuzXJDVB50e8c3aR8z4zM3ejHy7Vs
 +R0iLxrd1w6rTu3W5EZ6h2s+HhjWK3F0+44mN9nDJ/ZPWRKj6q/64cS1ifEK+dZZLSy15puw=
X-Gm-Gg: ASbGncuXKfWJ9KmyAIpeN17F4OM1APc/CoqErmAuzwnLJhL5B6mWtPQKEqYATnKXR7b
 kz5MvxixvFtWYbFSr7UeZNrhGFi/xNl0NwT27x46eHnjD5YJ+VVaT6GWF108SsdfuEmGtqgnySa
 XFu8/O399t5Nald98qbqL0/67GplSedt5lT3JttNOjAnYZy2LMT9RkZZZ7SrKw6Gtk2AiPBWk9I
 pMF+Wq6FqOgcJ0F22TBQbDs52CFvK1ZjA/uukaaa5sA3rEcEsL7WPPTrVd7qk6J5h0NZ0l7IYJu
 9fkNJeM3AV0NbpI8j5PDHzhSg4LpZmOuvKOh9gco3rycQRuTrFu0FfPXcKv+i2epw1bj5spevhb
 quGywXtDBQ+nzOWr5vU5og0fALXgxn8jmwv4=
X-Received: by 2002:a17:902:c94a:b0:262:923b:4e2e with SMTP id
 d9443c01a7336-262923b5125mr46665245ad.11.1757933112386; 
 Mon, 15 Sep 2025 03:45:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGYdD9O4QdRiVJ5hAs101DS3Zf4FAq6fcZz1dgavqsmhdSqj3W4RYmxEazrWjBJJAH2vJCcqw==
X-Received: by 2002:a17:902:c94a:b0:262:923b:4e2e with SMTP id
 d9443c01a7336-262923b5125mr46664835ad.11.1757933111666; 
 Mon, 15 Sep 2025 03:45:11 -0700 (PDT)
Received: from [10.133.33.231] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2664f0071e5sm27436305ad.68.2025.09.15.03.45.05
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 15 Sep 2025 03:45:11 -0700 (PDT)
Message-ID: <8baa3f62-8069-42cb-810d-33e1ad61abbb@oss.qualcomm.com>
Date: Mon, 15 Sep 2025 18:45:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 08/13] phy: qcom: qmp-usbc: Add USB/DP switchable PHY
 clk register
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
References: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
 <20250911-add-displayport-support-for-qcs615-platform-v4-8-2702bdda14ed@oss.qualcomm.com>
 <6p43oxn57kke5eotoqtt5gqtmhmgeteoymewqm3ko5q5veyegs@krkh4dwdno5i>
 <335ffce5-19c6-409d-8386-686fe9e5dea5@oss.qualcomm.com>
 <7ozv3u7xuvtz2x5q3pp5kdeydtsu5jlrgwjnxpxxiuh7przr2z@35uo7t3b4ze2>
 <05e8069e-895c-48b2-8a25-a4a680728cfa@oss.qualcomm.com>
 <ykxl2xjrabsvs6llaf6p3cpiler2nhyrsbnhrbvhtl2is27cig@fbtj45n4e2yd>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <ykxl2xjrabsvs6llaf6p3cpiler2nhyrsbnhrbvhtl2is27cig@fbtj45n4e2yd>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: AU0NPG1hbC6tvpTikAVHShEz9Ailx70g
X-Authority-Analysis: v=2.4 cv=A/1sP7WG c=1 sm=1 tr=0 ts=68c7ee3a cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=rsY2jHysN4_Lp2AvgbIA:9
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: AU0NPG1hbC6tvpTikAVHShEz9Ailx70g
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA5OCBTYWx0ZWRfX6/YZ0DDWSjm1
 qC6+tzS5ozLJMqcHnyQPEsATvUcHcmzS1oF7Fe5Y+Ba89Qid2Sf9ad1HOGQFiWtc9GytPE45fTs
 T0PFoujsey/JyNvT5C5ThW/9DbObaCrPDR15QpPZsfVfGD3IWpKa0rksvEFBkHD55keva1R93Ag
 9NCpdbX+SIPvoSkjesi4YD6NNhcmXwT1geAu7Aer5nIyBjPc4WfiRew+uHtZMDr9vWNowCW/IU4
 7qUzUMgVf85UCaMWFFoRFTJUX2BxZgFmqxsXZFWOQyKBF4/nJNzivn1FRn1ATYOqXvh3mTdgmkN
 p4WFUoIivIWq3+TwR1KdeEq/tKb3HvMoe83rS9sqXBn6DCVjL6BR7DjzfMB22s2fwmGH3sT5s7s
 6XbpyMaI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-15_04,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 spamscore=0 suspectscore=0 bulkscore=0
 impostorscore=0 clxscore=1015 adultscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150098
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On 9/15/2025 6:14 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 15, 2025 at 06:02:19PM +0800, Xiangxu Yin wrote:
>> On 9/12/2025 8:08 PM, Dmitry Baryshkov wrote:
>>> On Fri, Sep 12, 2025 at 08:00:14PM +0800, Xiangxu Yin wrote:
>>>> On 9/12/2025 6:19 PM, Dmitry Baryshkov wrote:
>>>>> On Thu, Sep 11, 2025 at 10:55:05PM +0800, Xiangxu Yin wrote:
>>>>>> Add USB/DP switchable PHY clock registration and DT parsing for DP offsets.
>>>>>> Extend qmp_usbc_register_clocks and clock provider logic to support both
>>>>>> USB and DP instances.
>>>>>>
>>>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>>>> ---
>>>>>>  drivers/phy/qualcomm/phy-qcom-qmp-usbc.c | 208 +++++++++++++++++++++++++++++--
>>>>>>  1 file changed, 195 insertions(+), 13 deletions(-)
>>>>>> +	default:
>>>>>> +		return 0;
>>>>>> +	}
>>>>>> +}
>>>>>> +
>>>>>> +static int qmp_usbc_register_clocks(struct qmp_usbc *qmp, struct device_node *np)
>>>>>> +{
>>>>>> +	int ret;
>>>>>>  
>>>>>> -	ret = of_clk_add_hw_provider(np, of_clk_hw_simple_get, &fixed->hw);
>>>>>> +	ret = phy_pipe_clk_register(qmp, np);
>>>>>>  	if (ret)
>>>>>>  		return ret;
>>>>>>  
>>>>>> -	/*
>>>>>> -	 * Roll a devm action because the clock provider is the child node, but
>>>>>> -	 * the child node is not actually a device.
>>>>>> -	 */
>>>>>> -	return devm_add_action_or_reset(qmp->dev, phy_clk_release_provider, np);
>>>>>> +	if (qmp->dp_serdes != 0) {
>>>>>> +		ret = phy_dp_clks_register(qmp, np);
>>>>>> +		if (ret)
>>>>>> +			return ret;
>>>>>> +	}
>>>>>> +
>>>>>> +	return devm_of_clk_add_hw_provider(qmp->dev, qmp_usbc_clks_hw_get, qmp);
>>>>> Do you understand what did the comment (that you've removed) say? And
>>>>> why?
>>> And this was ignored :-(
>> Sorry for missing this part.
>>
>> For USB-C PHY, the legacy implementation only supports USB with a single
>> device node. The new driver for USB and DP also uses a single device node.
> There is no 'new driver'. It's about DT.
>
>> The function devm_of_clk_add_hw_provider internally handles both
>> of_clk_add_hw_provider and devres_add, and supports automatic resource
>> release.
>>
>> So I think using devm_of_clk_add_hw_provider allows us to remove
>> of_clk_add_hw_provider and devm_add_action_or_reset.
> Which node is passed to of_clk_add_hw_provider() in the legacy DT case?
> Which node is passed to of_clk_add_hw_provider() by
> devm_of_clk_add_hw_provider()?


Ohh, legacy is child node and devm is dev->of_node.

Will add that back for compatibility.


>> For combo PHY, the legacy implementation uses two device nodes: dp_np and
>> usb_np. To maintain forward compatibility, we need to keep support for
>> both nodes and retain the related logic.
