Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 24B27806AC9
	for <lists+freedreno@lfdr.de>; Wed,  6 Dec 2023 10:36:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2180F10E6B0;
	Wed,  6 Dec 2023 09:36:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x242.google.com (mail-lj1-x242.google.com
 [IPv6:2a00:1450:4864:20::242])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8B9CE10E6A1
 for <freedreno@lists.freedesktop.org>; Wed,  6 Dec 2023 09:35:57 +0000 (UTC)
Received: by mail-lj1-x242.google.com with SMTP id
 38308e7fff4ca-2c9ef682264so54467801fa.3
 for <freedreno@lists.freedesktop.org>; Wed, 06 Dec 2023 01:35:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701855356; x=1702460156; darn=lists.freedesktop.org;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=P1uTIL0GRLZOB0FT93dwCYy7xZaAhICWjtwuEg4wrk0=;
 b=Bz/0UoNQhNGKW1qYW0ZmeBY79mnHQqHm2ysjZX2EDIOPFOo6ARdE0KIXXy/h1lzywF
 3jpWnjmAAgdYk7JkXX0mVPaHBmmvY+97uaJkdygoO263Z383wXFxCFVYXLybrCh1Gmez
 LMwooBULKYQ3RAgWOkTWnniZJFfM3xt0bjmaV2r1hoM0FwS7n1zpl7I7/kxHtTcEoNq3
 LXpSYtJrF10gJQOzJ8rLwQJWeEoBFZvOstBKSsHWeG7YOVJEU3hvfXUEe08VsS0Oyx/V
 Od81xX0qxGOSqd46DzCF8jU6hLOU3Iri04UDNGNW3/4yYT3+N6oQpa6WAbgzt4ILHqyz
 x9aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701855356; x=1702460156;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to
 :content-language:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=P1uTIL0GRLZOB0FT93dwCYy7xZaAhICWjtwuEg4wrk0=;
 b=skDBCWlzG5c5ExHLANEo9losVSomTnRNg54s3yTeQS3eY2CewpLGRzWAJ+TmsoMhGc
 wWPypV+CQTYIuM40rOOrI5c9vHwwAmKOYbh5QGXFU5nD8R7igGtQBu557CcfDwyun2H/
 AOcFmX4FzSmVad8w095k3Qj7TRaXvj2EF6DdfCv6eFeCpG7sp7MDTHgihTfSfQlWqa9f
 gf/XsP1Mze7wY4Pngs7ZEC6KUJM0bJkw3J87Zmn6FInUZaFEH0lwzjVsl7FEY8UhQWdR
 wEGag+1faP5DWOTlGZBQLnUhly4EbdC8RACYyv5089N0W8PrIK6CtJIGuNfWF9POTW1h
 F89A==
X-Gm-Message-State: AOJu0Yy+8CL76XnPsqR2thLW2K5VjfIe0wmMce1EPtj3DJprkMubj2WT
 ZxFcgrBwLV1DbapBNv9jh0TrcTjNDuOID+iSj/YOmNzGWS8=
X-Google-Smtp-Source: AGHT+IE93z0bHFvlbASrANDdEKiRPHexw3XOfptNyD3X6/AgD2g/s58fROSC3Y9Si3pVByFGq4Dyeg==
X-Received: by 2002:a2e:300b:0:b0:2c9:f9ef:d03 with SMTP id
 w11-20020a2e300b000000b002c9f9ef0d03mr324369ljw.82.1701855355594; 
 Wed, 06 Dec 2023 01:35:55 -0800 (PST)
Received: from ?IPV6:2001:14ba:a0db:1f00::227?
 (dzdqv0yyyyyyyyyyyykxt-3.rev.dnainternet.fi. [2001:14ba:a0db:1f00::227])
 by smtp.gmail.com with ESMTPSA id
 w20-20020a05651c119400b002c9f817765asm1203026ljo.61.2023.12.06.01.35.55
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 06 Dec 2023 01:35:55 -0800 (PST)
Message-ID: <6e447c1f-f7c5-48c1-9474-5362575b74d8@linaro.org>
Date: Wed, 6 Dec 2023 11:35:54 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-GB
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
References: <1701734134-7816-1-git-send-email-quic_khsieh@quicinc.com>
 <CAA8EJprgES1tA1E=17Bnrz8n7mX1COpkx=w-vhWge4ywZ1E0ZQ@mail.gmail.com>
 <e5cc8bb5-f704-73fa-7801-8fc59c7fc4eb@quicinc.com>
 <CAA8EJpqHaTx0mCXetLn2cMUJcPPpV-FGTnTs1zLn9MUE0P5StA@mail.gmail.com>
 <488b7e77-cb5f-f0e5-fd4f-12535aa17470@quicinc.com>
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <488b7e77-cb5f-f0e5-fd4f-12535aa17470@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 05/12/2023 22:51, Kuogee Hsieh wrote:
> 
> On 12/5/2023 11:23 AM, Dmitry Baryshkov wrote:
>> On Tue, 5 Dec 2023 at 20:12, Kuogee Hsieh <quic_khsieh@quicinc.com> 
>> wrote:
>>>
>>> On 12/4/2023 4:23 PM, Dmitry Baryshkov wrote:
>>>> On Tue, 5 Dec 2023 at 01:55, Kuogee Hsieh <quic_khsieh@quicinc.com> 
>>>> wrote:
>>>>> A DCE (Display Compression Engine) contains two DSC hard slice
>>>>> encoders. Each DCE start with even DSC encoder index followed by
>>>>> an odd DSC encoder index. Each encoder can work independently.
>>>>> But Only two DSC encoders from same DCE can be paired to work
>>>>> together to support merge mode. In addition, the DSC with even
>>>>> index have to mapping to even pingpong index and DSC with odd
>>>>> index have to mapping to odd pingpong index at its data path.
>>>>> This patch improve DSC allocation mechanism with consideration
>>>>> of above factors.
>>>>>
>>>>> Changes in V2:
>>>>> -- split _dpu_rm_reserve_dsc() into _dpu_rm_reserve_dsc_single() and
>>>>>      _dpu_rm_reserve_dsc_pair()
>>>> Please don't send the new iteration of the patch if the discussion 
>>>> is ongoing.
>>> Got it, thanks.
>>>> Quoting v1 review:
>>>>
>>>> Are the limitations (odd:odd, allocation in pairs, etc) applicable to
>>>> v1.1 encoders?
>>>>
>>>> I assume that at least 'allocate two consecutive DSC for DSC merge' is
>>>> not applicable, since there are no separate DCE units.
>>> yes, you are correct in the hardware point of view.
>>>
>>> However, at software, we can think think of dsc index 0 and 1 are bound
>>> to DCE #1, index 2 and 3 are bound to DCE #2 and etc in regardless of
>>> v1.1 or v1.2.
>>>
>>> By doing that,this dsc allocation algorithm should be able to apply to
>>> both.
>>>
>>> There is no case to have dsc index 1 and dsc index 2 bind together (skip
>>> dsc index 0) to support merge mode.
>> Yes. However this might cause issues on the platforms which have DSI,
>> DP and just two DSC encoders. Consider RM allocating two odd (or two
>> even) PP blocks. One for DSI, one for DP. Then if we need DSC on both
>> interfaces, the RM won't be able to allocate it.
> 
> 
> I am not sure this case is possible.
> 
> DSC + pingpong  allocation is base on Layer mixer which is allocated 
> sequentially.

Not sequentially, but also in pairs. Yes, LM_5 (a pair for LM_2 on 
sdm845) is connected to PINGPONG_3. However all this doesn't make things 
easier to understand or to snoop bugs. I'd prefer to keep a simple 
allocation code for older DSC blocks. Especially since I might have to 
touch LM allocation for MDP 1.x platforms.

> ex, first lm --> pingpong --> dsc  allocate completed then followed by 
> next lm --> pingpong --> dsc allocation.
> 
> therefore it is not possible to have case with two odd pingpong index to 
> map two odd dsc index.
> 
> With this algorithm, there is one case (below) which can not be 
> supported is,
> 
> dsc_0 for pingpong-0 of stand alone mode + dsc-1 and dsc-2 for 
> pingpong-1 and ping pong-2 to support merge mode for DSC v1.1.
> 
> However  there is no hardware configuration which only have 3 or 5 dsc 
> encoders due to dsc always come in pair except some low end chip which 
> mdp come with only one dsc encoder.
> 
> 
> 
> 
>>
>>>>> Signed-off-by: Kuogee Hsieh <quic_khsieh@quicinc.com>
>>>>> ---
>>>>>    drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c | 171 
>>>>> ++++++++++++++++++++++++++++++---
>>>>>    1 file changed, 156 insertions(+), 15 deletions(-)
>>>>>
>>>>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c 
>>>>> b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>>> index 17ecf23..dafe1ee 100644
>>>>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c
>>>>> @@ -470,33 +470,174 @@ static int _dpu_rm_reserve_ctls(
>>>>>           return 0;
>>>>>    }
>>>>>
>>>>> -static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
>>>>> +static int _dpu_rm_reserve_dsc_single(struct dpu_rm *rm,
>>>>>                                  struct dpu_global_state 
>>>>> *global_state,
>>>>> -                              struct drm_encoder *enc,
>>>>> +                              uint32_t enc_id,
>>>>>                                  const struct msm_display_topology 
>>>>> *top)
>>>>>    {
>>>>> -       int num_dsc = top->num_dsc;
>>>>> -       int i;
>>>>> +       int num_dsc = 0;
>>>>> +       int i, pp_idx;
>>>>> +       int dsc_idx[DSC_MAX - DSC_0];
>>>>> +       uint32_t pp_to_enc_id[PINGPONG_MAX - PINGPONG_0];

You don't need pp_to_enc_id copy in the _single usecase. Just use the 
exisiting rm data.

>>>>> +       int pp_max = PINGPONG_MAX - PINGPONG_0;

inline

>>>>> +
>>>>> +       for (i = 0; i < DSC_MAX - DSC_0; i++)
>>>>> +               dsc_idx[i] = 0;

You know, this is called memset.

>>>>> +
>>>>> +       /* fill working copy with pingpong list */
>>>>> +       memcpy(pp_to_enc_id, global_state->pingpong_to_enc_id, 
>>>>> sizeof(pp_to_enc_id));
>>>>> +
>>>>> +       for (i = 0; i < ARRAY_SIZE(rm->dsc_blks) && num_dsc >= 
>>>>> top->num_dsc; i++) {
>>>>> +               if (!rm->dsc_blks[i])
>>>>> +                       continue;
>>>>>
>>>>> -       /* check if DSC required are allocated or not */
>>>>> -       for (i = 0; i < num_dsc; i++) {
>>>>> -               if (!rm->dsc_blks[i]) {
>>>>> -                       DPU_ERROR("DSC %d does not exist\n", i);
>>>>> -                       return -EIO;
>>>>> +               if (global_state->dsc_to_enc_id[i])     /* used */
>>>>> +                       continue;
>>>>> +
>>>>> +               /*
>>>>> +                * find the pingpong index which had been reserved
>>>>> +                * previously at layer mixer allocation
>>>>> +                */
>>>>> +               for (pp_idx = 0; pp_idx < pp_max; pp_idx++) {
>>>>> +                       if (pp_to_enc_id[pp_idx] == enc_id)

!reserved_by_other()

>>>>> +                               break;
>>>>>                   }
>>>>>
>>>>> -               if (global_state->dsc_to_enc_id[i]) {
>>>>> -                       DPU_ERROR("DSC %d is already allocated\n", i);
>>>>> -                       return -EIO;
>>>>> +               /*
>>>>> +                * dsc even index must map to pingpong even index
>>>>> +                * dsc odd index must map to pingpong odd index
>>>>> +                */
>>>>> +               if ((i & 0x01) != (pp_idx & 0x01))
>>>>> +                       continue;
>>>>> +
>>>>> +               dsc_idx[num_dsc++] = i + 1;     /* found, start 
>>>>> from 1 */

It's not +1. It is DSC_0 + i.

>>>>> +       }
>>>>> +
>>>>> +       if (num_dsc < top->num_dsc) {
>>>>> +               DPU_ERROR("DSC allocation failed num_dsc=%d 
>>>>> required=%d\n",
>>>>> +                                               num_dsc, 
>>>>> top->num_dsc);
>>>>> +               return -ENAVAIL;
>>>>> +       }
>>>>> +
>>>>> +       /* reserve dsc */
>>>>> +       for (i = 0; i < top->num_dsc; i++) {
>>>>> +               int j;
>>>>> +
>>>>> +               j = dsc_idx[i];
>>>>> +               if (j)
>>>>> +                       global_state->dsc_to_enc_id[j-1] = enc_id;
>>>>> +       }
>>>>> +
>>>>> +       return 0;
>>>>> +}
>>>>> +
>>>>> +static int _dpu_rm_reserve_dsc_pair(struct dpu_rm *rm,
>>>>> +                              struct dpu_global_state *global_state,
>>>>> +                              uint32_t enc_id,
>>>>> +                              const struct msm_display_topology *top)


>>>>> +{
>>>>> +       int num_dsc = 0;
>>>>> +       int i, pp_idx;
>>>>> +       int dsc_idx[DSC_MAX - DSC_0];
>>>>> +       uint32_t pp_to_enc_id[PINGPONG_MAX - PINGPONG_0];
>>>>> +       int pp_max = PINGPONG_MAX - PINGPONG_0;
>>>>> +
>>>>> +       for (i = 0; i < DSC_MAX - DSC_0; i++)
>>>>> +               dsc_idx[i] = 0;
>>>>> +
>>>>> +       /* fill working copy with pingpong list */
>>>>> +       memcpy(pp_to_enc_id, global_state->pingpong_to_enc_id, 
>>>>> sizeof(pp_to_enc_id));
>>>>> +
>>>>> +       for (i = 0; i < ARRAY_SIZE(rm->dsc_blks) && num_dsc >= 
>>>>> top->num_dsc; i++) {

Much easier. Just do i+= 2 here and in the loop check that the second 
half of DCE is not used.

>>>>> +               if (!rm->dsc_blks[i])
>>>>> +                       continue;
>>>>> +
>>>>> +               if (global_state->dsc_to_enc_id[i]) {   /* used */
>>>>> +                       /* consective dsc index to be paired */
>>>>> +                       if (num_dsc) {  /* already start pairing, 
>>>>> re start search */
>>>>> +                               num_dsc = 0;
>>>>> +                               /* fill working copy with pingpong 
>>>>> list */
>>>>> +                               memcpy(pp_to_enc_id, 
>>>>> global_state->pingpong_to_enc_id,
>>>>> +                                                               
>>>>> sizeof(pp_to_enc_id));
>>>>> +                       }
>>>>> +                       continue;
>>>>> +               }
>>>>> +
>>>>> +               /* odd index can not become start of pairing */
>>>>> +               if (i & 0x01 && !num_dsc)
>>>>> +                       continue;
>>>>> +
>>>>> +               /*
>>>>> +                * find the pingpong index which had been reserved
>>>>> +                * previously at layer mixer allocation
>>>>> +                */
>>>>> +               for (pp_idx = 0; pp_idx < pp_max; pp_idx++) {
>>>>> +                       if (pp_to_enc_id[pp_idx] == enc_id)
>>>>> +                               break;
>>>>>                   }
>>>>> +
>>>>> +               /*
>>>>> +                * dsc even index must map to pingpong even index
>>>>> +                * dsc odd index must map to pingpong odd index
>>>>> +                */
>>>>> +               if ((i & 0x01) != (pp_idx & 0x01))
>>>>> +                       continue;
>>>>> +
>>>>> +               /*
>>>>> +                * delete pp_idx so that next pp_idx can be paired 
>>>>> with
>>>>> +                * next dsc_idx
>>>>> +                */
>>>>> +               pp_to_enc_id[pp_idx] = 0xffff;
>>>>> +
>>>>> +               dsc_idx[num_dsc++] = i + 1;     /* found, start 
>>>>> from 1 */
>>>>>           }
>>>>>
>>>>> -       for (i = 0; i < num_dsc; i++)
>>>>> -               global_state->dsc_to_enc_id[i] = enc->base.id;
>>>>> +       if (num_dsc < top->num_dsc) {
>>>>> +               DPU_ERROR("DSC allocation failed num_dsc=%d 
>>>>> required=%d\n",
>>>>> +                                               num_dsc, 
>>>>> top->num_dsc);
>>>>> +               return -ENAVAIL;
>>>>> +       }
>>>>> +
>>>>> +       /* reserve dsc */
>>>>> +       for (i = 0; i < top->num_dsc; i++) {
>>>>> +               int j;
>>>>> +
>>>>> +               j = dsc_idx[i];
>>>>> +               if (j)
>>>>> +                       global_state->dsc_to_enc_id[j-1] = enc_id;
>>>>> +       }
>>>>>
>>>>>           return 0;
>>>>>    }
>>>>>
>>>>> +static int _dpu_rm_reserve_dsc(struct dpu_rm *rm,
>>>>> +                              struct dpu_global_state *global_state,
>>>>> +                              uint32_t enc_id,
>>>>> +                              const struct msm_display_topology *top)
>>>>> +{
>>>>> +       if (!top->num_dsc || !top->num_intf)
>>>>> +               return 0;
>>>>> +
>>>>> +       /*
>>>>> +        * Truth:
>>>>> +        * 1) every layer mixer only connects to one pingpong
>>>>> +        * 2) no pingpong split -- which is two layer mixers shared 
>>>>> one pingpong
>>>>> +        * 3) each DSC engine contains two dsc encoders
>>>>> +        *    -- index(0,1), index (2,3),... etc
>>>> Does this apply to v1.1 encoders?
>>>>
>>>>> +        * 4) dsc pair can only happens with same DSC engine
>>>>> +        * 5) odd pingpong connect to odd dsc
>>>>> +        * 6) even pingpong connect to even dsc
>>>>> +        * 7) pair: encoder +--> pp_idx_0 --> dsc_idx_0
>>>>> +                           +--> pp_idx_1 --> dsc_idx_1
>>>>> +        */
>>>>> +
>>>>> +       /* num_dsc should be either 1, 2 or 4 */
>>>>> +       if (top->num_dsc > top->num_intf)       /* merge mode */
>>>>> +               return _dpu_rm_reserve_dsc_pair(rm, global_state, 
>>>>> enc_id, top);
>>>>> +       else
>>>>> +               return _dpu_rm_reserve_dsc_single(rm, global_state, 
>>>>> enc_id, top);

Can we end up with num_dsc = 2, num_intf = 2 and 
_dpu_rm_reserve_dsc_single() allocating two DSC blocks despite its name?

>>>>> +}
>>>>> +
>>>>>    static int _dpu_rm_make_reservation(
>>>>>                   struct dpu_rm *rm,
>>>>>                   struct dpu_global_state *global_state,
>>>>> @@ -518,7 +659,7 @@ static int _dpu_rm_make_reservation(
>>>>>                   return ret;
>>>>>           }
>>>>>
>>>>> -       ret  = _dpu_rm_reserve_dsc(rm, global_state, enc, 
>>>>> &reqs->topology);
>>>>> +       ret  = _dpu_rm_reserve_dsc(rm, global_state, enc->base.id, 
>>>>> &reqs->topology);

Is there any reason to change this?

>>>>>           if (ret)
>>>>>                   return ret;
>>>>>
>>>>> -- 
>>>>> 2.7.4
>>>>>
>>
>>

-- 
With best wishes
Dmitry

