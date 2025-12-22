Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 53CF2CD53F9
	for <lists+freedreno@lfdr.de>; Mon, 22 Dec 2025 10:10:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 316A210E5ED;
	Mon, 22 Dec 2025 09:10:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Hj7MUYmL";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fMZ/CQfu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CB3AC10E5EE
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 09:10:04 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BM8hXDf3962870
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 09:10:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JHWWdE+wbubFTvie2Z1oIhb9fPYx8KhlXYjd4LJ4pI0=; b=Hj7MUYmLG/YfTa5j
 EV6U0BVE3kdgHyx/TOBsIi2Muuz36pYia49op82WlExlvYS9E+Fj00LKPyUndzmd
 7gfgGAhfaThqNaxWSiHygmWDieTLNCrimmy0LRa5ZyGI95gjjjzLtwTwjVhe7YKt
 5XYYP0KkoRnRuqH/z3eiTstuFy3j6mBxWZs9/MYCGP2Bz+MDgZ6Wzz1YDe57Gd3q
 XWS9aYg08MF/xtFXHSAUxaPuTA678CaJsqkobEvcWJrGHghrIUHCAHzFlhEn4Fzr
 aV/DwIgaOxYh77R1iAB+QPwBM4rBgHtUIrhFSEW14TyNtpqs8/htktVPR2LTqIdJ
 A7M7FQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b6vk6h5ah-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 09:10:04 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4f34b9ab702so8751831cf.3
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 01:10:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766394603; x=1766999403;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JHWWdE+wbubFTvie2Z1oIhb9fPYx8KhlXYjd4LJ4pI0=;
 b=fMZ/CQful+yNEoHSXGywNIvmDDFcbTu6qF52vfkN7xvNM/bK/hDHCs9LKKfF6V6SnH
 sOzp4F4foZA2V77q2enqiTYZ26AijBLN/GkDLa9iWIyLkzFr/FBrtWFNLMN4xLpWsyCN
 Ja/0c+3M9rGOV1RY6NOnJMjTFWCoXeHCtcW5vVL1T3BgWrEFQKKY4eBgnWIKq+v0LGO3
 gBLuAlGWG/UIGTdLIzHQRE4EktWhKZxbA+0q9j4mUlSUFbXBLSamaZSO8shK/gZSfAKt
 B0qLXtg5ajbaUV3soTHWKlJR3TyM65uFfjKdDcvICr3tLPMNSwwQ2zG26wQ6ImqBw7fr
 +nsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766394603; x=1766999403;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JHWWdE+wbubFTvie2Z1oIhb9fPYx8KhlXYjd4LJ4pI0=;
 b=DBo4nnDaSNcZEqQSatwML/6KGH/puxZA/zZVjQDFYJo0jJ23i3bYhAzS1jy5FsvTrn
 Cr3uXcGEaUat37kLZnNSWbYrdEXoWnC8ENkA+CyEJo39wdRKgKCTlmO+U5hZNwP4bL3p
 7mizS88u7+ptePnXv5kfnodwaO5DLLWaEHrlHhOw8OP0qXZHPgx7kjjC/vPYazEYrXTJ
 LEvuC5sYFeEEgBtjnlcMCxkKGHL8OitarWj7HMB9LHLu+Ma1Z6zgXQqJ8J5YBr94wLAJ
 n/f4Ppz3uLDis/UjeNoWJiNJnE7LI6P1ZrSMYUQB8O9PqJ4FtsCdz4EHQC5roTGbkWFg
 INQg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVYuQJkrWuLce1xgJQ6/T6ELwHq3nAGILFgtppJbsNikDw5w4NLLvcf/S1lmBGPe5uZBLa7L9BPvCM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxXq05RcolqsEJCB1BUV49kd3danAn56YLR98axRiBY6jMnuD5m
 oNOcr9J7vyFhvvn3nz43tWmJNdPaz0+rsepU8SoxRdQP567ev9aJliBYu6xedBai2DotIsPspdB
 5HaN7TWLCcxLUbBqPwJ8WgtFq5lPaJqw/EZ+872f0GD/GXeBRZs9ZQ3dTOLQt5GUXYUeJs7I=
X-Gm-Gg: AY/fxX4I0mi9+h8oqkUX/P96BHKWWlCZMJ/oUIBv8OiA+DgBfsKbA+60Dyforxb77rV
 FEKrsuixnvTF/uveacD0pb7tfhsbGpDjoSN0shBlWEPWStW0aD6cgD289Pk2KC+XSyzCFqKH840
 zm/ggHsyO424yKeSbwE3QPhsbjtOxTvn7j/l++ysP06u7yKZRj0WuicAd2SEFbj9NiYFQUbX4Ty
 9uToihE9i8U12S3/tNp8Pq59kUXpezeq79R7AdmDPzja9Ce6JI4p5BhUZMr1IyIZeK4AvN1gnrM
 6dFo1YnvCI91itm1bv2gLFOdiVlmHdeIR7BwX1skU1W1j6d8jRkd4X3VJFaEL2HM7j/cBvp+S3m
 swOLbFN81Q5D+sJkINTWK8n9kTwSr7ork8e5Ez1Q3o6PVN7BvICKHkAXcrDv4wDqcKw==
X-Received: by 2002:a05:622a:247:b0:4e8:a54d:cce8 with SMTP id
 d75a77b69052e-4f4abce7d98mr117884151cf.4.1766394603171; 
 Mon, 22 Dec 2025 01:10:03 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTv9EYxPbsYfG8sAutjjuuUPajlBybvkaycaj2QtwrxowzdMs7eKcuYEBPmJLLlgfLbWzTsw==
X-Received: by 2002:a05:622a:247:b0:4e8:a54d:cce8 with SMTP id
 d75a77b69052e-4f4abce7d98mr117883871cf.4.1766394602784; 
 Mon, 22 Dec 2025 01:10:02 -0800 (PST)
Received: from [192.168.119.72] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 4fb4d7f45d1cf-64b90f53b21sm9799699a12.5.2025.12.22.01.09.59
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 22 Dec 2025 01:10:02 -0800 (PST)
Message-ID: <2f3c7bc8-8c7b-4c47-95de-7a8ac6dc3c57@oss.qualcomm.com>
Date: Mon, 22 Dec 2025 10:09:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 3/6] drm/msm: mdss: Add Milos support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Luca Weiss <luca.weiss@fairphone.com>
Cc: Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 ~postmarketos/upstreaming@lists.sr.ht, phone-devel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org
References: <20251219-milos-mdss-v1-0-4537a916bdf9@fairphone.com>
 <20251219-milos-mdss-v1-3-4537a916bdf9@fairphone.com>
 <475izg5bi56oefqtqkvqeyspx2por66zrw4tgqbb3f2ziaghyt@tccm73sl2u2e>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <475izg5bi56oefqtqkvqeyspx2por66zrw4tgqbb3f2ziaghyt@tccm73sl2u2e>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: obSclOLXeyH2s05V9mzXd2Lly5E6RwD5
X-Authority-Analysis: v=2.4 cv=cuuWUl4i c=1 sm=1 tr=0 ts=69490aec cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=6H0WHjuAAAAA:8 a=EUspDBNiAAAA:8
 a=DgVbG8OoVQ-VTv-dGB8A:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=Soq9LBFxuPC4vsCAQt-j:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA4MiBTYWx0ZWRfX7LNP/73ziwrI
 DDVA1YphUdSBIipKo/9+ty5rwTDdg6htQsSzQVyqw/zH9Jr/VSnn1UvfnezoI6B1D3ywE9rLnU/
 a91fFS9A52IsFionBRAtAqbnVAmVK/pDQvhMF5jFbPwAon3pkQlb1qGRDiO1PI8Nqf133cAjSvG
 NZsZxjGV6uIaMNm+J1zjk+J2Ysl6kGPkCv0WyP/xxH0jhjAs3GC/xy/THj+KM+yV7fGoDGiyd98
 rKa51FCn61f4mrda6AZqJG3xlk/6bK5oVeu8IqX9XbDjGYLPn9CjjjPQ3BeghdAfoahk8/iCHyj
 wm/3GAAtRsju0+ZSWQaHxlc2d5vkjj3JJSBkOSyHV9uK8NkyvetY+APNBDxVLdfN11deRAFp4ab
 HcxSN2e3ZdHHOdWeOuRjez8r+5ewDfbHowNA5iWTPXJX68/vdhKKKeI1lV3f7rh52sNcCR3KNBr
 nZYVwVzr+ds8uTcJ0VA==
X-Proofpoint-GUID: obSclOLXeyH2s05V9mzXd2Lly5E6RwD5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220082
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

On 12/20/25 5:52 PM, Dmitry Baryshkov wrote:
> On Fri, Dec 19, 2025 at 05:41:09PM +0100, Luca Weiss wrote:
>> Add support for MDSS on Milos.
>>
>> Signed-off-by: Luca Weiss <luca.weiss@fairphone.com>
>> ---
>>  drivers/gpu/drm/msm/msm_mdss.c | 5 +++++
>>  1 file changed, 5 insertions(+)
>>
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> 
> Though 14000 seems lower than the value for all other platforms.

IIUC it's essentially "nonzero" or "first-level-above-just-nonzero"

The downstream DT also defines a 140_000 and a 310_000 point.. though
the middle one is never(?) used and the latter one is only used during
UEFI handoff and upon the first commit after (runtime) resume

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
