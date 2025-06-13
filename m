Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CADDAD8E8E
	for <lists+freedreno@lfdr.de>; Fri, 13 Jun 2025 16:05:20 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0460610E9D6;
	Fri, 13 Jun 2025 14:05:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DihtPqmI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 422EB10E9E5
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jun 2025 14:05:17 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D89FOe029246
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jun 2025 14:05:16 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 SXbFVS3HagPAIGb4Q6j9L8gN9T65FtuJmw8eE95m7Hc=; b=DihtPqmIpiFvuGhA
 StkWJqw1wzFY7E9AxU9jY/rNqYKAa/Q710ybRmEMn0gOAE2A0DfLnM480/j6KwYs
 kR4prcYBOTBKM7Py2RvPZFszqlcxpnHUS55o4pvSsW3zJttlPB1OseSN/e8tGLCd
 7Q85dAKVtqzsWgDsW3dzjKTH6pK0ZijRB5/75VcKnu8tunbXXK+HDg3tY/NJbwcH
 lVuzpMUm+4zo6/vljkgAgWKlaPk0N1g/Og+AO3xsohl9DWNjg34loiE0jjl5VtI1
 623rG3pHXJXqsxYFkWUPhP6lQwT92Szg6SW1lY9iV6bSvwntZrbOuMSUdUbZ1mKG
 LQjtsg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474dn6kp3q-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jun 2025 14:05:16 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d15c975968so361761985a.2
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jun 2025 07:05:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749823514; x=1750428314;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=SXbFVS3HagPAIGb4Q6j9L8gN9T65FtuJmw8eE95m7Hc=;
 b=iJuIEr+y1HTQKkrf5zXXfxa8CvGSFZfE57WC0D2zVnsaG+FEDWze3pXFDvutg6P2ei
 Rr3oh2MNbGO2r0M0M4qz8vM4bTh2f7tk9mkhK5BNeIzaHV9n8nIrBC8HUhLjaJ5+0hpP
 sKOnCvrsbe0YnvBFJknXGqWlVGN3KidR9sKC567LIdz5U+0rXRxZV13cS+XYiDazYxcz
 g27oFz6utUTYIW1CIGjDLvE2Tc509PwPi7C2enWdYKpUHM+jXqzfLfkGt0u44quQqDG+
 KbIRp3e75itgRgLXXbYNt/OXggpmbGW2k2XGQnUY59u0rtTYFGPIpf682uE9x7H+s4zJ
 36cw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHlJIQOsfHj5C1NkNoeECSYZJFnrdCGiKPGJlOgcLHiuTX6RpvCu8KvuyAtkCQKFVbFeH1BBKFU1Y=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxNciqqDMfmrGUAVsZquKhIt52lZ3joU31div83U9k6tLKEF0Kv
 DswBk5GKEJqkjbhRmgWeUkE55EUdjERMp1rcn8V9lAirEfSthaQLLKa2yz9/ZCz41YNdrxBUdyC
 SOeZpOH50EK8+76EghQ93RJerBFxWR8+NcdAFXMPWfEsUQGHyEeOc3bC6Df/dHM1CrHEJN6RMtR
 IlY30=
X-Gm-Gg: ASbGncs3yH3KJf2qYzQweTu5HJ8VEvAY16k98x0eM2IHolwXaW2gYazB9eHeW320YFB
 snpm8WJscI57ZmqSPgswWu41WbaJgY0T/IH9JHS8Xv7+QYnoGXSgu4aD+BQQE8CWTektwNgBy50
 USdaUvIiUhnwQTbfpFXnkpX8kRZ97JGAcbK01dUNN1avU2FUsuYJXoZ123eW5pTHmROl4gfHTnt
 e55EVaDgTMSggAx1TX74HplUlYi8JaRJSoLLObHjdKzXDPMTFEHtsNGUkHJ9lJ+9tWVTVqBi3up
 VNxfaBRm63Mu0jE6TijOrix1S1pkeUo3ESW4dUNI72snJfidK2s91f+Jw4o3mAsCu/55VbU=
X-Received: by 2002:a05:6122:1809:b0:52f:4776:f6a7 with SMTP id
 71dfb90a1353d-5313c860c0bmr2070500e0c.0.1749823502977; 
 Fri, 13 Jun 2025 07:05:02 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGAabxiuRoQe/YqtbK2biWXOJsRJMOrPMmyOlfhlU9BuJsNPdIIiFtgHaougk+e0AABz+4dYg==
X-Received: by 2002:a05:6102:3ed4:b0:4e7:b8ca:e3bc with SMTP id
 ada2fe7eead31-4e7e39d8cbamr2083763137.17.1749823491378; 
 Fri, 13 Jun 2025 07:04:51 -0700 (PDT)
Received: from [10.161.140.61] (87-95-85-22.bb.dnainternet.fi. [87.95.85.22])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-553ac120167sm456434e87.20.2025.06.13.07.04.48
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 13 Jun 2025 07:04:50 -0700 (PDT)
Message-ID: <738a889d-9bd5-40c3-a8f5-f76fcde512f4@oss.qualcomm.com>
Date: Fri, 13 Jun 2025 17:04:47 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 08/17] drm/msm/dsi/phy: Fix reading zero as PLL rates
 when unprepared
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc: Abhinav Kumar <quic_abhinavk@quicinc.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Jonathan Marek <jonathan@marek.ca>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, Rob Clark <robin.clark@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>, Srinivas Kandagatla <srini@kernel.org>
References: <20250610-b4-sm8750-display-v6-0-ee633e3ddbff@linaro.org>
 <20250610-b4-sm8750-display-v6-8-ee633e3ddbff@linaro.org>
 <n5djafe2bm4cofoa3z4urfogchhfacybzou763nelttgfspo25@bywfd5febe6g>
 <dbcfcb3c-0cba-45f6-aaed-b79494d96cde@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <dbcfcb3c-0cba-45f6-aaed-b79494d96cde@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDEwMyBTYWx0ZWRfX53Ijjdh0QBzE
 MAMJAGXuaQ8x8oa6ozsc1pN6uALeE+M/hpoqDN9tTZ1doqWGKaY9mkq05OKigHAo1kHKkzPWdTM
 wMndQE1/jm3JugPC7670qNh14q70tGIVLU8Eu9EUG5Z/lJHypVx2ugAftdV+tJc3DlexxtS6D9d
 Fcl3iJkK6iHq/ia6wxjGCHeGShb6N/3QTtUzmVMxGR9YD2l4RI7EK2FcV1BmyJ73pW6JxCLCBpE
 ZyCN5gpgWURfILZNq+gdT2U6YbeJU0AQNFfBOH2MODdevRA4evi75SQL4ZtKxgqAgMq+FrJVP4B
 ngpwQ+KinT/xKSyyqvJkS8nPjMum1aGsZ/C0Z09q3DfHmLPDVxNJzMhZtUM5TiWfinFbDfH82M7
 WAzmSvFX5GFsqI7VfaDavDIKubeL5XS91WvW9KlEYHaPSZHLzXT6XnFGNjvCJnvphV3Fx+xx
X-Proofpoint-GUID: d8RBeZRpx2N6grttEIO5Ww6yjyHiU3np
X-Authority-Analysis: v=2.4 cv=FaQ3xI+6 c=1 sm=1 tr=0 ts=684c301c cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=E+pfOR1jn8a0x6QusqFK4Q==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=0NLLj492lcDJW-k-HvMA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: d8RBeZRpx2N6grttEIO5Ww6yjyHiU3np
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_01,2025-06-12_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 adultscore=0
 mlxlogscore=689 mlxscore=0 spamscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 clxscore=1015 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506130103
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

On 13/06/2025 17:02, Krzysztof Kozlowski wrote:
> On 13/06/2025 15:55, Dmitry Baryshkov wrote:
>>>   
>>> @@ -361,24 +373,47 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
>>>   
>>>   static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
>>>   {
>>> +	unsigned long flags;
>>>   	u32 data;
>>>   
>>> +	spin_lock_irqsave(&pll->pll_enable_lock, flags);
>>> +	--pll->pll_enable_cnt;
>>> +	if (pll->pll_enable_cnt < 0) {
>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>> +		DRM_DEV_ERROR_RATELIMITED(&pll->phy->pdev->dev,
>>> +					  "bug: imbalance in disabling PLL bias\n");
>>> +		return;
>>> +	} else if (pll->pll_enable_cnt > 0) {
>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>> +		return;
>>> +	} /* else: == 0 */
>>> +
>>>   	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>>   	data &= ~DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>>>   	writel(0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
>>>   	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>> +	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>>   	ndelay(250);
>>
>> What is this ndelay protecting? Is is to let the hardware to wind down
>> correctly? I'm worried about dsi_pll_disable_pll_bias() beng followed up
>> by dsi_pll_enable_pll_bias() in another thread, which would mean that
>> corresponding writes to the REG_DSI_7nm_PHY_CMN_CTRL_0 can come up
>> without any delay between them.
>>
> 
> Great question, but why do you ask me? The code was there already and
> MSM DRM drivers are not something I know and could provide context about.

Because it's you who are changing the code as you've faced the issue 
with recalc_rate.

> 
> 
> Best regards,
> Krzysztof


-- 
With best wishes
Dmitry
