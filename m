Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46D7596C8D9
	for <lists+freedreno@lfdr.de>; Wed,  4 Sep 2024 22:47:19 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D4EE10E056;
	Wed,  4 Sep 2024 20:47:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="IuSAb50B";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A453F10E056
 for <freedreno@lists.freedesktop.org>; Wed,  4 Sep 2024 20:47:15 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 484G0n9V020031
 for <freedreno@lists.freedesktop.org>; Wed, 4 Sep 2024 20:47:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 dYLo7lXNUv9yHinHhuBhhoNhTOrD9atSQu3uAEcwRbE=; b=IuSAb50BoTIkE4fG
 A/V+4qkIHxhAKnNeFO/pNsClaZc25+OqhqmymXwScpTaIavgDASpBFdyQBeIz7ze
 r7g1hZeeEOpVDRu5CcrFbfyVBo8zTIWxYIo85Lk9rCduUFBkPLaf76f5BCaEaic3
 zB9qTiJhlJUp7R/hkZuT8JIalxTkcD/EapNeh6h9jSKzHCqI6wslP+hc824o4bTV
 LF5lNn74VIjwcjpmBoLg0cJflEk5tFia0LCJ7UZpVoS3Xm33vhjksuwnfBBUPd5r
 d4EDsJwbp4vxQN9ISEEhz4XBaukeWPAtUCUmykfDaAUmCt5rQlI32OJNcBa21lNm
 iBfCnw==
Received: from nasanppmta02.qualcomm.com (i-global254.qualcomm.com
 [199.106.103.254])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41dxy25cca-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 04 Sep 2024 20:47:14 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com
 [10.46.141.250])
 by NASANPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 484KlEsA008852
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 4 Sep 2024 20:47:14 GMT
Received: from [10.134.70.212] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Sep 2024
 13:47:13 -0700
Message-ID: <d0345697-a8fe-4517-970d-2dcb658cc4d0@quicinc.com>
Date: Wed, 4 Sep 2024 13:47:13 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 07/21] drm/msm/dpu: Check CRTC encoders are valid clones
To: <freedreno@lists.freedesktop.org>
References: <20240829-concurrent-wb-v1-0-502b16ae2ebb@quicinc.com>
 <20240829-concurrent-wb-v1-7-502b16ae2ebb@quicinc.com>
 <uqtlpynjdszqyyikj64uxwuqnk3lmzma7kd2vwxipnj4fg2eje@7toj5kww7vk7>
 <9f95704d-0699-4b11-b8cb-40f1a57eeebd@quicinc.com>
 <CAA8EJpqM0QBxLFCx22UuVmYAE258im_Up2-3fu6qez1GrOhOQg@mail.gmail.com>
 <ZtizlTxH-7EBhiSd@intel.com>
Content-Language: en-US
From: Jessica Zhang <quic_jesszhan@quicinc.com>
In-Reply-To: <ZtizlTxH-7EBhiSd@intel.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-GUID: n82urun1bJAabqqZZrurW6JwVx69xyYW
X-Proofpoint-ORIG-GUID: n82urun1bJAabqqZZrurW6JwVx69xyYW
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-04_18,2024-09-04_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0
 impostorscore=0 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0
 lowpriorityscore=0 mlxlogscore=999 spamscore=0 clxscore=1015
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2409040157
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



On 9/4/2024 12:23 PM, Ville Syrjälä wrote:
> On Wed, Sep 04, 2024 at 09:41:23PM +0300, Dmitry Baryshkov wrote:
>> On Wed, 4 Sept 2024 at 01:18, Jessica Zhang <quic_jesszhan@quicinc.com> wrote:
>>>
>>>
>>>
>>> On 8/30/2024 10:00 AM, Dmitry Baryshkov wrote:
>>>> On Thu, Aug 29, 2024 at 01:48:28PM GMT, Jessica Zhang wrote:
>>>>> Check that each encoder in the CRTC state's encoder_mask is marked as a
>>>>> possible clone for all other encoders in the encoder_mask and that only
>>>>> one CRTC is in clone mode at a time
>>>>>
>>>>> Signed-off-by: Jessica Zhang <quic_jesszhan@quicinc.com>
>>>>> ---
>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 36 +++++++++++++++++++++++++++++++-
>>>>>    1 file changed, 35 insertions(+), 1 deletion(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>>> index 5ec1b5a38922..bebae365c036 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>>>>> @@ -1,6 +1,6 @@
>>>>>    // SPDX-License-Identifier: GPL-2.0-only
>>>>>    /*
>>>>> - * Copyright (c) 2022-2023 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>> + * Copyright (c) 2022-2024 Qualcomm Innovation Center, Inc. All rights reserved.
>>>>>     * Copyright (c) 2014-2021 The Linux Foundation. All rights reserved.
>>>>>     * Copyright (C) 2013 Red Hat
>>>>>     * Author: Rob Clark <robdclark@gmail.com>
>>>>> @@ -1204,6 +1204,36 @@ static struct msm_display_topology dpu_crtc_get_topology(
>>>>>       return topology;
>>>>>    }
>>>>>
>>>>> +static bool dpu_crtc_has_valid_clones(struct drm_crtc *crtc,
>>>>> +            struct drm_crtc_state *crtc_state)
>>>>> +{
>>>>> +    struct drm_encoder *drm_enc;
>>>>> +    struct drm_crtc *temp_crtc;
>>>>> +    int num_cwb_sessions = 0;
>>>>> +
>>>>> +    drm_for_each_crtc(temp_crtc, crtc->dev)
>>>>> +            if (drm_crtc_in_clone_mode(temp_crtc->state))
>>>>
>>>> No, get the state from drm_atomic_state. temp_crtc->state might be
>>>> irrelevant.
>>>
>>> Hi Dmitry,
>>>
>>> Ack.
>>>
>>>>
>>>>> +                    num_cwb_sessions++;
>>>>
>>>> Even simpler:
>>>> if (temp_crtc != crtc && drm_crtc_in_clone_mode(...))
>>>>        return false;
>>>
>>> Ack.
>>>
>>>>
>>>>> +
>>>>> +    /*
>>>>> +     * Only support a single concurrent writeback session running
>>>>> +     * at a time
>>>>
>>>> If it is not a hardware limitation, please add:
>>>> FIXME: support more than one session
>>>
>>> This is a hardware limitation.
>>>
>>>>
>>>>> +     */
>>>>> +    if (num_cwb_sessions > 1)
>>>>> +            return false;
>>>>> +
>>>>> +    drm_for_each_encoder_mask(drm_enc, crtc->dev, crtc_state->encoder_mask) {
>>>>> +            if ((crtc_state->encoder_mask & drm_enc->possible_clones) !=
>>>>> +                            crtc_state->encoder_mask) {
>>>>
>>>> Align to opening bracket, please. Granted that other drivers don't
>>>> perform this check, is it really necessary? Doesn't
>>>> validate_encoder_possible_clones() ensure the same, but during the
>>>> encoder registration?
>>>
>>> The difference here is that validate_encoder_possible_clones() is only
>>> called when the drm device is initially registered.
>>>
>>> The check here is to make sure that the encoders userspace is proposing
>>> to be cloned are actually possible clones of each other. This might not
>>> be necessary for drivers where all encoders are all possible clones of
>>> each other. But for MSM (and CWB), real-time display encoders can only
>>> be clones of writeback (and vice versa).
>>
>> I had the feeling that encoder_mask should already take care of that,
>> but it seems I was wrong.
>> Please extract this piece as a generic helper. I think it should be
>> called from the generic atomic_check() codepath.
> 
> Yeah, if we are semi-assured that drivers aren't screwing up those
> bitmasks anymore we could shove the cloning checks into
> drm_atomic_helper_check_modeset(). It already checks possible_crtcs.
> We could then throw out the equavalent code from i915 as well...

Hi Ville and Dmitry,

Sure, I can move this part of the check to *_atomic_check_modeset() -- 
I'll add it here [1] since it's after the encoder mask is updated.

[1] 
https://elixir.bootlin.com/linux/v6.10.7/source/drivers/gpu/drm/drm_atomic_helper.c#L731

> 
> Are there decent IGTs to make sure the kernel properly rejects
> illegal cloning configurations?

There's a few invalid clone subtests in kms_setmode [2]

Thanks,

Jessica Zhang

[2] 
https://gitlab.freedesktop.org/drm/igt-gpu-tools/-/blob/master/tests/kms_setmode.c#L63

> 
> -- 
> Ville Syrjälä
> Intel
