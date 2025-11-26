Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CD2C87F81
	for <lists+freedreno@lfdr.de>; Wed, 26 Nov 2025 04:38:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C834910E0F9;
	Wed, 26 Nov 2025 03:38:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="N7KY8YDw";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="dDwltILo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53C6D10E0F9
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 03:38:30 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5APLFEFv4121220
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 03:38:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 agDGgzRr5TSP9r6ApCG+csfzr79eR2JTLEqjVq7+3mA=; b=N7KY8YDwtjzD/UFH
 IJROtuCni8d/hH3xIr/oAq2EbKamSvJrT/78Bu23z5mr6Nteg+4qRHepivPTIWbO
 LQyjIL8XPG+Fpvs7eN4rPfnqzbextZm/Aj5tVNP5keF68wxF+tu7gxoL5tvArjN2
 8+fIatH+I8374KbRcreucqqPleINny0ehcT42VgWI5mwAhR7K03EDHwjkBvD2lob
 tr8S8yetzqJxweUPyxvpeFWrC3UBtjGyBpmlJv3oAPwWyAEZ3R2oOZXlcgoca5Pb
 iZaYo+5dF1W3AM35yc9gyNvgx12LGRLYEe1YqzOX8WEp9ycyVCtEWF1t1ybX4IS7
 Ey9kSw==
Received: from mail-pf1-f198.google.com (mail-pf1-f198.google.com
 [209.85.210.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ana9xana8-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 26 Nov 2025 03:38:29 +0000 (GMT)
Received: by mail-pf1-f198.google.com with SMTP id
 d2e1a72fcca58-7b895b520a2so5935861b3a.0
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 19:38:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764128309; x=1764733109;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:from:to
 :cc:subject:date:message-id:reply-to;
 bh=agDGgzRr5TSP9r6ApCG+csfzr79eR2JTLEqjVq7+3mA=;
 b=dDwltILo6Kapq0tF/JcwGAWNJ9WEceRnf54Mpd9NlYALZlIVW9p+LXkoLefhfEX29X
 KQmyL38obrjgfWal6M127hFzeYHZTqABQ0msGSAVxWPKLSRtgR9/wDvM9c/6EOvsGWEh
 HHoG76ksksocCbWTyNHQAG8Jbxo0K3p+MXTNAwuGyFtlkzEZix8POb9YNgV38XQx8ziF
 5Ba8Q7ZVjz0OLfuoaGyIlAHyBtn6beH9tw1IQFWly4q1jLH5B4emL/UYvuZ/FMfDShtJ
 jMZNkzVDMCQaCrY7cjMdXLqHUV9aiFoTrUr8PQIhgaf2yR255eYzVQbyHevDq/2WICdz
 q8Pg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764128309; x=1764733109;
 h=content-transfer-encoding:in-reply-to:content-language:references
 :cc:to:from:subject:user-agent:mime-version:date:message-id:x-gm-gg
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=agDGgzRr5TSP9r6ApCG+csfzr79eR2JTLEqjVq7+3mA=;
 b=loEnetdxQMT3OiW1kLcrc7uPWRUvGc8tn0AYd5VgUXaBAD1dCvZ3M6hSLNDLM4UCpk
 0s0IIUDs8mABs2JCNRFPB/MLE6NJTkLWJrcIp6vAYJDz7qP7cNScY5qf13UKOMeMICPD
 XX1Z/ECZuCaGGZtRcrUsjtq1zO7+xwjzgNALQ3qSqulnXpayW5qy7v0wbbErhBUIdc4S
 /8RgJl+ddI6u+LDwJhWB+Q/DgkTgWHKPT1UN8OLARvjEWF9yJwtzMIfYeFHJyzmMJwQ4
 OUA9t341ikCmp2OMJLVpkp+D89fOwYl6GL1cYEHQN6Als07/k8At6+Zt0WfvjbY3wNiF
 3zkQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWPiYhQldRW1SDZxOVeND8t81f3v/PRG2U6ZvX2IAxYp7Z8yS5G/LofNAlmpTx+jpnWwtJViFAjLnA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyIyHpf2x+IFYF1bjqxC+WAVYgE8tcoT0I6NNbDx1crZLW++1NP
 8wIIhUss8NjNUf++A6e7QJuOhRwhmto2eaNrnxNqsl5P4tdNZIxAVoQlSYTxVZnnCMo2sApwlkA
 bUmAm7643Pp9DU+76z5P2i3x8ht+KeUPPAhk6y+xwCoRbcXfeDEWiyxIA+gieoLCJAsBRo7Q=
X-Gm-Gg: ASbGncvAAaAywWb0qww4iRfG2Qc1BR8mrGLV9FvhOTNEnoMa6BKHHGPDgFGktEn7aLt
 3usjBxWDW44iMeyzEg0qkS4Ic+LbzKMhax/MbvSk0A90FuS7kRCrGva9qBgvnSV8HUbrfxUFBvM
 d1t1MLBSPCgzofdRmprHcjmg04cAFS/J3bZ9w/XFvQgDQaNPp2z/krYxBuJtCLodEKhISSyZWl0
 rGla5XGwKsuifD0qy79i4j+WQ2ByL5PU3L319DW2U7ZvJF4BI15wCqABQ7n8sGO35+9QcZgbmIz
 qC+Sl5/KitqfmdpVourvVf3t7xtSMZ2AcwQAD/BjRGLrNocBJVSxbQiFO8KoaOkF72HvWg0pgX5
 HftYs/pANYnKIKLYF9m3OFtN564hIK/st7fcqb/hGfY2W7FW7XFJ9RRudazZ/DTzzTdMcXA==
X-Received: by 2002:a05:6a00:a1e:b0:7ba:153f:5a40 with SMTP id
 d2e1a72fcca58-7ca879e956cmr5403797b3a.9.1764128309086; 
 Tue, 25 Nov 2025 19:38:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFTiG66hdYeGYiaCl9f/OqCieCXEYUJQxdu0p5mNi7NxXuiHye2hU5fq6jbx44J0e52G9P8Vw==
X-Received: by 2002:a05:6a00:a1e:b0:7ba:153f:5a40 with SMTP id
 d2e1a72fcca58-7ca879e956cmr5403774b3a.9.1764128308544; 
 Tue, 25 Nov 2025 19:38:28 -0800 (PST)
Received: from [10.133.33.250] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7c3f0243b3csm19469225b3a.36.2025.11.25.19.38.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 25 Nov 2025 19:38:28 -0800 (PST)
Message-ID: <586c0ab5-ead1-4387-9f7a-d1943dffc7df@oss.qualcomm.com>
Date: Wed, 26 Nov 2025 11:38:22 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] drm/msm/dp: fix the intf_type of MST interfaces
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20251125-mdss_catalog-v4-1-df651fba2702@oss.qualcomm.com>
 <3cnujrkkcui34wg3jrfoezradc5itm2paw5mgkii2d2snlac2a@lerj4ldbvf4l>
 <9515e743-b8bd-426c-9827-7d5a170445e0@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <9515e743-b8bd-426c-9827-7d5a170445e0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: 9inG63K-sS_wyMHiZdu0-O3HYQhQzbSU
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI2MDAyNiBTYWx0ZWRfX1u9dXxi+6z73
 0mAnd19MYx0eNZughB7nNWzGmVJehpizvZTtcEeeTzZXZ36H0oSo8nheBZFR8yZJjaG76reTArk
 FLAZaka80+ViLWuGe8HIS95CcAPugCRVA0Odrqbk/jhrUtGAfh5l9odlS8JhLEREwpnvYyAz3sX
 yWqiOu3AUM3OhsTeLhxfNYNzLg2OzVdet5K57KPb0uA8te2d6yVO+MUKbq3A9EzqMo62ipPgtgC
 Srrd06bE7WejuLotFYijFbcoFbxhpCoAxXKOfaw4Xo3mhEhLzImsdQ+wYZvMz21B6dBjBuUvbox
 DNzUKiyJFIjWhkScuSmvLSorC1g7CoYq/kVvnw2oZenA0he7+pgKRsL95/Mfx+pkpwBbu6krw/S
 la5qKKt8pKzViV9z47kUcYFD2z4CoQ==
X-Authority-Analysis: v=2.4 cv=Sfj6t/Ru c=1 sm=1 tr=0 ts=69267635 cx=c_pps
 a=m5Vt/hrsBiPMCU0y4gIsQw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=VwQbUJbxAAAA:8 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=GrdrOO9Tebfov7ezxyYA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=IoOABgeZipijB_acs4fv:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: 9inG63K-sS_wyMHiZdu0-O3HYQhQzbSU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_02,2025-11-25_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 adultscore=0 malwarescore=0 suspectscore=0 clxscore=1015
 spamscore=0 impostorscore=0 phishscore=0 lowpriorityscore=0
 priorityscore=1501 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510240001
 definitions=main-2511260026
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



On 11/26/2025 10:50 AM, Yongxing Mou wrote:
> 
> 
> On 11/26/2025 8:36 AM, Dmitry Baryshkov wrote:
>> On Tue, Nov 25, 2025 at 04:22:12PM +0800, Yongxing Mou wrote:
>>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>>
>>> Interface type of MST interfaces is currently INTF_NONE. Update this to
>>> INTF_DP. And correct the intf_6 intr_underrun/intr_vsync index for
>>> dpu_8_4_sa8775p.
>>>
>>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>>> ---
>>> This patch was split out from the MST V3 patch series:
>>> https://lore.kernel.org/all/20250825-msm-dp-mst- 
>>> v3-0-01faacfcdedd@oss.qualcomm.com/
>>> ---
>>> Changes in v4:
>>> - Splite chagne out from the MST V3 series.
>>
>> Why?
>>
> i just want to spelieete
Sorry, please ignore this message and move to the other reply.>> - Link 
to v3: https://lore.kernel.org/
> all/20250825-msm-dp-mst-v3-37-01faacfcdedd@oss.qualcomm.com/
>>>
>>> Changes in v3:
>>> - Fix through the whole catalog
>>> - Link to v2: https://lore.kernel.org/all/20250609-msm-dp-mst-v2-37- 
>>> a54d8902a23d@quicinc.com/
>>>
>>> Changes in v2:
>>> - Change the patch order in the series.
>>> - Link to v1: https://lore.kernel.org/all/20241205-dp_mst-v1-3- 
>>> f8618d42a99a@quicinc.com/
>>> ---
>>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h |  6 +++---
>>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h  | 12 +++++ 
>>> +------
>>>   drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h |  6 +++---
>>>   3 files changed, 12 insertions(+), 12 deletions(-)
>>>
>>> @@ -363,15 +363,15 @@ static const struct dpu_intf_cfg sa8775p_intf[] 
>>> = {
>>>       }, {
>>>           .name = "intf_6", .id = INTF_6,
>>>           .base = 0x3A000, .len = 0x280,
>>> -        .type = INTF_NONE,
>>> +        .type = INTF_DP,
>>>           .controller_id = MSM_DP_CONTROLLER_0,    /* pair with 
>>> intf_0 for DP MST */
>>>           .prog_fetch_lines_worst_case = 24,
>>> -        .intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
>>> -        .intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
>>> +        .intr_underrun = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 16),
>>> +        .intr_vsync = DPU_IRQ_IDX(MDP_SSPP_TOP0_INTR, 17),
>>
>> This is a separate fix, it should be a separate patch.
>>
> 

