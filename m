Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 77034AA9531
	for <lists+freedreno@lfdr.de>; Mon,  5 May 2025 16:14:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D99210E2AC;
	Mon,  5 May 2025 14:14:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ND390zxj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6E74110E2E6
 for <freedreno@lists.freedesktop.org>; Mon,  5 May 2025 14:14:53 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 545Axtam028615
 for <freedreno@lists.freedesktop.org>; Mon, 5 May 2025 14:14:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 N4sMPDgul+5aEBpACagOkB2ejQOvDaMfk9F++ofP/og=; b=ND390zxjLditdSh9
 kiFSZFnTqnxOxxGjuzKTkdXrBLm7fTfzneNq/E3ltm5M6SYwWueTLPTMBKFhtATE
 dKwrB0vksp4iEuvR7wG+pQ1Z+hT5ZFw/bAsy36tAIad2JLVUPSaj52ElDhKq88G8
 8JvwImFXBm+Ex2hGLjcyNvStD5SFg0qzBYn9X8i3V/id0XYcH+LBgFIE/ebVsPI8
 d7JL5hVjMt+Gg/7gxfV/v3CLfnnhJCo2+pQWobOYtDAwMxqw4OzTWN4MTine0DcA
 nBEVRWI9fOldTEbcyPEYwDlm3rQOvNiISPfvdXviaT/id2xQgdwFaD10wOOSkGiZ
 L9du1w==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dd3n45y6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 05 May 2025 14:14:52 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-7c790dc38b4so790437985a.0
 for <freedreno@lists.freedesktop.org>; Mon, 05 May 2025 07:14:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746454491; x=1747059291;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=N4sMPDgul+5aEBpACagOkB2ejQOvDaMfk9F++ofP/og=;
 b=r0CFHlkkq2WdewCiHO8BQlMKzjkOTaC95yUt2Y/QVn9A5fGGHOTkBUL+lEqUAHmZ+s
 BRkxV4NpZt5lewZtlI71r2nERuEKn5aMbOykd2UNqHqOQ5OpvQhh2OxT926ic2VdVbK8
 zi0IwTRXcyzXXTwq3+rPoB/7Kx2yzhKlodOG7792dm7v3A06PPRkxT3yYr+OhvNmtK64
 qjquer1UPhiWbVJNKG7LqD6ZUSQmygIuqv/lqWsMwoj3hFPuX16XO+XpjBKjWW+mMBj9
 fY+Tc8Vl0WwD9M63JW3DDLIBhYCM4pRy6AMg6/GQGLHmRWLp/5aKEAF1f/hZ1CpteF/I
 os6w==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFIe9v7pxmYJaC7me6ARhM4oyEGz9qfYHFcDuwLCvJ1SCJqEWJibXl8gfsSBrJkZTCXrfiOrZLgxU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyK4xyJL19VtKXS2VMbDXiCUn849DnWU01fDAnmmD70Mqj1Sye8
 UwGmn32LQCmp4ZS6dNFFr3zxAgIz8ZS6q4bdalB/dxTZD5m6MbyQMLanubShtoOs3H7fPSqsTUU
 C1mIa2dIJNHhfTzo3TOl4Exkl6FfQoNw3DjAIoggTs8BhpBB7qyIJ/+qQHZtIsgNqnNo=
X-Gm-Gg: ASbGncs5NZmyeofY+Wevn+CaG5oOK+nQD00kJwA5UNIVO3W/CAaCvn05V/GrIPCqhBm
 xmD7Oy+8/5Dpd4/46Elw0jcXTSnT/YxymiMSfYCDxq7jlvxTvS9gy2uYzoewknQoThDM+A7kCoC
 fFuL4gV/sUJBVQ9GBsgS3jC71G3FU1OF9fIRgIN6dAh2skmjPzfgSF1gPFhgcjDY4gbTxmN+sRT
 Te2HmAxdd5C//gzOkrChFr21dExWqz1DDZJDu/hKVEzmYm9U8VSEFwNMVvUu943P0am7iYb25DV
 wenQGDURxludmmsf0SucVSHk9+MfhwA6uwziCmSy4/kV2qyDt1BNL5I/RUQsF7zPWH3PZparKRh
 bPSUqaquFsNWLc51NcBRJKOxdM3chmtaZT1vNANYWqXix8k9/oVkaYeI33iNKNYC7kKrV
X-Received: by 2002:a05:620a:2697:b0:7c3:ca29:c87e with SMTP id
 af79cd13be357-7cacea24688mr2331711485a.21.1746454491572; 
 Mon, 05 May 2025 07:14:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH/vBvLz2xsMDmp49gK5gm96O/Tw7T3JFctVTVSeo6t9VZN8IC+KDCL2/JJC8O+HXJyk28oEw==
X-Received: by 2002:a05:620a:2697:b0:7c3:ca29:c87e with SMTP id
 af79cd13be357-7cacea24688mr2331704185a.21.1746454491141; 
 Mon, 05 May 2025 07:14:51 -0700 (PDT)
Received: from ?IPV6:2001:14bb:671:42db:147e:6740:cd7c:7688?
 (2001-14bb-671-42db-147e-6740-cd7c-7688.rev.dnainternet.fi.
 [2001:14bb:671:42db:147e:6740:cd7c:7688])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94f6613sm1721233e87.217.2025.05.05.07.14.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 05 May 2025 07:14:50 -0700 (PDT)
Message-ID: <f56c19a0-18d7-438d-8d05-98ae7a842959@oss.qualcomm.com>
Date: Mon, 5 May 2025 17:14:48 +0300
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 15/24] drm/msm/dsi/phy: Define PHY_CMN_CTRL_0 bitfields
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
 Dmitry Baryshkov <lumag@kernel.org>, Rob Clark <robdclark@gmail.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>, Stephen Boyd
 <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 Rob Clark <robdclark@chromium.org>, linux-clk@vger.kernel.org,
 Srinivas Kandagatla <srini@kernel.org>
References: <20250430-b4-sm8750-display-v5-0-8cab30c3e4df@linaro.org>
 <20250430-b4-sm8750-display-v5-15-8cab30c3e4df@linaro.org>
 <j47udhqq3ldsza3cr6a6rd5dq7uxjgpolbmdhmpzvzt7glpuva@v5tgkydlywag>
 <97e49dc5-9cca-4c85-b0b0-18c472d0ec0d@linaro.org>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <97e49dc5-9cca-4c85-b0b0-18c472d0ec0d@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDEzNyBTYWx0ZWRfX9SIDIBZsyoqJ
 CbxObatiuZxnPSxbDWt7KbCZmaPtPdJciNtsQvulGtMcz4kgbf6flBI2Xm0S4EX96n9/gkvUfvf
 Oq1xJt4IpGKxCVloY/aJ6Z0qWa8oEogf5SI0oqHOYsPIbdzVa/YPA0cTHw/UC2h37Q0v0JbfzNT
 bHCusQdUeBH6v9vR87WJdpObu5tA/GPTRDjK5aaAa0Jwl2/cjvtmjdN5NysiHiXKH8dw6wsV0Ye
 wyoTn6Ugs6c+fQKDQXW+2orZJ9uJkwmiUT6X51UhpLTn1OYW3y2tcx9UAG87W0T9qzMKvmUFMuQ
 cnQUN/5vhno/DIdBDVECTRl4GD/wvpa3McoHoKD7W5ArN5+zlqw4sVoX7GrU3TtgnoWKz4iWZ3D
 zuqC5w0GnxsjAcJPvWtzkAhlqHUO6pqURd9baCKQPpItcZeGSY8oU0X2z0I8xM7SdPPhFhNu
X-Proofpoint-GUID: eyZwMLSDcyTJ4zhMVgbTknuc1XmrfS8D
X-Proofpoint-ORIG-GUID: eyZwMLSDcyTJ4zhMVgbTknuc1XmrfS8D
X-Authority-Analysis: v=2.4 cv=UNDdHDfy c=1 sm=1 tr=0 ts=6818c7dc cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=F9VSnBJ7OdIsbtMwzSAA:9 a=QEXdDO2ut3YA:10
 a=bTQJ7kPSJx9SKPbeHEYW:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_06,2025-05-05_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050137
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

On 05/05/2025 09:17, Krzysztof Kozlowski wrote:
> On 03/05/2025 00:44, Dmitry Baryshkov wrote:
>> On Wed, Apr 30, 2025 at 03:00:45PM +0200, Krzysztof Kozlowski wrote:
>>> Add bitfields for PHY_CMN_CTRL_0 registers to avoid hard-coding bit
>>> masks and shifts and make the code a bit more readable.
>>>
>>> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
>>>
>>> ---
>>>
>>> Changes in v5:
>>> 1. New patch
>>> ---
>>>   drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c             |  9 ++++++---
>>>   drivers/gpu/drm/msm/registers/display/dsi_phy_7nm.xml | 11 ++++++++++-
>>>   2 files changed, 16 insertions(+), 4 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> index ca1a120f630a3650bf6d9f9d426cccea88c22e7f..7ef0aa7ff41b7d10d2630405c3d2f541957f19ea 100644
>>> --- a/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> +++ b/drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c
>>> @@ -362,17 +362,19 @@ static int dsi_pll_7nm_lock_status(struct dsi_pll_7nm *pll)
>>>   static void dsi_pll_disable_pll_bias(struct dsi_pll_7nm *pll)
>>>   {
>>>   	u32 data = readl(pll->phy->base + REG_DSI_7nm_PHY_CMN_CTRL_0);
>>
>> This (and several following functions) should be triggering a warning
>> regarding empty line after variable declaration block.
> 
> You mean --strict or what? It is common to have the &= immediately after
> assignment, so that's why I chosen that syntax. It is just more
> readable, but I understand your comment that you want --strict
> compliancen even if it hurts readability, so I'll change it.

I'd probably prefer to split variable declaration and readl invocation. 
Then the code will be logical with &= comining on the line adjacent to 
readl().

> 
> 
> 
> Best regards,
> Krzysztof


-- 
With best wishes
Dmitry
