Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D129AB933D
	for <lists+freedreno@lfdr.de>; Fri, 16 May 2025 02:39:13 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E530710E986;
	Fri, 16 May 2025 00:39:11 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dhWIqLhA";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FB8710E986
 for <freedreno@lists.freedesktop.org>; Fri, 16 May 2025 00:39:10 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54FEF9ZZ016628
 for <freedreno@lists.freedesktop.org>; Fri, 16 May 2025 00:39:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GlqhZcs+erk3iBh+80fphQbFA+uOB/LMqliG0REwbBc=; b=dhWIqLhAtjrxwtE2
 pPBq6XHxgW9JdIiD1TWG0LkoytjCi2O4joojeUGxcMzCW5YfWAuWuxlidB3ZCaLE
 AtamsNgvWmIJtIGm/SOEQCWpX8F88vPLs0yNxK1Bw2HZ+R380ZJbvqlNaY+OPOaY
 Np1gumqPX7sYhMznsiZuKrxFvWQafOFTY3/c78erAGmsyRq3vIWz5j+WhOGIDdRn
 QdmKDxsWRK2OyxMTc8dtvvdFKbyBknu4TTxelCJD6tGR/pjk+juLUrHTtSmSHjYr
 ERK8JrINMKfa7rgA0SZASrpsiucWkln624roJfPHnhr4ZH1deH2OFTJGLX5mYi/2
 Z2nxIA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbcmr81u-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 16 May 2025 00:39:09 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-22eb21a2788so21279955ad.2
 for <freedreno@lists.freedesktop.org>; Thu, 15 May 2025 17:39:09 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747355949; x=1747960749;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=GlqhZcs+erk3iBh+80fphQbFA+uOB/LMqliG0REwbBc=;
 b=hIqkeb/f21CPhT01vgdVnN3nDXdOMmtAwy3+8AZ71OPVxA8duNXyZ0XpYsQn5fLUAi
 JXw4AvGUhUJmA3f4OoJfkPKhQ+AM4O0Ir2g93zH0MDnMjNmqsi9PwQQUU8JrbKDsVkcb
 OvoKr9UNYCUDV9hAhXWhsJhUSYBqrYSxpSUn8qYx/I+08SrJm7UBIAd/Gw2aKd+bo6c5
 r4QQKv7HC2ISynLpjAqTvBntskzr8sSpB9A+tVJ5LDej/dF4xhWkGsWJnyXCnBrlh7xz
 iIFVqAfBgtVOzx2GYVXl+OcXspUfryA1OphVeAk33kE6afbtU+uztbBWIDo1H5TlrsAB
 f1EA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXN4u4mXhiuaxZuBb3aO9MwvS0Mt4eUvBkVcVHHkcCTA03B/ARkW5pIIHbEfSA4fqbPY0YmFpkbeTQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyZiwKLlwzC+ICYbrOCHck//uQY/l1QFKlqtxIcKZ9IR8e53dS+
 qa9Ab0ezJmH3rDqfT0IWs/z0pULPqig5R4gC9SwiHERT45r/uq7yTW1bCVvX2/gI8BXPraqUD+t
 6K6Hbe0OjgVseF6qarkYoynQ/peqNrSZnLtsopWBYjvVeeP4PRZ1ZoiqcEJl0mwtOi8sZdDQ=
X-Gm-Gg: ASbGnctW04XtM3K9ZUtajL/Khj+K7hK8BqhnkAABrl+5kDwgDfIY79sKrs0rjl94uOf
 AtEJwNjoYdWckN61KyBpTCeG5KwN707q6yls0tUrV2ezFnmGjQT+a6bqpQdxR4NrZTVw+Vck9Pe
 w8PFi8UcWzWJbBCR2JxJ9PvHBHJ4V7nWjkJAThUO7URHBjRsJfQXzkkwWOH/kEdttHvbML6Iifr
 NBMrjMiK9F+8ecpDelKWz71453FZExEFFMnILZXPUOs/hF2FP0HsE2X9+uPr8dOpG7p1AyVIWep
 Dic/W3Ztl15NRAvR1AlF4TGhPwnZ+p0M+KIrWh+7fLOzgO0G1ca0zjhqrTBTLQFtE7xVWA==
X-Received: by 2002:a17:903:f8d:b0:224:f12:3734 with SMTP id
 d9443c01a7336-231d43d36ffmr15462985ad.30.1747355948942; 
 Thu, 15 May 2025 17:39:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFCIxa42I2fd9QBBq3jcy1OxAa7Gi6L2HevXKicZ0G0GjWZp48BnGCRKieCJE4fuG/o3RumIg==
X-Received: by 2002:a17:903:f8d:b0:224:f12:3734 with SMTP id
 d9443c01a7336-231d43d36ffmr15462825ad.30.1747355948541; 
 Thu, 15 May 2025 17:39:08 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-231e069c592sm755765ad.100.2025.05.15.17.39.07
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 15 May 2025 17:39:08 -0700 (PDT)
Message-ID: <24e419da-71f8-4b0d-9416-0fe4c63eed0f@oss.qualcomm.com>
Date: Thu, 15 May 2025 17:39:06 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/5] drm/msm/dpu: Check mode against PINGPONG or DSC max
 width
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
 <20250514-max-mixer-width-v1-3-c8ba0d9bb858@oss.qualcomm.com>
 <f2brfgvsnwqu5rudr32fkjx6qiuut2im546mjqrk2ouego4npx@g6avls6o7kws>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <f2brfgvsnwqu5rudr32fkjx6qiuut2im546mjqrk2ouego4npx@g6avls6o7kws>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE2MDAwMyBTYWx0ZWRfX1HEUHUuPbSYo
 6cWHgKChQAPLIPIYvc2bJXSZ/9tsGOVEWQbbOnlkIyelMFFk8XrHUBImFJIHUL3rXYmwDuOrmLr
 fFMKX2ZNHLTk3H4mo1om/ehhXNOvbvkDq/Z1xazs89rCDxaWySljcgMIiOfGy2xXby12+J1+kte
 Tgfj6/vPu6W23IqI4QWL2pJxuhnfAF+qW+L1ltCMISPVbqk0ufthlMNFUB/hO+lYd+i7Fri7khL
 2fzyN6lpV+5L/+igGwmi3S8qSPYH+hfqij4YSmKDODdVzcHJBtIkqPjLXj4u/bBAYQuFd+yMAQR
 Y0dbhVdqUDdc25BK+baTQfZ8oeQpjKw3JVMPo3vF5Db6BIKcliGxTUncLkEve1XaIMEu+RQFtbv
 SjVf5Z+nwDIUnM6CKn0jULwNMv1+N2cB0BHvzTNk/kKn4szqLBpSJQ0BprdOqBPgMelXyD27
X-Authority-Analysis: v=2.4 cv=G5scE8k5 c=1 sm=1 tr=0 ts=6826892d cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=lZyNh1K7jJI6hNXvg3QA:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-GUID: Lkg7p_o32pcVTD4VqJ6ltTX8v4kjQgl1
X-Proofpoint-ORIG-GUID: Lkg7p_o32pcVTD4VqJ6ltTX8v4kjQgl1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-15_11,2025-05-15_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxlogscore=999 clxscore=1015 phishscore=0 bulkscore=0
 suspectscore=0 spamscore=0 impostorscore=0 lowpriorityscore=0 mlxscore=0
 malwarescore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505160003
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



On 5/14/2025 5:28 PM, Dmitry Baryshkov wrote:
> On Wed, May 14, 2025 at 04:52:31PM -0700, Jessica Zhang wrote:
>> Validate requested mode and topology based on the PINGPONG or DSC encoder
>> max width. In addition, drop MAX_HDISPLAY_SPLIT and base LM reservation
>> off of PINGPONG or DSC encoder max width
> 
> Separate commit for num_lm, please.

Hi Dmitry,

Ack.

> 
>>
>> As noted in the patch, while DPU 8.x+ supports a max linewidth of 8960
>> for PINGPONG_0, there is some additional logic that needs to be added to
>> the resource manager to specifically try and reserve PINGPONG_0 for
>> modes that are greater than 5k.
>>
>> Since this is out of the scope of this series, add a helper that will
>> get the overall minimum PINGPONG max linewidth for a given chipset.
>>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 46 +++++++++++++++++++++++++++-----
>>   1 file changed, 39 insertions(+), 7 deletions(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 0714936d8835..6131d071b051 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -723,6 +723,31 @@ void dpu_crtc_complete_commit(struct drm_crtc *crtc)
>>   	_dpu_crtc_complete_flip(crtc);
>>   }
>>   
>> +static int msm_display_get_max_pingpong_width(struct dpu_kms *dpu_kms)
>> +{
>> +	const struct dpu_pingpong_cfg *pingpong;
>> +	u32 max_pingpong_width = dpu_kms->catalog->pingpong[0].max_linewidth;
>> +
>> +	/*
>> +	 * Find the smallest overall PINGPONG max_linewidth in the catalog since
>> +	 * max_linewidth can differ between PINGPONGs even within the same
>> +	 * chipset.
>> +	 *
>> +	 * Note: While, for DPU 8.x+, PINGPONG_0 can technically support up to
>> +	 * 8k resolutions, this requires reworking the RM to try to reserve
>> +	 * PINGPONG_0 for modes greater than 5k.
>> +	 *
>> +	 * Once this additional logic is implemented, we can drop this helper
>> +	 * and use the reserved PINGPONG's max_linewidth
>> +	 */
>> +	for (int i = 1; i < dpu_kms->catalog->pingpong_count; i++) {
>> +		pingpong = &dpu_kms->catalog->pingpong[i];
>> +		max_pingpong_width = min(max_pingpong_width, pingpong->max_linewidth);
>> +	}
> 
> Since we are skipping PINGPONG_0, wouldn't it be enough to return
> max_linewidth of PP_1 ?

I don't think we're skipping PINGPONG_0 here since `u32 
max_pingpong_width = dpu_kms->catalog->pingpong[0].max_linewidth;` at 
the top of the function.

> 
> I think, it would be easier to follow .max_dsc_encoder_width and store
> .max_pingpong_linewidth in dpu_caps (and later add special
> .max_pp0_linewidth).

Ack. I think my only concern for this is that max_pp0_linewidth won't be 
set for all chipsets. But if you're fine with that I'll go ahead and 
make this change.

Thanks,

Jessica Zhang

> 
>> +
>> +	return max_pingpong_width;
>> +}
>> +
>>   static int _dpu_crtc_check_and_setup_lm_bounds(struct drm_crtc *crtc,
>>   		struct drm_crtc_state *state)
>>   {
> 

