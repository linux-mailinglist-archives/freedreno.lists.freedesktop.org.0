Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E2DA4ADB754
	for <lists+freedreno@lfdr.de>; Mon, 16 Jun 2025 18:48:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF7A510E3B7;
	Mon, 16 Jun 2025 16:48:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="d5Xd7REY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0BA6210E3DC
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jun 2025 16:48:34 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8gK3u026338
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jun 2025 16:48:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 lxyeOcoLjC3T2xwCWZvRjoeExdTH0SjUCC/Y0ERYeNQ=; b=d5Xd7REYM3S9gnS5
 n7bYGFpFbiw+1+kJ2EqZbnWEMgfB2xuele5T5Pwm9aKsDRA78/EKtOy0F2QNTYzT
 KJvLT7ey6fAz3mjnpAWR432o8QADvN+IEnRwpM9Yj6bc0Ge8sjvzz0ZWiAwbFZTq
 nSepVk6eUNbh2ajDno4AWOc80XhTQlCWJcNa+Xm0CfPGPAoe58ojfQ9t2H2KbETZ
 z7mYYqFgR+aN0ahVuhbD8tNmbaw4ythr6pL1F0kGDSq4MFutDxLYRwjZC/QWS+ot
 Q/wBmVMGl0R5Qzntex2p8lKoFoNZds64/OuZsZjde6FVoaFAvIo75Ja0bP5wgTr2
 Mlo+Yg==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4791hfdbef-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jun 2025 16:48:33 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-748865aa38fso6488355b3a.1
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jun 2025 09:48:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750092512; x=1750697312;
 h=content-transfer-encoding:in-reply-to:content-language:from
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=lxyeOcoLjC3T2xwCWZvRjoeExdTH0SjUCC/Y0ERYeNQ=;
 b=NyEvgv9QrmYbVQAe7NFNDvky7E8vnh5rjF26g1gvcEfAEP/6HlqJc9KjG5gcUCXg7N
 nRQ0CgMk45W7c+gHYQQ8ABt7hmCVnwS9zD5zsI4nk1bWHOyMvrhm5FDUdBCxQUc1EXRQ
 SaRJCBEn/fC6CLdmHt9BjD6RYJcsl/yjwd1FcPr6Ir9hCpHiFVWyb4myg0f1rhz3TQG0
 dKGT6waewMeGDYbrnJBaLFkEzldk372DN/+j0rVat3jWclXO0QIk56aWVBofbjVw+wr6
 F2QMiMNQVPRWLIyo3XJA7AxIoJv2tqzWtjRlep08p0wvW0WA0GOzBhj+UXgydlPKc6RI
 nyUQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHQoB6FLwklQnI0oU9ENEC77lcfhSMuZV1OCyAzjFAH8dLdlLvoBHi3Ie9L1DFK4CYUIqM1clK7S8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxZtgr8Evy7YdDAT2yNdg9xzZvz9xn5ZhKgpUGf/ECFjWcc2hdl
 tRNxkm6lHD1ZxlIuu9r/7PStB6WhzklSIUurFbIDKvMx1QNWz9I28tiyMhVZSyro5vnrsLC4LuL
 X7gf+nubvjgFJLAg+5Pr6s9M1lys6UyGWyZbddbX1k3J/dOrQ1X2eg7SEQWnAHbPrzMK8ogk=
X-Gm-Gg: ASbGncvZPlHpmKr8+JzBEX9T78dZ3mjoBb7LFqi/GBmGfYhT80HPtTF1ojntStLlZLw
 yFtlrS86syqoO8M9lZPLFMTQo9Zdm6d3j0neOLsIaQUQZMjbod92N+Al9xRUYA0wbd5mWH0/am5
 xq55wYIoZtSdBSVgSJ3nN4sSUCNbMbJ9f73rMAlOJntWnvqnulEP8rAIjGUdz+eEMQw+KLt3YEG
 MpgQydY5O9Zpjjk1uV5YntUQOiBpfKA+XNezJ9qrerNQ3CbaX8lFgqRqIazYBtTKqfJv6PiCIi1
 BifTYkxtHbKp3vN6nlMdA3XxmmTKR432et8dsZu7Rw==
X-Received: by 2002:a05:6a21:318c:b0:215:d611:5d9b with SMTP id
 adf61e73a8af0-21fbd4bbd5fmr14908411637.12.1750092512620; 
 Mon, 16 Jun 2025 09:48:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFiRsfJISsTnkxLW8qZGNZNt7p0Rfn9bVYWR0l8aBesdxG90+o4bb4c6x4zbi0HdUx7zVZcJw==
X-Received: by 2002:a05:6a21:318c:b0:215:d611:5d9b with SMTP id
 adf61e73a8af0-21fbd4bbd5fmr14908365637.12.1750092512245; 
 Mon, 16 Jun 2025 09:48:32 -0700 (PDT)
Received: from [10.206.104.82] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2fe1680454sm6019135a12.37.2025.06.16.09.48.25
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 16 Jun 2025 09:48:31 -0700 (PDT)
Message-ID: <31c50188-986a-44e8-8765-c1fce6ad3c2c@oss.qualcomm.com>
Date: Mon, 16 Jun 2025 22:18:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/4] dt-bindings: opp: adreno: Update regex of OPP entry
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org
References: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
 <20250611-x1p-adreno-v2-1-5074907bebbd@oss.qualcomm.com>
 <492417fe-c086-4980-b108-0487bad08155@kernel.org>
 <d482653e-5c0e-4b03-98d6-2c898b445917@quicinc.com>
 <750da319-d25f-454d-b376-ebbc194e0e41@kernel.org>
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <750da319-d25f-454d-b376-ebbc194e0e41@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDExMSBTYWx0ZWRfX/DYgpdN2nhIc
 E9XkuopgzI45P3vcvC0LI5+yTqOzEgSJU2wq+PFkX8x/ni4H69T1FB7FD1AYy/HxzW6f5rUf+iW
 KQkoSqXQdvNToHujrnkpF52j6CymbvkWUNtay0UN6LJTnBgJfQrP7Hpl22xXKBa2InZs/aade9n
 k/INMAcJvdReRsvXbYLm9qlOGLklIMSXWFjhvPR2y46PMQnR3yKJpV54/3kK2W87DSJ4T9vpq96
 BWlNLFDy4VtXUW6dh6kiQhINn30FpXPj4OAWsp7jWO7Sll6zPz83Buu8rUEOwkcmbK1Zfm+4GOb
 C3XRBgJqVjDLgEkUleGoCuasqqhUx0kNt8844+CSZPJNdjhAOlndPrRE7JkSwlWteXcM9VchsHR
 XDIB0kTefIlgNb3HM3TV/D3Pl/hnv4QL2vFWeSpaz5EsO5Ss50lerOMI/cGA5d/9sPMNmzVQ
X-Authority-Analysis: v=2.4 cv=VvEjA/2n c=1 sm=1 tr=0 ts=68504ae1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=DDAlTcr3_WI9VELS8V8A:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: r9cajKPhsar0yoUezT4v5nm8rQaK3oDk
X-Proofpoint-ORIG-GUID: r9cajKPhsar0yoUezT4v5nm8rQaK3oDk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_08,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 mlxscore=0 lowpriorityscore=0 spamscore=0 mlxlogscore=998
 malwarescore=0 impostorscore=0 clxscore=1015 bulkscore=0 suspectscore=0
 priorityscore=1501 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506160111
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

On 6/12/2025 4:59 PM, Krzysztof Kozlowski wrote:
> On 11/06/2025 14:24, Akhil P Oommen wrote:
>>>>  
>>>>  patternProperties:
>>>> -  '^opp-[0-9]+$':
>>>> +  '^opp(-?[0-9]+)*$':
>>>
>>> Not correct regex. You allow "opp", "opp1" and all other unusual
>>> variants. Commit does not explain what problem you are solving, so I
>>> have no clue what you want here, but for sure opp1 is wrong.
>>
>> Just to confirm, would this be fine for the requirement I mentioned above?
>>
>> "'^opp(-[0-9]+)*$'"
> 
> No, You did not solve half of the problems - still allows "opp" and
> commit msg does not explain why "opp" is now correct. Describe the
> actual problem and then write the regex solving it in specific way, not
> causing other effects.

Gotcha. If we want to be super strict, the regex should be:
^opp(-[0-9]+){1,2}$

I will send out a new patch.

-Akhil

> 
> Best regards,
> Krzysztof

