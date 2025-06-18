Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3A4A3ADEE01
	for <lists+freedreno@lfdr.de>; Wed, 18 Jun 2025 15:39:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 11ABB10E823;
	Wed, 18 Jun 2025 13:39:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="TS6A3eEa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A48A10E823
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jun 2025 13:39:21 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55I8Q7jq007205
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jun 2025 13:39:20 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4EXdgzWBp0rRNaJUQrduuFz9dcLZtkU3b7btYf+fyks=; b=TS6A3eEavcszJ+4u
 utlHuBbP5Ro/XSrrrJk7631nSwT83ZoPwxnrnc3T95lXnS21LJ3HAliIeThWwOux
 3yogDz/mEZ8S8gxtTUNJxEUEQJ55zjtwyOfXC0DAYbyjx8CCQWYcE3AVwm9eqzN1
 pjRwAtBU+dWaUniwTTACHZVdQqCaf3xvwWK2eSO315X8J7TWs9EjH6CPejF3xvXz
 uuz0AhLUkvtIpBApzpQnlj4IqM55SftmQ5/SVM6kBOv7tA5GK9daWgtk547skQPD
 lApVocx52v4RYdsBqesRcTC97+OZTs5DC00hDXaIZoezSTGDXixvsPyKCRBFs67h
 /hvdIQ==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791enm7cc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jun 2025 13:39:20 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c5bb68b386so2184203285a.3
 for <freedreno@lists.freedesktop.org>; Wed, 18 Jun 2025 06:39:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750253960; x=1750858760;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=4EXdgzWBp0rRNaJUQrduuFz9dcLZtkU3b7btYf+fyks=;
 b=hqv83AGJT6cEcHBHbJc28ESXNrMXSeDsME/MGCBh7GQHizMlLD9qcnm+SPQHmjL9Am
 /V6/2J+XHP6IVPJC4NJy1JLPz+StahJMWkWNS0lRsZVPqOeTc3O7ALkim0QBVNp3buUK
 27e+qtZSCnETx6xy/p6fIzrJAS0ieJi4UXhf+zjR6E2lix+vObSkUw2Zwo91BSwdwZre
 zMU1VToULBDbdJrty3qAfafMnHdPwPM6JDRxnDGk/NGgZ0JjKhunzsX0JsEvTkOfxwtB
 4gbzsMoZoCmY22DOcN2ipOTbRctxDepi+oCz22dT8eMitoLPf060URWsSE9S9krFLnfI
 TbSQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX19Y8nr8GkI32o2S7ft32ufswfCIKgzSmGNsnQVxCCWXg4ZLG0wFFKCtDDxbZa99kpjUcKickq5hk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxoGFwm3JmaEYC31AxbYAkQoPBeKI2IMMbUhpMlenQfH4CGnjyg
 vHx6NG/DwdypwG1LfQzghT+ubUjQJA3vEndlDafKENj6un/cRa5NIOwmcxopJE2MOJXeZRXSRZp
 DDggpnsKU6Cmvl1MSWFrueoOxZEfxATWuDzu3TjiHe8AevOI8l5BficW0yfB/lfKFDVYBc8I=
X-Gm-Gg: ASbGncuRS5GGN5dw/ycxIwNHtQp8inhoUUuMHqvorET9ba9TeFZyCKNzlt61Q+rnJg1
 86+G3++gm4K0TE/JjO7YA0q1x0C1WFHYfyUKxabMm+4FqVBfb5ZBnlpLObS6Kpcq3RzLIuslWbj
 slVko10DPsm4RMIekwDfwIUC/VKFkezDqjWrJNQQjxlB/0BMXduFyyZUdEVQIA0UA7aog2Z19yV
 y7gfu5EEK5aR7FjLfbcTsaRa6x5b0Og7BTEEmd3LSc7mtTxHSuB0RH54sgXjOF5MUTUKDFZN3zf
 pS1OZyKJYSkx1HneQcWjXR3E0hceY8M7irZvEsfDkw==
X-Received: by 2002:a05:620a:4512:b0:7d0:9ee6:e7ac with SMTP id
 af79cd13be357-7d3c6c16571mr2603786585a.21.1750253959524; 
 Wed, 18 Jun 2025 06:39:19 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHUVtqsx2MV4WTV8JMc+1EJgnKxxG3YeGolNRkNZNGXdIZpmLSYPMNcqI7vB8yIshy4whg95A==
X-Received: by 2002:a05:620a:4512:b0:7d0:9ee6:e7ac with SMTP id
 af79cd13be357-7d3c6c16571mr2603780285a.21.1750253959040; 
 Wed, 18 Jun 2025 06:39:19 -0700 (PDT)
Received: from [10.92.240.160] ([212.136.9.4])
 by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-adfa7435a1dsm906932066b.110.2025.06.18.06.39.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 18 Jun 2025 06:39:18 -0700 (PDT)
Message-ID: <fa8d4af9-e822-4dec-a8dc-f3bbf5dd0100@oss.qualcomm.com>
Date: Wed, 18 Jun 2025 16:39:15 +0300
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
 <738a889d-9bd5-40c3-a8f5-f76fcde512f4@oss.qualcomm.com>
 <8a986ebb-5c25-46d9-8a2f-7c0ad7702c15@linaro.org>
 <24xkss4bw6ww43x2gbjchcm4gtmqhdecncmxopnnhf7y2tblc2@iibgqhuix5rm>
 <f2654844-091f-46bf-88c6-6f6d4edc5533@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <f2654844-091f-46bf-88c6-6f6d4edc5533@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: fne-HSZoRM1iuk4XrXFPoss3tx-NLOOT
X-Authority-Analysis: v=2.4 cv=D6RHKuRj c=1 sm=1 tr=0 ts=6852c188 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=dNlqnMcrdpbb+gQrTujlOQ==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=BTWw6KF8kvBcRQRl-U4A:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-GUID: fne-HSZoRM1iuk4XrXFPoss3tx-NLOOT
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE4MDExNSBTYWx0ZWRfX+Oclqzc0/6b2
 euUlV4tdA8l88URfpR+7EyLhruZ8miwuL293MHbfo4tv+DP7sd6p9qO9knif044vkwJvfZfEaL+
 IWildKvQf2O5EdSr9xXYs3xBApTr44EPmT3aNz5DzB4WYMkC+07PoBlL0n8EgYjOVyZCzhGmDD5
 EIvXhH0NBDlGoqG5+qgJrBW+Nd1TszoBtZFNp3EfpX5MCeHFkLebfkE2ooOwjPIyqm49DFe6WlJ
 XBCl9FnbEofWycuTTI629My0pVn4kdXZ+N8s5hN8WBByJv5dc9aulTy+q6QNEzbeaeN6qvMpYlG
 ZzTC37oUiZ+QFl1np/qoD+WF8OEE97tv5oTFa8GSLP0kNo6VA5fDLTUnyAbX3qkq6LfsO/UIZgy
 NscG0AeqqWFg00kqLhDn/KCnqua5m84yZ7Sq3p8XYg8PZlSUjcDwD/vjpJ5uXH/e7v6BYMiq
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-18_05,2025-06-18_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 malwarescore=0 impostorscore=0 phishscore=0 adultscore=0
 suspectscore=0 mlxlogscore=686 clxscore=1015 mlxscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506180115
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

On 18/06/2025 16:34, Krzysztof Kozlowski wrote:
> On 18/06/2025 15:07, Dmitry Baryshkov wrote:
>> On Wed, Jun 18, 2025 at 10:28:10AM +0200, Krzysztof Kozlowski wrote:
>>> On 13/06/2025 16:04, Dmitry Baryshkov wrote:
>>>> On 13/06/2025 17:02, Krzysztof Kozlowski wrote:
>>>>> On 13/06/2025 15:55, Dmitry Baryshkov wrote:
>>>>>>>    
>>>>>>> @@ -361,24 +373,47 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
>>>>>>>    
>>>>>>>    static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
>>>>>>>    {
>>>>>>> +	unsigned long flags;
>>>>>>>    	u32 data;
>>>>>>>    
>>>>>>> +	spin_lock_irqsave(&pll->pll_enable_lock, flags);
>>>>>>> +	--pll->pll_enable_cnt;
>>>>>>> +	if (pll->pll_enable_cnt < 0) {
>>>>>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>>>>>> +		DRM_DEV_ERROR_RATELIMITED(&pll->phy->pdev->dev,
>>>>>>> +					  "bug: imbalance in disabling PLL bias\n");
>>>>>>> +		return;
>>>>>>> +	} else if (pll->pll_enable_cnt > 0) {
>>>>>>> +		spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>>>>>> +		return;
>>>>>>> +	} /* else: == 0 */
>>>>>>> +
>>>>>>>    	data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>>>>>>    	data &= ~DSI_7nm_PHY_CMN_CTRL_0_PLL_SHUTDOWNB;
>>>>>>>    	writel(0, pll->phy->pll_base + REG_DSI_7nm_PHY_PLL_SYSTEM_MUXES);
>>>>>>>    	writel(data, pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>>>>>> +	spin_unlock_irqrestore(&pll->pll_enable_lock, flags);
>>>>>>>    	ndelay(250);
>>>>>>
>>>>>> What is this ndelay protecting? Is is to let the hardware to wind down
>>>>>> correctly? I'm worried about dsi_pll_disable_pll_bias() beng followed up
>>>>>> by dsi_pll_enable_pll_bias() in another thread, which would mean that
>>>>>> corresponding writes to the REG_DSI_7nm_PHY_CMN_CTRL_0 can come up
>>>>>> without any delay between them.
>>>>>>
>>>>>
>>>>> Great question, but why do you ask me? The code was there already and
>>>>> MSM DRM drivers are not something I know and could provide context about.
>>>>
>>>> Because it's you who are changing the code as you've faced the issue
>>>> with recalc_rate.
>>>>
>>> Heh, the answer is then: I don't know. I think authors of the code could
>>> know.
>>
>> The 10nm HPG documents a 250ns interval between enabling PLL bias and
>> and enabling the PLL via the CMN_PLL_CNTRL register. There is no extra
>> delay between disabling the PLL, disabling FIFO and remobing PLL bias.
>> Please adjust the code for 7nm and 10nm PHYs accordingly.
>>
>>
> 
> I can drop this 250 ns here, if that's what you ask me. But fixing
> anything in 10nm is not relevant to this patchset. You were already
> asking me for different fixes for some different things and I find it
> not acceptable anymore. Stop blocking this patchset with every little
> existing issue.

I think that it is a common practice to ask to fix the issue in relevant 
pieces. For example, we frequently ask to fix all the DT files if there 
was an issue / workaround reported against a selected set of those.

In this case you can send a fix for 10nm separately, but please post a 
fix for that platform too.

> 
> Or merge this code without this patch if a fix for reading PLL as zero
> anyhow is questionable for you.

I think I've asked it at some point, to split the generic code parts and 
the DSI enablement into two different patch series, so that they could 
be picked up separately.

No, the fix is not questionable. The patch causes questions though.



> 
> Best regards,
> Krzysztof


-- 
With best wishes
Dmitry
