Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 957B38076AB
	for <lists+freedreno@lfdr.de>; Wed,  6 Dec 2023 18:34:44 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 726AF10E02C;
	Wed,  6 Dec 2023 17:34:43 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8E7A110E02C
 for <freedreno@lists.freedesktop.org>; Wed,  6 Dec 2023 17:34:41 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.17.1.19/8.17.1.19) with ESMTP id
 3B6EsTmc006371; Wed, 6 Dec 2023 17:34:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com;
 h=message-id : date :
 mime-version : subject : to : cc : references : from : in-reply-to :
 content-type : content-transfer-encoding; s=qcppdkim1;
 bh=NKLm4hV2IaNt7V7mzOmUZUkfJmKgp0w9Ka1GlyVSZW8=;
 b=j7qdqQJ1UkM99itod3DUCRMEddE+6T7vkaPSLY5RtV8HgnF6rDvksBPYhMh7lfLKI/59
 HNOfZyPfbDGbdpVnK274oISNNsEslMAVoFQn//z8frZIKu48w+I0IVx2j4GM+Eqr3Lij
 LxFoKdnN9d1LIzqTtrq8yfboSRywPQmFFBwS5NSicn6pwfgzSPo/8hwM0LCKXvQz1Qgi
 l/MTH36fdxQzYv6Rjp3KgKnQiIFAY2pLP9my0X9HYgGGX5sEn9AIGFCeGpGmHNBxpBd6
 xDaOiQaQlPenhabc4G0RQ6G61G681hHYm1m+Yo941MNtz/Tf0lGNuWW/nV7L5vQ+6B31 EQ== 
Received: from nalasppmta05.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3utrwq0vy9-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 06 Dec 2023 17:34:40 +0000
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com
 [10.47.209.196])
 by NALASPPMTA05.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 3B6HYdvC013404
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Wed, 6 Dec 2023 17:34:39 GMT
Received: from [10.110.76.210] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 6 Dec
 2023 09:34:39 -0800
Message-ID: <1b6e7c9f-9df5-2371-49c6-5d45808852cb@quicinc.com>
Date: Wed, 6 Dec 2023 09:34:30 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <1701734134-7816-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJprgES1tA1E=17Bnrz8n7mX1COpkx=w-vhWge4ywZ1E0ZQ@mail.gmail.com>
 <e5cc8bb5-f704-73fa-7801-8fc59c7fc4eb@quicinc.com>
 <CAA8EJpqHaTx0mCXetLn2cMUJcPPpV-FGTnTs1zLn9MUE0P5StA@mail.gmail.com>
 <488b7e77-cb5f-f0e5-fd4f-12535aa17470@quicinc.com>
 <6e447c1f-f7c5-48c1-9474-5362575b74d8@linaro.org>
Content-Language: en-US
From: Kuogee Hsieh <quic_khsieh@quicinc.com>
In-Reply-To: <6e447c1f-f7c5-48c1-9474-5362575b74d8@linaro.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: hZIZF8iirILUssN9QjNMDGQf08Kp0KBG
X-Proofpoint-GUID: hZIZF8iirILUssN9QjNMDGQf08Kp0KBG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.997,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2023-12-06_16,2023-12-06_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 impostorscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 mlxlogscore=999 malwarescore=0
 suspectscore=0 mlxscore=0 priorityscore=1501 clxscore=1015 phishscore=0
 classifier=spam adjust=0 reason=mlx scancount=1 engine=8.12.0-2311290000
 definitions=main-2312060140
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dpu: improve DSC allocation
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
Cc: freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>


On 12/6/2023 1:35 AM, Dmitry Baryshkov wrote:
> On 05/12/2023 22:51, Kuogee Hsieh wrote:
>>
>> On 12/5/2023 11:23 AM, Dmitry Baryshkov wrote:
>>> On Tue, 5 Dec 2023 at 20:12, Kuogee Hsieh <quic_khsieh@quicinc.com> 
>>> wrote:
>>>>
>>>> On 12/4/2023 4:23 PM, Dmitry Baryshkov wrote:
>>>>> On Tue, 5 Dec 2023 at 01:55, Kuogee Hsieh 
>>>>> <quic_khsieh@quicinc.com> wrote:
>>>>>> A DCE (Display Compression Engine) contains two DSC hard slice
>>>>>> encoders. Each DCE start with even DSC encoder index followed by
>>>>>> an odd DSC encoder index. Each encoder can work independently.
>>>>>> But Only two DSC encoders from same DCE can be paired to work
>>>>>> together to support merge mode. In addition, the DSC with even
>>>>>> index have to mapping to even pingpong index and DSC with odd
>>>>>> index have to mapping to odd pingpong index at its data path.
>>>>>> This patch improve DSC allocation mechanism with consideration
>>>>>> of above factors.
>>>>>>
>>>>>> Changes in V2:
>>>>>> -- split _dpu_rm_reserve_dsc() into _dpu_rm_reserve_dsc_single() and
>>>>>>      _dpu_rm_reserve_dsc_pair()
>>>>> Please don't send the new iteration of the patch if the discussion 
>>>>> is ongoing.
>>>> Got it, thanks.
>>>>> Quoting v1 review:
>>>>>
>>>>> Are the limitations (odd:odd, allocation in pairs, etc) applicable to
>>>>> v1.1 encoders?
>>>>>
>>>>> I assume that at least 'allocate two consecutive DSC for DSC 
>>>>> merge' is
>>>>> not applicable, since there are no separate DCE units.
>>>> yes, you are correct in the hardware point of view.
>>>>
>>>> However, at software, we can think think of dsc index 0 and 1 are 
>>>> bound
>>>> to DCE #1, index 2 and 3 are bound to DCE #2 and etc in regardless of
>>>> v1.1 or v1.2.
>>>>
>>>> By doing that,this dsc allocation algorithm should be able to apply to
>>>> both.
>>>>
>>>> There is no case to have dsc index 1 and dsc index 2 bind together 
>>>> (skip
>>>> dsc index 0) to support merge mode.
>>> Yes. However this might cause issues on the platforms which have DSI,
>>> DP and just two DSC encoders. Consider RM allocating two odd (or two
>>> even) PP blocks. One for DSI, one for DP. Then if we need DSC on both
>>> interfaces, the RM won't be able to allocate it.
>>
>>
>> I am not sure this case is possible.
>>
>> DSC + pingpong  allocation is base on Layer mixer which is allocated 
>> sequentially.
>
> Not sequentially, but also in pairs. Yes, LM_5 (a pair for LM_2 on 
> sdm845) is connected to PINGPONG_3. However all this doesn't make 
> things easier to understand or to snoop bugs. I'd prefer to keep a 
> simple allocation code for older DSC blocks. Especially since I might 
> have to touch LM allocation for MDP 1.x platforms.

1) from dpu_rm_reserve() --> _dpu_rm_make_reservation() -->  
_dpu_rm_reserve_dsc() path, there is no any flag can be used to identify 
is this allocation is for dsc V1.1 or V1.2

2) your earlier question -- Are the limitations (odd:odd, allocation in 
pairs, etc) applicable to v1.1 encoders? <== the answer is true, my 
apology to have not confirmed this earlier.

I try to said is the checking pp-index and dsc-index (odd:odd, 
even:even) at new implementation is to correct original (v1.1) mistake.

>
>> ex, first lm --> pingpong --> dsc allocate completed then followed by 
>> next lm --> pingpong --> dsc allocation.
>>
>> therefore it is not possible to have case with two odd pingpong index 
>> to map two odd dsc index.
>>
>> With this algorithm, there is one case (below) which can not be 
>> supported is,
>>
>> dsc_0 for pingpong-0 of stand alone mode + dsc-1 and dsc-2 for 
>> pingpong-1 and ping pong-2 to support merge mode for DSC v1.1.
>>
>> However  there is no hardware configuration which only have 3 or 5 
>> dsc encoders due to dsc always come in pair except some low end chip 
>> which mdp come with only one dsc encoder.
>>
>>
>>
>>
>>>
>>>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>>>> ---
>>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 171 
>>>>>> ++++++++++++++++++++++++++++++---
>>>>>>    1 file changed, 156 insertions(+), 15 deletions(-)
>>>>>>
>>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c 
>>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>>>> index 17ecf23..dafe1ee 100644
>>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>>>> @@ -470,33 +470,174 @@ static int _dpu_rm_reserve_ctls(
>>>>>>           return 0;
>>>>>>    }
>>>>>>
>>>>>> -static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
>>>>>> +static int _dpu_rm_reserve_dsc_single(struct dpu_rm *rm,
>>>>>>                                  struct dpu_global_state 
>>>>>> *global_state,
>>>>>> -                              struct drm_encoder *enc,
>>>>>> +                              uint32_t enc_id,
>>>>>>                                  const struct 
>>>>>> msm_display_topology *top)
>>>>>>    {
>>>>>> -       int num_dsc = top->num_dsc;
>>>>>> -       int i;
>>>>>> +       int num_dsc = 0;
>>>>>> +       int i, pp_idx;
>>>>>> +       int dsc_idx[DSC_MAX - DSC_0];
>>>>>> +       uint32_t pp_to_enc_id[PINGPONG_MAX - PINGPONG_0];
>
> You don't need pp_to_enc_id copy in the _single usecase. Just use the 
> exisiting rm data.
>
>>>>>> +       int pp_max = PINGPONG_MAX - PINGPONG_0;
>
> inline
>
>>>>>> +
>>>>>> +       for (i = 0; i < DSC_MAX - DSC_0; i++)
>>>>>> +               dsc_idx[i] = 0;
>
> You know, this is called memset.
>
>>>>>> +
>>>>>> +       /* fill working copy with pingpong list */
>>>>>> +       memcpy(pp_to_enc_id, global_state->pingpong_to_enc_id, 
>>>>>> sizeof(pp_to_enc_id));
>>>>>> +
>>>>>> +       for (i = 0; i < ARRAY_SIZE(rm->dsc_blks) && num_dsc >= 
>>>>>> top->num_dsc; i++) {
>>>>>> +               if (!rm->dsc_blks[i])
>>>>>> +                       continue;
>>>>>>
>>>>>> -       /* check if DSC required are allocated or not */
>>>>>> -       for (i = 0; i < num_dsc; i++) {
>>>>>> -               if (!rm->dsc_blks[i]) {
>>>>>> -                       DPU_ERROR("DSC %d does not exist\n", i);
>>>>>> -                       return -EIO;
>>>>>> +               if (global_state->dsc_to_enc_id[i])     /* used */
>>>>>> +                       continue;
>>>>>> +
>>>>>> +               /*
>>>>>> +                * find the pingpong index which had been reserved
>>>>>> +                * previously at layer mixer allocation
>>>>>> +                */
>>>>>> +               for (pp_idx = 0; pp_idx < pp_max; pp_idx++) {
>>>>>> +                       if (pp_to_enc_id[pp_idx] == enc_id)
>
> !reserved_by_other()
>
>>>>>> + break;
>>>>>>                   }
>>>>>>
>>>>>> -               if (global_state->dsc_to_enc_id[i]) {
>>>>>> -                       DPU_ERROR("DSC %d is already 
>>>>>> allocated\n", i);
>>>>>> -                       return -EIO;
>>>>>> +               /*
>>>>>> +                * dsc even index must map to pingpong even index
>>>>>> +                * dsc odd index must map to pingpong odd index
>>>>>> +                */
>>>>>> +               if ((i & 0x01) != (pp_idx & 0x01))
>>>>>> +                       continue;
>>>>>> +
>>>>>> +               dsc_idx[num_dsc++] = i + 1;     /* found, start 
>>>>>> from 1 */
>
> It's not +1. It is DSC_0 + i.
>
>>>>>> +       }
>>>>>> +
>>>>>> +       if (num_dsc < top->num_dsc) {
>>>>>> +               DPU_ERROR("DSC allocation failed num_dsc=%d 
>>>>>> required=%d\n",
>>>>>> +                                               num_dsc, 
>>>>>> top->num_dsc);
>>>>>> +               return -ENAVAIL;
>>>>>> +       }
>>>>>> +
>>>>>> +       /* reserve dsc */
>>>>>> +       for (i = 0; i < top->num_dsc; i++) {
>>>>>> +               int j;
>>>>>> +
>>>>>> +               j = dsc_idx[i];
>>>>>> +               if (j)
>>>>>> + global_state->dsc_to_enc_id[j-1] = enc_id;
>>>>>> +       }
>>>>>> +
>>>>>> +       return 0;
>>>>>> +}
>>>>>> +
>>>>>> +static int _dpu_rm_reserve_dsc_pair(struct dpu_rm *rm,
>>>>>> +                              struct dpu_global_state 
>>>>>> *global_state,
>>>>>> +                              uint32_t enc_id,
>>>>>> +                              const struct msm_display_topology 
>>>>>> *top)
>
>
>>>>>> +{
>>>>>> +       int num_dsc = 0;
>>>>>> +       int i, pp_idx;
>>>>>> +       int dsc_idx[DSC_MAX - DSC_0];
>>>>>> +       uint32_t pp_to_enc_id[PINGPONG_MAX - PINGPONG_0];
>>>>>> +       int pp_max = PINGPONG_MAX - PINGPONG_0;
>>>>>> +
>>>>>> +       for (i = 0; i < DSC_MAX - DSC_0; i++)
>>>>>> +               dsc_idx[i] = 0;
>>>>>> +
>>>>>> +       /* fill working copy with pingpong list */
>>>>>> +       memcpy(pp_to_enc_id, global_state->pingpong_to_enc_id, 
>>>>>> sizeof(pp_to_enc_id));
>>>>>> +
>>>>>> +       for (i = 0; i < ARRAY_SIZE(rm->dsc_blks) && num_dsc >= 
>>>>>> top->num_dsc; i++) {
>
> Much easier. Just do i+= 2 here and in the loop check that the second 
> half of DCE is not used.
>
>>>>>> +               if (!rm->dsc_blks[i])
>>>>>> +                       continue;
>>>>>> +
>>>>>> +               if (global_state->dsc_to_enc_id[i]) {   /* used */
>>>>>> +                       /* consective dsc index to be paired */
>>>>>> +                       if (num_dsc) {  /* already start pairing, 
>>>>>> re start search */
>>>>>> +                               num_dsc = 0;
>>>>>> +                               /* fill working copy with 
>>>>>> pingpong list */
>>>>>> +                               memcpy(pp_to_enc_id, 
>>>>>> global_state->pingpong_to_enc_id,
>>>>>> + sizeof(pp_to_enc_id));
>>>>>> +                       }
>>>>>> +                       continue;
>>>>>> +               }
>>>>>> +
>>>>>> +               /* odd index can not become start of pairing */
>>>>>> +               if (i & 0x01 && !num_dsc)
>>>>>> +                       continue;
>>>>>> +
>>>>>> +               /*
>>>>>> +                * find the pingpong index which had been reserved
>>>>>> +                * previously at layer mixer allocation
>>>>>> +                */
>>>>>> +               for (pp_idx = 0; pp_idx < pp_max; pp_idx++) {
>>>>>> +                       if (pp_to_enc_id[pp_idx] == enc_id)
>>>>>> +                               break;
>>>>>>                   }
>>>>>> +
>>>>>> +               /*
>>>>>> +                * dsc even index must map to pingpong even index
>>>>>> +                * dsc odd index must map to pingpong odd index
>>>>>> +                */
>>>>>> +               if ((i & 0x01) != (pp_idx & 0x01))
>>>>>> +                       continue;
>>>>>> +
>>>>>> +               /*
>>>>>> +                * delete pp_idx so that next pp_idx can be 
>>>>>> paired with
>>>>>> +                * next dsc_idx
>>>>>> +                */
>>>>>> +               pp_to_enc_id[pp_idx] = 0xffff;
>>>>>> +
>>>>>> +               dsc_idx[num_dsc++] = i + 1;     /* found, start 
>>>>>> from 1 */
>>>>>>           }
>>>>>>
>>>>>> -       for (i = 0; i < num_dsc; i++)
>>>>>> -               global_state->dsc_to_enc_id[i] = enc->base.id;
>>>>>> +       if (num_dsc < top->num_dsc) {
>>>>>> +               DPU_ERROR("DSC allocation failed num_dsc=%d 
>>>>>> required=%d\n",
>>>>>> +                                               num_dsc, 
>>>>>> top->num_dsc);
>>>>>> +               return -ENAVAIL;
>>>>>> +       }
>>>>>> +
>>>>>> +       /* reserve dsc */
>>>>>> +       for (i = 0; i < top->num_dsc; i++) {
>>>>>> +               int j;
>>>>>> +
>>>>>> +               j = dsc_idx[i];
>>>>>> +               if (j)
>>>>>> + global_state->dsc_to_enc_id[j-1] = enc_id;
>>>>>> +       }
>>>>>>
>>>>>>           return 0;
>>>>>>    }
>>>>>>
>>>>>> +static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
>>>>>> +                              struct dpu_global_state 
>>>>>> *global_state,
>>>>>> +                              uint32_t enc_id,
>>>>>> +                              const struct msm_display_topology 
>>>>>> *top)
>>>>>> +{
>>>>>> +       if (!top->num_dsc || !top->num_intf)
>>>>>> +               return 0;
>>>>>> +
>>>>>> +       /*
>>>>>> +        * Truth:
>>>>>> +        * 1) every layer mixer only connects to one pingpong
>>>>>> +        * 2) no pingpong split -- which is two layer mixers 
>>>>>> shared one pingpong
>>>>>> +        * 3) each DSC engine contains two dsc encoders
>>>>>> +        *    -- index(0,1), index (2,3),... etc
>>>>> Does this apply to v1.1 encoders?
>>>>>
>>>>>> +        * 4) dsc pair can only happens with same DSC engine
>>>>>> +        * 5) odd pingpong connect to odd dsc
>>>>>> +        * 6) even pingpong connect to even dsc
>>>>>> +        * 7) pair: encoder +--> pp_idx_0 --> dsc_idx_0
>>>>>> +                           +--> pp_idx_1 --> dsc_idx_1
>>>>>> +        */
>>>>>> +
>>>>>> +       /* num_dsc should be either 1, 2 or 4 */
>>>>>> +       if (top->num_dsc > top->num_intf) /* merge mode */
>>>>>> +               return _dpu_rm_reserve_dsc_pair(rm, global_state, 
>>>>>> enc_id, top);
>>>>>> +       else
>>>>>> +               return _dpu_rm_reserve_dsc_single(rm, 
>>>>>> global_state, enc_id, top);
>
> Can we end up with num_dsc = 2, num_intf = 2 and 
> _dpu_rm_reserve_dsc_single() allocating two DSC blocks despite its name?
>
>>>>>> +}
>>>>>> +
>>>>>>    static int _dpu_rm_make_reservation(
>>>>>>                   struct dpu_rm *rm,
>>>>>>                   struct dpu_global_state *global_state,
>>>>>> @@ -518,7 +659,7 @@ static int _dpu_rm_make_reservation(
>>>>>>                   return ret;
>>>>>>           }
>>>>>>
>>>>>> -       ret  = _dpu_rm_reserve_dsc(rm, global_state, enc, 
>>>>>> &reqs->topology);
>>>>>> +       ret  = _dpu_rm_reserve_dsc(rm, global_state, 
>>>>>> enc->base.id, &reqs->topology);
>
> Is there any reason to change this?
>
>>>>>>           if (ret)
>>>>>>                   return ret;
>>>>>>
>>>>>> -- 
>>>>>> 2.7.4
>>>>>>
>>>
>>>
>
