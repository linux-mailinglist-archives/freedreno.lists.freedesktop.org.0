Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6A2C9D19E6A
	for <lists+freedreno@lfdr.de>; Tue, 13 Jan 2026 16:31:26 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EF8210E506;
	Tue, 13 Jan 2026 15:31:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NDuBqgf2";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="boHTdpKU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1AB9C10E504
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 15:31:23 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60D8Z1oH3727188
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 15:31:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Jdh/o+SXQDB+611mtKFjE/D68KoXr5mEtsYbTZq6sHI=; b=NDuBqgf2zIg+H73n
 i6AtMEXz6x5zXjXzrYrAyKNFRBSo9tcOl+8FFlednRWBrPPTu6Tn2nML5zR0OQrL
 q7TjA+gyj8esCth8LQ94/XNe/yuGGEd9s0DoQyjR4xv37mXSAbmLdcg4+3U/AqTH
 RzZUvrygy6dPloZ73RjXgb+7AyLbCygJUV6Xt2aN2Da5JEO+kuJDN/csT0yfoK5R
 0U50xIj/IkbofXQRRgHzKZuzX+tboeTmaId8X8pAZgxQaDIH/kB3UYX37Kuq8Eh6
 moH1OK6Gd4CioisOiVJL6FfmnaMXxZQ5fPzEZyiCerLX/8cuNcZSxhr6nbJi5whD
 j4nXKA==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnjnu1bw3-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 15:31:22 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-5eea40cc21aso262837137.0
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 07:31:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768318282; x=1768923082;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=Jdh/o+SXQDB+611mtKFjE/D68KoXr5mEtsYbTZq6sHI=;
 b=boHTdpKU0Oiuqar2UmjSXRXcS6J8vRT8gnkubasFKWwZgbYDoG8rz9QRghfIdxjKhd
 IUEo5Psgp1Wzn/p557p5gJIjBBrLQCB7LHpPoHzrwilS9aBWYStQ6Dyi55BaZJ3UogSW
 U0uRzaOGACr1Uvf/I5NMGnJCYmPaI/68Nx8PRPQsUyGhFpjhE+cA1P4UnadY+yMsFMMo
 18TZ5PUQLnufbS2LQqGs5aHdymSLzKsUm7mjVfskYQ4rSP80pl6xsTqrQ9LrLCMqnR8n
 BNF/EXUMBkoxdXh+tDAA+72plscUrZEjV6StZejmrpsi5EpOw6j+KJp8rvEbG1IAKqPA
 k43w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768318282; x=1768923082;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Jdh/o+SXQDB+611mtKFjE/D68KoXr5mEtsYbTZq6sHI=;
 b=hUC5NqdA4E3567ipd7SZgH2fs4uhEbDWgVnNVgqW6spQDfUeOr71R6fCXEa4ZRXzRU
 acgG7uWQowPOnlZvmPE9qd6K+dnnCf8kuQvgn0rHE7GN6m2gHyjat8WC+/QmGPIs4r/O
 kZrCQ2avW1Jq6YHwuKoGZMHrSn5v/xRcjJg43lWKRmw0hXdzA/rlljQGnME2jK8qaUXb
 YL1U6Iqy0M/jzPkb7nvF/69713KUBLaCvicd3cxqHDkLSTRuezisLzrLCzmyvbSQClGp
 UrEL0k4f5l5l+MlB9pBH0CBoKvpT/MpHVVJ0ql8rbLqv0vJJ1cVxsnHLBpqYCOlUJspR
 VjKg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUR7tCAR82W35X/ucK9i9RMMyuEPX44N7LQqQXXS2FCx74AuHvpJ3J4vyqzZ7HZPr9/FjenRM7rPlM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxQoxqgUHTCQmuA1Zi1GelYeYlYsi8uBaIWdjb748FjqWur+sy1
 zEHdvU4pkuGeMLrW3gX0oZTunUXJYYSms8sxBwU0iS1wYq5yHEVrhnnBOqEiawAyw3sM3kCBOHj
 uyH7YswWJ2L5HfsmYMx4D2zJm9nuWxrF4/MSeQATt9XSTeUU19ejjHdwxXZIf+fAVThBgiF8=
X-Gm-Gg: AY/fxX5SQ1/xsxNae/2iaUaHQpXOZjy6+EIrnNi+Pe3unuTtaeXT3wOUN9jsVJBeKOc
 zBHrH5QaDucK6/WPebIFOAx9IvevkDK+VRZnLSxioaog43au/WW4d8smUUOmjOQUOy1IegQsHlR
 EBagJLWMovrY6U9ed6N9YkO5s6Zd+qQHQDX3UzryN59zkPRwtDYV2fE+ysi7dZtxq5/vZax65rT
 9pVyhCA1TudMUp6bbcAbH1qu2giqsW63HTrVU/Ckn5Gxfl8Z+HuFfQHdyuLCgfHPhg9nMYNEhHH
 UkgcnupcbqO+zET+DcZ1vElnYT9y6BKfmSVHGfasPcKJ6kKLGHMeaI9kyFeCkimr0AVrGpAQnKX
 vHc0pOw+H6Q4WAzKe394Arbeq3G6dbA+STmpW2uWoPj8HGWR8jQ+6Exw3IQgeRFFOy6I=
X-Received: by 2002:a05:6122:c1ce:b0:55b:ac1:d05f with SMTP id
 71dfb90a1353d-5634735d2e6mr3999011e0c.0.1768318280007; 
 Tue, 13 Jan 2026 07:31:20 -0800 (PST)
X-Google-Smtp-Source: AGHT+IEJaDNb89277U09zQgcbIRSDmN8Tc2NQbPIkmYjjiiCT9F6GWII0ZfQNvgvatDzT93Kgyw+wg==
X-Received: by 2002:a05:6122:c1ce:b0:55b:ac1:d05f with SMTP id
 71dfb90a1353d-5634735d2e6mr3998977e0c.0.1768318279128; 
 Tue, 13 Jan 2026 07:31:19 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b87207e08a7sm519832466b.55.2026.01.13.07.31.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 07:31:18 -0800 (PST)
Message-ID: <befc5600-5cfd-4134-928c-80e3b1b4102a@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 16:31:15 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/3] soc: qcom: ubwc: Get HBB from SMEM
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>
Cc: Konrad Dybcio <konradybcio@kernel.org>, Kees Cook <kees@kernel.org>,
 "Gustavo A. R. Silva" <gustavoars@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-hardening@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org
References: <20260108-topic-smem_dramc-v3-0-6b64df58a017@oss.qualcomm.com>
 <20260108-topic-smem_dramc-v3-2-6b64df58a017@oss.qualcomm.com>
 <you4xijwc5g4ngcnhxm4ecn7opexnsdfayvd5wiiqpl7734r7w@bdkpjqmlzxre>
 <b2pqfrs2ptaoxxeanzumxyibmydsoiqslcsg6yrm4hihynowj4@mzazqnrptnyf>
 <hunbpvbfkcxzbnwr676z6fncgdhfumjedx7jp5izojusg3rj7f@5te77lmqcdaa>
 <cleh7dolqus3grexqfchtavvnj6wef6rlslgv3r7gesfuyxhs5@5b6z5gwtn36b>
 <nhgxvv5bm3bevq4qkqnew6gaqlwiaicrs7yjckg26fgwnffqj5@u2phabfukljx>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <nhgxvv5bm3bevq4qkqnew6gaqlwiaicrs7yjckg26fgwnffqj5@u2phabfukljx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: EdBoF-IyolNa85CkLafqSjxfe3XrVYm9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDEyOSBTYWx0ZWRfX0kEOKvq5rbmi
 b4SbJqvRTSvt2TPb79ifXyz3A8VZ7Fly1nUWuXEe7JeGT71z7vCqjnH+asLBCx5vsaaFfTmKCn+
 2/eEHvUN8CSZsxapLN5SWTfJi4Ngb+WpslJGh9vFgVkVgwH7a5YwpK20kMnoSw+ZyrddgRN3tH+
 yuuB2w9QcR5w6jU1sIBayYq0mZRS/b6oTKNglf8mqIDScAs+pMZ/OsMcwkqlzL5WrdNTi0jevHH
 uJBk/bPfoK8jjENVyb0WqDKztNLrqU8H4m4nt9UCvihJu1zS0is8N+FWdRKGZ1it1/jhJtTN/yr
 Sk4lBrCQDAYnsgRDdJKIsCn2bqDI51JmKEO7dQxTflH/w1ST+jP5jM1TGjMiLdoDO+W51570h/e
 z6I1AtxCrgq2vkVLYShkbSmKJK2JvvdCf2OXt9cLmhLESFsKm4Oy6Ih85dxMnIbe8T16Hwgruk5
 WPR5ujPZTSFBr/5z0QQ==
X-Authority-Analysis: v=2.4 cv=RMu+3oi+ c=1 sm=1 tr=0 ts=6966654a cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=KxVwwE8FzcsyeGkQqd4A:9
 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-GUID: EdBoF-IyolNa85CkLafqSjxfe3XrVYm9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_03,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 malwarescore=0 impostorscore=0 suspectscore=0 phishscore=0
 spamscore=0 lowpriorityscore=0 priorityscore=1501 bulkscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601130129
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

On 1/10/26 11:45 AM, Dmitry Baryshkov wrote:
> On Fri, Jan 09, 2026 at 11:50:46AM -0600, Bjorn Andersson wrote:
>> On Fri, Jan 09, 2026 at 05:21:10AM +0200, Dmitry Baryshkov wrote:
>>> On Thu, Jan 08, 2026 at 11:49:54AM -0600, Bjorn Andersson wrote:
>>>> On Thu, Jan 08, 2026 at 04:45:49PM +0200, Dmitry Baryshkov wrote:
>>>>> On Thu, Jan 08, 2026 at 03:21:51PM +0100, Konrad Dybcio wrote:
>>>>>> From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>
>>>>>> To make sure the correct settings for a given DRAM configuration get
>>>>>> applied, attempt to retrieve that data from SMEM (which happens to be
>>>>>> what the BSP kernel does, albeit with through convoluted means of the
>>>>>> bootloader altering the DT with this data).
>>>>>>
>>>>>> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
>>>>>>
>>>>>> ---
>>>>>> I'm not sure about this approach - perhaps a global variable storing
>>>>>> the selected config, which would then be non-const would be better?
>>>>>
>>>>> I'd prefer if const data was const, split HBB to a separate API.
>>>>>
>>>>
>>>> I agree, but I'd prefer to avoid a separate API for it.
>>>>
>>>> Instead I'd like to either return the struct by value (after updating
>>>> the hbb), but we then loose the ability to return errors, or by changing
>>>> the signature to:
>>>>
>>>> int qcom_ubwc_config_get_data(struct qcom_ubwc_cfg_data *data)
>>>>
>>>> This costs us an additional 16 bytes in each client (as the pointer is
>>>> replaced with the data), but I think it's a cleaner API.
>>>
>>> What about:
>>>
>>> const struct qcom_ubwc_cfg_data qcom_ubwc_config_get_data(u32 *hbb)
>>>
>>> I really want to keep the data as const and, as important, use it as a
>>> const pointer.
>>>
>>
>> I guess the question is what are you actually trying to achive; my goal
>> was to keep the base data constant, but I'm guessing that you also want
>> to retain the "const" classifier in the client's context struct (e.g.
>> the "mdss" member in struct dpu_kms)
>>
>> If we're returning the data by value, there's no way for you to mark
>> it as "const" in the calling code's context object (as by definition you
>> shouldn't be able to change the value after initializing the object).
> 
> And I, of course, misssed one star:
> 
> const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(u32 *hbb)
> 
> This leaks the knowledge that HBB is slightly different kind of property
> than the rest of UBWC data.
> 
>>
>> You also can't return the data by value and then track it by reference -
>> as that value lives on the stack. This has the benefit of making the
>> lifecycle of that object clear (it lives in each client) - but perhaps
>> not a goal of ours... 
>>
>> How come the ubwc config is const but the hbb isn't?
>>
>>
>> If we want both the per-target data to remain const and data in the
>> client's context to be carrying the const qualifier, the one solution I
>> can see is:
>>
>> const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
>> {
>>         const struct qcom_ubwc_cfg_data *data;
>>         static struct qcom_ubwc_cfg_data cfg;
>>         int hbb;
>>
>>         ...
>>
>>         data = of_machine_get_match_data(qcom_ubwc_configs);
>>         ...
>>
>>         hbb = qcom_smem_dram_get_hbb();
>> 	...
>>
>>         cfg = *data;
>>         cfg.highest_bank_bit = hbb;
>>
>>         return &cfg;
>> }
>>
>> But we'd need to deal with the race in cfg assignment...
> 
> static struct qcom_ubwc_cfg_data *cfg;
> static DEFINE_MUTEX(cfg_mutex);
> const struct qcom_ubwc_cfg_data *qcom_ubwc_config_get_data(void)
> {
>         const struct qcom_ubwc_cfg_data *data;
>         int hbb;
> 
> 	guard(mutex)(&cfg_mutex);
> 
> 	if (cfg)
> 		return cfg;
> 
>         data = of_machine_get_match_data(qcom_ubwc_configs);
> 	if (!data)
> 		return ERR_PTR(-ENOMEM);
> 
>         hbb = qcom_smem_dram_get_hbb();
> 	if (hbb = -ENODATA)
> 		hbb = 15; /* I think it was default */
> 	else if (hbb < 0)
> 		return ERR_PTR(hbb);
> 
>         cfg = kmemdup(data, sizeof(*data), GFP_KERNEL);
> 	if (!cfg)
> 		return ERR_PTR(-ENOMEM);
> 
>         cfg->highest_bank_bit = hbb;
> 
> 	return cfg;
> }
> 
> This potentially leaks sizeof(*data) memory if the module gets removed.
> Granted that all users also use qcom_ubwc_config_get_data() symbol, it
> should be safe to kfree(cfg) on module removal.

I really don't understand why you'd want a separate API for hbb, if
hbb is already available from the larger struct *and* if a driver needs
to know about the value of hbb, it really needs to know about all the
other values as well

Konrad
