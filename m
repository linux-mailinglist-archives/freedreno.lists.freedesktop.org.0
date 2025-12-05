Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 95394CA7DC9
	for <lists+freedreno@lfdr.de>; Fri, 05 Dec 2025 14:59:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 019C010EB26;
	Fri,  5 Dec 2025 13:59:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mYrBWUow";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="CcwBD6m1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D25E510EB26
 for <freedreno@lists.freedesktop.org>; Fri,  5 Dec 2025 13:59:02 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5B5DlTpY473774
 for <freedreno@lists.freedesktop.org>; Fri, 5 Dec 2025 13:59:02 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AwOFGn23N+84vw0QT3trM5DNBw8Zal6xqShrR3uLN78=; b=mYrBWUowCghcJ3GL
 Ky79nPpkT+wzspmjazyv9ts0CwRO5STry8At4o1B1R3qq3OnqaRlMsZMOKrmPxAO
 2YLSRonQlMnr4Lf4g8DkzZdbEe+uVrmxI+1nDj0jmIHeHPO9qNLd1IcEyOF6o8f/
 yJmFv4H39uHe5kqMOWq0ycFruwrtoOWtcul1Ia/E/vEAYwtbKBvzT6xY9SDY+f1t
 roRJvlSqgDQlfJiKUUtZC8UvXJYal1MV16G5ThBN+g9VK/88cSJKMnXoZwJovvph
 Ih3SXjHoX9TNzAvso/Q9YdFoZF8Ila9lH/IrFIRXOvlFxpYfpqkygXyQ82MrDPlJ
 rYs1XQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4av0ka013c-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 05 Dec 2025 13:59:02 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-7b82c2c2ca2so3514061b3a.1
 for <freedreno@lists.freedesktop.org>; Fri, 05 Dec 2025 05:59:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764943142; x=1765547942;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=AwOFGn23N+84vw0QT3trM5DNBw8Zal6xqShrR3uLN78=;
 b=CcwBD6m1ZFMkaDTaK5lj75THkR8l0LspUj7jTBt7IgYukwOyovZjHOu+iynj5HsoF1
 1dQk1YDMMtLAcxe1+DzDIuToabHPAwAga1X47WIgMPmWUDlOjROODTK80ZG3/ty2nA6a
 M904YJKPT61IVJG/7EJyvGDnhSoVisO6NJmujtxX2XmDtEx1DgMt4rMGudbvSDCg/NZU
 jIRzejNQmTC2ZelH1nHNZ3IukQImc1ixzCVjiq/KURpHdUQv5z2+ViaFGoCR/euHqd4E
 5E+kqnnzxkk3le8i1jybbt+nuw/EVHX6wxFwPUTgJ5Xw7jVDQMOfaIUa4GKzNle+pvcz
 Sapg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764943142; x=1765547942;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=AwOFGn23N+84vw0QT3trM5DNBw8Zal6xqShrR3uLN78=;
 b=YAuUo5bsK5ZUNgBeShCo9Bg5IUAXYxGUGq4rFLVLKkdMOCPl5wZUVBCGbmZF8TFF9A
 f0yhqTnhrR7Vv0AGvGNmrAXVwcDOQYmFhgw8eQNm9zj9ou7UNuLM7R/nuMN+4ZMBZgp3
 9GhPZbFYsLzcf43WUGHzt1ce4/KKnI18ugQO/ImgatCoW1TG35f8rHYJyFS1IlnJtZWJ
 ZlnfArm32xuOl+qh9yoCZ7HsSRnNF6vu5FIjYiaLKQGMvuipv/riZPd5pqQ9cyf4tBaH
 d2f4SGaGEVxmfeMGHd7zLuqJkcZIDcvP6JTcgp7qmo8Dl1nxGkYhcTpUrKki/xWO6zK9
 ncHQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXta2a8ji3aF/jcsuekTmrtxwAgL7KiJtF5+lfO361PGszDi3S3gqNDQXQ3Rh+xAIGZbaFFQWilbFY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyY9AJ33gMD8bjuLjv1+mmNs3esAzpNhnQJtAsSs80Gp8srSE+9
 BL1mohRgrpazF2RPR6lzo8kq/2Bx9duRjJduk7N3xrTvDAS500H4cMapgE2AXnRWLk/TYaf+yNm
 J3xwcGlARwespXICzALH6c7MCb0dy12Isx86RiFar4gqxTqLJoES80xuIRnwV59BsFvGTfzo=
X-Gm-Gg: ASbGncs7KaVZWwRoPjkmdqnLjJ1MUTltRndpjVp/bMZpjNIbGQPqMvkTh6XpDZMWdPn
 bPhB2+mH4eZzajMgEaxNn16l6NK0Ry4ySbQoduaZAN4na/BBdMgEX/zboH4ad3M4nlMmYOmMA/h
 uevlo+REZ4n9TWmZLhA9O4nwwY7FdXZ6CKsvyb0wlFvZ8PywIA3LQFUTtVu1umOXD9SUcc76pno
 JWZflMJ3wLwLLRn4CuDVqOjlphzIggDPUyYbgC1Omq4+nPCdbPOnV0czlbwvdjQYdILsqt/5jCa
 eBenv5FlqHxLg9uQLiveX4R6EpsOtifXX+F+8WYJlHsLJZ3vsmVRcc7k5yhQ46uUqk1+T8Y6pTI
 uJp4XAhaw2CS5UhJug4u51EbqUpsRSoDo2A==
X-Received: by 2002:a05:6a21:6d9b:b0:366:14ac:8c6a with SMTP id
 adf61e73a8af0-36614ac8db5mr264922637.64.1764943141631; 
 Fri, 05 Dec 2025 05:59:01 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHIN17bdoUP6uMMUJ7SDlvyxo7Bng7d1r0V3Z/Gg3ZRXNxJiMHZaodSHJ8uBr3BUf6qxSgK7g==
X-Received: by 2002:a05:6a21:6d9b:b0:366:14ac:8c6a with SMTP id
 adf61e73a8af0-36614ac8db5mr264873637.64.1764943141147; 
 Fri, 05 Dec 2025 05:59:01 -0800 (PST)
Received: from [192.168.1.4] ([106.222.235.197])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-bf6a2745c43sm4855199a12.29.2025.12.05.05.58.54
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 05 Dec 2025 05:59:00 -0800 (PST)
Message-ID: <aaae2ab1-04ec-4d42-afe4-7a2ed00ce903@oss.qualcomm.com>
Date: Fri, 5 Dec 2025 19:28:52 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] dt-bindings: display/msm: gpu: Document A612 GPU
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
 Dan Carpenter <dan.carpenter@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jie Zhang <jie.zhang@oss.qualcomm.com>
References: <20251204-qcs615-spin-2-v4-0-f5a00c5b663f@oss.qualcomm.com>
 <20251204-qcs615-spin-2-v4-3-f5a00c5b663f@oss.qualcomm.com>
 <e8243a84-a7bd-4087-87d7-2795d6bc7595@kernel.org>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <e8243a84-a7bd-4087-87d7-2795d6bc7595@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 6WbJn0Ld8vmFQXoRvEWzOGzLF72OSQSD
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjA1MDA5OSBTYWx0ZWRfX+kFAROq6n0nF
 IdoVsiP/B3kPNVKgpAuqY1lSeRKNPGPRIcfxbVCpE9Ufq4CXMysa8hI/RFSSH+L7heT5XgvNrEe
 w2cPNwrZIjIQRPWlegZD1YL5NGURmUzH7hBFCfOaXPDlJyfAddziJytyJGPDrYuOhPx/EytQjRe
 miBO/NKL38hAf6glCgUtR72A1Gqfb6MRK1OLQv+pqHUgOsfPD0+qgXpSGhQEN1tRJrpksRbty52
 rBsQFjvmAKo8FUCEdZz9t0jWuMjhbCGItfgXMf/W1iyiVte0FZwHbqC3r/IvUjhFAAncbMZhHrI
 xCPCQUA2/vKNHGy9GrtvPPjSv5v/tk8nCxSkldbI3W6NHvaUQicqT+PqvRyK/hnfaHDu2u6vr0G
 O07whpyps7/Xxp1roAlYs7jLfTC7Fg==
X-Authority-Analysis: v=2.4 cv=HOjO14tv c=1 sm=1 tr=0 ts=6932e526 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=jBSxni06C9HboLYAjQ55wg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=fzXiC-7nnnm7XjcqKBIA:9 a=QEXdDO2ut3YA:10
 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: 6WbJn0Ld8vmFQXoRvEWzOGzLF72OSQSD
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-05_05,2025-12-04_04,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 bulkscore=0 spamscore=0 clxscore=1015 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512050099
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

On 12/4/2025 9:04 PM, Krzysztof Kozlowski wrote:
> On 04/12/2025 14:21, Akhil P Oommen wrote:
>>  
>>    clocks:
>> -    minItems: 2
>> +    minItems: 1
>>      maxItems: 7
>>  
>>    clock-names:
>> -    minItems: 2
>> +    minItems: 1
>>      maxItems: 7
>>  
>>    reg:
>> @@ -388,6 +388,32 @@ allOf:
>>          - clocks
>>          - clock-names
>>  
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            const: qcom,adreno-612.0
>> +    then:
>> +      properties:
>> +        clocks:
>> +          items:
>> +            - description: GPU Core clock
>> +
>> +        clock-names:
>> +          items:
>> +            - const: core
>> +
>> +        reg-names:
>> +          minItems: 1
>> +          items:
>> +            - const: kgsl_3d0_reg_memory
>> +            - const: cx_mem
>> +            - const: cx_dbgc
> 
> The patch overall gets better, thanks, but I think I asked about this
> already - why you don't have the list strict? I don't see reason for
> making list flexible and I don't see the explanation in the commit msg.
> Either this should be fixed-size (so minItems: 3 and same for reg:) or
> you should document reasons WHY in the commit msg. Otherwise next time I
> will ask the same. :(

TBH, I was just following the convention I saw for the other entries
here. We can make it more strict. But I am curious, in which case are
num reg ranges flexible usually?

Just to confirm, we should add this here for adreno-612.0:

reg:
  minItems: 3
  maxItems: 3

reg-names:
  minItems: 3
  items:
    - const: kgsl_3d0_reg_memory
    - const: cx_mem
    - const: cx_dbgc

-Akhil>
> 
> Best regards,
> Krzysztof

