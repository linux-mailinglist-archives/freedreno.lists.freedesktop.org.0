Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 69DE5D1B550
	for <lists+freedreno@lfdr.de>; Tue, 13 Jan 2026 22:02:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2FA7C10E165;
	Tue, 13 Jan 2026 21:02:15 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="M+qWKaYj";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ToCp2PKv";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5A26C10E378
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 21:02:13 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60DKaFvP1390366
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 21:02:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PN/lkOtrYA2OT2ZpcMymY52CzXoyPIuxPKU48Dyzghs=; b=M+qWKaYjaEwGs7Xv
 1f0ZBNDgMy5taVSN17y1VlpHKIz3yinTD/VEQZMCRYUaE2DcUPd+JALbn2IOWlTe
 C5zbGPVBlFxdNbHlArgTGvZk9N00vfcXAhfhd1WNN6HapejiP2ok+FmMLvwN8IlA
 7HxHc0OVNZopGB7BjYxer4BjBHr4Jm2lY0Jax3wrEDOzo2QZqo+Rg5qbBP6vbsIs
 azoJn7eLlyYL0ngJDucVHxYUtsTYLKVMci05VaRJzDVaHcqLk+s1BrMtXNDt13kU
 ng4zgKl3pygNStskRIUSlSzqoQ3NSsLXDQDIwMjXaBLHXxBBtJ2ClqJSQ66dP2Ow
 /Ld6tQ==
Received: from mail-vk1-f199.google.com (mail-vk1-f199.google.com
 [209.85.221.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bnw7v8213-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 21:02:12 +0000 (GMT)
Received: by mail-vk1-f199.google.com with SMTP id
 71dfb90a1353d-5635d2bec8bso11904040e0c.0
 for <freedreno@lists.freedesktop.org>; Tue, 13 Jan 2026 13:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768338132; x=1768942932;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=PN/lkOtrYA2OT2ZpcMymY52CzXoyPIuxPKU48Dyzghs=;
 b=ToCp2PKvIrXHm9TgQD+o3dsuyFGmd+E2EwM2Y1kkHhkpBc6GaunrQHSj9QA5Pk+oPx
 xONMXcehVUKQfKJgCTUMgvHVB9vkuoFA5NlkkQTj9gm0zTfBW807thgyBdDmydKJXy+Q
 yxNyZOJ9ms0GqyZSLAHEvc+0Kg9P4gbTjUVFYOWTJXVAYUC15vwhbFQdQqNrX0nCGTz9
 JqMlIui6qbwetT0F1oU4bgFzgV3VeCur1BgH5DHOMl1GkmUScP6lkD2OmKuAa84ndP9u
 B9FeYvCvZcw/kv/qyHhP6qKm8LsOo4qSEfRwevTfci9Kcf4uaKW/3AE/3DNiyKxbn59g
 n+Fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768338132; x=1768942932;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=PN/lkOtrYA2OT2ZpcMymY52CzXoyPIuxPKU48Dyzghs=;
 b=rRXuLa54FJ/DlLnJfIWfSQQlh7l9yQ3s140quRvE9ECcYsWAECNhccktOuWp7Vp0cB
 gOOoof5ggU6o+EOjp5Mo7ahQX8J4NJfFNUT63/ajFV3giYakKk+wWlm3+defFzbJsLm+
 c5NNGuhXKTVQXjX1NsOfvRQ0QY6I3NJNkYjJGPog6fnZT0NyYQiVgi+fUvVt4JP/U+Tg
 l3Aux4+tcLw3scsGvmGI0Vw9mxNXyIQ18wWN8VN124w7WDm9TSF0/UVXHyBjNPNZgs+x
 Vq9mjRqPaUHPxhIk0SVIclnLDW8xi0OTKtFpLWB9BNkxgnNLmLa3ltXkTWuGrxvE3uhw
 SL4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCVuY8Rg37qRjRlHQXkFgo40XRL9BPQ1k9FsAQQURFDzupUY7CxECCB1vPpt0W/gVnZmUMZRoFdqRBA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywhbv5RsJOUHfU1IiP4uhmBLZDJPoWuhlCfSIJtGgeymT0jGjtC
 VruKWyqLWBniNj3gSjDrnOi3PYnzmFis2KnnLqRFAqZ3qdaz5f9OdkihJJHbz7LZSRXY71XTgzV
 PiUrMDRZnVVyuZ5Hl00ULIRbbK3JJziCoJFCxxx4bwjqB87tWGlbTbfBBPs79Ka9SdJlxAeU=
X-Gm-Gg: AY/fxX4TyewxgMk35/ZRSK8WnfzoUXAramxp7Qym7sA5YTSEL66fQ/HVFa6A8WkAfub
 AK35bjoXFD5CoIkDOi0soXSgDWjDtny6pjLPGNshbihIKSyPT1otLbzBOE3GzyOCMSTMJNtX5bm
 KPHV4RpgtmpaBuVYZVYUChF//n37YAELLsfI2SpRv+sc2n0tzIcpP9hCot/gin0GcFD3UA79Wwv
 cyVggZpwF+JtuFsiaLYKBTysVpLDLxKPzhrkR0ENtiD2O/sxpsL0e+3W9xXw+ee077i1Rz6Kn4P
 eD/ugfBgxUcM8aGQPJfxBZC6d9j5ze3AZqJHe5qc+/ZXnT6FTqMK8Dd+FWMROm5ow/pskdMEf2+
 /iOA26ZhyXviPwiyjjeUx29fI5zm+IEGmA4QvcK8ePAQkFetI/kSCqxeuCHAnEMlVYf/8LwY7gl
 ueFJB2
X-Received: by 2002:a05:6122:46a2:b0:563:687f:360c with SMTP id
 71dfb90a1353d-563a08080a7mr278132e0c.0.1768338131566; 
 Tue, 13 Jan 2026 13:02:11 -0800 (PST)
X-Received: by 2002:a05:6122:46a2:b0:563:687f:360c with SMTP id
 71dfb90a1353d-563a08080a7mr278104e0c.0.1768338131125; 
 Tue, 13 Jan 2026 13:02:11 -0800 (PST)
Received: from [192.168.1.188] (87-92-245-163.rev.dnainternet.fi.
 [87.92.245.163]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b86ebfd007fsm1126590566b.31.2026.01.13.13.02.09
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 13 Jan 2026 13:02:10 -0800 (PST)
Message-ID: <0919844a-9246-4bdc-979c-115ccc3995c2@oss.qualcomm.com>
Date: Tue, 13 Jan 2026 23:02:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dp: Avoid division by zero in
 msm_dp_ctrl_config_msa()
To: Nathan Chancellor <nathan@kernel.org>
Cc: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, llvm@lists.linux.dev,
 patches@lists.linux.dev, kernel test robot <lkp@intel.com>
References: <20260108-drm-msm-dp_ctrl-avoid-zero-div-v1-1-6a8debcb3033@kernel.org>
 <ca851614-2804-4029-9799-19e71dd73414@oss.qualcomm.com>
 <zmfgq5d2gwrxgvr4eh4th2gjef76gpbv54kz2myvfnqgpor4dn@7qjr262yryap>
 <20260113205955.GA2893481@ax162>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <20260113205955.GA2893481@ax162>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTEzMDE3MiBTYWx0ZWRfX3vIUusc5/IeU
 AXCFKio+Po7zuli6ADPsiC7rSmDdyGeXd5d5b38qjx+6dhYd6FCHUVpgI1moAEwhcP4gvVH1CRY
 nZcGv4HRD08MxyMxor9kYt9eG3oTYwesBZ4b0k5eQE4xm1+DqQn9kj75mnht7aQ3oNwsVieCcEP
 iTWODaBSpGkvuvFozxRea0lFAt74pRR5QHXznV+eptSpddgjx6S3jeq9StBaI/8UXs98AdxD28M
 o39j8PBvLwdGvFEaiQHUnBUXxcO6VJDENfmbbmIDIUTFnuQDik/UoOcVVRd+nlfZaDNFN2AFmsQ
 ynYblYLBom6qSpupVlMj9Sy9N27rcdb4Z2QcJC0pz4wikzvk1NA9cXaalmgAMpNJrc6p6zpEIxJ
 U5S4/Y87jcZtbAeX0MHXH0qXZc5vTT2blX5N/dYnnfBRYO71lDM2/Og1E3Pk614OQnH+paTE3Ow
 K/TC5Ndpqz+EF7nvG3A==
X-Authority-Analysis: v=2.4 cv=PJ0COPqC c=1 sm=1 tr=0 ts=6966b2d4 cx=c_pps
 a=+D9SDfe9YZWTjADjLiQY5g==:117 a=+WgfKLcscl3VAWRHYO56eA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=LpQP-O61AAAA:8
 a=0--PztnLt7rTvDwXMSMA:9 a=QEXdDO2ut3YA:10 a=vmgOmaN-Xu0dpDh8OwbV:22
 a=pioyyrs4ZptJ924tMmac:22
X-Proofpoint-GUID: 7FxP4fqIRfUy-4zKpOY4IyHdYsExaB7u
X-Proofpoint-ORIG-GUID: 7FxP4fqIRfUy-4zKpOY4IyHdYsExaB7u
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-13_04,2026-01-09_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0
 priorityscore=1501 adultscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601130172
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



On 13/01/2026 22:59, Nathan Chancellor wrote:
> On Mon, Jan 12, 2026 at 04:37:46AM +0200, Dmitry Baryshkov wrote:
>> On Fri, Jan 09, 2026 at 10:06:29AM +0100, Konrad Dybcio wrote:
>>> Dmitry, would it be beneficial to throw an actual error when the rate is
>>> is mangled? i.e.
>>>
>>> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> index aa2303d0e148..4f710b8e6bc6 100644
>>> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
>>> @@ -2404,9 +2404,9 @@ static int msm_dp_ctrl_link_retrain(struct msm_dp_ctrl_private *ctrl)
>>>          return msm_dp_ctrl_setup_main_link(ctrl, &training_step);
>>>   }
>>>   
>>> -static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>>> -                              u32 rate, u32 stream_rate_khz,
>>> -                              bool is_ycbcr_420)
>>> +static int msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>>> +                                 u32 rate, u32 stream_rate_khz,
>>> +                                 bool is_ycbcr_420)
>>>   {
>>>          u32 pixel_m, pixel_n;
>>>          u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
>>> @@ -2415,14 +2415,21 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>>>          u32 const link_rate_hbr3 = 810000;
>>>          unsigned long den, num;
>>>   
>>> -       if (rate == link_rate_hbr3)
>>> +       switch (rate) {
>>> +       case link_rate_hbr3:
>>>                  pixel_div = 6;
>>> -       else if (rate == 162000 || rate == 270000)
>>> -               pixel_div = 2;
>>> -       else if (rate == link_rate_hbr2)
>>> +               break;
>>> +       case link_rate_hbr2:
>>>                  pixel_div = 4;
>>> -       else
>>> +               break;
>>> +       case 270000:
>>> +       case 162000:
>>> +               pixel_div = 2;
>>> +               break;
>>> +       default:
>>>                  DRM_ERROR("Invalid pixel mux divider\n");
>>> +               return -EINVAL;
>>
>> Well... In the ideal world, we can't end up here, PHY's
>> configure_dp_clocks (or qcom_edp_set_vco_div()) will fail if the link
>> rate is is invalid here. I think, we should return an error here, but
>> there is no need to propagate it further.
>>
>> See the discussion at https://lore.kernel.org/dri-devel/f2ce6ae51c50b0d2e57b905c63b43413@codeaurora.org/
> 
> I interpret that as approving of the above hunk but omitting the hunk
> that modifies msm_dp_ctrl_on_stream(). In that case, what is the point
> of changing the return type of msm_dp_ctrl_config_msa()? Wouldn't the
> below diff have the same exact effect as a smaller change? I don't mind
> rolling this up as a v2.
> 
> Cheers,
> Nathan
> 
> diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> index aa2303d0e148..d8ea73b89f7c 100644
> --- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
> +++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
> @@ -2409,20 +2409,27 @@ static void msm_dp_ctrl_config_msa(struct msm_dp_ctrl_private *ctrl,
>   			       bool is_ycbcr_420)
>   {
>   	u32 pixel_m, pixel_n;
> -	u32 mvid, nvid, pixel_div = 0, dispcc_input_rate;
> +	u32 mvid, nvid, pixel_div, dispcc_input_rate;
>   	u32 const nvid_fixed = DP_LINK_CONSTANT_N_VALUE;
>   	u32 const link_rate_hbr2 = 540000;
>   	u32 const link_rate_hbr3 = 810000;
>   	unsigned long den, num;
>   
> -	if (rate == link_rate_hbr3)
> +	switch (rate) {
> +	case link_rate_hbr3:
>   		pixel_div = 6;
> -	else if (rate == 162000 || rate == 270000)
> -		pixel_div = 2;
> -	else if (rate == link_rate_hbr2)
> +		break;
> +	case link_rate_hbr2:
>   		pixel_div = 4;
> -	else
> +		break;
> +	case 162000:
> +	case 270000:
> +		pixel_div = 2;
> +		break;
> +	default:
>   		DRM_ERROR("Invalid pixel mux divider\n");
> +		return;

Please add a comment, stating that we can't actually reach it. LGTM 
otherwise.

> +	}
>   
>   	dispcc_input_rate = (rate * 10) / pixel_div;
>   

-- 
With best wishes
Dmitry

