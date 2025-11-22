Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8F798C7D17F
	for <lists+freedreno@lfdr.de>; Sat, 22 Nov 2025 14:26:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E8BE10E093;
	Sat, 22 Nov 2025 13:26:51 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZV7g11Gd";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hueHt7ph";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8DA6C10E093
 for <freedreno@lists.freedesktop.org>; Sat, 22 Nov 2025 13:26:50 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AMCbpHO2690148
 for <freedreno@lists.freedesktop.org>; Sat, 22 Nov 2025 13:26:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 24+6OA3r/X7e6ENSi+fGXOwkYsH7o9p185zFLLoyfpM=; b=ZV7g11Gd+9rmY05K
 Su2jZxirLh8vfnW/m3N+LbhJOcNCIFtogtCQ1g3f13VLkv7QpMfJOZN7/f3s88dt
 7TtCDpLP3KgeyiH/+Mf/W7ScefB6Uk7F1a2RRioeUQHh9Jrgf+sTJA6QWJl7amab
 Kw8gFR/7/AO9gIrW0dnehX/FWY0mkKj+vIbFX+NeiTb66LaFNR2dZGpjTdFZgAnW
 gZO0g646BZuHVeVPDh6aWO88NpI9IZn3k0yIAZhO7RjBKV+46nIugWvu6GEVEn0q
 Ptt4ca5egQ2gDx03NTGvs6ET+Lpd+mBwe73inbnn4XGWVQGfOppTs6H9G0KWXAl1
 g2OEMQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ak6cdrps6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 22 Nov 2025 13:26:49 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ee409f1880so5899711cf.1
 for <freedreno@lists.freedesktop.org>; Sat, 22 Nov 2025 05:26:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763818009; x=1764422809;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=24+6OA3r/X7e6ENSi+fGXOwkYsH7o9p185zFLLoyfpM=;
 b=hueHt7phZ1l37Fx2+WTn7gvRsOj1L/fyzW+fkVTP+0iJvI9b7hrpdebF0sZiVXWUnM
 zL3H1KHqQ2BFEM4baC3yXo8BNjpDkubePWDG/JkSvY94wCQNfW1oYveWFPUq8Vb1rUiC
 wwjVK2TGFTSbbG9jwSc/GIxDslYndEyOwupiLKzp4c95lFNMpMbx6In9h+ya3L207T6Y
 8dTRCZEM7bWsdK1eUILYuHGtzKbtkEketjXZB2BTUuMgkQQH5DaslO+KSAdHsFTq0Wau
 71dCvPCI8i28k2vVMZM/qauU4dcNHxc8HORYmeWA0OwtQBu0H0s52rNzz4pRpQ6wDe1K
 KCtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763818009; x=1764422809;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=24+6OA3r/X7e6ENSi+fGXOwkYsH7o9p185zFLLoyfpM=;
 b=KIhZLjARcUHXaUI3Nwth2gp0XbWaBjQRultL3eJbWdtVAy0rlYvIJpt/8uiBLWd2lE
 WMmOuEFGEHKGOqOQh7zXMoOU52BPv0BYjuu2OiyJRywyUkWeRdMUH1X+H47xMNMquVKm
 7ahxhfmWe/fog54/FT2JbblhQFMHmFb8vEIif5c38moS3Dc4wilSDvNEy9deJ5jI3iu9
 fp5AxqgpJ07aFrxMII85i7f3BlL1x5m3lbOyOPV9PEs6Y2Be3A9mKjq1ErfgdOZC26sy
 upuz497k8ncOk0pIuvMosBqLTPm7nsT/Szoc+h35WSU7mu/qt9P5BV3mrXwpZQQ3Kj6b
 wVIw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVz+HK+t18lYdwAmYGNMLmVAnbZp8OeL8jpIWSMU2q4wECBj4jlcBnuqJE0iY4YX0LUyoJoyc5N0As=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yytdb5zfk6Pu8DA0eVOJz97p3TF4VoLi8OmPgAxvA+bGvygtd/E
 2QqaNTfV7QUiyy4iAz87Pv0KWOK3aFSu63O5/O54fRlEPtDWWNjdu0b1mUhkorhIGT2JPTJF+Xi
 8XZBkd80Trn6gQ1JPda9NEvqv6tLJf939Ux5sKEEDesSW2DSegnEqG8BrxUZ5uwemYgamejw=
X-Gm-Gg: ASbGncsbhtlW+RkU1nt22klxzWkJqnbo4sDB15SbpS+wTEYIe1AK0MxT5RPc0T1sctv
 nNGsXFbpiGGAMcNRGV19840KinpQDlvtqymfSU80GmHadRixahOHvQ/rqBmm8pjCKZMl/xguZPd
 afuYaeJzkzepRH5YW9ksn88+elVvHMwlfMFmZPw44ryr+m/Mf3CWbwDuJopD8uypASE6K3VLaIz
 fdbWlRkmdownm+6h4w7t8sG5jndZs4B5zQI3+KQbUVTxOGWPhMY3fZN2vtsWFHawmj8pfiKErtZ
 r7EIoLUJGnXOFMQTF48rbyex6rQa7i6TJM3Rrb9gwaIhpK4HvZY8kYk1IHLXMC1GUSnl+Ju5GLm
 UeHFdip5UCRpeeD7h7J8IeWJnmTdQ140wzNe7hFLM0bnoDX74aqBypTqopwspvzrhSh0=
X-Received: by 2002:ac8:7c48:0:b0:4ee:1e95:af63 with SMTP id
 d75a77b69052e-4ee5894e4camr57035951cf.10.1763818009059; 
 Sat, 22 Nov 2025 05:26:49 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHzKrHFfiXLL3t7qcXOYH/9ZjJQXSKkuyZ5Ow/HDShaOvGBaRejHnuNettlr7Wma7Iu0SLb6g==
X-Received: by 2002:ac8:7c48:0:b0:4ee:1e95:af63 with SMTP id
 d75a77b69052e-4ee5894e4camr57035771cf.10.1763818008664; 
 Sat, 22 Nov 2025 05:26:48 -0800 (PST)
Received: from [192.168.119.202] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b7654d7cbebsm733074966b.29.2025.11.22.05.26.45
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sat, 22 Nov 2025 05:26:47 -0800 (PST)
Message-ID: <a4a487e8-4dd3-4187-980e-f77e97d0e85a@oss.qualcomm.com>
Date: Sat, 22 Nov 2025 14:26:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] drm/msm/a2xx: enable Adreno A225 support
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Jonathan Marek
 <jonathan@marek.ca>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org
References: <20251121-a225-v1-0-a1bab651d186@oss.qualcomm.com>
 <68224fc4-9d91-4e6a-9fbd-b3aabe0f23c1@oss.qualcomm.com>
 <heoefnaboftvn5u5ueicmtsqyfr4rpwna37rw3h3dulq7q5m3l@46s7l3fsxzbp>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <heoefnaboftvn5u5ueicmtsqyfr4rpwna37rw3h3dulq7q5m3l@46s7l3fsxzbp>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=bsdBxUai c=1 sm=1 tr=0 ts=6921ba19 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=lhKUE6b7AAAA:20 a=EUspDBNiAAAA:8
 a=75Q4ZoG0bmdH4YrKQGkA:9 a=QEXdDO2ut3YA:10 a=kacYvNCVWA4VmyqE58fU:22
 a=bA3UWDv6hWIuX7UZL3qL:22
X-Proofpoint-ORIG-GUID: VrO7OmAKO84JzuXM6P3hI1iSTfViu9tM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTIyMDEwOSBTYWx0ZWRfX1FnUAA2l1Hu0
 BaHKhQN03ls95yaq0HuONlaWF78A6FzjH349O+6zgV6J0HHRC4Ndg+qmUqzafxp4B2255fq3H5P
 I6M0SN3WngojqdiS+kw63zuIKWBxbGmLQzY5C+HidBCpC8bIHGsD7ZjMVb6C/BvdCQlSxmyETe2
 PohWQKMEWI0iDGWAm1c+XcJiivOhmKgfbwM4zupAkeDVO8yIX5H1RkncYGcDWPNZRSLXKLhf726
 QKgyQogEkyOM2gl+iSEg3mBKgJo3c7TsJvWIRUeyOMRq/73/uvFE0dTfCr7+GhaK6VGmlksRdHj
 tNWxAALwa0Sys84AXFIahPuRUilhzdUMPDMl6o+BElu5TcYChdMURbrHj3h3D+InPIIMDPek0PM
 T/tmLP9Xv01lkm9pEymA0VeLNNM1+A==
X-Proofpoint-GUID: VrO7OmAKO84JzuXM6P3hI1iSTfViu9tM
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-22_05,2025-11-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 clxscore=1015 suspectscore=0 phishscore=0
 bulkscore=0 adultscore=0 impostorscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511220109
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

On 11/21/25 9:38 PM, Dmitry Baryshkov wrote:
> On Fri, Nov 21, 2025 at 08:36:08PM +0100, Konrad Dybcio wrote:
>> On 11/21/25 5:13 PM, Dmitry Baryshkov wrote:
>>> Add two remaining bits necessary to enable Adreno A225 support.
>>> Note, this wasn't tested on the actual hardware and is purely based on
>>> the old KGSL driver from msm-3.0. For example, running on MSM8960 might
>>> require adjusting PM_OVERRIDE[12] registers.
>>>
>>> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>> Dmitry Baryshkov (2):
>>>       drm/msm/a2xx: fix pixel shader start on A225
>>>       drm/msm/a2xx: add A225 entry to catalog
>>
>> Not sure that's enough, a2xx_drawctxt_draw_workaround looks scary
>>
>> https://github.com/AdrianDC/android_kernel_sony_msm8960t/blob/lineage-18.1/drivers/gpu/msm/adreno_a2xx.c
> 
> Yep. msm-3.0 does some other things for a200 / a220, which we don't
> perform. I don't know which parts actually apply to our stack and which
> don't.

Right, this patchset at least fixes up the obvious errors and those
interested can poke at it more

Konrad
